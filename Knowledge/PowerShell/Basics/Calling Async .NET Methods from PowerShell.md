# Calling Async .NET Methods from PowerShell

In this post, we’ll look at how to call async .NET methods from PowerShell.

## What are Async Methods?

The .NET Framework introduced the [async\\await pattern][2] in version 4.5 of the framework. It’s a very common pattern that makes better use of processor time by suspending processing of async methods while they access external systems like the file system or a database. The idea that then the process can use processor time that would otherwise be waiting for that access to complete and run on another thread.

In C#, you write the async\\await keywords directly in your source code. The below example will suspend the processing of the thread below as the download is occurring over the network. Once the download is finished, the thread will resume as expected. This can be a significant performance increase in multi-threaded applications.

```csharp
private static async Task<int> DownloadDocsMainPageAsync()
{
  Console.WriteLine($"{nameof(DownloadDocsMainPageAsync)}: About to start downloading.");

  var client = new HttpClient();
  byte[] content = await client.GetByteArrayAsync("https://docs.microsoft.com/en-us/");

  Console.WriteLine($"{nameof(DownloadDocsMainPageAsync)}: Finished downloading.");
  return content.Length;
}
```

## How do you use Async Methods in PowerShell?

PowerShell does not provide an async or await keyword. The PowerShell engine itself has a tendency to very single-threaded unless you take steps to use `Start-Job` or `Start-ThreadJob`. Because of this, you’ll need to take care when calling async methods in .NET from PowerShell.

When you call an async method in C#, you’ll notice that it does not return the value but rather a `Task`. The `Task` object can be used to evaluate whether the external operation has completed. Calling await in C#, is just shorthand for a bunch of code that is generated at compile time to wait on the `Task` object.

In PowerShell, we need to call these methods directly since we do not have an await keyword. The below example is how to call an async method in PowerShell.

```powershell
$client = [System.Net.Http.HttpClient]::new()
$content = $client.GetByteArrayAsync("https://docs.microsoft.com/en-us/").GetAwaiter().GetResult()
```

The `GetAwaiter()` call returns an object that you can use to await the result of the download. The `GetResult()` call will return the result of the method call once it completes. In this case, it’s returning an array of bytes. As explained in this [Stack Overflow post][3], the `GetResult()` method is preferred because if an exception is throw, it will return that exception.

## A `Wait-Task` Function

The below function and alias can be defined to simplify calling and awaiting async methods in PowerShell. The `Wait-Task` function accepts one or more `Task` objects and waits for them all to finish. It checks every 200 milliseconds to see if the tasks have finished to allow for `Ctrl+C` to cancel the PowerShell pipeline. Once all the tasks have finished, it will return their results.

```powershell
function Wait-Task {
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.Threading.Tasks.Task[]]$Task
    )

    Begin {
        $Tasks = @()
    }

    Process {
        $Tasks += $Task
    }

    End {
        While (-not [System.Threading.Tasks.Task]::WaitAll($Tasks, 200)) {}
        $Tasks.ForEach( { $_.GetAwaiter().GetResult() })
    }
}

Set-Alias -Name await -Value Wait-Task -Force
```

Using the alias, you could then have a similar syntax to C#. It also accepts pipeline input.

```powershell
PS > await ([System.IO.FIle]::ReadAllTextAsync("$PSScriptRoot\hello.txt"))
PS > @([System.IO.FIle]::ReadAllTextAsync("$PSScriptRoot\hello.txt"), [System.IO.FIle]::ReadAllTextAsync("$PSScriptRoot\hello.txt")) | await
Hello
Hello
Hello
```

Also, calling a missing file will result in the expected exception.

```powershell
PS > await ([System.IO.FIle]::ReadAllTextAsync("$PSScriptRoot\notHere.txt"))

MethodInvocationException: C:\Users\adamr\Desktop\Async.ps1:17:27
Line |
  17 |          $Tasks.ForEach( { $_.GetAwaiter().GetResult() })
     |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     | Exception calling "GetResult" with "0" argument(s): "Could not find file 'C:\Users\adamr\Desktop\notHere.txt'."
```

___

[2]: https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/await
[3]: https://stackoverflow.com/a/51218694/13688
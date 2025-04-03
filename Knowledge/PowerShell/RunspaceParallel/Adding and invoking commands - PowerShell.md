chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html

> Adding and invoking commands

# Adding and invoking commands - PowerShell
## Adding and invoking commands

-   Artikel
-   04.10.2022

## In diesem Artikel

1.  [Creating a pipeline](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#creating-a-pipeline)
2.  [See Also](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also)

After creating a runspace, you can add Windows PowerShell commands and scripts to a pipeline, and then invoke the pipeline synchronously or asynchronously.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#creating-a-pipeline)

## Creating a pipeline

The [System.Management.Automation.Powershell](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/system.management.automation.powershell) class provides several methods to add commands, parameters, and scripts to the pipeline. You can invoke the pipeline synchronously by calling an overload of the [System.Management.Automation.Powershell.Invoke\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.Invoke) method, or asynchronously by calling an overload of the [System.Management.Automation.Powershell.Begininvoke\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.BeginInvoke) and then the [System.Management.Automation.Powershell.Endinvoke\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.EndInvoke) method.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#addcommand)

### AddCommand

1.  Create a [System.Management.Automation.Powershell](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/system.management.automation.powershell) object.
    
    ```
    <span>PowerShell ps = PowerShell.Create();
    </span>
    ```
    
2.  Add the command that you want to execute.
    
    ```
    <span>ps.AddCommand(<span>"Get-Process"</span>);
    </span>
    ```
    
3.  Invoke the command.
    
    ```
    <span>ps.Invoke();
    </span>
    ```
    

If you call the [System.Management.Automation.Powershell.Addcommand\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddCommand) method more than once before you call the [System.Management.Automation.Powershell.Invoke\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.Invoke) method, the result of the first command is piped to the second, and so on. If you do not want to pipe the result of a previous command to a command, add it by calling the [System.Management.Automation.Powershell.Addstatement\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddStatement) instead.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#addparameter)

### AddParameter

The previous example executes a single command without any parameters. You can add parameters to the command by using the [System.Management.Automation.Pscommand.Addparameter\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PSCommand.AddParameter) method For example, the following code gets a list of all of the processes that are named `PowerShell` running on the machine.

```
<span>PowerShell.Create().AddCommand(<span>"Get-Process"</span>)
                   .AddParameter(<span>"Name"</span>, <span>"PowerShell"</span>)
                   .Invoke();
</span>
```

You can add additional parameters by calling [System.Management.Automation.Pscommand.Addparameter\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PSCommand.AddParameter) repeatedly.

```
<span>PowerShell.Create().AddCommand(<span>"Get-Command"</span>)
                   .AddParameter(<span>"Name"</span>, <span>"Get-VM"</span>)
                   .AddParameter(<span>"Module"</span>, <span>"Hyper-V"</span>)
                   .Invoke();
</span>
```

You can also add a dictionary of parameter names and values by calling the [System.Management.Automation.Powershell.Addparameters\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddParameters) method.

```
<span>IDictionary parameters = <span>new</span> Dictionary&lt;String, String&gt;();
parameters.Add(<span>"Name"</span>, <span>"Get-VM"</span>);

parameters.Add(<span>"Module"</span>, <span>"Hyper-V"</span>);
PowerShell.Create().AddCommand(<span>"Get-Command"</span>)
   .AddParameters(parameters)
      .Invoke()

</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#addstatement)

### AddStatement

You can simulate batching by using the [System.Management.Automation.Powershell.Addstatement\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddStatement) method, which adds an additional statement to the end of the pipeline The following code gets a list of running processes with the name `PowerShell`, and then gets the list of running services.

```
<span>PowerShell ps = PowerShell.Create();
ps.AddCommand(<span>"Get-Process"</span>).AddParameter(<span>"Name"</span>, <span>"PowerShell"</span>);
ps.AddStatement().AddCommand(<span>"Get-Service"</span>);
ps.Invoke();
</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#addscript)

### AddScript

You can run an existing script by calling the [System.Management.Automation.Powershell.Addscript\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddScript) method. The following example adds a script to the pipeline and runs it. This example assumes there is already a script named `MyScript.ps1` in a folder named `D:\PSScripts`.

```
<span>PowerShell ps = PowerShell.Create();
ps.AddScript(File.ReadAllText(<span>@"D:\PSScripts\MyScript.ps1"</span>)).Invoke();
</span>
```

There is also a version of the [System.Management.Automation.Powershell.Addscript\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddScript) method that takes a boolean parameter named `useLocalScope`. If this parameter is set to `true`, then the script is run in the local scope. The following code will run the script in the local scope.

```
<span>PowerShell ps = PowerShell.Create();
ps.AddScript(File.ReadAllText(<span>@"D:\PSScripts\MyScript.ps1"</span>), <span>true</span>).Invoke();
</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#invoking-a-pipeline-synchronously)

### Invoking a pipeline synchronously

After you add elements to the pipeline, you invoke it. To invoke the pipeline synchronously, you call an overload of the [System.Management.Automation.Powershell.Invoke\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.Invoke) method. The following example shows how to synchronously invoke a pipeline.

```
<span><span>using</span> System;
<span>using</span> System.Collections.Generic;
<span>using</span> System.Linq;
<span>using</span> System.Text;
<span>using</span> System.Management.Automation;

<span>namespace</span> <span>HostPS1e</span>
{
  <span>class</span> <span>HostPS1e</span>
  {
    <span><span>static</span> <span>void</span> <span>Main</span>(<span><span>string</span>[] args</span>)</span>
    {
      <span>// Using the PowerShell.Create and AddCommand</span>
      <span>// methods, create a command pipeline.</span>
      PowerShell ps = PowerShell.Create().AddCommand (<span>"Sort-Object"</span>);

      <span>// Using the PowerShell.Invoke method, run the command</span>
      <span>// pipeline using the supplied input.</span>
      <span>foreach</span> (PSObject result <span>in</span> ps.Invoke(<span>new</span> <span>int</span>[] { <span>3</span>, <span>1</span>, <span>6</span>, <span>2</span>, <span>5</span>, <span>4</span> }))
      {
          Console.WriteLine(<span>"{0}"</span>, result);
      } <span>// End foreach.</span>
    } <span>// End Main.</span>
  } <span>// End HostPS1e.</span>
}
</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#invoking-a-pipeline-asynchronously)

### Invoking a pipeline asynchronously

You invoke a pipeline asynchronously by calling an overload of the [System.Management.Automation.Powershell.Begininvoke\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.BeginInvoke) to create an [IAsyncResult](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/system.iasyncresult) object, and then calling the [System.Management.Automation.Powershell.Endinvoke\*](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.EndInvoke) method.

The following example shows how to invoke a pipeline asynchronously.

```
<span><span>using</span> System;
<span>using</span> System.Collections.Generic;
<span>using</span> System.Linq;
<span>using</span> System.Text;
<span>using</span> System.Management.Automation;

<span>namespace</span> <span>HostPS3</span>
{
  <span>class</span> <span>HostPS3</span>
  {
    <span><span>static</span> <span>void</span> <span>Main</span>(<span><span>string</span>[] args</span>)</span>
    {
      <span>// Use the PowerShell.Create and PowerShell.AddCommand</span>
      <span>// methods to create a command pipeline that includes</span>
      <span>// Get-Process cmdlet. Do not include spaces immediately</span>
      <span>// before or after the cmdlet name as that will cause</span>
      <span>// the command to fail.</span>
      PowerShell ps = PowerShell.Create().AddCommand(<span>"Get-Process"</span>);

      <span>// Create an IAsyncResult object and call the</span>
      <span>// BeginInvoke method to start running the</span>
      <span>// command pipeline asynchronously.</span>
      IAsyncResult asyncpl = ps.BeginInvoke();

      <span>// Using the PowerShell.Invoke method, run the command</span>
      <span>// pipeline using the default runspace.</span>
      <span>foreach</span> (PSObject result <span>in</span> ps.EndInvoke(asyncpl))
      {
        Console.WriteLine(<span>"{0,-20}{1}"</span>,
                result.Members[<span>"ProcessName"</span>].Value,
                result.Members[<span>"Id"</span>].Value);
      } <span>// End foreach.</span>
      System.Console.WriteLine(<span>"Hit any key to exit."</span>);
      System.Console.ReadKey();
    } <span>// End Main.</span>
  } <span>// End HostPS3.</span>
}
</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also)

## See Also

[Creating an InitialSessionState](https://learn.microsoft.com/de-de/powershell/scripting/developer/hosting/creating-an-initialsessionstate?view=powershell-7.5)

[Creating a constrained runspace](https://learn.microsoft.com/de-de/powershell/scripting/developer/hosting/creating-a-constrained-runspace?view=powershell-7.5)

Zusammenarbeit auf GitHub

Die Quelle für diesen Inhalt finden Sie auf GitHub, wo Sie auch Issues und Pull Requests erstellen und überprüfen können. Weitere Informationen finden Sie in unserem [Leitfaden für Mitwirkende](https://learn.microsoft.com/powershell/scripting/community/contributing/powershell-style-guide).

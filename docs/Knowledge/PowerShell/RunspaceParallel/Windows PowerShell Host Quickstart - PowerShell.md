chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html

> Windows PowerShell Host Quickstart

# Windows PowerShell Host Quickstart - PowerShell
## Windows PowerShell Host Quickstart

-   Artikel
-   18.12.2023

## In diesem Artikel

1.  [Using the default runspace](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#using-the-default-runspace)
2.  [Creating a custom runspace](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#creating-a-custom-runspace)

To host Windows PowerShell in your application, you use the [System.Management.Automation.PowerShell](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell) class. This class provides methods that create a pipeline of commands and then execute those commands in a runspace. The simplest way to create a host application is to use the default runspace. The default runspace contains all of the core Windows PowerShell commands. If you want your application to expose only a subset of the Windows PowerShell commands, you must create a custom runspace.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#using-the-default-runspace)

## Using the default runspace

To start, we'll use the default runspace, and use the methods of the [System.Management.Automation.PowerShell](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell) class to add commands, parameters, statements, and scripts to a pipeline.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#addcommand)

### AddCommand

You use the [System.Management.Automation.PowerShell.AddCommand](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddCommand) method to add commands to the pipeline. For example, suppose you want to get the list of running processes on the machine. The way to run this command is as follows.

1.  Create a [System.Management.Automation.PowerShell](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell) object.
    
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
    

If you call the AddCommand method more than once before you call the [System.Management.Automation.PowerShell.Invoke](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.Invoke) method, the result of the first command is piped to the second, and so on. If you do not want to pipe the result of a previous command to a command, add it by calling the [System.Management.Automation.PowerShell.AddStatement](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddStatement) instead.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#addparameter)

### AddParameter

The previous example executes a single command without any parameters. You can add parameters to the command by using the [System.Management.Automation.PSCommand.AddParameter](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PSCommand.AddParameter) method. For example, the following code gets a list of all of the processes that are named `PowerShell` running on the machine.

```
<span>PowerShell.Create().AddCommand(<span>"Get-Process"</span>)
                   .AddParameter(<span>"Name"</span>, <span>"PowerShell"</span>)
                   .Invoke();
</span>
```

You can add additional parameters by calling the AddParameter method repeatedly.

```
<span>PowerShell.Create().AddCommand(<span>"Get-ChildItem"</span>)
                   .AddParameter(<span>"Path"</span>, <span>@"c:\Windows"</span>)
                   .AddParameter(<span>"Filter"</span>, <span>"*.exe"</span>)
                   .Invoke();
</span>
```

You can also add a dictionary of parameter names and values by calling the [System.Management.Automation.PowerShell.AddParameters](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddParameters) method.

```
<span>IDictionary parameters = <span>new</span> Dictionary&lt;String, String&gt;();
parameters.Add(<span>"Path"</span>, <span>@"c:\Windows"</span>);
parameters.Add(<span>"Filter"</span>, <span>"*.exe"</span>);

PowerShell.Create().AddCommand(<span>"Get-Process"</span>)
   .AddParameters(parameters)
      .Invoke()

</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#addstatement)

### AddStatement

You can simulate batching by using the [System.Management.Automation.PowerShell.AddStatement](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddStatement) method, which adds an additional statement to the end of the pipeline. The following code gets a list of running processes with the name `PowerShell`, and then gets the list of running services.

```
<span>PowerShell ps = PowerShell.Create();
ps.AddCommand(<span>"Get-Process"</span>).AddParameter(<span>"Name"</span>, <span>"PowerShell"</span>);
ps.AddStatement().AddCommand(<span>"Get-Service"</span>);
ps.Invoke();
</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#addscript)

### AddScript

You can run an existing script by calling the [System.Management.Automation.PowerShell.AddScript](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.PowerShell.AddScript) method. The following example adds a script to the pipeline and runs it. This example assumes there is already a script named `MyScript.ps1` in a folder named `D:\PSScripts`.

```
<span>PowerShell ps = PowerShell.Create();
ps.AddScript(<span>"D:\PSScripts\MyScript.ps1"</span>).Invoke();
</span>
```

There is also a version of the AddScript method that takes a boolean parameter named `useLocalScope`. If this parameter is set to `true`, then the script is run in the local scope. The following code will run the script in the local scope.

```
<span>PowerShell ps = PowerShell.Create();
ps.AddScript(<span>@"D:\PSScripts\MyScript.ps1"</span>, <span>true</span>).Invoke();
</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#creating-a-custom-runspace)

## Creating a custom runspace

While the default runspace used in the previous examples loads all of the core Windows PowerShell commands, you can create a custom runspace that loads only a specified subset of all commands. You might want to do this to improve performance (loading a larger number of commands is a performance hit), or to restrict the capability of the user to perform operations. A runspace that exposes only a limited number of commands is called a constrained runspace. To create a constrained runspace, you use the [System.Management.Automation.Runspaces.Runspace](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.Runspace) and [System.Management.Automation.Runspaces.InitialSessionState](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.InitialSessionState) classes.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#creating-an-initialsessionstate-object)

### Creating an InitialSessionState object

To create a custom runspace, you must first create a [System.Management.Automation.Runspaces.InitialSessionState](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.InitialSessionState) object. In the following example, we use the [System.Management.Automation.Runspaces.RunspaceFactory](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.RunspaceFactory) to create a runspace after creating a default InitialSessionState object.

```
<span>InitialSessionState iss = InitialSessionState.CreateDefault();
Runspace rs = RunspaceFactory.CreateRunspace(iss);
rs.Open();
PowerShell ps = PowerShell.Create();
ps.Runspace = rs;
ps.AddCommand(<span>"Get-Command"</span>);
ps.Invoke();
rs.Close();
</span>
```

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#constraining-the-runspace)

### Constraining the runspace

In the previous example, we created a default [System.Management.Automation.Runspaces.InitialSessionState](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.InitialSessionState) object that loads all of the built-in core Windows PowerShell. We could also have called the [System.Management.Automation.Runspaces.InitialSessionState.CreateDefault2](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.InitialSessionState.CreateDefault2) method to create an InitialSessionState object that would load only the commands in the Microsoft.PowerShell.Core snapin. To create a more constrained runspace, you must create an empty InitialSessionState object by calling the [System.Management.Automation.Runspaces.InitialSessionState.Create](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.InitialSessionState.Create) method, and then add commands to the InitialSessionState.

Using a runspace that loads only the commands that you specify provides significantly improved performance.

You use the methods of the [System.Management.Automation.Runspaces.SessionStateCmdletEntry](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.SessionStateCmdletEntry) class to define cmdlets for the initial session state. The following example creates an empty initial session state, then defines and adds the `Get-Command` and `Import-Module` commands to the initial session state. We then create a runspace constrained by that initial session state, and execute the commands in that runspace.

Create the initial session state.

```
<span>InitialSessionState iss = InitialSessionState.Create();
</span>
```

Define and add commands to the initial session state.

```
<span>SessionStateCmdletEntry getCommand = <span>new</span> SessionStateCmdletEntry(
    <span>"Get-Command"</span>, <span>typeof</span>(Microsoft.PowerShell.Commands.GetCommandCommand), <span>""</span>);
SessionStateCmdletEntry importModule = <span>new</span> SessionStateCmdletEntry(
    <span>"Import-Module"</span>, <span>typeof</span>(Microsoft.PowerShell.Commands.ImportModuleCommand), <span>""</span>);
iss.Commands.Add(getCommand);
iss.Commands.Add(importModule);
</span>
```

Create and open the runspace.

```
<span>Runspace rs = RunspaceFactory.CreateRunspace(iss);
rs.Open();
</span>
```

Execute a command and show the result.

```
<span>PowerShell ps = PowerShell.Create();
ps.Runspace = rs;
ps.AddCommand(<span>"Get-Command"</span>);
Collection&lt;CommandInfo&gt; result = ps.Invoke&lt;CommandInfo&gt;();
<span>foreach</span> (<span>var</span> entry <span>in</span> result)
{
    Console.WriteLine(entry.Name);
}
</span>
```

Close the runspace.

```
<span>rs.Close();
</span>
```

When run, the output of this code will look as follows.

```
<span><span>Get-Command</span>
<span>Import-Module</span>
</span>
```

Zusammenarbeit auf GitHub

Die Quelle für diesen Inhalt finden Sie auf GitHub, wo Sie auch Issues und Pull Requests erstellen und überprüfen können. Weitere Informationen finden Sie in unserem [Leitfaden für Mitwirkende](https://learn.microsoft.com/powershell/scripting/community/contributing/powershell-style-guide).

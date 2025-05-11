Enter-Debugger
--------------

### Synopsis
Enters the debugger by triggering a breakpoint at the current location.

---

### Description

The breakpoint command enters the debugger by triggering a breakpoint at the current location, whether that location be in a script file or in an interactive prompt.

Without the ConditionScript parameter, the breakpoint command will enter the debugger by triggering a breakpoint where it is invoked. You can also use the breakpoint command to conditionally enter the debugger by providing an expression in the ConditionScript parameter. If the ConditionScript parameter evaluates to True, then the execution will be suspended at a breakpoint. If the ConditionScript parameter evaluates to False, then execution will continue beyond the breakpoint command.

You can use the breakpoint command in a pipeline. If the breakpoint command is used in a pipeline, it will break for each object that it receives from the previous stage in the pipeline, conditionally if the ConditionScript parameter is used. If the breakpoint command is disabled, the object will be passed down the pipeline to the next stage, allowing breakpoint commands to be left in place while you disable or enable them as required when developing your PowerShell solutions.

When you are setting breakpoints with more complex conditions or for more rare scenarios such as intermittent issues that you can't put your finger on, it can be helpful to know more context about those breakpoints when they are hit. For these situations, you can specify a message that you want written directly to the host using the Message parameter. The message you provide will be output to the host just before PowerShell enters the debugger, but only if the breakpoint condition passes.

You can enable or disable the breakpoint command at any time by invoking either the Enable-EnterDebuggerCommand or Disable-EnterDebuggerCommand commands.

The breakpoint command will not cause PowerShell to enter the debugger unless the current process is interactive.

---

### Related Links
* [Disable-EnterDebuggerCommand](Disable-EnterDebuggerCommand)

* [Enable-EnterDebuggerCommand](Enable-EnterDebuggerCommand)

---

### Examples
> EXAMPLE 1

PS C:\> Get-Service w* | breakpoint {$_.Name -eq 'wuauserv'} | Select-Object -ExpandProperty Name
If the breakpoint command is enabled (it is enabled by default), this command will get a list of names of services whose name starts with "w". When the Windows Update service is received by the breakpoint command, Windows PowerShell will enter the debugger at that breakpoint. The name of that service, and any remaining services, will be output to the console when the debugger is used to either step or to resume execution.
> EXAMPLE 2

PS C:\> & {
>>     'Before breakpoint'
>>     breakpoint
>>     'After breakpoint'
>> }
This command will output the text "Before breakpoint" to the console. Then, when the breakpoint command is invoked, if the breakpoint command is enabled (the default), Windows PowerShell will enter the debugger at the breakpoint command. The text "After breakpoint" will be output to the console when the debugger is used to step or to continue execution of the command.
> EXAMPLE 3

```PowerShell
PS C:\> breakpoint {
>>     $service = Get-Service wuauserv
>>     $service.Status -eq 'Stopped'
>> } -Message "The Windows Update service has stopped! How did this happen?"
This command causes PowerShell to enter the debugger at a breakpoint on that command, but only if the Windows Update service is in a stopped state. When PowerShell enters the debugger, the message "The Windows Update service has stopped! How did this happen?" will be written directly to the host. These messages may help understand what condition you are watching for on conditional breakpoints in more complex scripting scenarios.
```

---

### Parameters
#### **ConditionScript**
The condition under which PowerShell will enter the debugger at a breakpoint at the current location.
When the breakpoint command is used in a pipeline, you can use the $_ or $PSItem variables to reference the current item that was just received from the previous stage in the pipeline.

|Type           |Required|Position|PipelineInput|Aliases           |
|---------------|--------|--------|-------------|------------------|
|`[ScriptBlock]`|false   |0       |false        |ScriptBlock<br/>sb|

#### **InputObject**
The object that was input to the command, either by value (using this parameter) or through the pipeline.
If the breakpoint command is disabled when it is invoked in a pipeline, input objects will be passed directly through to the next stage in the pipeline without any additional processing.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

#### **Message**
A message that you want output to the host when the breakpoint is triggered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
System.Management.Automation.PSObject

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
It is recommended that the breakpoint alias be used in place of Enter-Debugger because it more clearly indicates the intent of the command. This is an exception to 
the normal rule recommendation to use command names in place of aliases in scripts; however, all breakpoint command invocations should be removed from scripts 
before they are officially released, so that shouldn't be an issue.

---

### Syntax
```PowerShell
Enter-Debugger [[-ConditionScript] <ScriptBlock>] [-Message <String>] [-InputObject <PSObject>] [<CommonParameters>]
```

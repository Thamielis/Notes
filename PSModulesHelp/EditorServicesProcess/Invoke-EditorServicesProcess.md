Invoke-EditorServicesProcess
----------------------------

### Synopsis
Invoke a script block in the default runspace of processes hosted by the PowerShell Editor Services Integrated Console.

---

### Description

The Invoke-EditorServicesProcess allows you to invoke a script in the default runspace of any process hosted by the PowerShell Editor Services Integrated Console.

This is similar to the Enter-EditorServicesProcess function, with a few differences.

- It can be ran on any number of processes

- Invocation will take place in the default runspace of the Integrated Console, instead of a proxy runspace for the process.

- It can be ran interactively.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/EditorServicesProcess/docs/en-US/Invoke-EditorServicesProcess.md)

* [Enter-EditorServicesProcess](Enter-EditorServicesProcess)

* [Get-EditorServicesProcess](Get-EditorServicesProcess)

---

### Examples
> EXAMPLE 1

```PowerShell
$processes = Get-EditorServicesProcess
$processes | Invoke-EditorServicesProcess {
    $psEditor.Workspace.ShowInformationMessage('Hey there!')
}
Shows a information message on all editor services windows.
```
> EXAMPLE 2

```PowerShell
Get-EditorServicesProcess -Workspace '${workspaceRoot}' |
    Invoke-EditorServicesProcess { Invoke-Build -Task Build }
Invoke a VSCode task in the context of the Integrated Console.
```
> EXAMPLE 3

```PowerShell
code .
Get-EditorServicesProcess -Workspace $pwd |
    Invoke-EditorServicesProcess { psedit (Get-ChildItem *.ps1) }
Start VSCode in the current directory and open all *.ps1 files.
```

---

### Parameters
#### **ScriptBlock**
Specifies the script block to invoke.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |False        |

#### **ProcessId**
Specifies the process ID(s) of the Integrated Console(s).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |2       |True (ByPropertyName)|

---

### Inputs
System.Int32

You can pipe Process ID's to this function, or objects with a property named "ProcessId"

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Invoke-EditorServicesProcess [[-ScriptBlock] <ScriptBlock>] [[-ProcessId] <Int32>] [<CommonParameters>]
```

Enter-EditorServicesProcess
---------------------------

### Synopsis
Enter a new runspace within a process hosted by the PowerShell Editor Services Integrated Console.

---

### Description

The Enter-EditorServicesProcess function creates a new runspace within the integrated console. In this runspace you can interact with Editor Services from a standard PowerShell console.

The runspace will not be the same one the integrated console uses, but it will have a functioning $psEditor variable and contain all the same loaded assemblies.  You can also use the "Get-Runspace" and "Debug-Runspace" cmdlets to interact with the default runspace currently active in the integrated console.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/EditorServicesProcess/blob/master/docs/en-US/Enter-EditorServicesProcess.md)

* [Get-EditorServicesProcess](Get-EditorServicesProcess)

* [Get-Runspace](https://msdn.microsoft.com/en-us/powershell/reference/5.1/microsoft.powershell.utility/get-runspace)

* [Debug-Runspace](https://msdn.microsoft.com/en-us/powershell/reference/5.1/microsoft.powershell.utility/debug-runspace)

---

### Examples
> EXAMPLE 1

```PowerShell
Enter-EditorServicesProcess
Enter the first process found with a instance of the $psEditor editor object.
```
> EXAMPLE 2

```PowerShell
Get-EditorServicesProcess *MyProject* | Enter-EditorServicesProcess
Enter the first process found with an instance of $psEditor that is also open to a workspace with a path that maches the glob.
```
> EXAMPLE 3

```PowerShell
Enter-EditorServicesProcess
$psEditor.GetEditorContext().CurrentFile.InsertText('Testing insert from PowerShell!')
exit
Enter the first found Editor Services process, insert text into the currently open file, and exit back to the standard console.
```

---

### Parameters
#### **ProcessId**
Specifies ID of the process to enter.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |1       |True (ByPropertyName)|

---

### Inputs
System.Int32

You can pass process ID's to this function.  If multiple processes are passed, the first will be used and the rest will be ignored.

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
Enter-EditorServicesProcess [[-ProcessId] <Int32>] [<CommonParameters>]
```

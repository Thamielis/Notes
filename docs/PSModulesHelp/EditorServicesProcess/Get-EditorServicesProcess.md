Get-EditorServicesProcess
-------------------------

### Synopsis
Gets processes running PowerShell EditorServices.

---

### Description

The Get-EditorServicesProcess function gets processes currently running on the system that are hosted within the PowerShell Editor Services Integrated Terminal. The returned object contains the process ID, AppDomain name, and current workspace path.  This object can also be used with other functions in this module to manipulate the processes.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/EditorServicesProcess/blob/master/docs/en-US/Get-EditorServicesProcess.md)

* [Enter-EditorServicesProcess](Enter-EditorServicesProcess)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-EditorServicesProcess
Returns all current instances of the integrated terminal.
```
> EXAMPLE 2

```PowerShell
Get-EditorServicesProcess -Workspace *Projects*MyProject*
Returns only instances that are open to a workspace that matches the specified pattern.
```
> EXAMPLE 3

```PowerShell
Get-EditorServicesProcess -ProcessId 23145 | Enter-EditorServicesProcess
Enters the process with an ID of 23145 if it is within the integrated terminal.
```

---

### Parameters
#### **Workspace**
Specifies a workspace path that the process must have open to be returned.  This parameter accepts wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |False        |

#### **ProcessId**
Specifies the ID of the process to return.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |1       |False        |

---

### Inputs
None

This function does not accept input from the pipeline.

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes

---

### Syntax
```PowerShell
Get-EditorServicesProcess [[-Workspace] <String>] [<CommonParameters>]
```
```PowerShell
Get-EditorServicesProcess [-ProcessId] <Int32> [<CommonParameters>]
```

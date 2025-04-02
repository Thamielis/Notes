Get-RDMOpenedSession
--------------------

### Synopsis
Retrieve the list of opened sessions of the current data source.

---

### Description

Retrieve the list of opened sessions. of the current data source

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMOpenedSession
Retrieves the list of available data sources of the current data source.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMOpenedSession; $list[0]
Retrieves the list of the opened sessions and displays the first item.
```

---

### Parameters
#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Get-RDMOpenedSession -detailed". For technical information, type "Get-Help Get-RDMOpenedSession -full".

---

### Syntax
```PowerShell
Get-RDMOpenedSession [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

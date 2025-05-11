Get-RDMCommand
--------------

### Synopsis
Retrieve the executable path of Remote Desktop Manager or the specified tool

---

### Description

Retrieve the executable path of Remote Desktop Manager or the specified tool

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $execPath = Get-RDMCommand
```
> EXAMPLE 2

```PowerShell
PS C:\> $execPath = Get-RDMCommand -Tool Jetsocat
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

#### **Tool**
Define which tool is returned
Valid Values:

* Jetsocat
* SSH

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
For more information, type "Get-Help Get-RDMCommand -detailed". For technical information, type "Get-Help Get-RDMCommand -full".

---

### Syntax
```PowerShell
Get-RDMCommand [[-Tool] <Jetsocat | SSH>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

Get-RDMVersion
--------------

### Synopsis
Retrieve the installed Remote Desktop Manager for Windows version

---

### Description

Retrieve the installed Remote Desktop Manager for Windows version

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $version = Get-RDMVersion
```

---

### Parameters
#### **Edition**

Valid Values:

* Free
* Enterprise

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

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
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
For more information, type "Get-Help Get-RDMVersion -detailed". For technical information, type "Get-Help Get-RDMVersion -full".

---

### Syntax
```PowerShell
Get-RDMVersion [[-Edition] <Free | Enterprise>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

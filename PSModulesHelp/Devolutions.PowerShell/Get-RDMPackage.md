Get-RDMPackage
--------------

### Synopsis
Retrieve the latest or specified version download url

---

### Description

Retrieve the latest or specified version download url

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $package = Get-RDMPackage
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

#### **Platform**

Valid Values:

* Linux
* OSX
* Windows

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RequiredVersion**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSCustomObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSCustomObject)

---

### Notes
For more information, type "Get-Help Get-RDMPackage -detailed". For technical information, type "Get-Help Get-RDMPackage -full".

---

### Syntax
```PowerShell
Get-RDMPackage [[-Edition] <Free | Enterprise>] [[-Platform] <Linux | OSX | Windows>] [[-RequiredVersion] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

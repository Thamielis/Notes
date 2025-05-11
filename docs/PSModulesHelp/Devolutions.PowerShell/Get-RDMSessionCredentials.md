Get-RDMSessionCredentials
-------------------------

### Synopsis
Returns the session credentials

---

### Description

Returns the session credentials

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

#### **GetID**
Get the credential ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PSConnection**
Specifies the connection to get credentials from.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
For more information, type "Get-Help Get-RDMSessionCredentials -detailed". For technical information, type "Get-Help Get-RDMSessionCredentials -full".

---

### Syntax
```PowerShell
Get-RDMSessionCredentials -PSConnection <PSConnection> [-GetID] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

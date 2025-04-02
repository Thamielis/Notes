Read-RDMSession
---------------

### Synopsis
Read RDM session from a file

---

### Description

Read RDM session from a file

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $session = Read-RDMSession -Filename "C:\MyFile.rdm" -DuplicateAction "Add"; Set-RDMSession $session[0]
```

---

### Parameters
#### **DuplicateAction**
Action when a duplicate is found. Must be one of the following:
"Add", "Overwrite", "Ignore"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

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

#### **Group**
The group where the sessions will be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Path**
Path where the file is loaded. Must be finish:
"RDM: .rdm", "XML: .xml"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Read-RDMSession -detailed". For technical information, type "Get-Help Read-RDMSession -full".

---

### Syntax
```PowerShell
Read-RDMSession [[-DuplicateAction] <String>] [[-Group] <String>] [-Path] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

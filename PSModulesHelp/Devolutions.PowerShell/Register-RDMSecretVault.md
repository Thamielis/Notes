Register-RDMSecretVault
-----------------------

### Synopsis

---

### Description

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

#### **Name**
Secret vault's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **UserVault**
Use the current data source's user vault.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Register-RDMSecretVault -detailed". For technical information, type "Get-Help Register-RDMSecretVault -full".

---

### Syntax
```PowerShell
Register-RDMSecretVault -Name <String> [-UserVault] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

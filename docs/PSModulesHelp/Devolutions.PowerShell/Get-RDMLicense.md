Get-RDMLicense
--------------

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

#### **Serial**
License serial
Valid Values:

* CUQBA-UATZC-CAXH9-5ZP4J-CQYH2
* TCQCA-B94PU-4ZCA2-UYZJ5-HXCA2

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
System.String

License serial

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMLicense -detailed". For technical information, type "Get-Help Get-RDMLicense -full".

---

### Syntax
```PowerShell
Get-RDMLicense [[-Serial] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

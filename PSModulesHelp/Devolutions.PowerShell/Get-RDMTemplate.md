Get-RDMTemplate
---------------

### Synopsis
Retrieve the list of available templates.

---

### Description

Retrieve the list of available templates. The current selected template is marked with an "X".

---

### Related Links
* [Set-RDMDataSource](Set-RDMDataSource)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMTemplate
Retrieves the list of available templates.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMTemplate; $list[0]
Retrieves the list of available templates and displays the first item.
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

#### **Type**
Type of templates
Valid Values:

* Both
* Local
* Shared

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-RDMTemplate -detailed". For technical information, type "Get-Help Get-RDMTemplate -full".

---

### Syntax
```PowerShell
Get-RDMTemplate [[-Type] <Both | Local | Shared>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

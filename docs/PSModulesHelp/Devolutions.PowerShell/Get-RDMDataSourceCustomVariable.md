Get-RDMDataSourceCustomVariable
-------------------------------

### Synopsis
Get the custom variables stored in the current data source

---

### Description

Get the custom variables stored in the current data source. The path to access those variables in Remote Desktop Manager is Administration -> System Settings -> Common -> Custom Variables.
        The user must have the rights to access the data source settings. Only advanced data source have settings.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $customVars = Get-RDMDataSourceCustomVariable -Name $VAR*
Obtain all custom variables stored in the data source whose name start with $Var.
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

#### **Name**
Filter the custom variables by their name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.DataSourceVariable[]

---

### Notes
For more information, type "Get-Help Get-RDMDataSourceCustomVariable -detailed". For technical information, type "Get-Help Get-RDMDataSourceCustomVariable -full".

---

### Syntax
```PowerShell
Get-RDMDataSourceCustomVariable [[-Name] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

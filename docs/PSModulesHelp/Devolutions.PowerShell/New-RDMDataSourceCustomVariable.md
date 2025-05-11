New-RDMDataSourceCustomVariable
-------------------------------

### Synopsis
Create a new custom variable stored in the current data source

---

### Description

Create a new custom variable stored in the current data source. The path to access those variables in Remote Desktop Manager is Administration -> System Settings -> Common -> Custom Variables.
        The user must have the rights to access the data source settings. Only advanced data source have settings.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> New-RDMDataSourceCustomVariable -Name MyVarName -Value MyVarValue -Description MyVarDesc -SetCustomVariable
Create or update a custom variable in the data source settings.
```

---

### Parameters
#### **Description**
Description of the custom variable

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

#### **Name**
Name of the variable. Two special characters can be used: '_' everywhere and '$' at the start and the end. Other characters are not allowed. All lower letters will be converted to upper characters.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetCustomVariable**
Save the new custom variable in the data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Value**
Value of the variable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.DataSourceVariable

---

### Notes
For more information, type "Get-Help New-RDMDataSourceCustomVariable -detailed". For technical information, type "Get-Help New-RDMDataSourceCustomVariable -full".

---

### Syntax
```PowerShell
New-RDMDataSourceCustomVariable [[-Description] <String>] [-Name] <String> [-SetCustomVariable] [-Value] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

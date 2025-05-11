Set-RDMDataSourceCustomVariable
-------------------------------

### Synopsis
Add or edit custom variables in the current data source settings.

---

### Description

Add or edit custom variables in the current data source settings. The path to access those variables in Remote Desktop Manager is Administration -> System Settings -> Common -> Custom Variables.
        The user must have the rights to access the data source settings. Only advanced data source have settings.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $cv = Get-RDMDataSourceCustomVariable -Name $MyVar1$;
        $cv.Value = 'MyVarNewValue';
        Set-RDMDataSourceCustomVariable -InputObject $cv
Update the value of the custom variable named $MyVar1$
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

#### **InputObject**
Custom variables to save.

|Type                    |Required|Position|PipelineInput |
|------------------------|--------|--------|--------------|
|`[DataSourceVariable[]]`|true    |1       |true (ByValue)|

#### **PassThru**
Return the custom variables that have been saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.DataSourceVariable

---

### Notes
For more information, type "Get-Help Set-RDMDataSourceCustomVariable -detailed". For technical information, type "Get-Help Set-RDMDataSourceCustomVariable -full".

---

### Syntax
```PowerShell
Set-RDMDataSourceCustomVariable [-InputObject] <DataSourceVariable[]> [-PassThru] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

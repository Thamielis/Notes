Edit-RDMUserTemplate
--------------------

### Synopsis
Add or default vaults in the User Template of the System Settings for a specific data source. New users created in that data source will gain or lose access to those vaults.

---

### Description

Add or default vaults in the User Template of the System Settings for a specific data source. New users created in that data source will gain or lose access to those vaults.

---

### Related Links
* [Get-RDMCurrentDataSource](Get-RDMCurrentDataSource)

* [Get-RDMDataSource](Get-RDMDataSource)

* [Get-RDMCurrentRepository](Get-RDMCurrentRepository)

* [Get-RDMRepository](Get-RDMRepository)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Edit-RDMUserTemplate -DataSource ADataSource -AddRepository ACommonVault;
Add ACommonVault in the User Template in the System Settings of the data source "ADataSource".
```
> EXAMPLE 2

```PowerShell
PS C:\> Edit-RDMUserTemplate -DataSource ADataSource -RemoveRepository *;
Remove all the repositories in the User Template in the System Settings of the data source ADataSource.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMDataSource -Name "ADataSource" | Edit-RDMUserTemplate -RemoveRepository CommonVault[ab] -CaseSensitive;
Remove the repositories CommonVaulta and CommonVaultb in the User Template in the System Settings of the data source "ADataSource". The case sensitive switch is not impacting the term [ab], meaning a repository CommonVaultA would not be affected.
```
> EXAMPLE 4

```PowerShell
PS C:\> Edit-RDMUserTemplate -DataSource ADataSource -Repository UserVault? -CaseSensitive;
Add all repositories UserVault? such as UserVaultA and UserVault1 in the User Template in the System Settings of the data source "ADataSource". The search for the data source and the repositories wll be case sensitive.
```

---

### Parameters
#### **AddRepository**
Add the default vaults in the User Template of the System Settings. Allows to find repositories by ID (Guid), by name (supports wildcards), and repositories (PSRepositoryInfo).

|Type        |Required|Position|PipelineInput |Aliases |
|------------|--------|--------|--------------|--------|
|`[Object[]]`|true    |2       |true (ByValue)|AddVault|

#### **CaseSensitive**
Case sensitive when searching the data source or the repositories by name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DataSource**
DataSource whose settings will be modified. Allows to find the data source by ID (Guid), by name (supports wildcard), and data source (PSDataSource).

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |1       |true (ByValue)|

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

#### **RemoveRepository**
Remove the default vaults in the User Template of the System Settings. Allows to find repositories by ID (Guid), by name (supports wildcards), and repositories (PSRepositoryInfo). Removing all default vaults is possible.

|Type        |Required|Position|PipelineInput |Aliases    |
|------------|--------|--------|--------------|-----------|
|`[Object[]]`|true    |2       |true (ByValue)|RemoveVault|

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
System.Management.Automation.PSObject

The data source whose system settings will be modified. Allows to find the data source by ID (Guid), by name (supports wildcard), and data source (PSDataSource).

System.Management.Automation.PSObject

The repositories to add or remove to the User Template. Allows to find repositories by ID (Guid), by name (supports wildcards), and repositories (PSRepositoryInfo).

System.Management.Automation.SwitchParameter

The name of the data source and the repositories will be a case sensitive search is this switch is present.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Edit-RDMUserTemplate -detailed". For technical information, type "Get-Help Edit-RDMUserTemplate -full".

---

### Syntax
```PowerShell
Edit-RDMUserTemplate [-AddRepository] <Object[]> [-CaseSensitive] [-DataSource] <Object> [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Edit-RDMUserTemplate [-RemoveRepository] <Object[]> [-CaseSensitive] [-DataSource] <Object> [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

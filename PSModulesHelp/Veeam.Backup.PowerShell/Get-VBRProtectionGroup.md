Get-VBRProtectionGroup
----------------------

### Synopsis
Returns protection groups.

---

### Description

This cmdlet returns protection groups.
You can get all protection groups or search for instances directly by name, ID, type or protection scope. Use an appropriate parameter set for each case.

---

### Examples
> Example 1. Getting All Protection Groups

Get-VBRProtectionGroup
This command returns all protection groups added to Veeam Backup & Replication.
> Example 2. Getting Protection Groups by ID

```PowerShell
Get-VBRProtectionGroup -Id 4022509c-3308-4883-b166-118bdf7480ea, 730dc485-84c2-4a9d-86e7-2e35d1d5a0be
This command returns protection groups by ID.
```
> Example 3. Getting Protection Groups by Scope of Active Directory Objects

```PowerShell
Get-VBRProtectionGroup -ContainerType ActiveDirectory
This command returns protection groups created for the scope of Active Directory objects.
```

---

### Parameters
#### **ContainerType**
Specifies the array of protection scope types:
* ActiveDirectory: a scope of Active Directory objects
* IndividualComputers: a scope of individual computers
* CSV: a scope of computers listed in a CSV file
* ManuallyDeployed: a scope of computers that were added manually to a Veeam Agent backup job.
The cmdlet will return protection groups created for these protection scope types.
Valid Values:

* IndividualComputers
* ActiveDirectory
* CSV
* ManuallyDeployed
* CloudMachines

|Type                                 |Required|Position|PipelineInput        |
|-------------------------------------|--------|--------|---------------------|
|`[VBRProtectionGroupContainerType[]]`|false   |named   |True (ByPropertyName)|

#### **Id**
Specifies the array of protection group IDs. The cmdlet will return protection groups with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of protection group names. The cmdlet will return protection groups with these names.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **Type**
Specifies protection group types:
* Custom: protection groups created for individual computers, Active Directory objects or computers listed in a CSV file.
* ManuallyAdded: protection groups created for computers that were added manually to a Veeam Agent backup job.
The cmdlet will return protection groups of these types.
Valid Values:

* Custom
* ManuallyAdded

|Type                        |Required|Position|PipelineInput        |
|----------------------------|--------|--------|---------------------|
|`[VBRProtectionGroupType[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

System.String[]

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupType[]

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupContainerType[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRProtectionGroup [-ContainerType {IndividualComputers | ActiveDirectory | CSV | ManuallyDeployed | CloudMachines}] [<CommonParameters>]
```
```PowerShell
Get-VBRProtectionGroup [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRProtectionGroup [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRProtectionGroup [-Type {Custom | ManuallyAdded}] [<CommonParameters>]
```

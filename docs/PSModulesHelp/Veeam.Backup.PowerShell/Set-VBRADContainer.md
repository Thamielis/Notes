Set-VBRADContainer
------------------

### Synopsis
Modifies a scope of Active Directory objects.

---

### Description

This cmdlet modifies the VBRADContainer object. This object contains a scope of Active Directory objects you want to add to a protection group.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Set-VBRProtectionGroup](Set-VBRProtectionGroup)

---

### Examples
> Excluding VMS from Protection Group

$group = Get-VBRProtectionGroup -Name "Support PG"
$ad = $group.Container
$newad = Set-VBRADContainer -Container $ad -ExcludeVMs
Set-VBRProtectionGroup -ProtectionGroup $group -Container $newad
This example shows how to exclude VMs from the existing protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Get the scope of Active Directory objects. Use the Container property of the $group variable. Save the result to the $ad variable.
3. Run the Set-VBRADContainer cmdlet. Set the $ad variable as the Container parameter value. Provide the ExcludeVMs parameter. Save the result to the $newad variable.
4. Run the Set-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value. Set the $newad variable as the Container parameter value.

---

### Parameters
#### **Container**
Specifies the scope of Active Directory objects you want to add to a protection group.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRADContainer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **CustomCredentials**
Specifies custom credentials for authenticating with associated Active Directory objects.

|Type                        |Required|Position|PipelineInput        |
|----------------------------|--------|--------|---------------------|
|`[VBRADCustomCredentials[]]`|false   |named   |True (ByPropertyName)|

#### **Domain**
Specifies the Active Directory domain connection object.

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[VBRADDomain]`|false   |named   |True (ByPropertyName)|

#### **Entity**
Specifies the array of the Active Directory objects from the same domain. The cmdlet will add these objects to the protection scope.
You can add the following types of Active Directory objects:
* Domain
* Cluster
* Organization unit
* Global group
* Folder
* Computer
Note: You cannot add Domain Local or Universal groups.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[VBRADEntity[]]`|false   |named   |True (ByPropertyName)|

#### **ExcludeComputers**
Defines that you want to exclude some Active Directory objects from the protection scope.
Use the ExcludeEntity parameter to specify objects you want to exclude from the protection scope.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **ExcludedEntity**
Specifies Active Directory objects you want to exclude from the protection scope.
Note: You cannot exclude Domain Local or Universal groups.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[VBRADEntity[]]`|false   |named   |True (ByPropertyName)|

#### **ExcludeOfflineComputers**
Defines that the cmdlet will exclude computers that have been offline for over 30 days.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **ExcludeVMs**
Defines that the cmdlet will exclude all VMs from the protection scope.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **MasterCredentials**
Specifies Master account credentials for authenticating with all Active Directory objects in a protection scope.
For authenticating with Active Directory objects that require different credentials, Veeam Backup & Replication uses custom credentials. If you want to use custom credentials for some Active Directory objects, set the UseCustomCredentials parameter.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **UseCustomCredentials**
Defines that you want to use custom credentials for authenticating with some Active Directory objects.
To specify custom credentials, use the CustomCredentials parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRADContainer

Veeam.Backup.PowerShell.Infos.VBRADDomain

Veeam.Backup.PowerShell.Infos.VBRADEntity[]

System.Management.Automation.SwitchParameter

Veeam.Backup.Common.CCredentials

Veeam.Backup.PowerShell.Infos.VBRADCustomCredentials[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRADContainer -Container <VBRADContainer> [-CustomCredentials <VBRADCustomCredentials[]>] [-Domain <VBRADDomain>] [-Entity <VBRADEntity[]>] [-ExcludeComputers] [-ExcludedEntity <VBRADEntity[]>] 
```
```PowerShell
[-ExcludeOfflineComputers] [-ExcludeVMs] [-MasterCredentials <CCredentials>] [-UseCustomCredentials] [<CommonParameters>]
```

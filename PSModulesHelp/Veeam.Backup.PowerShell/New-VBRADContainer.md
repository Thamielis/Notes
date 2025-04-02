New-VBRADContainer
------------------

### Synopsis
Creates a scope of Active Directory objects for a protection group.

---

### Description

This cmdlet creates the VBRADContainer object. This object contains a scope of Active Directory objects. Use this object to create a protection group with the Add-VBRProtectionGroup cmdlet.

---

### Related Links
* [Get-VBRADDomain](Get-VBRADDomain)

* [Find-VBRADEntity](Find-VBRADEntity)

* [New-VBRADCustomCredentials](New-VBRADCustomCredentials)

* [Add-VBRProtectionGroup](Add-VBRProtectionGroup)

---

### Examples
> Example 1. Creating Scope of Active Directory Objects

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
$root = Find-VBRADEntity -Domain $connection
$accounts = Find-VBRADEntity -Domain $connection -Root $root -Name "Accounts"
$servers = Find-VBRADEntity -Domain $connection -Root $root -Name "Servers"
$creds = Get-Credential
$custom = New-VBRADCustomCredentials -Entity $servers -Credentials $creds
New-VBRADContainer -Domain $connection -Entity $root -ExcludeComputers -ExcludedEntity $accounts -MasterCredentials support\jsmith -UseCustomCredentials -CustomCredentials $custom
This example shows how to create a scope of Active Directory objects.
The cmdlet will create a scope with the following settings:
- The scope will contain objects of the Active Directory domain container except for the Accounts container.
- All computers that have been offline for over 30 days and VMs will be excluded from the scope.
- Veeam Backup & Replication will use custom credentials for authenticating with objects from the Servers container.

Perform the following steps:
1. Run the Get-VBRADDomain cmdlet. Specify the ServerName parameter value. Specify the Credentials parameter value. Save the result to the $connection variable.
2. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Save the result to the $root variable.
3. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the $root variable as the Root parameter value. Specify the Name parameter value. Save the result to the $accounts variable.
4. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the $root variable as the Root parameter value. Specify the Name parameter value. Save the result to the $servers variable.
5. Run the Get-credential cmdlet. Type the credentials and save the result to the $creds variable.
6. Run the New-VBRADCustomCredentials cmdlet. Set the $servers variable as the Entity parameter value. Set the $creds variable as the Credentials parameter value. The cmdlet will apply custom credentials to the objects from the Servers container. Save the result to the $custom variable.
7. Run the New-VBRADContainer cmdlet. Specify the following settings:
- Set the $connection variable as the Domain parameter value.
- Set the $root variable as the Entity parameter value.
- Provide the ExcludeComputers parameter.
- Set the $accounts variable as the ExcludedEntity parameter value.
- Specify the MasterCredentials parameter value.
- Provide the UseCustomCredentials parameter.
- Set the $custom variable as the CustomCredentials parameter value.
> Example 2. Creating Protection Group with Scope of Active Directory Objects

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
$root = Find-VBRADEntity -Domain $connection
$accounts = Find-VBRADEntity -Domain $connection -Root $root -Name "Accounts"
$servers = Find-VBRADEntity -Domain $connection -Root $root -Name "Servers"
$creds = Get-Credential
$custom = New-VBRADCustomCredentials -Entity $servers -Credentials $creds
$adscope = New-VBRADContainer -Domain $connection -Entity $root -ExcludeOfflineComputers -ExcludeComputers -ExcludedEntity $accounts -MasterCredentials support\jsmith -UseCustomCredentials -CustomCredentials $custom
Add-VBRProtectionGroup -Name "AD" -Description "Protection Group" -Container $adscope
This example shows how to create a protection group with a scope of Active Directory objects.
Perform the following steps:
1. Create a scope of Active Directory objects:
- Run the Get-VBRADDomain cmdlet. Specify the ServerName parameter value. Specify the Credentials parameter value. Save the result to the $connection variable.
- Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Save the result to the $root variable.
- Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the $root variable as the Root parameter value. Specify the Name parameter value. Save the result to the $accounts variable.
- Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the $root variable as the Root parameter value. Specify the Name parameter value. Save the result to the $servers variable.
- Run the Get-credential cmdlet. Type the credentials and save the result to the $creds variable.
- Run the New-VBRADCustomCredentials cmdlet. Set the $servers variable as the Entity parameter value. Set the $creds variable as the Credentials parameter value. The cmdlet will apply custom credentials to the objects from the Servers container. Save the result to the $custom variable.
- Run the New-VBRADContainer cmdlet. Specify the necessary parameters. Save the result to the $adscope variable.
2. Create a protection group. Run the Add-VBRProtectionGroup cmdlet. Specify the Name and the Description parameter values. Set the $adscope variable as the Container parameter value.

---

### Parameters
#### **CustomCredentials**
Specifies custom credentials for authenticating with associated Active Directory objects.

|Type                        |Required|Position|PipelineInput        |
|----------------------------|--------|--------|---------------------|
|`[VBRADCustomCredentials[]]`|false   |named   |True (ByPropertyName)|

#### **Domain**
Specifies the Active Directory domain connection object.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[VBRADDomain]`|true    |named   |True (ByPropertyName, ByValue)|

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
|`[VBRADEntity[]]`|true    |named   |True (ByPropertyName)|

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
By default this parameter is set to True. If you don't want to exclude offline computers from the protection scope, set this parameter to False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **ExcludeVMs**
Defines that the cmdlet will exclude all VMs from the protection scope.
By default this parameter is set to True. If you don't want to exclude VMs from the protection scope, set this parameter to False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **MasterCredentials**
Specifies Master account credentials for authenticating with all Active Directory objects in a protection scope.
For authenticating with Active Directory objects that require different credentials, Veeam Backup & Replication uses custom credentials. If you want to use custom credentials for some Active Directory objects, set the UseCustomCredentials parameter.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|true    |named   |True (ByPropertyName)|

#### **UseCustomCredentials**
Defines that you want to use custom credentials for authenticating with some Active Directory objects.
To specify custom credentials, use the CustomCredentials parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

---

### Inputs
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
New-VBRADContainer [-CustomCredentials <VBRADCustomCredentials[]>] -Domain <VBRADDomain> -Entity <VBRADEntity[]> [-ExcludeComputers] [-ExcludedEntity <VBRADEntity[]>] [-ExcludeOfflineComputers] [-ExcludeVMs] 
```
```PowerShell
-MasterCredentials <CCredentials> [-UseCustomCredentials] [<CommonParameters>]
```

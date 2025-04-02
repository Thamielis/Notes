Add-VBRCloudSubUser
-------------------

### Synopsis
Creates cloud subuser accounts.

---

### Description

This cmdlet creates new cloud subuser accounts.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRCloudSubUserResource](New-VBRCloudSubUserResource)

---

### Examples
> Example - Creating Cloud Subuser Account

$cloudrepository = Get-VBRBackupRepository | Where {$_.Type -eq "Cloud"} | Select -First 1
$subuserquota = New-VBRCloudSubUserResource -CloudRepository $cloudrepository -RepositoryFriendlyName "Cloud Repository 1" -Quota 10
$cloudprovider = Get-VBRCloudProvider
Add-VBRCloudSubUser -CloudProvider $cloudprovider -Name "Subuser 1" -Password "Pass 123" -Resources $subuserquota
This example shows how to create a cloud subuser account.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Pipe the cmdlet output to the Where cmdlet to filter repositories where Type property equals Cloud. Pipe the cmdlet output to the Select cmdlet. Set the 1 number as the First parameter value. Save the result to the $cloudrepository variable.
2. Run the New-VBRCloudSubUserResource cmdlet. Set the $cloudrepository variable as the CloudRepository parameter value. Specify the RepositoryFriendlyName and the Quota parameter values. Save the result to the $subuserquota variable.
3. Run the Get-VBRCloudProvider cmdlet. Save the result to the $cloudprovider variable.
4. Run the Add-VBRCloudSubUser cmdlet. Specify the following settings:
- Set the $cloudprovider variable as the CloudProvider parameter value.
- Specify the Name parameter value.
- Specify the Password parameter value.
- Set the $subuserquota variable as the Resources parameter value.

---

### Parameters
#### **CloudProvider**
Specifies the cloud provider. The resources of this provider will be parent for the subuser. Accepts the VBRCloudProvider object. To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRCloudProvider]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies the description of the cloud subuser account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Disabled**
Defines that the cloud subuser is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the subuser account. The subuser name must meet the following requirements:
* The maximum length of the subuser name is 128 characters. It is recommended that you create short subuser names to avoid problems with long paths to backup files on the cloud repository.
* The subuser name may contain space characters.
* The subuser name must not contain the following characters: \/:*?\"<>|=; as well as Unicode characters.
* The subuser name must not end with the period character [.].

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to set to the subuser account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Resources**
Specifies the quota of the subuser backup resources you want to give to the subuser. Accepts the VBRCloudSubUserResource[] object. To create this object, run the New-VBRCloudSubUserResource cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRCloudSubUserResource[]]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudProvider

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCloudSubUser -CloudProvider <VBRCloudProvider> [-Description <String>] [-Disabled] -Name <String> -Password <String> -Resources <VBRCloudSubUserResource[]> [<CommonParameters>]
```

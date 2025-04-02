New-VBRCloudSubUserResource
---------------------------

### Synopsis
Creates quotas of cloud subuser resources.

---

### Description

This cmdlet creates a new VBRCloudSubUserResource object. This object contains a quota of the tenant backup resources. The subtenant quota is a part of subuser account. To assign the quota to a subuser, run the Add-VBRCloudSubUser cmdlet and use the created VBRCloudSubUserResource object.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Creating Resource Quota for Subuser with Limited Disk Space

$cloudrepository = Get-VBRBackupRepository | Where {$_.Type -eq "Cloud"} | Select -First 1
New-VBRCloudSubUserResource -CloudRepository $cloudrepository -RepositoryFriendlyName "Cloud Repository 1" -Quota 10
This example shows how to create a quota of resources for a subuser with a limited disk space.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Pipe the cmdlet output to the Where cmdlet to filter repositories where Type property equals Cloud. Pipe the cmdlet output to the Select cmdlet. Set the 1 number as the First parameter value. Save the result to the $cloudrepository variable.
2. Run the New-VBRCloudSubUserResource cmdlet. Set the $cloudrepository variable as the CloudRepository parameter value. Specify the RepositoryFriendlyName and the Quota parameter values.
> Example 2. Creating Resource Quota for Subuser with Unlimited Disk Space

$cloudrepository = Get-VBRBackupRepository | Where {$_.Type -eq "Cloud"} | Select -First 1
New-VBRCloudSubUserResource -CloudRepository $cloudrepository -RepositoryFriendlyName "Cloud Repository 1" -Unlimited
This example shows how to create a quota of resources for a subuser with unlimited disk space.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Pipe the cmdlet output to the Where cmdlet to filter repositories where Type property equals Cloud. Pipe the cmdlet output to the Select cmdlet. Set the 1 number as the First parameter value. Save the result to the $cloudrepository variable.
2. Run the New-VBRCloudSubUserResource cmdlet. Set the $cloudrepository variable as the CloudRepository parameter value. Specify the RepositoryFriendlyName parameter value. Provide the Unlimited parameter.

---

### Parameters
#### **CloudRepository**
Specifies the backup resources of the cloud tenant. The disk space available under the cloud user account will be used as parent resources for creating the subuser quota. Use the Quota or the Unlimited parameter to indicate the amount of disk space you want to give to a subuser. Accepts the CCloudRepository object, GUID or string. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[CCloudRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Quota**
Specifies the amount of space you want to give to the subuser on the selected backup repository. Permitted value: 1 to 2097151  (GB).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |named   |True (ByPropertyName)|

#### **RepositoryFriendlyName**
Specifies the name you want to give to the subuser quota. This name will be displayed in the list of backup repositories at the subuser side.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **Unlimited**
Defines that the quota of resources has unlimited disk space. With unlimited quota, the subuser will be able to use all parent cloud repository.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.Core.CCloudRepository

System.String

System.Int32

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRCloudSubUserResource -CloudRepository <CCloudRepository> -Quota <Int32> -RepositoryFriendlyName <String> [<CommonParameters>]
```
```PowerShell
New-VBRCloudSubUserResource -CloudRepository <CCloudRepository> -RepositoryFriendlyName <String> -Unlimited [<CommonParameters>]
```

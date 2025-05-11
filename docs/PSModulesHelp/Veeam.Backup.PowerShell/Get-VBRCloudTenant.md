Get-VBRCloudTenant
------------------

### Synopsis
Returns cloud tenant accounts.

---

### Description

This cmdlet returns cloud tenant accounts of the following types:
- Simple cloud tenant accounts
- vCD cloud tenant accounts

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Getting All Cloud Tenants

```PowerShell
Get-VBRCloudTenant
This example shows how to look for all cloud tenants.
```
> Example 2. Getting Cloud Tenant by Tenant Account Name

```PowerShell
Get-VBRCloudTenant -Name "ABC Company"
This example shows how to look for a cloud tenant by the tenant account name.
```
> Example 3. Getting Cloud Tenant by Tenant Account Backup Repository

$repository = Get-VBRBackupRepository -Name "Backups Vol2"
Get-VBRCloudTenant -Repository $repository
This example shows how to look for a cloud tenants by the tenant account backup repository.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRCloudTenant cmdlet. Set the $repository variable as Repository parameter value.

---

### Parameters
#### **Id**
Specifies an array of cloud tenant IDs you want to get. Accepts GUID[] or string.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of cloud tenant names.  The cmdlet will return details on tenants with specified names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Repository**
Specifies an array of backup repositories. The cmdlet will return the tenants that use these repositories. You can specify simple or scale-out backup repositories. You cannot specify cloud repositories. Accepts the CBackupRepository[] object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[CBackupRepository[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

Veeam.Backup.Core.CBackupRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudTenant [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTenant [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTenant [-Repository <CBackupRepository[]>] [<CommonParameters>]
```

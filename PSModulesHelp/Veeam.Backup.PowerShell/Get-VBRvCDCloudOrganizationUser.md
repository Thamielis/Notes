Get-VBRvCDCloudOrganizationUser
-------------------------------

### Synopsis
Returns vCD cloud user accounts.

---

### Description

This cmdlet returns the VBRvCDCloudOrganizationUser object that contains the details about vCD user accounts added to your organization. You can use this object to create new subtenants. NOTE:
- You must add vCD users to the vCD Organization in VMware vCloud Director beforehand. The user must not have the administrator role.
- This cmdlet works for tenants only.
- Run the Find-VBRvCloudEntity cmdlet with the OrganizationUser parameter to get the array of the vCD users from the Cloud Provider side.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

---

### Examples
> Example 1. Getting All vCD User Accounts in vCD Organization

```PowerShell
Get-VBRvCDCloudOrganizationUser
This example shows how to get all vCD user accounts added to your vCD Organization.
```
> Example 2. Getting vCD User Account by Name

```PowerShell
Get-VBRvCDCloudOrganizationUser -Name "vCDUser1"
This example shows how to get a vCD user by name.
```
> Example 3. Getting vCD User Account by vCD Service Provider

$provider = Get-VBRCloudProvider -Name "vCDProvider"
Get-VBRvCDCloudOrganizationUser -vCDCloudProvider $provider -Name "vCDuser"
This example shows how to get a vCD user by vCD service provider.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $provider variable.
2. Run the Get-VBRvCDCloudOrganizationUser cmdlet. Set the $provider variable as the vCDCloudProvider parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies an array of names for the vCD user account that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **vCDCloudProvider**
Specifies the service provider added to Veeam Backup & Replication. Accepts the VBRCloudProvider[] object.  To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRCloudProvider[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudProvider[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRvCDCloudOrganizationUser [-Name <String[]>] [-vCDCloudProvider <VBRCloudProvider[]>] [<CommonParameters>]
```

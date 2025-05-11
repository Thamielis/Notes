Get-VBRvCDCloudOrganizationvDC
------------------------------

### Synopsis
Returns organization vDCs.

---

### Description

This cmdlet returns Organization vDCs. NOTE: This cmdlet is available for tenants only.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

---

### Examples
> Example 1. Getting All Organization VCDs

```PowerShell
Get-VBRvCDCloudOrganizationvDC
This command gets all organization vCDs.
```
> Example 2. Getting Organization VCD by Name

```PowerShell
Get-VBRvCDCloudOrganizationvDC -Name "Organization vDC"
This command gets an organization vCD by the organization vCD name.
```
> Example 3. Getting Organization VCD by Name and Cloud Service Provider

$provider = Get-VBRCloudProvider -Name "vCD CloudProvider"
Get-VBRvCDCloudOrganizationvDC -Name "vCD Organization" -CloudProvider $provider
This example shows how to get all vCD Cloud organization by specifying the name and the cloud provider details.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $provider variable.
2. Run the Get-VBRvCDCloudOrganizationvDC cmdlet. Specify the Name parameter value. Set the $provider variable as the CloudProvider parameter value.

---

### Parameters
#### **CloudProvider**
Specifies a cloud service provider. Veeam Backup & Replication will return the vCD cloud Organizations, managed by the cloud service provider. Accepts the VBRCloudProvider[] object. To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRCloudProvider[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies the ID of organization vCDs that you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the name of organization vCDs that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRvCDCloudOrganizationvDC [-CloudProvider <VBRCloudProvider[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRvCDCloudOrganizationvDC [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRvCDCloudOrganizationvDC [-Name <String[]>] [<CommonParameters>]
```

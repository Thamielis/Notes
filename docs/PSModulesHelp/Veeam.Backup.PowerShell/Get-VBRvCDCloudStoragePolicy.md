Get-VBRvCDCloudStoragePolicy
----------------------------

### Synopsis
Returns vCD storage policies.

---

### Description

This cmdlet returns vCD storage policies. The service provider must configure a storage policy in VMware vCloud Director beforehand.

---

### Related Links
* [Get-VBRvCDCloudOrganizationvDC](Get-VBRvCDCloudOrganizationvDC)

---

### Examples
> Example 1. Getting vCD Cloud Storage Policy

```PowerShell
Get-VBRvCDCloudStoragePolicy -Name "Silver policy"
This command gets a vCD cloud storage policy.
```
> Example 2. Getting vCD Cloud Storage Policy Assigned to Selected Organization VDC

$vdc = Get-VBRvCDCloudOrganizationvDC -Name "Organization VDC"
Get-VBRvCDCloudStoragePolicy -Name "Silver Policy" -OrganizationvDC $vdc
This example shows how to get the vCD cloud storage policy that is assigned to the specific organization VDC.

Perform the following steps:
1. Run the Get-VBRvCDCloudOrganizationvDC cmdlet. Specify the Name parameter value. Save the result to the $vdc variable.
2. Run the Get-VBRvCDCloudStoragePolicy cmdlet. Specify the Name parameter value. Set the $vdc variable as the OrganizationvDC parameter value.

---

### Parameters
#### **Id**
Specifies the ID of the vCD cloud Organization that you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the name of the vCD cloud policy that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **OrganizationvDC**
Specifies a cloud service provider. Veeam Backup & Replication will return the vCD cloud Organizations, managed by the cloud service provider. Accepts the VBRvCDCloudOrganizationvDC object.  To get this object, run the Get-VBRvCDCloudOrganizationvDC cmdlet.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRvCDCloudOrganizationvDC]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRvCDCloudOrganizationvDC

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRvCDCloudStoragePolicy [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRvCDCloudStoragePolicy [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRvCDCloudStoragePolicy [-OrganizationvDC <VBRvCDCloudOrganizationvDC>] [<CommonParameters>]
```

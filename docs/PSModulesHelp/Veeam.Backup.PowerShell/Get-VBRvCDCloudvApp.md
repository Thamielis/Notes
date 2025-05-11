Get-VBRvCDCloudvApp
-------------------

### Synopsis
Returns vCD vApps.

---

### Description

This cmdlet returns vApps that are added to Organization DCs. NOTE:  This cmdlet is available for tenants only.

---

### Related Links
* [Get-VBRvCDCloudOrganizationvDC](Get-VBRvCDCloudOrganizationvDC)

---

### Examples
> Example - Getting vApp Container

$vdc = Get-VBRvCDCloudOrganizationvDC -Name "Organization VDC"
$vApp = Get-VBRvCDCloudvApp -OrganizationvDC $vdc
This example shows how to get a vApp container.

Perform the following steps:
1. Run the Get-VBRvCDCloudOrganizationvDC cmdlet. Specify the Name parameter value. Save the result to the $vdc variable.
2. Run the Get-VBRvCDCloudvApp cmdlet. Set the $vdc variable as OrganizationvDC parameter value.

---

### Parameters
#### **Name**
Specifies the name of the vApp that you want to get.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **OrganizationvDC**
Specifies a cloud service provider. Veeam Backup & Replication will return the vCD cloud Organizations, managed by the cloud service provider. Accepts the VBRvCDCloudOrganizationvDC object. To get this object, run the Get-VBRvCDCloudOrganizationvDC cmdlet.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRvCDCloudOrganizationvDC]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String[]

Veeam.Backup.PowerShell.Infos.VBRvCDCloudOrganizationvDC

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRvCDCloudvApp [-Name <String[]>] -OrganizationvDC <VBRvCDCloudOrganizationvDC> [<CommonParameters>]
```

Get-VBRvCDCloudVM
-----------------

### Synopsis
Returns cloud VMs from organization VDCs.

---

### Description

This cmdlet returns cloud VMs from organization VDCs. The tenant will use this VM to set up mapping.

---

### Related Links
* [Get-VBRvCDCloudOrganizationvDC](Get-VBRvCDCloudOrganizationvDC)

---

### Examples
> Example - Getting All VMs from Selected Organization VDC

$vdc = Get-VBRvCDCloudOrganizationvDC -Name "Cloud Organization 01"
Get-VBRvCDCloudVM -OrganizationvDC $vdc
This example shows how to get all VMs from the specific organization VDC.

Perform the following steps:
1. Run the Get-VBRvCDCloudOrganizationvDC cmdlet. Specify the Name parameter value. Save the result to the $vdc variable.
2. Run the Get-VBRvCDCloudVM cmdlet. Set the $vdc parameter as the OrganizationvDC parameter value.

---

### Parameters
#### **Id**
Specifies an array of IDs. The cmdlet will return VMs with these IDs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Name**
Specifies an array of names. The cmdlet will return VMs with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **OrganizationvDC**
Specifies an organization VDC.  The cmdlet will return VMs from the specified organization VDC. Accepts the VBRvCDCloudOrganizationvDC object.  To get this object, run the Get-VBRvCDCloudOrganizationvDC cmdlet.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRvCDCloudOrganizationvDC]`|true    |named   |True (ByPropertyName, ByValue)|

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
Get-VBRvCDCloudVM [-Id <String[]>] -OrganizationvDC <VBRvCDCloudOrganizationvDC> [<CommonParameters>]
```
```PowerShell
Get-VBRvCDCloudVM [-Name <String[]>] -OrganizationvDC <VBRvCDCloudOrganizationvDC> [<CommonParameters>]
```

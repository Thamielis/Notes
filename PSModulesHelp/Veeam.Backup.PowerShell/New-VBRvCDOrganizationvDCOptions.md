New-VBRvCDOrganizationvDCOptions
--------------------------------

### Synopsis
Creates Organization vDCs settings.

---

### Description

This cmdlet creates a VBRvCDOrganizationvDCOptions object that contains settings for Organization vDCs.

---

### Related Links
* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Defining Settings for Organization VDC

$orgvdc = Find-VBRvCloudEntity -OrganizationVdc -Name "VDC 01"
New-VBRvCDOrganizationvDCOptions -OrganizationvDC $orgvdc
This example shows how to define settings for the Organization vDC.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Provide the OrganizationVdc parameter. Specify the Name parameter value. Save the result to the $orgvdc variable.
2. Run the New-VBRvCDOrganizationvDCOptions cmdlet. Set the $orgvdc variable as the OrganizationvDC parameter value.

---

### Parameters
#### **EnableWanAccelerator**
Enables the WAN accelerator option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OrganizationvDC**
Specifies organization VDCs that you want to assign to the tenant.  The specified organization VDCs will provide the resources for tenant VM replicas. Accepts the CVcdOrganizationVdcItem object. To get this object, run the Find-VBRvCloudEntity cmdlet and provide the OrganizationVdc parameter.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[CVcdOrganizationVdcItem]`|true    |0       |True (ByValue)|

#### **WanAccelerator**
Specifies the target WAN accelerator that is configured at the SP side. Accepts the CWanAccelerator object.  To get this object, run the Get-VBRWANAccelerator cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.CVcdOrganizationVdcItem

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRvCDOrganizationvDCOptions [-OrganizationvDC] <CVcdOrganizationVdcItem> [-EnableWanAccelerator] [-WanAccelerator <CWanAccelerator>] [<CommonParameters>]
```

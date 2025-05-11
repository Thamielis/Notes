Get-VBRvCDCloudNetworkInfo
--------------------------

### Synopsis
Returns target vCD networks for replica mapping.

---

### Description

This cmdlet returns target vCD networks for replica mapping.

---

### Related Links
* [Get-VBRvCDCloudOrganizationvDC](Get-VBRvCDCloudOrganizationvDC)

---

### Examples
> Example 1. Getting All VCD Target Networks

```PowerShell
Get-VBRvCDCloudStoragePolicy
This command gets all vCD target networks.
```
> Example 2. Getting VCD Target Network for Selected Organization VDC

$vdc = Get-VBRvCDCloudOrganizationvDC -Name "vCDorg"
Get-VBRvCDCloudStoragePolicy -Name "Silver Policy" -OrganizationvDC $vdc
This example shows how to get a vCD target cloud network for the particular organization VDC.

Perform the following steps:
1. Run the Get-VBRvCDCloudOrganizationvDC cmdlet. Specify the Name parameter value. Save the result to the $vdc variable.
2. Run the Get-VBRvCDCloudStoragePolicy cmdlet. Specify the Name parameter value. Set the $vdc variable as the OrganizationvDC parameter value.

---

### Parameters
#### **Id**
Specifies the IDs of Organizations VDCs that you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies a name of VDC network that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **OrganizationvDC**
Specifies an organization VDC.  The cmdlet will return target VDC networks for the specified organization VDC. Accepts the Get-VBRCloudProvider object. To get this object, run the Get-VBRvCDCloudOrganizationvDC cmdlet.

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
Get-VBRvCDCloudNetworkInfo [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRvCDCloudNetworkInfo [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRvCDCloudNetworkInfo [-OrganizationvDC <VBRvCDCloudOrganizationvDC>] [<CommonParameters>]
```

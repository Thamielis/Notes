New-VBRvCDReplicationResource
-----------------------------

### Synopsis
Defines vCD replication resource settings.

---

### Description

This cmdlet creates the VBRvCDReplicationResource object that contains settings for the replication resources.

---

### Related Links
* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

* [New-VBRvCDOrganizationvDCOptions](New-VBRvCDOrganizationvDCOptions)

---

### Examples
> Defining vCD Replication Resource Settings

$orgvdc = Find-VBRvCloudEntity -OrganizationVdc -Name "Organization 05"
$dcoptions = New-VBRvCDOrganizationvDCOptions -OrganizationvDC $vdc
New-VBRvCDReplicationResource -OrganizationvDCOptions $dcoptions
This example shows how to set the Organization 05 organization VDC to provide the resources for tenant VM replicas.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Provide the OrganizationVdc parameter. Specify the Name parameter value. Save the result to the $orgvdc variable.
2. Run the New-VBRvCDOrganizationvDCOptions cmdlet. Set the $orgvdc variable as the OrganizationvDC parameter value. Save the result to the $dcoptions variable.
3. Run the New-VBRvCDReplicationResource cmdlet. Set the $dcoptions variable as the OrganizationvDCOptions parameter value.

---

### Parameters
#### **EnableNetworkFailoverResources**
Enables the tenant to use the network resources to perform failover task. The cmdlet will create a network extension appliance with default settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OrganizationvDCOptions**
Specifies organization VDCs that you want to assign to the tenant.  The specified organization VDCs will provide the resources for tenant VM replicas. Accepts the VBRvCDOrganizationvDCOptions[] object.  To get this object, run the New-VBRvCDOrganizationvDCOptions cmdlet.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBROrganizationvDCOption[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBROrganizationvDCOption[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRvCDReplicationResource [-EnableNetworkFailoverResources] -OrganizationvDCOptions <VBROrganizationvDCOption[]> [<CommonParameters>]
```

Set-VBRHvCloudHWPlanDatastore
-----------------------------

### Synopsis
Modifies Hyper-V cloud storage for tenants replication resources.

---

### Description

This cmdlet modifies the settings of a selected cloud storage in an existing hardware plan.

---

### Related Links
* [Get-VBRCloudHardwarePlan](Get-VBRCloudHardwarePlan)

* [Get-VBRCloudDatastore](Get-VBRCloudDatastore)

* [Set-VBRHvCloudHardwarePlan](Set-VBRHvCloudHardwarePlan)

---

### Examples
> Example - Modifying Cloud Storage Settings for Existing Hardware Plan

$plan = Get-VBRCloudHardwarePlan
$d1 = $plan.datastore | Where-Object {$_.FriendlyName -eq "Cloud Replicas ABC"}
$d2 = $plan.datastore | Where-Object {$_.FriendlyName -eq "Cloud Replicas North"}
$d1new = Set-VBRHvCloudHWPlanDatastore -CloudDatastore $d1 -FriendlyName "Cloud Replicas ABC Extended" -Quota 950
Set-VBRHvCloudHardwarePlan -HardwarePlan $plan -Datastore $d1new, $d2
This example shows how to modify cloud storage settings of an existing hardware plan.
Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Save the result to the $plan variable.
2. Use the Datastore property of the VBRHvCloudHardwarePlan object saved to the $plan variable. Pipe the output to the Where-Object cmdlet. Specify the following settings:
- Provide the $_. automatic variable.
- Provide the FriendlyName property.
- Specify the eq comparison operator value.
- Save each cloud storage to a separate variable: $d1, $d2, and so on.
3. Run the Set-VBRHvCloudHWPlanDatastore cmdlet. Set the $d1 variable as the CloudDatastore parameter value. Specify the FriendlyName and the Quota parameter values. Save the result to the $d1new variable.
4. Run the Set-VBRHvCloudHardwarePlan cmdlet. Set the $plan variable as the HardwarePlan parameter value. Set the $d1new, $d2 variables as the Datastore parameter values.

---

### Parameters
#### **CloudDatastore**
Specifies the cloud datastore you want to modify. Accepts the VBRHvCloudHardwarePlanDatastore object. To get this object, use the datastore property of the object returned by the Get-VBRCloudHardwarePlan cmdlet.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRHvCloudHardwarePlanDatastore]`|true    |named   |True (ByPropertyName, ByValue)|

#### **DatastorePath**
Specifies the path to the folder on the cloud provider host that is used in the hardware plan. This folder will be used to provide the storage space to a tenant under a hardware plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **FriendlyName**
Specifies the name of the storage that will be displayed to the tenant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Quota**
Specifies the amount of disk space you want to provide to a tenant under a hardware plan (Gb).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRHvCloudHardwarePlanDatastore

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvCloudHWPlanDatastore -CloudDatastore <VBRHvCloudHardwarePlanDatastore> [-DatastorePath <String>] [-FriendlyName <String>] [-Quota <Int32>] [<CommonParameters>]
```

Set-VBRViCloudHWPlanDatastore
-----------------------------

### Synopsis
Modifies VMware cloud storage for tenants replication resources.

---

### Description

This cmdlet modifies the settings of a selected cloud storage in an existing hardware plan.

---

### Related Links
* [Get-VBRCloudDatastore](Get-VBRCloudDatastore)

* [Get-VBRCloudHardwarePlan](Get-VBRCloudHardwarePlan)

* [Set-VBRViCloudHardwarePlan](Set-VBRViCloudHardwarePlan)

* [Find-VBRViStoragePolicy](Find-VBRViStoragePolicy)

---

### Examples
> Example - Modifying Cloud Storage Settings for Existing Hardware Plan

$plan = Get-VBRCloudHardwarePlan
$d1 = $plan.datastore | Where-Object {$_.FriendlyName -eq "Cloud Replicas ABC"}
$d2 = $plan.datastore | Where-Object {$_.FriendlyName -eq "Cloud Replicas North"}
$d1new = Set-VBRViCloudHWPlanDatastore -CloudDatastore $d1 -FriendlyName "Cloud Replicas ABC Extended" -Quota 950
Set-VBRViCloudHardwarePlan -HardwarePlan $plan -Datastore $d1new, $d2
This example shows how to modify cloud storage settings of an existing hardware plan.
Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Save the result to the $plan variable.
2. Use the Datastore property of the VBRViCloudHardwarePlan object saved to the $plan variable. Pipe the output to the Where-Object cmdlet. Specify the following settings: - Provide the $_. automatic variable.
- Provide the FriendlyName property.
- Specify the eq comparison operator value.
- Save each cloud storage to a separate variable: $d1, $d2, and so on.
3. Run the Set-VBRViCloudHWPlanDatastore cmdlet. Set the $d1 variable as the CloudDatastore parameter value. Specify the FriendlyName and the Quota parameter values. Save the result to the $d1new variable.
4. Run the Set-VBRViCloudHardwarePlan cmdlet. Set the $plan variable as the HardwarePlan parameter value. Set the $d1new and $d2 variables as the Datastore parameter value.

---

### Parameters
#### **CloudDatastore**
Specifies the cloud storage you want to modify. Accepts the VBRViCloudHardwarePlanDatastore object. To get this object, run the Get-VBRCloudHardwarePlan cmdlet and use the Datastore property.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRViCloudHardwarePlanDatastore]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Datastore**
Specifies the cloud provider datastore or datastore cluster. This datastore will be used to provide the storage space to a tenant under a hardware plan. Accepts the VBRViDatastore and VBRViDatastoreCluster objects. To get this object, run the Find-VBRViDatastore or the Find-VBRViDatastoreCluster cmdlets.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **FriendlyName**
Specifies the name of the storage that will be displayed to the tenant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Quota**
Specifies the amount of disk space you want to provide to a tenant under a hardware plan (Gb). Permitted value: 1 to 2097151 (GB).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profile. A datastore with matching profiles will be used. Note: If you specify the parameter as -StoragePolicy null, the storage policy profile is reset to the default one. Accepts the VBRViStoragePolicy object. To get this object, run the Find-VBRViStoragePolicy cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViCloudHardwarePlanDatastore

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViCloudHWPlanDatastore -CloudDatastore <VBRViCloudHardwarePlanDatastore> [-Datastore <VBRViDatastoreBase>] [-FriendlyName <String>] [-Quota <Int32>] [-StoragePolicy <VBRViStoragePolicy>] 
```
```PowerShell
[<CommonParameters>]
```

New-VBRViCloudHWPlanDatastore
-----------------------------

### Synopsis
Creates VMware cloud storage for tenants replication resources.

---

### Description

This cmdlet creates a VBRViCloudHardwarePlanDatastore object. This object contains a quota of storage resources on the cloud provider datastores and is used further in hardware plans. In the hardware plan, this quota will be presented as a cloud storage to a tenant. This object is used then in the Add-VBRViCloudHardwarePlan cmdlet.

---

### Related Links
* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Find-VBRViStoragePolicy](Find-VBRViStoragePolicy)

---

### Examples
> Example - Creating Cloud Storage for Selected Datastore

$datastore = Get-VBRServer -Name "ESXiHost" | Find-VBRViDatastore -Name "Veeam Cloud Datastore"
$cloudreplicas = New-VBRViCloudHWPlanDatastore -Datastore $datastore -FriendlyName "Cloud Replicas" -Quota 500
This example shows how to create a cloud storage on the "Veeam Cloud Datastore" with the following parameters:
- Friendly name: "Cloud Replicas"
- Quota: 500 Gb
Perform the following steps:
1. To get the Veeam Cloud Datastore:
- Run the Get-VBRServer cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Find-VBRViDatastore cmdlet. Specify the Name parameter value.
- Save the result to the $datastore variable.
2. Run the New-VBRViCloudHWPlanDatastore cmdlet. Specify the following settings:
- Set the $datastore variable as the Datastore parameter value.
- Specify the FriendlyName parameter value.
- Specify the Quota parameter value.
- Save the result to the $cloudreplicas variable.

---

### Parameters
#### **Datastore**
Specifies the cloud provider datastore. This datastore will be used to provide the storage space to a tenant under a hardware plan. Accepts the VBRViDatastoreBase object.  To get this object, run the Find-VBRViDatastore cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|true    |named   |False        |

#### **FriendlyName**
Specifies the name of the storage that will be displayed to the tenant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Quota**
Specifies the amount of disk space you want to provide to a tenant under a hardware plan (Gb).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profile. A datastore with matching profiles will be used. Accepts the VBRViStoragePolicy object.  To get this object, run the Find-VBRViStoragePolicy cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRViCloudHWPlanDatastore -Datastore <VBRViDatastoreBase> -FriendlyName <String> -Quota <Int32> [-StoragePolicy <VBRViStoragePolicy>] [<CommonParameters>]
```

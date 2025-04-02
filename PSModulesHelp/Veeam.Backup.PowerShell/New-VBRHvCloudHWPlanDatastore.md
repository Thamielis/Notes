New-VBRHvCloudHWPlanDatastore
-----------------------------

### Synopsis
Creates Hyper-V cloud storage for tenants replication resources.

---

### Description

This cmdlet creates a VBRHvCloudHardwarePlanDatastore object. This object contains a quota of storage resources on the cloud provider disks and is used further in hardware plans. In the hardware plan, this quota will be presented as a cloud storage to a tenant. This object is used then in the Add-VBRHvCloudHardwarePlan cmdlet.

---

### Examples
> Example - Creating Cloud Storage on Selected Datastore

$cloudreplicas = New-VBRHvCloudHWPlanDatastore -DatastorePath "D:\Replicas" -FriendlyName "Cloud Replicas" -Quota 500
This example shows how to create a cloud storage on the "Veeam Cloud Datastore" with the following parameters:
- Friendly name: "Cloud Replicas"
- Quota: 500 Gb

---

### Parameters
#### **DatastorePath**
Specifies the path to the folder on the cloud provider host that is used in the hardware plan. This folder will be used to provide the storage space to a tenant under a hardware plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
New-VBRHvCloudHWPlanDatastore -DatastorePath <String> -FriendlyName <String> -Quota <Int32> [<CommonParameters>]
```

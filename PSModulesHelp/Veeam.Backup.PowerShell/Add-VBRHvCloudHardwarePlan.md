Add-VBRHvCloudHardwarePlan
--------------------------

### Synopsis
Creates Hyper-V hardware plans.

---

### Description

This cmdlet creates a new hardware plan for Hyper-V environments.

The hardware plan allocates the following resources to a tenant:
- Cloud host. When creating replicas, the tenant will use this host as target host to register the replicated VMs.
- Quota of the cloud host CPU and memory.
- [Pre-configure] Networks to which the tenant will connect the cloud replicas. Use the cmdlets in the VLANs Configuration section to pre-configure the pool of VLANs.
- [Pre-configure] Cloud storage: a quota of datastores allocated to tenants. Run the New-VBRHvCloudHWPlanDatastore cmdlet to create the cloud storage.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [New-VBRHvCloudHWPlanDatastore](New-VBRHvCloudHWPlanDatastore)

---

### Examples
> Example - Creating Hyper-V Hardware Plan

$server = Get-VBRServer -Type HvServer -Name "Hyper-VHost"
$switches = Get-VBRHvServerNetworkInfo -Server $server
New-VBRCloudVLANConfiguration -Server $server -HvNetworkInfo $switches[0] -FirstVLANWithInternet 1 -LastVLANWithInternet 5 -FirstVLANWithoutInternet 6 -LastVLANWithoutInternet 10
$cloudreplicas = New-VBRHvCloudHWPlanDatastore -DatastorePath "D:\Replicas" -FriendlyName "Cloud Replicas" -Quota 500
$server = Get-VBRServer -Type HvServer -Name "Hyper-V Host"
Add-VBRHvCloudHardwarePlan -Name "Hyper-V Silver" -Description "Hyper-V Hardware Plan" -Server $server -Datastore $cloudreplicas -CPU 4000 -Memory 2000 -NumberOfNetWithoutInternet 1
This example shows how to create a hardware plan with the following settings:
- CPU quota: 4000 MHz
- Memory quota: 2000 Gb
- Cloud storage: "Cloud Replicas"
- Networks without access to the Internet: 1
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Set the HvServer option for the Type parameter. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $switches variable.
3. Run the New-VBRCloudVLANConfiguration cmdlet. Set the $server variable as the Server parameter value. Set the $switches variable as the HvNetworkInfo parameter value. Specify the FirstVLANWithInternet, LastVLANWithInternet, FirstVLANWithoutInternet, LastVLANWithoutInternet parameter values.
4. Run the New-VBRHvCloudHWPlanDatastore cmdlet. Specify the DatastorePath parameter value. Specify the FriendlyName and the Quota parameter values. Save the storage to the $cloudreplicas variable.
5. Run the Get-VBRServer cmdlet. Set the HvServer option for the Type parameter. Specify the Name parameter value. Save the result to the $server variable.
6. Run the Add-VBRHvCloudHardwarePlan cmdlet. Specify the following settings:
- Specify the Name and the Description parameter values.
- Set the $server variable as the Server parameter value.
- Set the $cloudreplicas variable as the Datastore parameter value.
- Specify the CPU and the Memory parameter values.
- Specify the NumberOfNetWithoutInternet parameter value.

---

### Parameters
#### **CPU**
Specifies the quota of CPU resources you want to allocate to the tenant under this hardware plan (MHz).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Datastore**
Specifies the array of cloud storages. The hardware plan will use use these storages to allocate storage space to the tenant under this hardware plan. Accepts the VBRHvCloudHardwarePlanDatastore[] object. To get this object, run the New-VBRHvCloudHWPlanDatastore cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRHvCloudHardwarePlanDatastore[]]`|true    |named   |False        |

#### **Description**
Specifies the description of the hardware plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Memory**
Specifies the quota of CPU memory you want to allocate to the tenant under this hardware plan (Gb).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the hardware plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **NumberOfNetWithInternet**
Specifies the number of networks with access to the Internet that you want to allocate to the tenant under this hardware plan.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **NumberOfNetWithoutInternet**
Specifies the number of networks without access to the Internet that you want to allocate to the tenant under this hardware plan.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies the Hyper-V host. The resources of this host (CPU and memory quotas) will be allocated to the tenant by the hardware plan. Accepts the CHost object or string (name of server). To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **UnlimitedCPU**
Defines that the quota of CPU resources is unlimited. If you provide this parameter, the tenant will be able to use all CPU resources of the host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UnlimitedMemory**
Defines that the quota of CPU memory is unlimited. If you provide this parameter, the tenant will be able to use all memory resources of the host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Add-VBRHvCloudHardwarePlan [-CPU <Int32>] -Datastore <VBRHvCloudHardwarePlanDatastore[]> [-Description <String>] [-Memory <Int32>] -Name <String> [-NumberOfNetWithInternet <Int32>] [-NumberOfNetWithoutInternet 
```
```PowerShell
<Int32>] -Server <CHost> [-UnlimitedCPU] [-UnlimitedMemory] [<CommonParameters>]
```

Add-VBRViCloudHardwarePlan
--------------------------

### Synopsis
Creates VMware hardware plans.

---

### Description

This cmdlet creates a new hardware plan for VMware environments.

The hardware plan allocates the following resources to a tenant:
- Cloud host. When creating replicas, the tenant will use this host as target host to register the replicated VMs.
- Quota of the cloud host CPU and memory.
- [Pre-configure] Networks to which the tenant will connect the cloud replicas. Use the cmdlets in the VLANs Configuration section to pre-configure the pool of VLANs.
- [Pre-configure] Cloud storage: a quota of datastores allocated to tenants. Run the New-VBRViCloudHWPlanDatastore cmdlet to create the cloud storage.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [New-VBRViCloudHWPlanDatastore](New-VBRViCloudHWPlanDatastore)

---

### Examples
> Example - Creating Hardware Plan for VMware

$server = Get-VBRServer -Type ESXi -Name "ESXiHost"
$switches = Get-VBRViVirtualSwitch -Server $server
New-VBRCloudVLANConfiguration -Server $server -ViVirtualSwitch $switches[0] -FirstVLANWithInternet 1 -LastVLANWithInternet 5 -FirstVLANWithoutInternet 6 -LastVLANWithoutInternet 10
$datastore = Get-VBRServer -Name "ESXiHost" | Find-VBRViDatastore -Name "Veeam Cloud Datastore"
$cloudreplicas = New-VBRViCloudHWPlanDatastore -Datastore $datastore -FriendlyName "Cloud Replicas" -Quota 500
$server = Get-VBRServer -Type ESXi -Name "ESXiHost"
Add-VBRViCloudHardwarePlan -Name "VMware Silver" -Description "VMware Hardware Plan" -Server $server -CPU 4000 -Memory 2000 -NumberOfNetWithoutInternet 1 -Datastore $cloudreplicas
This example shows how to create a hardware plan with the following settings:
- CPU quota: 4000 MHz
- Memory quota: 2000 Gb
- Cloud storage: "Cloud Replicas"
- Networks without access to the Internet: 1
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Set the ESXi option for the Type parameter. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViVirtualSwitch cmdlet. Set the $server variable as the Server parameter value. Save the result to the $switches variable.
3. Run the New-VBRCloudVLANConfiguration cmdlet. Set the $server variable as the Server parameter value. Set the $switches variable as the ViVirtualSwitch parameter value. Specify the FirstVLANWithInternet, LastVLANWithInternet, FirstVLANWithoutInternet, LastVLANWithoutInternet parameter values.
4. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the Find-VBRViDatastore cmdlet. Specify the Name parameter value. Save the result to the $datastore variable.
5. Run the New-VBRViCloudHWPlanDatastore cmdlet. Set the $datastore variable as the Datastore parameter value. Specify the FriendlyName and the Quota parameter values. Save the storage to the $cloudreplicas variable.
6. Run the Get-VBRServer cmdlet. Set the ESXi option for the Type parameter. Specify the Name parameter value. Save the server to the $server variable.
7. Run the Add-VBRViCloudHardwarePlan cmdlet. Specify the following settings:
- Specify the Name and the Description parameter values.
- Set the $server variable as the Server parameter value.
- Specify the CPU, the Memory and the NumberOfNetWithoutInternet parameter values.
- Set the $cloudreplicas variable as the Datastore parameter value.

---

### Parameters
#### **CPU**
Specifies the quota of CPU resources you want to allocate to the tenant under this hardware plan (MHz).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Datastore**
Specifies the array of cloud storage objects. The hardware plan will use these objects to allocate storage space to the tenant under this hardware plan. Accepts the VBRViCloudHardwarePlanDatastore[] object. To get this object, run the New-VBRViCloudHWPlanDatastore cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRViCloudHardwarePlanDatastore[]]`|true    |named   |False        |

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
Specifies the ESX(i) host or cluster. The resources of this host or cluster (CPU and memory quotas) will be allocated to the tenant by the hardware plan. Accepts the CHost (standalone host) or CViClusterItem (cluster) object. To get this object, run the Get-VBRServer cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |named   |False        |

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
Add-VBRViCloudHardwarePlan [-CPU <Int32>] -Datastore <VBRViCloudHardwarePlanDatastore[]> [-Description <String>] [-Memory <Int32>] -Name <String> [-NumberOfNetWithInternet <Int32>] [-NumberOfNetWithoutInternet 
```
```PowerShell
<Int32>] -Server <Object> [-UnlimitedCPU] [-UnlimitedMemory] [<CommonParameters>]
```

New-VBRCloudVLANConfiguration
-----------------------------

### Synopsis
Creates pools of VLANs that will be reserved for Veeam Cloud Connect.

---

### Description

This cmdlet creates a VBRCloudVLANConfiguration object. This object contains a pool of VLANs on a selected virtual switch. Before running this cmdlet, the service provider must pre-configure physical networks. This cmdlet reserves the selected number of networks for Veeam Cloud Connect. From this pool of the reserved networks, you can allocate quotas of networks to tenants. Create a separate pool of VLANs for each VMware or Hyper-V virtual switch.

NOTE: The total number of VLANs reserved for Veeam Cloud Connect Replication must be equal to or exceed the total number all tenants' production networks.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRViVirtualSwitch](Get-VBRViVirtualSwitch)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

---

### Examples
> Example 1. Configuring VLANs on VMware Virtual Switch

$server = Get-VBRServer -Type ESXi -Name "ESXiHost"
$switches = Get-VBRViVirtualSwitch -Server $server
New-VBRCloudVLANConfiguration -Server $server -ViVirtualSwitch $switches[0] -FirstVLANWithInternet 1 -LastVLANWithInternet 5 -FirstVLANWithoutInternet 6 -LastVLANWithoutInternet 10
This example shows how to specify a number of VLANs on a VMware virtual switch.
Perform the following steps:
1. Run the Get-VBRServer to get the host that will be the replication target. Specify the Type and the Name parameter values. Save it to the $server variable.
2. Run the Get-VBRViVirtualSwitch cmdlet. Set the $server variable as the Server parameter value. Save the array of the switches to the $switches variable. Mind the ordinal number of the necessary virtual switch (in our example, it is the first virtual switch in the array).
3. Run the New-VBRCloudVLANConfiguration cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Set the $switches variable as the ViVirtualSwitch parameter value.
- Specify the FirstVLANWithInternet and the LastVLANWithInternet parameter values.
- Specify the FirstVLANWithoutInternet and the LastVLANWithoutInternet parameter values.
> Example 2. Configuring VLANs on Hyper-V Virtual Switch

$server = Get-VBRServer -Type HvServer -Name "Hyper-VHost"
$switches = Get-VBRHvServerNetworkInfo -Server $server
New-VBRCloudVLANConfiguration -Server $server -HvNetworkInfo $switches[0] -FirstVLANWithInternet 1 -LastVLANWithInternet 5 -FirstVLANWithoutInternet 6 -LastVLANWithoutInternet 10
This example shows how to specify a number of VLANs on a Hyper-V virtual switch.
Perform the following steps:
1. Run the Get-VBRServer cmdlet to get the host that will be the replication target. Specify the Type and the Name parameter values. Save it to the $server variable.
2. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the array of the switches to the $switches variable. Mind the ordinal number of the necessary virtual switch (in our example, it is the first virtual switch in the array).
3. Run the New-VBRCloudVLANConfiguration cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Set the $switches variable as the HvNetworkInfo parameter value.
- Specify the FirstVLANWithInternet and the LastVLANWithInternet parameter values.
- Specify the FirstVLANWithoutInternet and the LastVLANWithoutInternet parameter values.

---

### Parameters
#### **FirstVLANWithInternet**
Specifies the first VLAN ID in the range of VLANs you plan to use for providing networks with internet access to VM replicas on the cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **FirstVLANWithoutInternet**
Specifies the first VLAN ID in the range of VLANs you plan to use for providing networks without internet access to VM replicas on the cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **HvNetworkInfo**
Specifies the Hyper-V virtual switch connected to the target host. Accepts the VBRHvServerNetworkInfo object. To get this object, run the Get-VBRHvServerNetworkInfo cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo]`|true    |named   |False        |

#### **LastVLANWithInternet**
Specifies the last VLAN ID in the range of VLANs you plan to use for providing networks with internet access to VM replicas on the cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **LastVLANWithoutInternet**
Specifies the last VLAN ID in the range of VLANs you plan to use for providing networks without internet access to VM replicas on the cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **Server**
Specifies host or cluster on which you plan to configure a replication target. Accepts the CHost object.  To get this object, run the Get-VBRServer cmdlet.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ViVirtualSwitch**
Specifies the VMware virtual switch connected to the target host. Accepts the VBRViVirtualSwitch object.  To get this object, run the Get-VBRViVirtualSwitch cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViVirtualSwitch]`|true    |named   |False        |

---

### Inputs
System.Object

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRCloudVLANConfiguration -FirstVLANWithInternet <Int32> -FirstVLANWithoutInternet <Int32> -HvNetworkInfo <VBRHvServerNetworkInfo> -LastVLANWithInternet <Int32> -LastVLANWithoutInternet <Int32> -Server 
```
```PowerShell
<Object> [<CommonParameters>]
```
```PowerShell
New-VBRCloudVLANConfiguration -FirstVLANWithInternet <Int32> -FirstVLANWithoutInternet <Int32> -LastVLANWithInternet <Int32> -LastVLANWithoutInternet <Int32> -Server <Object> -ViVirtualSwitch 
```
```PowerShell
<VBRViVirtualSwitch> [<CommonParameters>]
```

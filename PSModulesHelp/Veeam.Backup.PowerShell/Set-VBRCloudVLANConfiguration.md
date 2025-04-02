Set-VBRCloudVLANConfiguration
-----------------------------

### Synopsis
Modifies pools of VLANs reserved for Veeam Cloud Connect.

---

### Description

This cmdlet modifies a selected VLAN pool.

---

### Related Links
* [Get-VBRCloudVLANConfiguration](Get-VBRCloudVLANConfiguration)

* [Get-VBRViVirtualSwitch](Get-VBRViVirtualSwitch)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

---

### Examples
> Example - Changing Number of VLANs in Pool of Reserved VLANs

$configs = Get-VBRCloudVLANConfiguration
Set-VBRCloudVLANConfiguration -Configuration $configs[0] -FirstVLANWithInternet 1 -LastVLANWithInternet 10 -FirstVLANWithoutInternet 11 -LastVLANWithoutInternet 20
This example shows how to change the number of VLANs in the pool of reserved VLANs.
Perform the following steps:
1. Run the Get-VBRCloudVLANConfiguration cmdlet. Save the array of pools to the $configs variable. Mind the ordinal number of the necessary VLAN pool (in our example, it is the first VLAN pool in the array).
2. Run the Set-VBRCloudVLANConfiguration cmdlet. Specify the following settings:
- Set the $configs variable as the Configuration parameter value.
- Specify the FirstVLANWithInternet and the LastVLANWithInternet parameter values.
- Specify the FirstVLANWithoutInternet and the LastVLANWithoutInternet parameter values.

---

### Parameters
#### **Configuration**
Specifies the VLAN configuration you want to modify. Accepts the VBRCloudVLANConfiguration object. To get this object, run the Get-VBRCloudVLANConfiguration cmdlet.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRCloudVLANConfiguration]`|true    |named   |True (ByPropertyName, ByValue)|

#### **FirstVLANWithInternet**
Specifies the first VLAN ID in the range of VLANs you plan to use for providing networks with internet access to VM replicas on the cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **FirstVLANWithoutInternet**
Specifies the first VLAN ID in the range of VLANs you plan to use for providing networks without internet access to VM replicas on the cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **HvNetworkInfo**
Specifies the Hyper-V virtual switch connected to the target host. Accepts the VBRHvServerNetworkInfo object.  To get this object, run the Get-VBRHvServerNetworkInfo cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo]`|false   |named   |False        |

#### **LastVLANWithInternet**
Specifies the last VLAN ID in the range of VLANs you plan to use for providing networks with internet access to VM replicas on the cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LastVLANWithoutInternet**
Specifies the last VLAN ID in the range of VLANs you plan to use for providing networks without internet access to VM replicas on the cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ViVirtualSwitch**
Specifies the VMware virtual switch connected to the target host. Accepts the VBRViVirtualSwitch object.  To get this object, run the Get-VBRViVirtualSwitch cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViVirtualSwitch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudVLANConfiguration

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudVLANConfiguration -Configuration <VBRCloudVLANConfiguration> [-FirstVLANWithInternet <Int32>] [-FirstVLANWithoutInternet <Int32>] [-HvNetworkInfo <VBRHvServerNetworkInfo>] [-LastVLANWithInternet 
```
```PowerShell
<Int32>] [-LastVLANWithoutInternet <Int32>] [-PassThru] [<CommonParameters>]
```
```PowerShell
Set-VBRCloudVLANConfiguration -Configuration <VBRCloudVLANConfiguration> [-FirstVLANWithInternet <Int32>] [-FirstVLANWithoutInternet <Int32>] [-LastVLANWithInternet <Int32>] [-LastVLANWithoutInternet <Int32>] 
```
```PowerShell
[-PassThru] [-ViVirtualSwitch <VBRViVirtualSwitch>] [<CommonParameters>]
```

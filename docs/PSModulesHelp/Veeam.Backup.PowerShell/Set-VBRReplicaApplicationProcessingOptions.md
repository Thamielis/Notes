Set-VBRReplicaApplicationProcessingOptions
------------------------------------------

### Synopsis
Modifies guest processing settings for vCD replica jobs and CDP policies.

---

### Description

This cmdlet modifies guest processing settings for vCD replica jobs and CDP policies.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRCredentials](Get-VBRCredentials)

* [New-VBRCDPPolicyRetentionOptions](New-VBRCDPPolicyRetentionOptions)

---

### Examples
> Defininig Application Processing Settings for CDP Policies

$vm = Find-VBRViEntity -Name "WinSrv2073"
$credentials = Get-VBRCredentials -Name "CDP Admin"
$oscreds = New-VBRIndividualGuestOSCredentials -IndividualMachine $vm -MachineCredentials $credentials
Set-VBRReplicaApplicationProcessingOptions -IndividualGuestOSCredentials $oscreds
This example shows how to assign the CDP Admin user account to the WinSrv2073 VM guest OS.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
3. Run the New-VBRCDPPolicyRetentionOptions cmdlet. Specify the IndividualMachine and MachineCredentials  parameters. Save the result to the $oscreds variable.
4. Run the Set-VBRReplicaApplicationProcessingOptions cmdlet. Set the $oscreds variable as the IndividualGuestOSCredentials parameter value.

---

### Parameters
#### **ApplicationProcessingOptions**
Specifies application-aware processing settings.
Accepts the VBRApplicationProcessingOptions[] object. To create this object, run the New-VBRApplicationProcessingOptions cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRApplicationProcessingOptions[]]`|false   |named   |False        |

#### **GuestInteractionProxy**
Specifies an arraof of VMs that will be used as guest interaction proxies.
Accepts the CHost[] object. To create this object, run the Get-VBRServer cmdlet.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **GuestOSCredentials**
Specifies a user account that will be used to connect to VMs added to the vCD replica jobs or CDP policies and deploy the runtime process on their guest OSes.
Accepts the CCredentials object. To create this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **IndividualGuestOSCredentials**
Specifies a user account that will be used connect to the specific VMs guest OSes.
Accepts the VBRIndividualGuestOSCredentials object. To create this object, run the New-VBRIndividualGuestOSCredentials cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRIndividualGuestOSCredentials[]]`|false   |named   |False        |

#### **ReplicaApplicationProcessingOptions**
Specifies guest processing settings that you want to modify.
Accepts the VBRReplicaApplicationProcessingOptions object. To create this object, run the New-VBRReplicaApplicationProcessingOptions cmdlet.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRReplicaApplicationProcessingOptions]`|true    |named   |False        |

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
Set-VBRReplicaApplicationProcessingOptions [-ApplicationProcessingOptions <VBRApplicationProcessingOptions[]>] [-GuestInteractionProxy <CHost[]>] [-GuestOSCredentials <CCredentials>] 
```
```PowerShell
[-IndividualGuestOSCredentials <VBRIndividualGuestOSCredentials[]>] -ReplicaApplicationProcessingOptions <VBRReplicaApplicationProcessingOptions> [<CommonParameters>]
```

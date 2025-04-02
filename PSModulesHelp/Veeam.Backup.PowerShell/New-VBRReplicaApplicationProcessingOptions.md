New-VBRReplicaApplicationProcessingOptions
------------------------------------------

### Synopsis
Defines guest processing settings for vCD replica jobs and CDP policies.

---

### Description

This cmdlet defines the VBRReplicaApplicationProcessingOptions object.
This object defines guest processing settings for vCD replica jobs and CDP policies.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Defining Guest Interaction Proxy for CDP Policy Application Processing Settings

$proxy = Get-VBRServer -Name "WinG2073"
New-VBRReplicaApplicationProcessingOptions -GuestInteractionProxy $proxy
This example shows how to define the WinG2073 machine as a guest interaction proxy for application-aware processing settings of a CDP policy.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the New-VBRReplicaApplicationProcessingOptions cmdlet. Set the $proxy variable as the GuestInteractionProxy parameter value.

---

### Parameters
#### **ApplicationProcessingOptions**
Specifies an array of application-aware processing settings.
Accepts the VBRApplicationProcessingOptions[] object. To create this object, run the New-VBRApplicationProcessingOptions cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRApplicationProcessingOptions[]]`|false   |named   |False        |

#### **GuestInteractionProxy**
Specifies an array of VMs that will be used as guest interaction proxies.
Accepts the CHost[] object. To create this object, run the Get-VBRServer cmdlet.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **GuestOSCredentials**
Specifies a user account that will be used to connect to VMs added to the job and deploy a runtime process on their guest OSes.
Accepts the CCredentials object. To create this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **IndividualGuestOSCredentials**
Specifies a user account that will used to connect to the specific machine guest OS.
Accepts the VBRIndividualGuestOSCredentials object. To create this object, run the New-VBRIndividualGuestOSCredentials cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRIndividualGuestOSCredentials[]]`|false   |named   |False        |

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
New-VBRReplicaApplicationProcessingOptions [-ApplicationProcessingOptions <VBRApplicationProcessingOptions[]>] [-GuestInteractionProxy <CHost[]>] [-GuestOSCredentials <CCredentials>] 
```
```PowerShell
[-IndividualGuestOSCredentials <VBRIndividualGuestOSCredentials[]>] [<CommonParameters>]
```

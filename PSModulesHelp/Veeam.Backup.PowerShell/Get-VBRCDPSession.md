Get-VBRCDPSession
-----------------

### Synopsis
Returns CDP policy session.

---

### Description

This cmdlet returns returns CDP policy session.

---

### Related Links
* [Get-VBRCDPPolicy](Get-VBRCDPPolicy)

* [Get-VBRSession](Get-VBRSession)

---

### Examples
> Example 1. Getting Session for Specified CDP Policy

$policy = Get-VBRCDPPolicy -Name "VM079"
Get-VBRCDPSession -Job $policy
This example shows how to get the session for the VM079 CDP policy.
Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $policy variable.
2. Run the Get-VBRCDPSession cmdlet. Set the $policy variable as the Job parameter value.
> Example 2. Getting CDP Policy Session with Specific ID

```PowerShell
Get-VBRCDPSession -Id "8a3eec9a-1ff0-4594-a454-522c410f76ab"
This command returns the 8a3eec9a-1ff0-4594-a454-522c410f76ab CDP policy session.
```
> Example 3. Getting CDP Policy Session with Specific Result

$policy = Get-VBRCDPPolicy -Name "VM079"
Get-VBRCDPSession -Job $policy -Result Failed
This example shows how to get a CDP policy session with the Failed result.
Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $policy variable.
2. Run the Get-VBRCDPSession cmdlet. Set the $policy variable as the Job parameter value. Set the Failed option for the Result parameter.
> Example 4. Getting CDP Policy Session with Specific State

$policy = Get-VBRCDPPolicy -Name "VM079"
Get-VBRCDPSession -Job $policy -State Pending
This example shows how get a CDP policy session with the Pending state.
Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $policy variable.
2. Run the Get-VBRCDPSession cmdlet. Set the $policy variable as the Job parameter value. Set the Pending option for the State parameter.

---

### Parameters
#### **Id**
Specifies the ID of the session. The cmdlet will return the session with this ID.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Guid]`|true    |named   |True (ByPropertyName)|

#### **Last**
Defines that the command returns the last session of the specified CDP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Policy**
Specifies the CDP policy for which you want to get sessions.

|Type                |Required|Position|PipelineInput        |
|--------------------|--------|--------|---------------------|
|`[VBRCDPPolicyBase]`|true    |named   |True (ByPropertyName)|

#### **Result**
Specifies the session result.
The cmdlet will return sessions with the on of the following results:
* None
* Success
* Warning
* Failed
Valid Values:

* None
* Success
* Warning
* Failed

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRSessionResult]`|false   |named   |False        |

#### **Session**
Specifies the CDP policy session for which you want to get an updated state.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[VBRSession]`|true    |named   |True (ByPropertyName, ByValue)|

#### **State**
Specifies the session state. The cmdlet will return sessions with the specified state.
Valid Values:

* Stopped
* Starting
* Stopping
* Working
* Pausing
* Resuming
* WaitingTape
* Idle
* Postprocessing
* WaitingRepository
* Pending
* WaitingSlot
* ActionRequired

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRSessionState]`|false   |named   |False        |

---

### Inputs
System.Guid

Veeam.Backup.PowerShell.Infos.VBRSession

Veeam.Backup.PowerShell.Infos.VBRCDPPolicyBase

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCDPSession -Id <Guid> [<CommonParameters>]
```
```PowerShell
Get-VBRCDPSession [-Last] -Policy <VBRCDPPolicyBase> [<CommonParameters>]
```
```PowerShell
Get-VBRCDPSession -Policy <VBRCDPPolicyBase> [-Result {None | Success | Warning | Failed}] [<CommonParameters>]
```
```PowerShell
Get-VBRCDPSession -Policy <VBRCDPPolicyBase> [-State {Stopped | Starting | Stopping | Working | Pausing | Resuming | WaitingTape | Idle | Postprocessing | WaitingRepository | Pending | WaitingSlot | 
```
```PowerShell
ActionRequired}] [<CommonParameters>]
```
```PowerShell
Get-VBRCDPSession -Session <VBRSession> [<CommonParameters>]
```

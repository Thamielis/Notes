Get-VBRFCDInstantRecoveryInfo
-----------------------------

### Synopsis
Returns details on the mounting of virtual disks that are recovered within an FCD instant recovery session.

---

### Description

This cmdlet returns details on the mounting of virtual disks that are recovered within an FCD instant recovery session.

---

### Related Links
* [Get-VBRFCDInstantRecoverySession](Get-VBRFCDInstantRecoverySession)

---

### Examples
> Getting Details on the Mounting of Virtual Disks Recovered Within FCD Instant Recovery Session

$session = Get-VBRFCDInstantRecoverySession -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
Get-VBRFCDInstantRecoveryInfo -Session $session
This example shows how to get details on the mounting of the virtual disks that that are recovered within the 49664A5F-9C55-4A1F-8E6A-1CD5705A684B FCD instant recovery session.

Perform the following steps:

1. Run the Get-VBRFCDInstantRecoverySession cmdlet. Specify the Id parameter value. Save the result to the $session variable.
2. Run the Get-VBRFCDInstantRecoveryInfo cmdlet. Set the $session varialbe as the Session parameter value.

---

### Parameters
#### **Session**
Specifies a session that is running to perform an FCD recovery.
The cmdlet will return details on mounting of the virtual disks that are recovered within this session.
Accepts the VBRFCDInstantRecoverySession object.
To create this object, run the Get-VBRFCDInstantRecoverySession cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRFCDInstantRecoverySession]`|true    |0       |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRFCDInstantRecoveryInfo

---

### Notes

---

### Syntax
```PowerShell
Get-VBRFCDInstantRecoveryInfo [-Session] <VBRFCDInstantRecoverySession> [<CommonParameters>]
```

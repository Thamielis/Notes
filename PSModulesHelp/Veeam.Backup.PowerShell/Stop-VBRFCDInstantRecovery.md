Stop-VBRFCDInstantRecovery
--------------------------

### Synopsis
Stops the FCD instant recovery session.

---

### Description

This cmdlet stops the FCD instant recovery session.

---

### Related Links
* [Get-VBRFCDInstantRecoverySession](Get-VBRFCDInstantRecoverySession)

---

### Examples
> Stopping FCD Instant Recovery Session

$fcdInstantRecovery = Get-VBRFCDInstantRecoverySession -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
Stop-VBRFCDInstantRecovery -Session $fcdInstantRecovery
This example shows how to stop the Id 49664A5F-9C55-4A1F-8E6A-1CD5705A684B FCD instant recovery session.

Perform the following steps:

1. Run the Get-VBRFCDInstantRecoverySession cmdlet. Specify the Id parameter value. Save the result to the $fcdInstantRecovery variable.
2. Run the Stop-VBRFCDInstantRecovery cmdlet. Set the $fcdInstantRecovery variable as the Session parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will stop FCD instant recovery session without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies an FCD instant recovery session that you want to stop.
Accepts the VBRFCDInstantRecoverySession object.
To get this object, run the Get-VBRFCDInstantRecoverySession cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRFCDInstantRecoverySession]`|true    |0       |False        |

---

### Inputs
None

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRFCDInstantRecovery [-Session] <VBRFCDInstantRecoverySession> [-Force] [-RunAsync] [<CommonParameters>]
```

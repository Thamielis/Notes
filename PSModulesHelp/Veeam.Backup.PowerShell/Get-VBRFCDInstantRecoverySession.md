Get-VBRFCDInstantRecoverySession
--------------------------------

### Synopsis
Returns an array of FCD recovery sessions.

---

### Description

This cmdlets returns an array of sessions that are running to perform FCD recovery.

---

### Examples
> Example 1. Getting all Sessions Running to Perform FCD Recovery

```PowerShell
Get-VBRFCDInstantRecoverySession
This command returns all sessions that are running to perform FCD recovery.
```
> Example 2. Getting Specific Sessions Running to Perform FCD Recovery

```PowerShell
Get-VBRFCDInstantRecoverySession -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B", "42696B53-6FEC-4148-9354-AA9E4B52DED9"
This command returns the sessions that are running to perform FCD recovery with the following IDs: 49664A5F-9C55-4A1F-8E6A-1CD5705A684B and 42696B53-6FEC-4148-9354-AA9E4B52DED9.
```

---

### Parameters
#### **Id**
Specifies an array of IDs  that are running to perform FCD recovery.
The cmdlet will return recovery sessions with these IDs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRFCDInstantRecoverySession[]

---

### Notes

---

### Syntax
```PowerShell
Get-VBRFCDInstantRecoverySession [-Id <Guid[]>] [<CommonParameters>]
```

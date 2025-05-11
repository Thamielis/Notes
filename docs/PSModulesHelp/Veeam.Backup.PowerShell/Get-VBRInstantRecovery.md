Get-VBRInstantRecovery
----------------------

### Synopsis
Returns running Instant Recovery sessions.

---

### Description

This cmdlet returns Instant Recovery (including Instant Recovery for first class disks, file shares and so on) sessions running at the moment. If you do not specify cmdlet parameters, the cmdlet will return all running Instant Recovery sessions.
You can get the information about the Instant Recovery sessions in short or detailed view.

---

### Examples
> Example 1

```PowerShell
Get-VBRInstantRecovery -Full
This command gets the list of the instant recovery sessions in detailed view.
```

---

### Parameters
#### **Full**
Specifies the information on sessions and history returned in detailed view.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Id**
Specifies IDs of Instant Recovery sessions that you want to return.
Tip: You can find the session ID in an object returned by the cmdlet that launched the Instant Recovery session.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.IPSInstantRecovery[]

---

### Notes

---

### Syntax
```PowerShell
Get-VBRInstantRecovery [-Full] [-Id <Guid[]>] [<CommonParameters>]
```

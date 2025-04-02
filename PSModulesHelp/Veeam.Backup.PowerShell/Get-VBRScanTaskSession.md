Get-VBRScanTaskSession
----------------------

### Synopsis
Returns scan task sessions performed during the specified SureBackup session.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet returns scan task sessions performed during the specified SureBackup session.

---

### Related Links
* [Get-VBRSureBackupSession](Get-VBRSureBackupSession)

* [Get-VBRSureBackupTaskSession](Get-VBRSureBackupTaskSession)

---

### Examples
> Getting List of SureBackup Scan Task Sessions

$sbs = Get-VBRSureBackupSession -ID 8e3cf452-23cb-490a-a86a-f802940e26df
$ts = Get-VBRSureBackupTaskSession -Session $sbs
Get-VBRScanTaskSession -InitiatorSessionId $ts.id
This example shows how to get the list of scan task sessions performed during the SureBackup job session with 8e3cf452-23cb-490a-a86a-f802940e26df ID.
Perform the following steps:
1. Run the Get-VBRSureBackupSession cmdlet. Specify the ID parameter. Save the result to the $sbs variable.
2. Run the Get-VBRSureBackupTaskSession cmdlet. Set the $sbs variable as the Session parameter value. Save the result to the $ts variable.
3. Run the Get-VBRScanTaskSession cmdlet. Set the $ts.id variable as the InitiatorSessionId parameter value.

---

### Parameters
#### **InitiatorSessionId**
Specifies the array of SureBackup task sessions IDs. The cmdlet will return task IDs performed during these sessions.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRScanTaskSession -InitiatorSessionId <Guid[]> [<CommonParameters>]
```

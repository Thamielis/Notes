Get-VBRScanTaskSessionLog
-------------------------

### Synopsis
Returns the results of scan task sessions performed during the specified SureBackup job session.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

Returns the results of scan task sessions performed during the specified SureBackup job session. The results are written in .txt log files.

---

### Related Links
* [Get-VBRSureBackupSession](Get-VBRSureBackupSession)

* [Get-VBRSureBackupTaskSession](Get-VBRSureBackupTaskSession)

* [Get-VBRScanTaskSession](Get-VBRScanTaskSession)

---

### Examples
> Getting List of SureBackup Scan Task Sessions Results

$sbs = Get-VBRSureBackupSession -ID 8e3cf452-23cb-490a-a86a-f802940e26df
$ts = Get-VBRSureBackupTaskSession -Session $sbs
$sts = Get-VBRScanTaskSession -InitiatorSessionId $ts.id
Get-VBRScanTaskSessionLog -ScanTaskSession $sts
This example shows how to get the list of scan task sessions results performed during the SureBackup job session with 8e3cf452-23cb-490a-a86a-f802940e26df ID.
Perform the following steps:
1. Run the Get-VBRSureBackupSession cmdlet. Specify the ID parameter. Save the result to the $sbs variable.
2. Run the Get-VBRSureBackupTaskSession cmdlet. Set the $sbs variable as the Session parameter value. Save the result to the $ts variable.
3. Run the Get-VBRScanTaskSession cmdlet. Set the $ts.id variable as the InitiatorSessionId parameter value. Save the result to the $sts variable.
4. Run the Get-VBRScanTaskSessionLog cmdlet. Set the $sts variable as the ScanTaskSession parameter value.

---

### Parameters
#### **ScanTaskSession**
Specifies the array of scan task sessions performed during the specified SureBackup session. The cmdlet will return scan task sessions performed during this SureBackup session.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRScanTaskSession]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScanTaskSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRScanTaskSessionLog -ScanTaskSession <VBRScanTaskSession> [<CommonParameters>]
```

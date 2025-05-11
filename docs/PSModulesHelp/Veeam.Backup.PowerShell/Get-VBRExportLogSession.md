Get-VBRExportLogSession
-----------------------

### Synopsis
Returns details on sessions that were started to collect system logs.

---

### Description

This cmdlet returns details on sessions that were started to collect system logs. Run the Export-VBRLogs cmdlet to collect system logs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Getting Details on all Sessions Started to Collect System Logs

PS C:\Users\Administrator> Get-VBRExportLogSession

Log          : {1, 2, 3, 4...}
CreationTime : 1/10/2020 3:19:16 AM
EndTime      : 1/10/2020 3:20:27 AM
JobId        : cfe697c9-fd5f-4b19-a7b5-f7330a3d828b
Result       : Success
State        : Stopped
Id           : cfe697c9-fd5f-4b19-a7b5-f7330a3d828b

Log          : {1, 2, 3, 4...}
CreationTime : 1/10/2020 3:07:51 AM
EndTime      : 1/10/2020 3:09:08 AM
JobId        : 914d37df-febc-45cd-8eec-a294b30366d0
Result       : Success
State        : Stopped
Id           : 914d37df-febc-45cd-8eec-a294b30366d0
This command returns details on all sessions that were started to collect system logs. The cmdlet output will contain the following details on these sessions: Log, CreationTime, EndTime, JobId, Result, State and Id.
> Example 2. Getting Details on Specific Session Started to Collect System Logs

$job = Get-VBRJob -Name R01
Export-VBRLogs -Job $job -FolderPath "C:\logs"
Log          : {1, 2, 3, 4...}
CreationTime : 1/10/2020 3:19:16 AM
EndTime      : 1/10/2020 3:20:27 AM
JobId        : cfe697c9-fd5f-4b19-a7b5-f7330a3d828b
Result       : Success
State        : Stopped
Id           : cfe697c9-fd5f-4b19-a7b5-f7330a3d828b
This example shows how to get details on the session that was started to collect system logs for the R01 replica job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job parameter value.
2. Run the Export-VBRLogs cmdlet. Set the $job variable as the Job parameter value. Specify the FolderPath parameter value.
The cmdlet output will contain the following details on these sessions: Log, CreationTime, EndTime, JobId, Result, State and Id.

---

### Parameters
#### **Session**
Specifies a session that was started to collect system logs. The cmdlet will return details on this session.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRExportLogSession]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRExportLogSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRExportLogSession [-Session <VBRExportLogSession>] [<CommonParameters>]
```

Export-VBRAudit
---------------

### Synopsis
Exports report on actions performed in Veeam Backup & Replication.

---

### Description

This cmdlet exports report that contain information on actions performed by an administrator in Veeam Backup & Replication.

---

### Examples
> Exporting Report on Actions Performed in Veeam Backup & Replication

$fromdate = Get-Date -Year 2023 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
$todate = Get-Date -Year 2023 -Month 3 -Day 4 -Hour 0 -Minute 0 -Second 0
Export-VBRAudit -From $fromdate -To $todate -FileFullPath "C:\Reports\02-03.2021AuditReport.txt"
This example shows how to export a  report that contains information on actions performed by an administrator in Veeam Backup & Replication for the period from 02/02/2023 to 03/04/2023.
Perform the following steps:
1. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $fromdate variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $todate variable.
3. Run the Export-VBRAudit cmdlet. Specify the following settings:
- Set the $fromdate variable as the From parameter value.
- Set the $todate variable as the To parameter value.
- Specify the FileFullPath parameter value.

---

### Parameters
#### **FileFullPath**
Specifies the name of the file and the target path where this file is located. This cmdlet will export the report to this file located in the specified destination.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **From**
Specifies the starting date of the report period. The cmdlet will generate a report starting from the specified date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |False        |

#### **To**
Specifies the end date of the report period. The cmdlet will generate a report for a period ending on the specified date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |False        |

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
Export-VBRAudit -FileFullPath <String> -From <DateTime> -To <DateTime> [<CommonParameters>]
```

Get-VBRTapeBackupSession
------------------------

### Synopsis
Returns tape backup job sessions.

---

### Description

This cmdlet returns tape backup job sessions.

---

### Related Links
* [Get-VBRTapeJob](Get-VBRTapeJob)

---

### Examples
> Example 1. Getting Tape Backup Sessions with Certain IDs

```PowerShell
Get-VBRTapeBackupSession -Id ("49664A5F-9C55-4A1F-8E6A-1CD5705A684B", "42696B53-6FEC-4148-9354-AA9E4B52DED9")
This example shows how to get tape backup sessions with certain IDs.
```
> Example 2. Getting Tape Backup Sessions for Certain Tape Backup Job

$tapejob = Get-VBRTapeJob "Payroll Reports to Tape (Q1-Q2)"
Get-VBRTapeBackupSession -Job $tapejob
This example shows how to get tape backup sessions run for a certain tape backup job.

Perform the following steps:
1. Run the Get-VBRTapeJob cmdlet. Specify the Name parameter value. Save the result to the $tapejob variable.
2. Run the Get-VBRTapeBackupSession cmdlet. Set the $tapejob variable as the Job parameter value.

---

### Parameters
#### **Id**
Specifies an array of tape backup session IDs. The cmdlet will return tape backup sessions with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Job**
Specifies a tape backup job. The cmdlet will return tape backup sessions run for this tape backup job. Accepts the VBRTapeJob object. To create this object, run the Get-VBRTapeJob cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[VBRTapeJob]`|false   |named   |False        |

#### **Name**
Specifies an array of tape backup job names. The cmdlet will return tape backup sessions run for this tape backup job.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRTapeBackupSession [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeBackupSession [-Job <VBRTapeJob>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeBackupSession [-Name <String[]>] [<CommonParameters>]
```

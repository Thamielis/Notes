Get-VBRNASBackupTaskSession
---------------------------

### Synopsis
Returns tasks for file share backup sessions.

---

### Description

This cmdlet returns tasks for file backup sessions.

---

### Related Links
* [Get-VBRNASBackupSession](Get-VBRNASBackupSession)

---

### Examples
> Example 1. Getting Backup Session Tasks for File Share by Its Name

```PowerShell
Get-VBRNASBackupSession -Name "\\fileserv05\Documents"
This command returns all tasks run for the \\fileserv05\Documents file share.
```
> Example 2. Getting Backup Session Tasks by Task IDs

Get-VBRNASBackupSession -Id ("49664A5F-9C55-4A1F-8E6A-1CD5705A684B", "42696B53-6FEC-4148-9354-AA9E4B52DED9")
This command returns the "49664A5F-9C55-4A1F-8E6A-1CD5705A684B", "42696B53-6FEC-4148-9354-AA9E4B52DED9 backup session tasks.
> Example 3. Getting Backup Session Tasks for File Backup Session

$session = Get-VBRNASBackupSession -Id "42636B53-6FEC-4148-9354-BB9E4B52DED9"
Get-VBRNASBackupTaskSession -Session $session
This example shows how to get backup session tasks for file backup session.

Perform the following steps:
1. Run the Get-VBRNASBackupSession cmdlet. Specify the Id parameter. Save the result to the $session variable.
2. Run the Get-VBRNASBackupTaskSession cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **Id**
Specifies an array of IDs for file share backup session tasks.  The cmdlet will return tasks with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of file share names.  The cmdlet will return tasks that run for file shares with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **Session**
Specifies the file share backup session.  The cmdlet will return tasks that run within the file share backup session with this ID. Accepts the VBRNASBackupSession object.  To get this object, run the Get-VBRNASBackupSession cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASBackupSession]`|true    |named   |False        |

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
Get-VBRNASBackupTaskSession -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackupTaskSession -Name <String[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackupTaskSession -Session <VBRNASBackupSession> [<CommonParameters>]
```

Get-VBRUnstructuredBackupTaskSession
------------------------------------

### Synopsis
Returns tasks for file share and object storage backup sessions.

---

### Description

This cmdlet returns tasks for file share and object storage backup sessions. Veeam Backup & Replication creates a separate task for each file share within a backup session.

---

### Related Links
* [Get-VBRUnstructuredBackupSession](Get-VBRUnstructuredBackupSession)

---

### Examples
> Example 1. Getting Backup Session Tasks for File Share by Its Name

```PowerShell
Get-VBRUnstructuredBackupTaskSession -Name "\\fileserv05\Documents"
This command returns all tasks run for the \fileserv05\Documents file share.
```
> Example 2. Getting Backup Session Tasks by Task IDs

```PowerShell
Get-VBRUnstructuredBackupTaskSession -Id ("49664A5F-9C55-4A1F-8E6A-1CD5705A684B", "42696B53-6FEC-4148-9354-AA9E4B52DED9")
This command returns the 49664A5F-9C55-4A1F-8E6A-1CD5705A684B and 42696B53-6FEC-4148-9354-AA9E4B52DED9 backup session tasks.
```
> Example 3. Getting Backup Session Tasks for Backup Session

$session = Get-VBRUnstructuredBackupSession -Id "42636B53-6FEC-4148-9354-BB9E4B52DED9"          
Get-VBRUnstructuredBackupTaskSession -Session $session
This command returns tasks that run within the "42636B53-6FEC-4148-9354-BB9E4B52DED9" backup session.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackupSession cmdlet. Specify the Id parameter value. Save the result to the $session variable.
2. Run the Get-VBRUnstructuredBackupTaskSession cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **Id**
Specifies an array of IDs for file share and object storage backup session tasks. The cmdlet will return tasks with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of file share and object storage names. The cmdlet will return tasks with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **Session**
Specifies the file share and object storage backup session. The cmdlet will return tasks that run within this session. Accepts the VBRUnstructuredBackupSession object.  To get this object, run the Get-VBRUnstructuredBackupSession cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupSession]`|true    |named   |False        |

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
Get-VBRUnstructuredBackupTaskSession -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredBackupTaskSession -Name <String[]> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredBackupTaskSession -Session <VBRUnstructuredBackupSession> [<CommonParameters>]
```

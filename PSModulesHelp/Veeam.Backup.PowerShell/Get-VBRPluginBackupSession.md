Get-VBRPluginBackupSession
--------------------------

### Synopsis
Returns application backup policy sessions.

---

### Description

This cmdlet returns application backup policy sessions.

---

### Examples
> Example 1. Getting all Application Backup Policy Sessions

```PowerShell
Get-VBRPluginBackupSession
This command returns all application backup policy sessions.
```
> Example 2. Getting Application Backup Policy Sessions by Name

```PowerShell
Get-VBRPluginBackupSession -Name "Oracle RMAN backup"
This command returns the Oracle RMAN backup application backup policy session.
```
> Example 3. Getting Application Backup Policy Sessions by Id

```PowerShell
Get-VBRPluginBackupSession -Id "483699a2-3fa2-45ed-86cb-230b9009b29d"
This command returns the 483699a2-3fa2-45ed-86cb-230b9009b29d application backup policy session.
```

---

### Parameters
#### **Id**
Specifies the array of application backup policy IDs. The cmdlet will return the sessions with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the array of application backup policy names. The cmdlet will return the sessions with these names.

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
Get-VBRPluginBackupSession [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRPluginBackupSession [-Name <String[]>] [<CommonParameters>]
```

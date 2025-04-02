Update-DSFolderCredentials
--------------------------

### Synopsis
Updates the credentials (Username/password) on a folder.

---

### Description

If the "ClearCredentials" switch parameter is present, it will delete both username AND password from folder. If not, it checks which field was provided and check with the current folder credentials to update accordingly with what credentials were supplied.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Update-DSFolderCredentials -FolderId "[guid]" -Username "YourNewUsername" -Password "YourNewPassword"
Update
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ClearCredentials**
Clear the username and the password of the folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **FolderId**
ID of the folder to update the credentials

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **Password**
Password of the folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **SetInherited**
Set the credential mode to inherited.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **Username**
Username of the folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Update-DSFolderCredentials -detailed". For technical information, type "Get-Help Update-DSFolderCredentials -full".

---

### Syntax
```PowerShell
Update-DSFolderCredentials [-ClearCredentials] -FolderId <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Update-DSFolderCredentials [[-Password] <String>] [[-Username] <String>] -FolderId <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Update-DSFolderCredentials [-SetInherited] -FolderId <Guid> [-AsLegacyResponse] [<CommonParameters>]
```

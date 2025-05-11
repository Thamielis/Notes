New-VBRSelectedPersonalFolders
------------------------------

### Synopsis
Defines the scope of personal data for Agent Backup jobs that back up Microsoft Windows machines.

---

### Description

This cmdlet creates the VBRSelectedPersonalFolders object that specifies the scope of personal data for Agent Backup jobs that back up Microsoft Windows machines. You can use this object in the following cmdlets:
- New-VBRSelectedFilesBackupOptions
- Set-VBRSelectedFilesBackupOptions
- Set-VBRSelectedPersonalFolders

---

### Examples
> Example 1. Including Desktop Folder in Backup Scope

```PowerShell
$folders = New-VBRSelectedPersonalFolders -Desktop
This command includes to the backup scope data stored in the Desktop folder on the system volume. Save the result to the $folders variable.
```
> Example 2. Including Pictures Folder in Backup Scope

```PowerShell
$folders = New-VBRSelectedPersonalFolders -Pictures
This command includes to the backup scope data stored in the Pictures folder on the system volume. Save the result to the $folders variable.
```
> Example 3. Excluding Roaming User Profiles from Backup Scope

```PowerShell
$folders = New-VBRSelectedPersonalFolders -ExcludeRoamingUsers
This command excludes roaming user profiles from the backup scope. Save the result to the $folders variable.
```

---

### Parameters
#### **ApplicationData**
Defines that the cmdlet will include to the backup scope application data stored on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Custom**
Defines that the cmdlet will include to the backup scope data stored in the in custom locations on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Desktop**
Defines that the cmdlet will include to the backup scope data stored in the Desktop folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Documents**
Defines that the cmdlet will include to the backup scope data stored in the Documents folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Downloads**
Defines that the cmdlet will include to the backup scope data stored in the Downloads folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludeOneDrive**
Excludes data stored in the OneDrive folder from the backup scope.
If you do not provide this parameter, the cmdlet will include data stored in the OneDrive folder to the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludeRoamingUsers**
Excludes roaming user profiles from the backup scope.
If you do not provide this parameter, the cmdlet will include roaming user profiles to the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Favorites**
Defines that the cmdlet will include to the backup scope data stored in the Favorites folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Pictures**
Defines that the cmdlet will include to the backup scope data stored in the Pictures folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Video**
Defines that the cmdlet will include to the backup scope data stored in the Video folder on the system volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
New-VBRSelectedPersonalFolders [-ApplicationData] [-Custom] [-Desktop] [-Documents] [-Downloads] [-ExcludeOneDrive] [-ExcludeRoamingUsers] [-Favorites] [-Pictures] [-Video] [<CommonParameters>]
```

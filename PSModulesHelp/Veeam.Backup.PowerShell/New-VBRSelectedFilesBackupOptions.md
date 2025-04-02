New-VBRSelectedFilesBackupOptions
---------------------------------

### Synopsis
Defines backup scope settings for Veeam Agent backup jobs.

---

### Description

This cmdlet creates a VBRSelectedFilesBackupOptions object that contains the backup scope settings. The backup scope includes individual folders and volumes that you want to back up.
For Veeam Agent jobs applied to Windows machines the backup scope may include:
- OS related data
- User profile folder with all settings and data
- Volumes or individual folders
For Veeam Agent jobs applied to Linux machines, the scope may include volumes or individual directories only.
For Windows machines you can use system environment variables to specify the backup scope and the exclude mask settings. You must type the backslash sign before the environment variable. For example: \%TEMP%, \%ProgramFiles% or \%WinDir%.

---

### Examples
> Example 1. Creating Backup Scope Settings for Veeam Agent Job (Windows)

```PowerShell
New-VBRSelectedFilesBackupOptions -OSPlatform Windows -BackupPersonalFiles
This command creates the backup scope settings for the Veeam Agent job that backs up a Windows computer.
The backup scope will include the user profile folders and settings.
```
> Example 2. Creating Backup Scope Settings with Selected Directory for Veeam Agent Job (Linux)

```PowerShell
New-VBRSelectedFilesBackupOptions -OSPlatform Linux -BackupSelectedFiles -SelectedFiles "/home/administrator/mydir"
This command creates the backup scope settings for the Veeam Agent job that backs up a Linux computer. The backup scope will include the files from the /home/administrator/mydir directory.
```
> Example 3. Creating Backup Scope Settings with OS Related Files for Veeam Agent Job (Windows)

```PowerShell
New-VBRSelectedFilesBackupOptions -OSPlatform Windows -BackupOS -ExcludeMask "\%Temp%"
This command creates the backup scope settings for the Veeam Agent job that backs up a Windows computer.
The backup scope will include OS related files and will exclude the temporary folder from the backup.
```
> Example 4. Creating Backup Scope Settings with Excluded Files for Veeam Agent Job (Linux)

```PowerShell
New-VBRSelectedFilesBackupOptions -OSPlatform Linux -BackupSelectedFiles -SelectedFiles "/home/user01/" -ExcludeMask '*.pdf'
This command creates the backup scope settings for the Veeam Agent job that backs up a Linux computer. The backup scope will include the files from the /home/user01/ directory and will exclude all files of the PDF format.
```

---

### Parameters
#### **BackupOS**
Note: This option works only for Veeam Agent jobs that back up Windows machines.
Defines that Veeam Backup & Replication will include the OS related data into the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupPersonalFiles**
NOTE: This option works for Veeam Agent jobs that back up Windows computers only. Indicates that Veeam Backup & Replication will include the user profile folders into the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupSelectedFiles**
Defines that Veeam Backup & Replication will include the following types of folders into the backup scope:
* Volumes
* Individual folders on Windows machines
* Directories on Linux machines
* Directories on macOS machines
* Directories on Unix machines
Use the SelectedFiles parameter to specify the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludeMask**
Specifies files and directories that you want to exclude from the backup scope. You can specify the following types of files:
* File names
* File masks for file types

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **IncludeMask**
Specifies the file names and/or masks for file types that you want to include into the backup scope.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **OSPlatform**
Specifies the OS of the protected machine:
* Windows: for Microsoft Windows machines.
* Linux: for Linux machines.
* Mac: for macOS machines.
Note: Indexing for macOS machines is not supported in current version of Veeam PowerShell.
* Unix: for Unix machines.
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRAgentType]`|true    |named   |False        |

#### **SelectedFiles**
For the BackupSelectedFiles parameter.
Specifies the backup scope settings. To back up the folders, you must specify either of the following settings:
* Volume name
* The path to the individual folder on Windows machines
* The path to the directory on Linux machines
* Directories on macOS machines
* Directories on Unix machines

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **SelectedPersonalFolders**
Defines the scope of personal data for Agent Backup jobs that back up Microsoft Windows machines.
Note: To use this setting, you must provide the BackupPersonalFiles parameter.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRSelectedPersonalFolders]`|false   |named   |False        |

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
New-VBRSelectedFilesBackupOptions [-BackupOS] [-BackupPersonalFiles] [-BackupSelectedFiles] [-ExcludeMask <String[]>] [-IncludeMask <String[]>] -OSPlatform {Windows | Linux | Mac | Unix} [-SelectedFiles 
```
```PowerShell
<String[]>] [-SelectedPersonalFolders <VBRSelectedPersonalFolders>] [<CommonParameters>]
```

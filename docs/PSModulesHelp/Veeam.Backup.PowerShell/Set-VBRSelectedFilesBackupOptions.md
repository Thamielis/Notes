Set-VBRSelectedFilesBackupOptions
---------------------------------

### Synopsis
Modifies the backup scope settings for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies the backup scope settings for Veeam Agent backup jobs.
For Windows machines you can use system environment variables to specify the backup scope and the exclude mask settings. You must type the backslash sign before the environment variable. For example: \%TEMP%, \%ProgramFiles% or \%WinDir%.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSelectedFilesBackupOptions](New-VBRSelectedFilesBackupOptions)

---

### Examples
> Modifying Existing Backup Scope Settings for Windows Computer

$scope = New-VBRSelectedFilesBackupOptions -OSPlatform Windows -BackupPersonalFiles
Set-VBRSelectedFilesBackupOptions -Options $scope -BackupOS
This example shows how to modify the existing backup scope settings for a Windows computer.
Perform the following steps:
1. Run the New-VBRSelectedFilesBackupOptions cmdlet. Set the Windows value for the OSPlatform parameter. Provide the BackupPersonalFiles parameter. Save the result to the $scope variable.
2. Run the Set-VBRSelectedFilesBackupOptions cmdlet. Set the $scope variable as the Options parameter value. Provide the BackupOS parameter.

---

### Parameters
#### **BackupOS**
Note: This option works only for Veeam Agent jobs that back up Windows machines.
Defines that Veeam Backup & Replication will include the OS related data into the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupPersonalFiles**
Note: This option works only for Veeam Agent jobs that back up Windows machines.
Defines that Veeam Backup & Replication will include all user profile folders into the backup scope except for the roaming user profiles and data stored in the OneDrive folder.

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
Specifies the files that you want to exclude from the backup scope. You can specify the following types of files:
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

#### **Options**
Specifies the file-level backup scope settings that you want to modify.

|Type                             |Required|Position|PipelineInput |
|---------------------------------|--------|--------|--------------|
|`[VBRSelectedFilesBackupOptions]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRSelectedFilesBackupOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSelectedFilesBackupOptions [-BackupOS] [-BackupPersonalFiles] [-BackupSelectedFiles] [-ExcludeMask <String[]>] [-IncludeMask <String[]>] -Options <VBRSelectedFilesBackupOptions> [-SelectedFiles 
```
```PowerShell
<String[]>] [-SelectedPersonalFolders <VBRSelectedPersonalFolders>] [<CommonParameters>]
```

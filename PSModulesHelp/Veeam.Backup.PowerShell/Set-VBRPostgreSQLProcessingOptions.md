Set-VBRPostgreSQLProcessingOptions
----------------------------------

### Synopsis
Modifies settings for processing backed-up PostgreSQL databases on Linux computers.

---

### Description

This cmdlet modifies settings for processing backed-up PostgreSQL database for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRPostgreSQLProcessingOptions](New-VBRPostgreSQLProcessingOptions)

---

### Examples
> Modifying PostgreSQL Authentication Options

$options = New-VBRPostgreSQLProcessingOptions
Set-VBRPostgreSQLProcessingOptions -Options $options -UserType SystemUserWithoutPassword
This example shows how to modify the PostgreSQL authentication options. Veeam Agent will use the peer authentication option.
Perform the following steps:
1. Run the New-VBRPostgreSQLProcessingOptions cmdlet. Save the result to the $options variable.
2. Run the Set-VBRPostgreSQLProcessingOptions cmdlet. Set the $options variable as the Options parameter value. Set the SystemUserWithoutPassword option for the UserType parameter.

---

### Parameters
#### **ArchiveLogBackupPeriod**
Specifies how often in minutes the cmdlet will back up WAL files.
Deafult: 15 minutes.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ArchiveLogBackupStorage**
For Linux machines.
Specify a path to a location where WAL files are stored

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ArchiveLogRetainAction**
Specifies retention policy for WAL files stored in the backup location.
* WaitForBackupDeletion: use this option to keep WAL files backups the same period as image-level backups.
* KeepOnlyLastDays: use this option to keep WAL files backups for a specific number of days. Use the ArchiveLogRetainPeriod parameter to specify the number of days.
Valid Values:

* WaitForBackupDeletion
* KeepOnlyLastDays

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRLogRetainAction]`|false   |named   |False        |

#### **ArchiveLogRetainPeriod**
Specifies the number of days to keep WAL files.
Default: 15.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Credentials**
Specifies the PostgreSQL credentials that Veeam Agent will use to connect to the PostgreSQL server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **EnableArchiveLogBackup**
Defines that the cmdlet will back up WAL files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Options**
Specifies settings for backed-up PostgreSQL database. The cmdlet will modify these settings.

|Type                              |Required|Position|PipelineInput |
|----------------------------------|--------|--------|--------------|
|`[VBRPostgreSQLProcessingOptions]`|true    |named   |True (ByValue)|

#### **UserType**
Specifies the PostgreSQL authentication options. You can specify either of the following types of authentication options:
* DBUserWithPassword: use this option for the password-based authentication. Veeam Agent will use the database login and password to authenticate against the PostgreSQL server.
* DBUserWithPasswordFile: use this option to authenticate against the PostgreSQL server with the password file. This password file must contain the user name and the password of the database user.
* SystemUserWithoutPassword: use this option for the peer authentication method. Veeam Agent will use the OS user name to authenticate against the PostgreSQL server.
Default: DBUserWithPassword.
Valid Values:

* DBUserWithPassword
* DBUserWithPasswordFile
* SystemUserWithoutPassword

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRPostgreSQLUserType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRPostgreSQLProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRPostgreSQLProcessingOptions [-ArchiveLogBackupPeriod <Int32>] [-ArchiveLogBackupStorage <String>] [-ArchiveLogRetainAction {WaitForBackupDeletion | KeepOnlyLastDays}] [-ArchiveLogRetainPeriod <Int32>] 
```
```PowerShell
[-Credentials <CCredentials>] [-EnableArchiveLogBackup] -Options <VBRPostgreSQLProcessingOptions> [-UserType {DBUserWithPassword | DBUserWithPasswordFile | SystemUserWithoutPassword}] [<CommonParameters>]
```

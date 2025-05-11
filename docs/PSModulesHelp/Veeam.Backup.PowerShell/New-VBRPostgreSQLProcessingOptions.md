New-VBRPostgreSQLProcessingOptions
----------------------------------

### Synopsis
Defines settings for processing backed-up PostgreSQL databases on Linux computers.

---

### Description

This cmdlet applies to Veeam Agent jobs that back up Linux computers.

This cmdlet creates the VBRPostgreSQLProcessingOptions object. This object contains settings for processing backed-up PostgreSQL databases.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Defining Settings for Processing Backed-up PostgreSQL Databases

$creds = Get-VBRCredentials -Name *Administrator*
New-VBRPostgreSQLProcessingOptions -Credentials $creds
This example shows how to define settings for processing backed-up PostgreSQL databases.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
2. Run the New-VBRPostgreSQLProcessingOptions cmdlet. Set the $creds variable as the Credentials parameter value.

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
Specify a path to a location where WAL files are stored.

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

#### **UserType**
Specifies the PostgreSQL authentication options. You can specify either of the following types of authentication options:
* DBUserWithPassword: use this option for the password-based authentication. Veeam Agent will use the database login and password to authenticate against the PostgreSQL server.
* DBUserWithPasswordFile: use this option to authenticate against the PostgreSQL server with the password file. This password file must contain the user name and the password of the database user.
* SystemUserWithoutPassword: use this option for the peer authentication method. Veeam Agent will use the OS user name to authenticate against the PostgreSQL server.
Valid Values:

* DBUserWithPassword
* DBUserWithPasswordFile
* SystemUserWithoutPassword

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRPostgreSQLUserType]`|false   |named   |False        |

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
New-VBRPostgreSQLProcessingOptions [-ArchiveLogBackupPeriod <Int32>] [-ArchiveLogBackupStorage <String>] [-ArchiveLogRetainAction {WaitForBackupDeletion | KeepOnlyLastDays}] [-ArchiveLogRetainPeriod <Int32>] 
```
```PowerShell
[-Credentials <CCredentials>] [-EnableArchiveLogBackup] [-UserType {DBUserWithPassword | DBUserWithPasswordFile | SystemUserWithoutPassword}] [<CommonParameters>]
```

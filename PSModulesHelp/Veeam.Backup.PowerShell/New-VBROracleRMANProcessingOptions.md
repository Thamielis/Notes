New-VBROracleRMANProcessingOptions
----------------------------------

### Synopsis
Creates the Oracle RMAN database processing settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for Oracle RMAN.

This cmdlet creates Oracle RMAN database processing settings. You can set up the following options:
- The way Veeam Backup & Replication will process archived logs.
- Schedule settings for archived logs processing.
- Number of data channels to back up archived logs.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example - Creating Oracle RMAN Database Processing Settings for Application Backup Policies for Veeam Plug-in for Oracle RMAN

$db_administrator = Get-VBRCredentials
New-VBROracleRMANProcessingOptions -Credentials $db_administrator -ArchivedLogAction Keep -ArchiveLogBackupPeriod 15 -ParallelChannelsCount 3
This example shows how to create an Oracle RMAN database processing settings for application backup policies for Veeam Plug-in for Oracle RMAN. The policy will back up archived logs every 15 minutes and send application backups to the target storage using 3 parallel data channels.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $db_administrator variable.
2. Run the New-VBROracleRMANProcessingOptions cmdlet. Specify the following settings:
- Set the $db_administrator variable as the Credentials parameter value.
- Set the Keep option for the ArchivedLogAction parameter.
- Specify the ArchiveLogBackupPeriod parameter value.
- Specify the ParallelChannelsCount parameter value.

---

### Parameters
#### **ArchivedLogAction**
Specifies the way of database processing:
* Keep: to keep archived logs that were backed up.
* Delete: to delete archived logs that were backed up.
Valid Values:

* Keep
* Delete

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBROracleRMANArchivedLogAction]`|false   |named   |False        |

#### **ArchiveLogBackupPeriod**
Specifies the integer defining the frequency for archived logs backup in minutes. Permitted values: 5 to 480.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Credentials**
Specifies the credentials for Oracle RMAN database processing. Accepts the CCredentials object.  To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **ParallelChannelsCount**
Specifies the integer defining the number of data channels that can be assigned.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
New-VBROracleRMANProcessingOptions [-ArchivedLogAction {Keep | Delete}] [-ArchiveLogBackupPeriod <Int32>] -Credentials <CCredentials> [-ParallelChannelsCount <Int32>] [<CommonParameters>]
```

Set-VBROracleRMANProcessingOptions
----------------------------------

### Synopsis
Modifies the Oracle RMAN database processing settings for application backup policies.

---

### Description

This cmdlet modifies Oracle RMAN database processing settings. You can update the following options:
- Credentials that Veeam Backup & Replication will use to connect to the database system.
- The way Veeam Backup & Replication will process archived logs.
- Schedule settings for archived logs processing.
- Number of data channels to back up archived logs.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example - Creating and Modifying Oracle RMAN Backup Settings for Application Backup Policies for Veeam Plug-in for Oracle RMAN

$db_administrator = Get-VBRCredentials
$processoptions = New-VBROracleRMANProcessingOptions -Credentials $db_administrator -ArchivedLogAction Keep -ArchiveLogBackupPeriod 15 -ParallelChannelsCount 1
Set-VBROracleRMANProcessingOptions -Options $processoptions -Credentials $db_administrator -ParallelChannelsCount 3
This example shows how to create and modify an Oracle RMAN backup settings for application backup policies for Veeam Plug-in for Oracle RMAN. The modified policy will send application backups to the target storage using 3 parallel data channels.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $db_administrator variable.
2. Run the New-VBROracleRMANProcessingOptions cmdlet. Set the $db_administrator variable as the Credentials parameter value. Specify the ArchivedLogAction, ArchiveLogBackupPeriod and ParallelChannelsCount parameter values. Save the result to the $processoptions variable.
3. Run the Set-VBROracleRMANProcessingOptions cmdlet. Set the $processoptions variable as the Options parameter value. Set the $db_administrator variable as the Credentials parameter value. Specify the ParallelChannelsCount parameter value.

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
Specifies the credentials for Oracle RMAN database processing. Accepts the CCredentials object.  To get this object, run the Get-VBRCredentials cmdlet

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Options**
Specifies the database processing options that you plan to modify. Accepts the VBROracleRMANProcessingOptions object. To get this object, run the New-VBROracleRMANProcessingOptions cmdlet.

|Type                              |Required|Position|PipelineInput |
|----------------------------------|--------|--------|--------------|
|`[VBROracleRMANProcessingOptions]`|true    |named   |True (ByValue)|

#### **ParallelChannelsCount**
Specifies the integer defining the number of data channels that can be assigned.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBROracleRMANProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBROracleRMANProcessingOptions [-ArchivedLogAction {Keep | Delete}] [-ArchiveLogBackupPeriod <Int32>] [-Credentials <CCredentials>] -Options <VBROracleRMANProcessingOptions> [-ParallelChannelsCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```

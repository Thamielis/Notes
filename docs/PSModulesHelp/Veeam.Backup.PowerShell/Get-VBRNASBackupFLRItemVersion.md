Get-VBRNASBackupFLRItemVersion
------------------------------

### Synopsis
Returns versions of objects backed-up by file backup jobs.

---

### Description

This cmdlet returns versions of objects backed-up by file backup jobs. IMPORTANT! This cmdlet runs only with file-level restore sessions that are created to restore all versions of backups on file shares.

---

### Related Links
* [Get-VBRNASBackupFLRSession](Get-VBRNASBackupFLRSession)

* [Get-VBRNASBackupFLRItem](Get-VBRNASBackupFLRItem)

---

### Examples
> Example 1. Getting all Versions of Object

$session = Get-VBRNASBackupFLRSession
$object = Get-VBRNASBackupFLRItem -Session $session
Get-VBRNASBackupFLRItemVersion -Item $object
This example shows how to get all versions of an object backed-up by a file backup job.

Perform the following steps:
1. Run the Get-VBRNASBackupFLRSession cmdlet. Save the result to the $session variable.
2. Run the Get-VBRNASBackupFLRItem cmdlet. Set the $session variable as the Session parameter value. Save the result to the $object variable.
3. Run the Get-VBRNASBackupFLRItemVersion cmdlet. Set the $object variable as the Item parameter value.
> Example 2. Getting Versions of Objects by Modification Date

$session = Get-VBRNASBackupFLRSession
$object = Get-VBRNASBackupFLRItem -Session $session
Get-VBRNASBackupFLRItemVersion -Item $object -ModificationDate "9/9/2022"
This example shows how to get versions of an object by the object modification date. Veeam Backup & Replication will return objects that have been modified on 9/9/2022.

Perform the following steps:
1. Run the Get-VBRNASBackupFLRSession cmdlet. Save the result to the $session variable.
2. Run the Get-VBRNASBackupFLRItem cmdlet. Set the $session variable as the Session parameter value. Save the result to the $object variable.
3. Run the Get-VBRNASBackupFLRItemVersion cmdlet. Set the $object variable as the Item parameter value. Specify the ModificationDate parameter value.
> Example 3. Getting Versions of Objects by Version ID

$session = Get-VBRNASBackupFLRSession
$object = Get-VBRNASBackupFLRItem -Session $session
Get-VBRNASBackupFLRItemVersion -Item $object -VersionId 9
This example shows how to get a version of an object by the object version ID. Veeam Backup & Replication will return an object with the 9 version ID.

Perform the following steps:
1. Run the Get-VBRNASBackupFLRSession cmdlet. Save the result to the $session variable.
2. Run the Get-VBRNASBackupFLRItem cmdlet. Set the $session variable as the Session parameter value. Save the result to the $object variable.
3. Run the Get-VBRNASBackupFLRItemVersion cmdlet. Set the $object variable as the Item parameter value. Specify the VersionId parameter value.

---

### Parameters
#### **Item**
Specifies an object. The cmdlet will return versions of this object. Accepts the VBRNASBackupFLRItem object.  To get this object, run the Get-VBRNASBackupFLRItem cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASBackupFLRItem]`|true    |named   |False        |

#### **LatestArchivedVersion**
Defines that the cmdlet will return the latest version of the object located in the archive repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ModificationDate**
Specifies the date when the object was modified.  The cmdlet will return versions of objects that were modified on the specified date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **VersionId**
Specifies a version ID of the object.  The cmdlet will return objects with the specified version ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt64]`|false   |named   |False        |

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
Get-VBRNASBackupFLRItemVersion -Item <VBRNASBackupFLRItem> [-LatestArchivedVersion] [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackupFLRItemVersion -Item <VBRNASBackupFLRItem> [-ModificationDate <DateTime>] [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackupFLRItemVersion -Item <VBRNASBackupFLRItem> [-VersionId <UInt64>] [<CommonParameters>]
```

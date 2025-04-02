New-VBRComputerIndexingOptions
------------------------------

### Synopsis
Creates indexing settings for Veeam Agent backup jobs.

---

### Description

This cmdlet creates the VBRComputerIndexingOptions object. This object contains file indexing settings for Veeam Agent backup jobs.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

---

### Examples
> Creating Indexing Settings for Veeam Agent Backup Job (Linux)

$group = Get-VBRProtectionGroup -Name "Linux Group"
New-VBRComputerIndexingOptions -BackupObject $group -OSPlatform Linux -IndexingMode IndexEverythingExceptExcluded -IndexingExclusion "/home/administrator/videos/"
This example shows how to create indexing settings for a Veeam Agent job that backs up Linux computers. Veeam Backup & Replication will index everything except for:
- System directories.
- The /home/administrator/videos/ directory.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the New-VBRComputerIndexingOptions cmdlet. Specify the following settings:
- Set the $group variable as the BackupObject parameter value.
- Set the Linux option for the OSPlatform parameter.
- Set the IndexEverythingExceptExcluded option for the IndexingMode parameter.
- Specify the IndexingExclusion parameter value.

---

### Parameters
#### **BackupObject**
Specifies the protection group, for which you want to add indexing settings.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |named   |True (ByValue)|

#### **IndexingExclusion**
For the IndexEverythingExceptExcluded mode.
Specifies the list of the folders that you want to exclude from indexing.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **IndexingInclusion**
For the IndexIncludedOnly mode.
Specifies the list of the folders that you want to index.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **IndexingMode**
Specifies indexing scope settings:
* Disable: select this option to disable indexing mode.
* IndexEverything: select this option to index all files within the backup scope.
* IndexIncludedOnly: select this option to specify folders that you want to index.
Note: Not available for the backup policy that Veeam Agent job applies to Linux machines with file-level backup scope.
* IndexEverythingExceptExcluded: select this option to index all directories on the protected computer except for those you want to exclude from indexing.
Note: Not available for the backup policy that Veeam Agent job applies to Linux machines with file-level backup scope.
Note: Veeam Backup & Replication will exclude the system directories from indexing.
Valid Values:

* Disable
* IndexEverything
* IndexIncludedOnly
* IndexEverythingExceptExcluded

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRIndexingMode]`|true    |named   |False        |

#### **OSPlatform**
Specifies the OS of the protected computers:
* Windows: for Windows computers.
* Linux: for Linux computers.
* Mac: for macOS computers.
Note: Indexing for macOS computers is not supported in current version of Veeam PowerShell.
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRAgentType]`|true    |named   |False        |

---

### Inputs
System.Object

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRComputerIndexingOptions -BackupObject <Object> [-IndexingExclusion <String[]>] [-IndexingInclusion <String[]>] -IndexingMode {Disable | IndexEverything | IndexIncludedOnly | 
```
```PowerShell
IndexEverythingExceptExcluded} -OSPlatform {Windows | Linux | Mac | Unix} [<CommonParameters>]
```

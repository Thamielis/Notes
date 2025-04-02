Set-VBRComputerIndexingOptions
------------------------------

### Synopsis
Modifies indexing settings for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies indexing settings for Veeam Agent backup job.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [New-VBRComputerIndexingOptions](New-VBRComputerIndexingOptions)

---

### Examples
> Modifying Indexing Settings for Veeam Agent Backup Job (Windows)

$group = Get-VBRProtectionGroup -Name "Windows Group"
$index = New-VBRComputerIndexingOptions -BackupObject $group -OSPlatform Windows -IndexingMode IndexIncludedOnly -IndexingInclusion "C:/Desktop/MyFolder"
Set-VBRComputerIndexingOptions -Options $index -IndexingMode IndexEverything
This example shows how to modify indexing settings for a Veeam Agent job that backs up Windows computers. Veeam Backup & Replication will change the indexing scope and will index everything except for system folders.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value Save the result to the $group variable.
2. Run the New-VBRComputerIndexingOptions cmdlet. Set the $group variable as the BackupObject parameter value. Specify the OSPlatform, IndexingMode and IndexingInclusion parameter values. Save the result to the $index variable.
3. Run the Set-VBRComputerIndexingOptions cmdlet. Set the $index variable as the Options parameter value. Set the IndexEverything option for the IndexingMode parameter.

---

### Parameters
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
|`[VBRIndexingMode]`|false   |named   |False        |

#### **Options**
Specifies the protection group indexing options that you want to modify.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRComputerIndexingOptions]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerIndexingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerIndexingOptions [-IndexingExclusion <String[]>] [-IndexingInclusion <String[]>] [-IndexingMode {Disable | IndexEverything | IndexIncludedOnly | IndexEverythingExceptExcluded}] -Options 
```
```PowerShell
<VBRComputerIndexingOptions> [<CommonParameters>]
```

Get-NcFileMove
--------------

### Synopsis
Retrieves all ongoing file move operations in the cluster. This cmdlet is supported with Rest Only.

---

### Description

Retrieves all ongoing file move operations in the cluster.

---

### Related Links
* 

* 

---

### Examples
> Example 1

```PowerShell
Get-NcFileMove
Destination        : /vol/VolumeFileDestination/DestinationFile
ElapsedTime        : PT0S
Failure            : Cannot quiesce source file. Source file "vs0:VolumeFileSou
                     rce/vol/VolumeFileSource/SourceFile" does not exist.
Index              : 0
IsDestinationReady : False
IsFlexgroup        : False
NcController       : 172.28.62.82
IsSnapshotFenced   : False
MaxCutoverTime     : 10
MaxThroughput      : 0
Node               : smoke3-vsim-ucs3b2e
Scanner            : destroyed
Source             : /vol/VolumeFileSource/SourceFile
Svm                : vs0
Uuid               : 595f391e-2ea8-444b-bdb6-84c9ac66abe3
Volume             :

```

---

### Parameters
#### **Vserver**
Specifies the name of the vserver.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|true    |0       |true         |Svm    |

#### **Template**
Specify $a = Get-NcFileMove -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcFileMove -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcFileMove -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcFileMove -Query $a.

|Type                                             |Required|Position|PipelineInput|
|-------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.File.StorageFileMovesOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.File.StorageFileMovesOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcFileMove -Attributes $a.

|Type                                                     |Required|Position|PipelineInput|
|---------------------------------------------------------|--------|--------|-------------|
|`[FileMoveDataONTAP.C.Types.File.StorageFileMovesOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.File.StorageFileMovesOutput

---

### Notes
Category: File
Api: storage/file/move
Family: NcCluster

---

### Syntax
```PowerShell
Get-NcFileMove [[-Vserver] <string>] [<CommonParameters>]
```
```PowerShell
Get-NcFileMove -Template <DataONTAP.C.Types.File.StorageFileMovesOutput> [<CommonParameters>]
```
```PowerShell
Get-NcFileMove -Query <DataONTAP.C.Types.File.StorageFileMovesOutput> [-Attributes <DataONTAP.C.Types.File.StorageFileMovesOutput>] [<CommonParameters>]
```

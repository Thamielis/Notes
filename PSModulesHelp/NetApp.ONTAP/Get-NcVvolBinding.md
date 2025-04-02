Get-NcVvolBinding
-----------------

### Synopsis
Retrieves vVol bindings.

---

### Description

Retrieves vVol bindings. This cmdlet is supported with Rest

---

### Related Links
* [New-NcVvolBinding](New-NcVvolBinding)

* [Remove-NcVvolBinding](Remove-NcVvolBinding)

---

### Examples
> Example 1

```PowerShell
Get-NcVvolBinding -Vserver vs0
NcController     : 10.234.64.61
Svm              : vs0
ProtocolEndpoint : /vol/vol1/protocol
Vvol             : /vol/vol1/vvol
Count            : 3
Id               : 634880
IsOptimal        : True

```
> Example 2

```PowerShell
$a = Get-NcVvolBinding -Template
		$a.Count = 1
		$a.Id = "2394880"
		$a.ProtocolEndpoint = New-Object DataONTAP.C.Types.Lun.ProtocolEndpoint
		$a.ProtocolEndpoint.Name = "/vol/vol1/lun_Protocol"
		Get-NcVvolBinding -Query $a
NcController     : 10.234.64.61
Svm              : vs0
ProtocolEndpoint : /vol/vol1/protocol
Vvol             : /vol/vol1/vvol
Count            : 3
Id               : 634880
IsOptimal        : True

```

---

### Parameters
#### **Vserver**
Name of the Vserver

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |true         |

#### **ProtocolEndpointName**
The fully qualified path name of the LUN composed of the  / vol prefix

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |true         |

#### **VvolName**
The fully qualified path name of the LUN composed of the  / vol prefix, and lun associated with Vvol class

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |true         |

#### **Template**
Specify to get an empty LunVvolBinding object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LunVvolBinding object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use Get-NcVvolBinding -Template to get the initially empty LunVvoBinding object.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.LunVvoBinding]`|true    |named   |false        |

#### **Attributes**
For advanced queries returned the desired number of attribute provide a LunVvoBinding object with various fields

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.LunVvoBinding]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunVvoBinding

---

### Notes
Category: Lun
Api: /api/protocols/san/vvol-bindings
Family: Controller

---

### Syntax
```PowerShell
Get-NcVvolBinding [[-Vserver] <String>] [[-ProtocolEndpointName] <String>] [[-VvolName] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcVvolBinding -Template <DataONTAP.C.Types.Lun.LunVvoBinding> [<CommonParameters>]
```
```PowerShell
Get-NcVvolBinding -Query <DataONTAP.C.Types.Lun.LunVvoBinding> [-Attributes <DataONTAP.C.Types.Lun.LunVvoBinding>] [<CommonParameters>]
```

New-NcVvolBinding
-----------------

### Synopsis
Creates a vVol binding. The binding between any two specific LUNs is reference counted. When a binding is created that already exists, the binding count is incremented.

---

### Description

Creates a vVol binding. The binding between any two specific LUNs is reference counted. When a binding is created that already exists, the binding count is incremented. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcVvolBinding](Get-NcVvolBinding)

* [Remove-NcVvolBinding](Remove-NcVvolBinding)

---

### Examples
> Example 1

```PowerShell
New-NcVvolBinding -VvolName /vol/vol1/lun_Vvol -ProtocolEndpointName /vol/vol1/lun_Protocol -VserverContext vs0
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
#### **VserverContext**
Name of vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |VS     |

#### **ProtocolEndpointName**
The fully qualified path name of the LUN composed of the  / vol prefix

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **VvolName**
The fully qualified path name of the LUN composed of the  / vol prefix, and lun associated with Vvol class

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |true         |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunVvolBinding

---

### Notes
Category: Lun
Api: /protocols/san/vvol-bindings
Family: Vserver

---

### Syntax
```PowerShell
New-NcVvolBinding -VserverContext <String> [[-ProtocolEndpointName] <String>] [[-VvolName] <String>] [<CommonParameters>]
```

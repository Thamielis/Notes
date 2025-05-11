Remove-NcVvolBinding
--------------------

### Synopsis
Removes a vVol binding between two lun

---

### Description

Removes a vVol binding between two lun.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcVvolBinding](Get-NcVvolBinding)

* [New-NcVvolBinding](New-NcVvolBinding)

---

### Examples
> Example 1

```PowerShell
Remove-NcVvolBinding -VvolName /vol/vol1/lun_Vvol -ProtocolEndpointName /vol/vol1/lun_Protocol
```

---

### Parameters
#### **ProtocolEndpointName**
The fully qualified path name of the LUN composed of the  / vol prefix

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **VvolName**
The fully qualified path name of the LUN composed of the  / vol prefix, and lun associated with Vvol class

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **DeleteAllReference**
Forces deletion of the binding regardless of the reference count value.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |2       |false        |

#### **Vserver**
Name of the vserver

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunVvolBinding

---

### Notes
Category: Lun
Api: /protocols/san/vvol-bindings
Family: Controller

---

### Syntax
```PowerShell
Remove-NcVvolBinding [-ProtocolEndpointName] <String> [-VvolName] <String> [<CommonParameters>]
```

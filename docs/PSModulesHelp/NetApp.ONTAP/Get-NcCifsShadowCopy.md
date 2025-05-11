Get-NcCifsShadowCopy
--------------------

### Synopsis
Retrieves Shadowcopy Sets.

---

### Description

Retrieves Shadowcopy Sets. This cmdlet is supported with Rest.

---

### Related Links
* [Save-NcCifsShadowCopySnapshot](Save-NcCifsShadowCopySnapshot)

---

### Parameters
#### **Id**
The universally-unique identifier of the controller's shadow copy set.

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|false   |0       |true (ByPropertyName)|FilerShadowCopySetId<br/>Uuid|

#### **Vserver**
The Name of the Svm

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |true (ByPropertyName)|Svm    |

#### **Vserver Uuid**
The unique identifier of the SVM

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **KeepSnapshot**
Specifies the timestamp of the performance data

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |3       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsShadowCopySet

---

### Notes
Category: Cifs
Api: /api/protocols/cifs/shadowcopy-sets
Family: Cluster

---

### Syntax
```PowerShell
Get-NcCifsShadowCopy [[-Id] <String>] [[-Vserver] <String>] [[-VserverUuid] <String>] [[-KeepSnapshot] <bool>] [<CommonParameters>]
```

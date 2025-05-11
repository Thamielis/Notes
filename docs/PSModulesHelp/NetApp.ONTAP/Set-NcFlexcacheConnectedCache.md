Set-NcFlexcacheConnectedCache
-----------------------------

### Synopsis
Modifies origin options for a origin volume in the cluster.This cmdlet is supported with Rest

---

### Description

Modifies origin options for a origin volume in the cluster.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcFlexcacheConnectedCache](Get-NcFlexcacheConnectedCache)

---

### Examples
> Example 1

```PowerShell
Set-NcFlexcacheConnectedCache -Name VolName -Vserver vs0 -BlockLevelInvalidation $true
Updates the origin options for a origin volume in the cluster.
```

---

### Parameters
#### **Name**
Origin volume name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Vserver**
Name of the Svm.

|Type      |Required|Position|PipelineInput         |Aliases|
|----------|--------|--------|----------------------|-------|
|`[String]`|false   |1       |false (ByPropertyName)|SvmName|

#### **BlockLevelInvalidation**
Block level invalidation enables the FlexCache volume to retain blocks that are not changed at the FlexCache volume without having to evict them. This means that the FlexCache volume does not have to again incur the cost of fetching blocks over the WAN from the FlexCache volume origin on the next client access. Block level invalidation is a property of the origin volume.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Flexcache.FlexcacheOriginConnectedCacheInfo

---

### Notes
Category: Flexcache
API: /storage/flexcache/origins/{uuid}
Family: vserver

---

### Syntax
```PowerShell
Set-NcFlexcacheConnectedCache [-Name] <String> [[-Vserver] <String>] -BlockLevelInvalidation <Boolean> [<CommonParameters>]
```

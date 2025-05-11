Get-NcAggrPlex
--------------

### Synopsis
Retrieves the collection of plexes for the specified aggregate. This cmdlet is supported with Rest Only.

---

### Description

Retrieves the collection of plexes for the specified aggregate.

---

### Related Links
* 

* 

---

### Examples
> Example 1

```PowerShell
Get-NcAggrPlex -Aggregate sti16_vsim_ucs580z_aggr1
Aggregate    : sti16_vsim_ucs580z_aggr1
Name         : plex0
Online       : True
State        : normal
Pool         : pool0
NcController : 10.234.85.2
Resync       : False
RaidGroups   : {rg0}

```

---

### Parameters
#### **Aggregate**
Name of the Aggregate

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **Name**
Name of the Plex

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Template**
Specify $a = Get-NcAggrPlex -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcAggrPlex -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcAggrPlex -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcAggrPlex -Query $a.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Aggr.AggrPlexes]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Aggr.AggrPlexes, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcAggrPlex -Attributes $a.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Aggr.AggrPlexes]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrPlexes

---

### Notes
Category: Aggregate
Api: /storage/aggregates/{aggregate.uuid}/plexes
Family: NcController

---

### Syntax
```PowerShell
Get-NcAggrPlex [-Aggregate] <String> [[-Name] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrPlex -Template <DataONTAP.C.Types.Aggr.AggrPlexes> [<CommonParameters>]
```
```PowerShell
Get-NcAggrPlex -Query <DataONTAP.C.Types.Aggr.AggrPlexes> [-Attributes <DataONTAP.C.Types.Aggr.AggrPlexes>] [<CommonParameters>]
```

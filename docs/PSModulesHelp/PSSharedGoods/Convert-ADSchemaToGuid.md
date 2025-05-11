Convert-ADSchemaToGuid
----------------------

### Synopsis
Converts name of schema properties to guids

---

### Description

Converts name of schema properties to guids

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-ADSchemaToGuid -SchemaName 'ms-Exch-MSO-Forward-Sync-Cookie'
```
> EXAMPLE 2

```PowerShell
Convert-ADSchemaToGuid -SchemaName 'ms-Exch-MSO-Forward-Sync-Cookie' -AsString
```

---

### Parameters
#### **SchemaName**
Schema Name to convert to guid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Domain**
Domain to query. By default the current domain is used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RootDSE**
RootDSE to query. By default RootDSE is queried from the domain

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[ADEntity]`|false   |3       |false        |

#### **AsString**
Return the guid as a string

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-ADSchemaToGuid [[-SchemaName] <String>] [[-Domain] <String>] [[-RootDSE] <ADEntity>] [-AsString] [<CommonParameters>]
```

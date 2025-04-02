Get-RDMDataSource
-----------------

### Synopsis
Retrieve the list of available data sources.

---

### Description

Retrieve the list of available data sources.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMDataSource
Retrieves the list of available data sources.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMDataSource; $list[0]
Retrieves the list of available data sources and displays the first item.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMDataSource; Set-RDMDataSource $list[1].ID
Retrieves the list of available data sources and sets the current data source the the second element in the list.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Name**
Data source name
Valid Values:

* IPS
* In-Pro DServer
* In-Pro OD
* In-Pro OPS
* KOWMellunig
* KOWVeeam
* Kostwein
* Lokal
* Lokale Datenquelle
* Mellunig

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-RDMDataSource -detailed". For technical information, type "Get-Help Get-RDMDataSource -full".

---

### Syntax
```PowerShell
Get-RDMDataSource [[-CaseSensitive]] [[-Name] <String>] [<CommonParameters>]
```

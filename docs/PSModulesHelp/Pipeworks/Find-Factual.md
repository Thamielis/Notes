Find-Factual
------------

### Synopsis
Finds content on Factual

---

### Description

Finds content on Factual's global places API

---

### Related Links
* [Get-Web](Get-Web)

---

### Examples
> EXAMPLE 1

```PowerShell
Find-Factual Starbucks in Seattle
```
> EXAMPLE 2

```PowerShell
$l = Resolve-Location -Address 'Redmond, WA'
Find-Factual -GeoPulse -TypeOfFilter Point -Filter "$($l.longitude),$($l.Latitude)" -Verbose
```
> EXAMPLE 3

```PowerShell
Find-Factual -InTable vYrq7F -Filter 'Washington' -TypeOfFilter State -Limit 50
```
Wineries

```PowerShell
Find-Factual -InTable cQUvfi
```

---

### Parameters
#### **Query**
The factual query

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **TypeOfFilter**
The type of the filter
Valid Values:

* In
* Near
* Category
* Country
* UPC
* EAN
* Brand
* Point
* Name
* Brewery
* Beer
* Style
* State
* PostCode

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Filter**
The filter

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Within**
Within.  This is only used when 'near' is used

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt32]`|false   |4       |true (ByPropertyName)|

#### **FactualKey**
Your Factual API Key

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **FactualKeySetting**
A secure setting containing your factual key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Restaurants**
If set, will only find US resturaunts

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HeathCare**
If set, will only find health care providers

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Product**
If set, will only find products

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Place**
If set, searches the places data set

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GeoPulse**
If set, gets the GeoPulse of an area

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InTable**
If set, will get data from a table

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Limit**
If set, will limit the number of responses returned

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Offset**
If set, will start returning results at a point

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **All**
If set, will query all records that match a filter.  This will result in multiple queries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Find-Factual [[-Query] <String>] [[-TypeOfFilter] <String[]>] [[-Filter] <String[]>] [[-Within] <UInt32>] [[-FactualKey] <String>] [[-FactualKeySetting] <String>] [-Restaurants] [-HeathCare] [-Product] [-Place] [-GeoPulse] [-InTable <String>] [-Limit <UInt32>] [-Offset <UInt32>] [-All] [<CommonParameters>]
```

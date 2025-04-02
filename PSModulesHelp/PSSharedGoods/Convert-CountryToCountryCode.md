Convert-CountryToCountryCode
----------------------------

### Synopsis
Converts a country name to a country code, or when used with a switch to full culture information

---

### Description

Converts a country name to a country code, or when used with a switch to full culture information

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-CountryToCountryCode -CountryName 'Poland'
```
> EXAMPLE 2

```PowerShell
Convert-CountryToCountryCode -CountryName 'Poland' -All
```
> EXAMPLE 3

```PowerShell
$Test = Convert-CountryToCountryCode
$Test['India']['Culture']
$Test['India']['RegionInformation']
```
> EXAMPLE 4

```PowerShell
$Test = Convert-CountryToCountryCode
$Test['Poland']['Culture']
$Test['Poland']['RegionInformation']
```
> EXAMPLE 5

```PowerShell
Convert-CountryToCountryCode -CountryName 'Polska'
Convert-CountryToCountryCode -CountryName 'Poland'
Convert-CountryToCountryCode -CountryName 'CZECH REPUBLIC'
Convert-CountryToCountryCode -CountryName 'USA'
```

---

### Parameters
#### **CountryName**
Country name in it's english name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **All**
Provide full culture information rather than just the country code

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-CountryToCountryCode [[-CountryName] <String>] [-All] [<CommonParameters>]
```

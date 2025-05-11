Convert-CountryCodeToCountry
----------------------------

### Synopsis
Converts a country code to a country name, or when used with a switch to full culture information

---

### Description

Converts a country code to a country name, or when used with a switch to full culture information

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-CountryCodeToCountry -CountryCode 'PL'
```
> EXAMPLE 2

```PowerShell
Convert-CountryCodeToCountry -CountryCode 'PL' -All
```
> EXAMPLE 3

```PowerShell
$Test = Convert-CountryCodeToCountry
$Test['PL']['Culture'] | fl
$Test['PL']['RegionInformation']
```
> EXAMPLE 4

```PowerShell
Convert-CountryCodeToCountry -CountryCode 'PL'
Convert-CountryCodeToCountry -CountryCode 'POL'
```

---

### Parameters
#### **CountryCode**
Country code

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **All**
Provide full culture information rather than just the country name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-CountryCodeToCountry [[-CountryCode] <String>] [-All] [<CommonParameters>]
```

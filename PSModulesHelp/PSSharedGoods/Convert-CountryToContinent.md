Convert-CountryToContinent
--------------------------

### Synopsis
Convert country to continent

---

### Description

Convert country to continent or return a hashtable of countries and their corresponding continent.
If the country is not found (for example empty), it will return "Unknown"

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-CountryToContinent -Country "Poland"
```
> EXAMPLE 2

```PowerShell
Convert-CountryToContinent
```

---

### Parameters
#### **Country**
Country to convert. If country is not given it will return a hashtable of countries and their corresponding continent.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ReturnHashTable**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-CountryToContinent [[-Country] <String>] [-ReturnHashTable] [<CommonParameters>]
```

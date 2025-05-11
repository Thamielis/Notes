Resolve-Location
----------------

### Synopsis
Resolves a location to it's place on Earth

---

### Description

Looks up physical addresess (in the US), ip addresses, or hostnames.

Returns results as a [http://schema.org/Place](http://schema.org/Place)

---

### Related Links
* [Get-Web](Get-Web)

---

### Examples
Resolve Location by GeoIP

```PowerShell
Resolve-Location -Address "69.89.88.122"
```
Resolve physical locations within the US

```PowerShell
Resolve-Location -Address "1600 Pennsylvania Ave, Washington, DC"
```

---

### Parameters
#### **Address**
The physical address or IP address.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

---

### Outputs
* http://schema.org/Place

---

### Syntax
```PowerShell
Resolve-Location [-Address] <String> [<CommonParameters>]
```

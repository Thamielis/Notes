Add-FormatData
--------------

### Synopsis
Adds a table formatting definition for the specified type name.

---

### Description

---

### Examples
> EXAMPLE 1

$r = [PSCustomObject] @{
    Name = "Lee";
    Phone = "555-1212";
    SSN = "123-12-1212"
}
PS > $r.PSTypeNames.Add("AddressRecord")
PS > Add-FormatData -TypeName AddressRecord -TableColumns Name, Phone
PS > $r
Name Phone
---- -----
Lee  555-1212

---

### Parameters
#### **TypeName**
The type name (or PSTypeName) that the table definition should
apply to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **TableColumns**
The columns to be displayed by default

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

---

### Syntax
```PowerShell
Add-FormatData [[-TypeName] <Object>] [[-TableColumns] <String[]>] [<CommonParameters>]
```

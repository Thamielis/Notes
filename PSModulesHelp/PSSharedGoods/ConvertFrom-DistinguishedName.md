ConvertFrom-DistinguishedName
-----------------------------

### Synopsis

ConvertFrom-DistinguishedName [-DistinguishedName <string[]>] [<CommonParameters>]

ConvertFrom-DistinguishedName [-DistinguishedName <string[]>] [-ToFQDN] [<CommonParameters>]

ConvertFrom-DistinguishedName [-DistinguishedName <string[]>] [-ToCanonicalName] [<CommonParameters>]

ConvertFrom-DistinguishedName [-DistinguishedName <string[]>] [-ToLastName] [<CommonParameters>]

ConvertFrom-DistinguishedName [-DistinguishedName <string[]>] [-ToDomainCN] [<CommonParameters>]

ConvertFrom-DistinguishedName [-DistinguishedName <string[]>] [-ToDC] [<CommonParameters>]

ConvertFrom-DistinguishedName [-DistinguishedName <string[]>] [-ToMultipleOrganizationalUnit] [-IncludeParent] [<CommonParameters>]

ConvertFrom-DistinguishedName [-DistinguishedName <string[]>] [-ToOrganizationalUnit] [<CommonParameters>]

---

### Description

---

### Parameters
#### **DistinguishedName**

|Type        |Required|Position|PipelineInput                 |Aliases        |
|------------|--------|--------|------------------------------|---------------|
|`[string[]]`|false   |0       |true (ByValue, ByPropertyName)|Identity<br/>DN|

#### **IncludeParent**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ToCanonicalName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ToDC**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ToDomainCN**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ToFQDN**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ToLastName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ToMultipleOrganizationalUnit**

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[switch]`|false   |Named   |false        |ToMultipleOU|

#### **ToOrganizationalUnit**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

---

### Inputs
System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=ConvertFrom-DistinguishedName; CommonParameters=True; parameter=System.Object[]}, @{name=ConvertFrom-DistinguishedName; CommonParameters=True; parameter=…
```

New-Adr
-------

### Synopsis
Create a new ADR.

---

### Description

Creates a new ADR numbered after the ADRs currently present in the ADR dir.

---

### Parameters
#### **Title**
The title of the ADR.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Status**
The initial status of the ADR. Can be Proposed or Accepted (default).
Valid Values:

* Proposed
* Accepted

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Supersede**
An array of ADR numbers that are superseded by this ADR.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |3       |false        |

#### **Link**
An array of link specs to add from this ADR. A link spec is as follows:
<ToNumber>:<ToLink>:<FromLink>
Example: '8:Amends:Amended by'

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **Template**
Path to the template to use over the other auto-lookup sources. This is meant for internal use only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-Adr [-Title] <String> [[-Status] <String>] [[-Supersede] <Int32[]>] [[-Link] <String[]>] [[-Template] <String>] [<CommonParameters>]
```

Initialize-Adr
--------------

### Synopsis
Initializes an ADR directory.

---

### Description

Initliazes an ADR directory and populates it with an initial decision to use ADRs.

---

### Parameters
#### **Target**
If provided, creates an .adr-dir file with the target path as it's content, creates
the target path as a directory (if it doesn't already exist) and uses this as the
directory to populate the initial decision. If omitted, uses doc/adr as the target.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Initialize-Adr [[-Target] <String>] [<CommonParameters>]
```

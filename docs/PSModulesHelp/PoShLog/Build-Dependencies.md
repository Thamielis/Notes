Build-Dependencies
------------------

### Synopsis

Build-Dependencies [-CsProjPath] <string> [-ModuleDirectory] <string> [[-Verbosity] <string>] [-IsExtensionModule] [<CommonParameters>]

---

### Description

---

### Parameters
#### **CsProjPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |0       |false        |

#### **IsExtensionModule**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ModuleDirectory**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

#### **Verbosity**

Valid Values:

* quiet
* q
* minimal
* m
* normal
* n
* detailed
* d
* diagnostic
* diag

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|false   |2       |false        |v      |

---

### Inputs
None

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
{@{name=Build-Dependencies; CommonParameters=True; parameter=System.Object[]}}
```

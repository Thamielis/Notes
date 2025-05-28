AnyInterestingPRs
-----------------

### Synopsis

AnyInterestingPRs [-Titles] <string[]> [-MaxSemVerIncrement] <string> [[-PackageWildcardExpressions] <string[]>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **MaxSemVerIncrement**

Valid Values:

* patch
* minor
* major

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

#### **PackageWildcardExpressions**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |2       |false        |

#### **Titles**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|true    |0       |false        |

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
{@{name=AnyInterestingPRs; CommonParameters=True; parameter=System.Object[]}}
```

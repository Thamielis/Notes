Export-DataTableToFeed
----------------------

### Synopsis

Export-DataTableToFeed [-DataTable] <DataTable> [-OutputFilename] <string> -Namespace <string> -NamespacePrefix <string> [-FeedTitle <string>] [-FeedID <string>] [-FeedUpdateTime <DateTimeOffset>] [-EntryUpdateTime <DateTimeOffset>] [-LinkSelf <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **DataTable**
DataTable

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[DataTable]`|true    |0       |false        |

#### **EntryUpdateTime**
EntryUpdateTime

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DateTimeOffset]`|false   |Named   |false        |

#### **FeedID**
FeedID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FeedTitle**
FeedTitle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FeedUpdateTime**
FeedUpdateTime

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DateTimeOffset]`|false   |Named   |false        |

#### **LinkSelf**
LinkSelf

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Namespace**
Namespace

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **NamespacePrefix**
NamespacePrefix

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **OutputFilename**
OutputFilename

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

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
{@{name=Export-DataTableToFeed; CommonParameters=True; parameter=System.Object[]}}
```

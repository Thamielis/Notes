Get-OAIRunItem
--------------

### Synopsis
Retrieves information about a specific run item.

---

### Description

The Get-OAIRunItem function retrieves information about a specific run item based on the provided thread ID and run ID.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/runs/getRun](https://platform.openai.com/docs/api-reference/runs/getRun)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIRunItem -threadId 123 -runId 456
Retrieves information about the run item with thread ID 123 and run ID 456.
```

---

### Parameters
#### **ThreadId**
The ID of the thread associated with the run item. This parameter is mandatory.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[Object]`|false   |1       |true (ByPropertyName)|thread_id|

#### **RunId**
The ID of the run item to retrieve information for. This parameter is mandatory.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |2       |true (ByPropertyName)|run_id |

---

### Syntax
```PowerShell
Get-OAIRunItem [[-ThreadId] <Object>] [[-RunId] <Object>] [<CommonParameters>]
```

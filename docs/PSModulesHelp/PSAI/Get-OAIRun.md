Get-OAIRun
----------

### Synopsis
Retrieves the runs associated with a specific thread ID.

---

### Description

The Get-OAIRun function retrieves the runs associated with a specific thread ID from a specified base URL. It allows you to specify various parameters such as the number of runs to retrieve, the order in which they should be sorted, and the time range for the runs.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/runs/listRuns](https://platform.openai.com/docs/api-reference/runs/listRuns)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIRun -threadId 12345 -limit 10 -order 'asc' -after '2022-01-01T00:00:00Z'
Retrieves the 10 oldest runs associated with thread ID 12345, sorted in ascending order, and after the specified timestamp.
```

---

### Parameters
#### **threadId**
Specifies the ID of the thread for which to retrieve the runs. This parameter is mandatory.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[Object]`|false   |1       |true (ByPropertyName)|thread_id|

#### **limit**
Specifies the maximum number of runs to retrieve. The default value is 20.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **order**
Specifies the order in which the runs should be sorted. Valid values are 'asc' (ascending) and 'desc' (descending). The default value is 'desc'.
Valid Values:

* asc
* desc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **after**
Specifies the timestamp after which the runs should be retrieved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **before**
Specifies the timestamp before which the runs should be retrieved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Syntax
```PowerShell
Get-OAIRun [[-threadId] <Object>] [[-limit] <Object>] [[-order] <Object>] [[-after] <Object>] [[-before] <Object>] [<CommonParameters>]
```

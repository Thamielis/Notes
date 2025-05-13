Get-OAIRunStep
--------------

### Synopsis
Retrieves the run steps for a specific thread and run ID.

---

### Description

The Get-OAIRunStep function retrieves the run steps for a specific thread and run ID. It allows you to specify optional parameters such as the number of steps to retrieve, the order in which the steps should be sorted, and filters based on timestamps.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/runs/listRunSteps](https://platform.openai.com/docs/api-reference/runs/listRunSteps)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIRunStep -threadId 123 -runId 456
Retrieves the run steps for thread ID 123 and run ID 456.
```
> EXAMPLE 2

```PowerShell
Get-OAIRunStep -threadId 123 -runId 456 -limit 50 -order 'asc' -after '2022-01-01T00:00:00Z'
Retrieves the first 50 run steps in ascending order that occurred after January 1, 2022.
```

---

### Parameters
#### **ThreadId**
The ID of the thread for which to retrieve the run steps. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **RunId**
The ID of the run for which to retrieve the steps. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **Limit**
The maximum number of steps to retrieve. The default value is 20.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Order**
The order in which the steps should be sorted. Valid values are 'asc' (ascending) and 'desc' (descending). The default value is 'desc'.
Valid Values:

* asc
* desc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **After**
Retrieve steps that occurred after which is an object ID that defines your place in the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **Before**
Retrieve steps that occurred before which is an object ID that defines your place in the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

---

### Syntax
```PowerShell
Get-OAIRunStep [-ThreadId] <Object> [-RunId] <Object> [[-Limit] <Object>] [[-Order] <Object>] [[-After] <Object>] [[-Before] <Object>] [<CommonParameters>]
```

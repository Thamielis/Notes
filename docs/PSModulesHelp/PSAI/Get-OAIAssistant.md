Get-OAIAssistant
----------------

### Synopsis
Retrieves OpenAI assistants based on specified criteria.

---

### Description

The Get-OAIAssistant function retrieves OpenAI assistants based on the specified criteria such as name, limit, order, after, before, and raw output.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/assistants/listAssistants](https://platform.openai.com/docs/api-reference/assistants/listAssistants)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIAssistant -Name "MyAssistant" -Limit 10 -Order 'asc'
Retrieves the first 10 OpenAI assistants with the name "MyAssistant" in ascending order.
```
> EXAMPLE 2

```PowerShell
Get-OAIAssistant -Limit 5 -After "cursor123"
Retrieves the next 5 OpenAI assistants created after the cursor "cursor123".
```

---

### Parameters
#### **Name**
Specifies the name of the OpenAI assistant to retrieve. If not specified, all assistants will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Limit**
Specifies the maximum number of assistants to retrieve.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Order**
Specifies the order in which the assistants should be sorted. Valid values are 'asc' (ascending) and 'desc' (descending). The default value is 'desc'.
Valid Values:

* asc
* desc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **After**
Specifies the cursor for pagination. Only assistants created after this cursor will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Before**
Specifies the cursor for pagination. Only assistants created before this cursor will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **Raw**
Switch parameter. If specified, the raw response from the API will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* The function returns a collection of OpenAI assistants based on the specified criteria.

---

### Syntax
```PowerShell
Get-OAIAssistant [[-Name] <Object>] [[-Limit] <Object>] [[-Order] <Object>] [[-After] <Object>] [[-Before] <Object>] [-Raw] [<CommonParameters>]
```

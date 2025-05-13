Get-OAIMessage
--------------

### Synopsis
Retrieves messages for a specific thread ID.

---

### Description

The Get-OAIMessage function retrieves messages for a specific thread ID. It allows you to specify various parameters such as the number of messages to retrieve, the order in which they should be sorted, and filters based on timestamps and run IDs.

---

### Related Links
* [https://beta.openai.com/docs/api-reference/messages/list](https://beta.openai.com/docs/api-reference/messages/list)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIMessage -ThreadId 12345 -Limit 10 -Order 'asc' -After '2022-01-01' -RunId 'abc123'
Retrieves the 10 oldest messages for the thread with ID 12345, sorted in ascending order, after the specified timestamp, and for the specified run ID.
```

---

### Parameters
#### **ThreadId**
The ID of the thread for which messages should be retrieved.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Object]`|false   |1       |true (ByPropertyName)|id<br/>thread_id|

#### **Limit**
The maximum number of messages to retrieve. The default value is 20.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Order**
The order in which the messages should be sorted. Valid values are 'asc' (ascending) and 'desc' (descending). The default value is 'desc'.
Valid Values:

* asc
* desc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **After**
Retrieve messages after the specified timestamp.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Before**
Retrieve messages before the specified timestamp.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **RunId**
Retrieve messages for a specific run ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

---

### Syntax
```PowerShell
Get-OAIMessage [[-ThreadId] <Object>] [[-Limit] <Object>] [[-Order] <Object>] [[-After] <Object>] [[-Before] <Object>] [[-RunId] <Object>] [<CommonParameters>]
```

Update-OAIMessage
-----------------

### Synopsis
Updates an OAI message by sending a POST request to the specified thread and message IDs.

---

### Description

The Update-OAIMessage function updates an OAI message by sending a POST request to the specified thread and message IDs. It allows you to update the metadata of a message.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/messages/modifyMessage](https://platform.openai.com/docs/api-reference/messages/modifyMessage)

---

### Examples
> EXAMPLE 1

Update-OAIMessage -ThreadId 1234 -MessageId 5678 -Metadata @{ "key" = "value" }
Updates the message with ID 5678 in the thread with ID 1234, setting the metadata to {"key": "value"}.

---

### Parameters
#### **ThreadId**
The ID of the thread to which the message belongs. This parameter is also aliased as 'thread_id'.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[Object]`|false   |1       |true (ByPropertyName)|thread_id|

#### **MessageId**
The ID of the message to be updated. This parameter is also aliased as 'id'.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |2       |true (ByPropertyName)|id     |

#### **Metadata**
Optional. The updated metadata for the message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
Update-OAIMessage [[-ThreadId] <Object>] [[-MessageId] <Object>] [[-Metadata] <Object>] [<CommonParameters>]
```

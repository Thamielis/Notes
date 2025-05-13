New-OAIMessage
--------------

### Synopsis
Creates a new message for a specified thread in the OpenAI API.

---

### Description

The New-OAIMessage function creates a new message for a specified thread in the OpenAI API. It allows you to specify the thread ID, role, content, attachments, and metadata for the message.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/messages/createMessage](https://platform.openai.com/docs/api-reference/messages/createMessage)

---

### Examples
> EXAMPLE 1

```PowerShell
New-OAIMessage -ThreadId "12345" -Role "user" -Content "Hello, how can I help you?"
This example creates a new user message with the content "Hello, how can I help you?" for the thread with ID "12345".
```

---

### Parameters
#### **ThreadId**
The ID of the thread to which the message belongs.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |true (ByPropertyName)|Id     |

#### **Role**
The role of the message. Valid values are 'user' and 'assistant'.
Valid Values:

* user
* assistant

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **Content**
The content of the message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |false        |

#### **Attachments**
Optional. Any attachments to include with the message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Metadata**
Optional. Any metadata to include with the message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-OAIMessage [[-ThreadId] <Object>] [-Role] <Object> [-Content] <Object> [[-Attachments] <Object>] [[-Metadata] <Object>] [<CommonParameters>]
```

New-OAIThread
-------------

### Synopsis
Creates a new thread in the OpenAI API.

---

### Description

The New-OAIThread function sends a POST request to the OpenAI API to create a new thread. It takes in the following parameters:
- messages: An array of messages to be included in the thread.
- tool_resources: (Optional) Additional tool resources to be used in the thread.
- metadata: (Optional) Additional metadata to be associated with the thread.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/threads/createThread](https://platform.openai.com/docs/api-reference/threads/createThread)

---

### Examples
> EXAMPLE 1

```PowerShell
$messages = @(
    @{
        role = 'user'
        content = 'You are a helpful AI assistant.'
    },
    @{
        role = 'user'
        content = 'How can I create a new thread?'
    }
)
New-OAIThread -messages $messages
```

---

### Parameters
#### **Messages**
Specifies an array of messages to be included in the thread.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |1       |false        |

#### **ToolResources**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Metadata**
Specifies additional metadata to be associated with the thread. This parameter is optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Notes
This function requires the Invoke-OAIBeta function to be available in the current session.

---

### Syntax
```PowerShell
New-OAIThread [[-Messages] <Object[]>] [[-ToolResources] <Object>] [[-Metadata] <Object>] [<CommonParameters>]
```

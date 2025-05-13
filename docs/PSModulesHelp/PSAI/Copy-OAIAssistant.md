Copy-OAIAssistant
-----------------

### Synopsis
Copies an OpenAI Assistant to create a new Assistant with optional name change.

---

### Description

The Copy-OAIAssistant function copies an OpenAI Assistant identified by AssistantId and creates a new Assistant with optional name change.

---

### Examples
> EXAMPLE 1

```PowerShell
Copy-OAIAssistant -AssistantId "assistant-12345" -NewName "MyCopiedAssistant"
Copies the OpenAI Assistant with ID "assistant-12345" and creates a new Assistant with the name "MyCopiedAssistant".
```
> EXAMPLE 2

```PowerShell
Copy-OAIAssistant -AssistantId "assistant-67890"
Copies the OpenAI Assistant with ID "assistant-67890" and creates a new Assistant with the same name as the original Assistant.
```

---

### Parameters
#### **AssistantId**
Specifies the ID of the OpenAI Assistant to be copied.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |true (ByPropertyName)|id     |

#### **NewName**
Specifies the new name for the copied Assistant. If not provided, the copied Assistant will retain the same name as the original Assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Copy-OAIAssistant [[-AssistantId] <Object>] [[-NewName] <Object>] [<CommonParameters>]
```

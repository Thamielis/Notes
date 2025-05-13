Export-OAIAssistant
-------------------

### Synopsis
Exports an OpenAI Assistant to a JSON file.

---

### Description

The Export-OAIAssistant function exports an OpenAI Assistant to a JSON file. It retrieves the assistant using the specified AssistantId and saves its properties to a JSON file at the specified Path.

---

### Examples
> EXAMPLE 1

```PowerShell
Export-OAIAssistant -AssistantId "assistant-12345" -Path "C:\Exports\assistant-12345.json"
Exports the OpenAI Assistant with ID "assistant-12345" to a JSON file located at "C:\Exports\assistant-12345.json".
```

---

### Parameters
#### **AssistantId**
The ID of the OpenAI Assistant to export.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |true (ByPropertyName)|id     |

#### **Path**
The path where the exported JSON file will be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Export-OAIAssistant [[-AssistantId] <Object>] [[-Path] <Object>] [<CommonParameters>]
```

ConvertTo-OAIAssistant
----------------------

### Synopsis
Converts the Assistant configuration to an OAIAssistant object.

---

### Description

The ConvertTo-OAIAssistant function takes an Assistant configuration as input and converts it to an OAIAssistant object. The Assistant configuration can be provided as a JSON file path or as a JSON string.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-OAIAssistant -AssistantConfig "C:\AssistantConfig.json"
This example converts the Assistant configuration stored in the "C:\AssistantConfig.json" file to an OAIAssistant object.
```
> EXAMPLE 2

```PowerShell
ConvertTo-OAIAssistant -AssistantConfig '{"name": "MyAssistant"}'
This example converts the Assistant configuration provided as a JSON string to an OAIAssistant object.
```

---

### Parameters
#### **AssistantConfig**
The Assistant configuration. It can be provided as a file path to a JSON file or as a JSON string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
ConvertTo-OAIAssistant [[-AssistantConfig] <Object>] [<CommonParameters>]
```

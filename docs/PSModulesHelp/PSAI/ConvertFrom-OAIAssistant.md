ConvertFrom-OAIAssistant
------------------------

### Synopsis
Converts an AI assistant object to Json.

---

### Description

The ConvertFrom-OAIAssistant function takes an AI assistant object as input and converts it to Json. It removes certain properties from the object. This allows you to save and resotre the assisant correctly

---

### Examples
> EXAMPLE 1

```PowerShell
$assistant = New-OAIAssistant 
ConvertFrom-OAIAssistant -Assistant $assistant
```

---

### Parameters
#### **Assistant**
The AI assistant object to be converted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
ConvertFrom-OAIAssistant [-Assistant] <Object> [<CommonParameters>]
```

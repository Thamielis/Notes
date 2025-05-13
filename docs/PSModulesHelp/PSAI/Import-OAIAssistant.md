Import-OAIAssistant
-------------------

### Synopsis
Imports an OAI Assistant from a JSON file.

---

### Description

The Import-OAIAssistant function imports an OAI Assistant from a JSON file and creates a new OAI Assistant object.

---

### Examples
> EXAMPLE 1

```PowerShell
Import-OAIAssistant -Path "C:\OAIAssistant.json"
This example imports an OAI Assistant from the "C:\OAIAssistant.json" file.
```

---

### Parameters
#### **Path**
The path to the JSON file containing the OAI Assistant properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Import-OAIAssistant [-Path] <String> [<CommonParameters>]
```

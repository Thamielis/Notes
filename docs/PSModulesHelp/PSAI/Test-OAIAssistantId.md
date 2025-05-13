Test-OAIAssistantId
-------------------

### Synopsis
Tests whether an OpenAI Assistant ID exists.

---

### Description

The Test-OAIAssistantId function checks whether an OpenAI Assistant ID exists by querying the Get-OAIAssistantItem cmdlet.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-OAIAssistantId -AssistantId "12345678"
Checks whether the Assistant ID "12345678" exists.
```

---

### Parameters
#### **AssistantId**
The Assistant ID to be tested.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |true (ByPropertyName)|id     |

---

### Inputs
None. You cannot pipe objects to this function.

---

### Outputs
* System.Boolean
Returns $true if the Assistant ID exists, otherwise returns $false.

---

### Syntax
```PowerShell
Test-OAIAssistantId [[-AssistantId] <Object>] [<CommonParameters>]
```

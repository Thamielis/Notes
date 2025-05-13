Remove-OAIAssistant
-------------------

### Synopsis
Removes an OAI Assistant.

---

### Description

The Remove-OAIAssistant function is used to remove an OAI Assistant by its ID.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/assistants/deleteAssistant](https://platform.openai.com/docs/api-reference/assistants/deleteAssistant)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-OAIAssistant -Id "assistant123"
Removes the OAI Assistant with the ID "assistant123".
```

---

### Parameters
#### **Id**
The ID of the OAI Assistant to be removed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |1       |true (ByPropertyName)|

---

### Syntax
```PowerShell
Remove-OAIAssistant [[-Id] <Object>] [<CommonParameters>]
```

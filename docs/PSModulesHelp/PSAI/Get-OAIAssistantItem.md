Get-OAIAssistantItem
--------------------

### Synopsis
Retrieves an item from the OpenAI Assistant.

---

### Description

The Get-OAIAssistantItem function retrieves an item from the OpenAI Assistant based on the specified AssistantId.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/assistants/getAssistant](https://platform.openai.com/docs/api-reference/assistants/getAssistant)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIAssistantItem -AssistantId "12345678"
This example retrieves an item from the OpenAI Assistant with the ID "12345678".
```

---

### Parameters
#### **AssistantId**
The ID of the OpenAI Assistant.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[Object]`|false   |1       |true (ByPropertyName)|assistant_id|

---

### Inputs
None.

---

### Outputs
* System.Object.

---

### Syntax
```PowerShell
Get-OAIAssistantItem [[-AssistantId] <Object>] [<CommonParameters>]
```

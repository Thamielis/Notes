Invoke-AIPrompt
---------------

### Synopsis
Prompts the user for input using OpenAI ChatGPT and returns the generated response.

---

### Description

The Invoke-AIPrompt function prompts the user for input using OpenAI ChatGPT and returns the generated response. It sends a series of messages to the ChatGPT model, including system messages and user messages, to guide the conversation.

---

### Examples
> EXAMPLE 1

```PowerShell
$data = @"
Region,State,Units,Price
West,Texas,927,923.71
North,Tennessee,466,770.67
East,Florida,520,458.68w
East,Maine,828,661.24
West,Virginia,465,53.58
North,Missouri,436,235.67
South,Kansas,214,992.47
North,North Dakota,789,640.72
South,Delaware,712,508.55
"@
Invoke-AIPrompt -Prompt "top 3" -Data $data

This example prompts the user with the question "What is the capital of France?" and includes the question in the conversation data. The function then returns the generated response from the ChatGPT model.
```

---

### Parameters
#### **Prompt**
Specifies the prompt message to be displayed to the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Data**
Specifies the data to be included in the conversation. This data will be displayed to the user before the prompt.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **Model**
Specifies the ChatGPT model to use for generating the response. The default value is 'gpt-4o-mini'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **UsePowerShellPersona**
Indicates whether to use a PowerShell persona for the conversation. If this switch is specified, a system message will be added to the conversation to inform the model that the user is a PowerShell expert.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* System.String
Returns the generated response from the ChatGPT model.

---

### Notes
This function requires the Invoke-OAIChatCompletion function to be available in the current session.

---

### Syntax
```PowerShell
Invoke-AIPrompt [-Prompt] <Object> [-Data] <Object> [[-Model] <Object>] [-UsePowerShellPersona] [<CommonParameters>]
```

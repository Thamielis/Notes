New-OAIThreadAndRun
-------------------

### Synopsis
Creates a new OpenAI thread and runs it.

---

### Description

The New-OAIThreadAndRun function creates a new thread and runs it using the OpenAI API. It allows you to specify various parameters such as the assistant ID, thread, model, instructions, tools, tool resources, metadata, temperature, top-p, stress, max prompt tokens, max completion tokens, truncation strategy, tool choices, and response format.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/runs/createThreadAndRun](https://platform.openai.com/docs/api-reference/runs/createThreadAndRun)

---

### Examples
> EXAMPLE 1

```PowerShell
New-OAIThreadAndRun -AssistantId 'assistant-123' -Thread 'Hello' -Model 'gpt-3.5-turbo' -Instructions 'Translate the following English text to French: "Hello, how are you?"' -Tools 'translation' -ToolResources @{ translation = @{ source_language = 'en' ; target_language = 'fr' } } -Temperature 0.8 -TopP 0.9 -Stress 0.5 -MaxPromptTokens 100 -MaxCompletionTokens 50 -TruncationStrategy 'longest_first' -ToolChoices @{ translation = 'translation' } -ResponseFormat 'json'
```

---

### Parameters
#### **AssistantId**
The ID of the assistant to use for the thread.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Thread**
The thread to be used for the conversation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Model**
The model to use for generating responses.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Instructions**
The instructions to provide to the model.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Tools**
The tools to be used during the conversation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **ToolResources**
The resources required by the tools.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **Metadata**
Additional metadata to include with the request.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **Temperature**
The temperature parameter controls the randomness of the model's output. Higher values (e.g., 0.8) make the output more random, while lower values (e.g., 0.2) make it more focused and deterministic.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **TopP**
The top-p parameter controls the diversity of the model's output. It specifies the cumulative probability threshold for generating tokens. Higher values (e.g., 0.9) result in more diverse output, while lower values (e.g., 0.3) make it more focused.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **Stress**
The stress parameter controls how much the model is "pushed" to generate a response. Higher values (e.g., 0.8) make the model more likely to generate a response, even if it's not confident. Lower values (e.g., 0.2) make it more cautious.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |

#### **MaxPromptTokens**
The maximum number of tokens allowed in the prompt.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |11      |false        |

#### **MaxCompletionTokens**
The maximum number of tokens allowed in the completion.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |12      |false        |

#### **TruncationStrategy**
The truncation strategy to use when the input exceeds the maximum token limit.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |13      |false        |

#### **ToolChoices**
The choices for the tools to be used during the conversation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |14      |false        |

#### **ResponseFormat**
The format in which the response should be returned. Valid values are 'auto', 'json', and 'text'.
Valid Values:

* auto
* json
* text

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |15      |false        |

---

### Notes
This function requires the Invoke-OAIBeta function to be available in the current session.

---

### Syntax
```PowerShell
New-OAIThreadAndRun [-AssistantId] <Object> [[-Thread] <Object>] [[-Model] <Object>] [[-Instructions] <Object>] [[-Tools] <Object>] [[-ToolResources] <Object>] [[-Metadata] <Object>] [[-Temperature] <Object>] [[-TopP] <Object>] [[-Stress] <Object>] [[-MaxPromptTokens] <Object>] [[-MaxCompletionTokens] <Object>] [[-TruncationStrategy] <Object>] [[-ToolChoices] <Object>] [[-ResponseFormat] <Object>] [<CommonParameters>]
```

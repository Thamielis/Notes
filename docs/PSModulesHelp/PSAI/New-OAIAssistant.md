New-OAIAssistant
----------------

### Synopsis
Creates a new OpenAI Assistant.

---

### Description

The New-OAIAssistant function is used to create a new OpenAI Assistant. It sends a POST request to the OpenAI API to create the assistant with the specified parameters.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/assistants/createAssistant](https://platform.openai.com/docs/api-reference/assistants/createAssistant)

---

### Examples
> EXAMPLE 1

```PowerShell
New-OAIAssistant -Name 'MyAssistant' -Instructions 'How can I help you?' -Description 'An assistant to answer questions' -Tools 'Calculator' -ToolResources 'https://example.com/calculator' -Model 'gpt-3.5-turbo' -Metadata @{ 'version' = '1.0' } -Temperature 0.8 -TopP 0.5 -ResponseFormat 'json'
This example creates a new OpenAI Assistant named 'MyAssistant' with the specified parameters.
```

---

### Parameters
#### **Name**
The name of the assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Instructions**
The instructions to provide to the assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Description**
The description of the assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Tools**
The tools used by the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types code_interpreter, file_search, or function.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **ToolResources**
The resources required by the tools used by the assistant. The resources are specific to the type of tool. For example, the code_interpreter tool requires a list of file IDs, while the file_search tool requires a list of vector store IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **Model**
The model to use for the assistant. Valid values are 'gpt-4', 'gpt-3.5-turbo', 'gpt-3.5-turbo-16k', 'gpt-4-turbo-preview', 'gpt-4-1106-preview', and 'gpt-3.5-turbo-1106'. The default value is 'gpt-3.5-turbo'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **Metadata**
The metadata associated with the assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **Temperature**
The temperature parameter for generating responses. Must be a value between 0 and 2.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **TopP**
The top-p parameter for generating responses. Must be a value between 0 and 1.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **ResponseFormat**
The format of the response. Valid values are 'auto', 'json', and 'text'. The default value is 'auto'.
Valid Values:

* auto
* json
* text

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |

---

### Syntax
```PowerShell
New-OAIAssistant [[-Name] <Object>] [[-Instructions] <Object>] [[-Description] <Object>] [[-Tools] <Object>] [[-ToolResources] <Object>] [[-Model] <Object>] [[-Metadata] <Object>] [[-Temperature] <Object>] [[-TopP] <Object>] [[-ResponseFormat] <Object>] [<CommonParameters>]
```

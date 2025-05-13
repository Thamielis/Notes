Update-OAIAssistant
-------------------

### Synopsis
Updates an OpenAI Assistant.

---

### Description

This function updates an OpenAI Assistant with the specified parameters.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/assistants/modifyAssistant](https://platform.openai.com/docs/api-reference/assistants/modifyAssistant)

---

### Examples
> EXAMPLE 1

```PowerShell
Update-OAIAssistant -Id "assistant123" -Model "gpt-3.5-turbo" -Name "My Assistant" -Description "This is my assistant" -Instructions "Use this assistant to perform various tasks" -Tools "PowerShell", "Visual Studio Code" -FileIds "file1", "file2" -Metadata @{ "key1" = "value1"; "key2" = "value2" }
```

---

### Parameters
#### **Id**
The ID of the OpenAI Assistant to update.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |1       |true (ByPropertyName)|

#### **Model**
The model to use for the OpenAI Assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Name**
The name of the OpenAI Assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Description**
The description of the OpenAI Assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Instructions**
The instructions for using the OpenAI Assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **Tools**
The tools required for using the OpenAI Assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **ToolResources**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **Metadata**
The metadata for the OpenAI Assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **Temperature**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **TopP**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |

#### **ResponseFormat**

Valid Values:

* auto
* json
* text

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |11      |false        |

---

### Syntax
```PowerShell
Update-OAIAssistant [[-Id] <Object>] [[-Model] <Object>] [[-Name] <Object>] [[-Description] <Object>] [[-Instructions] <Object>] [[-Tools] <Object>] [[-ToolResources] <Object>] [[-Metadata] <Object>] [[-Temperature] <Object>] [[-TopP] <Object>] [[-ResponseFormat] <Object>] [<CommonParameters>]
```

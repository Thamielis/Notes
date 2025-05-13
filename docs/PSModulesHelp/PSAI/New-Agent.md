New-Agent
---------

### Synopsis
Creates a new agent with specified tools, instructions, and other properties.

---

### Description

The New-Agent function initializes a new agent object with the provided tools, instructions, language model, name, and description. It also sets up various methods for the agent, such as printing responses and interacting via CLI.

---

### Examples
> EXAMPLE 1

```PowerShell
New-Agent -Instructions "Follow the guidelines" -Tools $tools -Name "HelperAgent" -Description "An agent to assist with tasks" -ShowToolCalls
```

---

### Parameters
#### **Instructions**
A list of instructions added to the system prompt.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Tools**
A collection of tools that the agent can use to assist the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **LLM**
The language model to be used by the agent. Defaults to a new OpenAI chat instance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Name**
The name of the agent.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Description**
A description of the agent.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **ShowToolCalls**
A switch to indicate whether tool calls should be shown.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
The function adds several methods to the agent object, including PrintResponse, InteractiveCLI, GetMessages, and PrettyPrintMessages.

---

### Syntax
```PowerShell
New-Agent [[-Instructions] <Object>] [[-Tools] <Object>] [[-LLM] <Object>] [[-Name] <Object>] [[-Description] <Object>] [-ShowToolCalls] [<CommonParameters>]
```

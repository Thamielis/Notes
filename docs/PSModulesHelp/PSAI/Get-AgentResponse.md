Get-AgentResponse
-----------------

### Synopsis
Retrieves a response from a PSAIAgent based on a given prompt.

---

### Description

The Get-AgentResponse function takes a prompt string and an agent object, validates the agent, and retrieves a response from the agent. The agent must be of type 'PSAIAgent'.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-AgentResponse -Prompt "Hello, how are you?" -Agent $myAgent
```
> EXAMPLE 2

```PowerShell
$myAgent | Get-AgentResponse -Prompt "What is the weather today?"
```

---

### Parameters
#### **Prompt**
The prompt string to be sent to the agent.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Agent**
The agent object from which the response is to be retrieved. This parameter accepts input from the pipeline.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |2       |true (ByValue)|

---

### Notes
The agent object must be of type 'PSAIAgent'. If the agent is not valid, an error will be thrown.

---

### Syntax
```PowerShell
Get-AgentResponse [[-Prompt] <String>] [[-Agent] <Object>] [<CommonParameters>]
```

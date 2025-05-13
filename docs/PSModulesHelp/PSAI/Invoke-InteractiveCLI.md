Invoke-InteractiveCLI
---------------------

### Synopsis
Invokes an interactive command-line interface (CLI) for a given PSAIAgent.

---

### Description

The Invoke-InteractiveCLI function initiates an interactive CLI session for a specified PSAIAgent object. 
It allows the user to send a message, specify a user, and optionally include an emoji and an exit condition.

---

### Examples
> EXAMPLE 1

```PowerShell
$agent = Get-PSAIAgent
PS C:\> Invoke-InteractiveCLI -Agent $agent -Message "Hello, World!" -User "Admin"
This example invokes the interactive CLI for the specified PSAIAgent with the message "Hello, World!" and user "Admin".
```

---

### Parameters
#### **Agent**
The PSAIAgent object that will be used to invoke the interactive CLI. This parameter accepts input from the pipeline.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

#### **Message**
The message to be displayed in the interactive CLI.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **User**
The user associated with the interactive CLI session.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Emoji**
An optional emoji to be displayed in the interactive CLI. The default value is '😎'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **ExitOn**
An optional parameter that specifies the condition on which the interactive CLI should exit.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Notes
The function checks if the provided Agent is a valid PSAIAgent object before invoking the interactive CLI.
If the Agent is not valid, an error is written and the function returns without further execution.

---

### Syntax
```PowerShell
Invoke-InteractiveCLI [[-Agent] <Object>] [[-Message] <Object>] [[-User] <Object>] [[-Emoji] <Object>] [[-ExitOn] <Object>] [<CommonParameters>]
```

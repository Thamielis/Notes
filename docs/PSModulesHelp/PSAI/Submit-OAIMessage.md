Submit-OAIMessage
-----------------

### Synopsis
Submits an OpenAI message and run.

---

### Description

The Submit-OAIMessage function is used to submit an OpenAI message and run. It creates a new message using the New-OAIMessage cmdlet and a new run using the New-OAIRun cmdlet. The function takes three parameters: $Assistant, $Thread, and $UserInput.

---

### Examples
> EXAMPLE 1

```PowerShell
Submit-OAIMessage -Assistant $assistant -Thread $thread -UserInput "Hello, how can I help you?"
This example submits a user message to the OpenAI assistant and creates a new run.
```

---

### Parameters
#### **Assistant**
The assistant object representing the OpenAI assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Thread**
The thread object representing the conversation thread.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **UserInput**
The user input to be submitted as a message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Inputs
None.

---

### Outputs
* System.Object[]
The function returns an array containing the run and message objects.

---

### Syntax
```PowerShell
Submit-OAIMessage [[-Assistant] <Object>] [[-Thread] <Object>] [[-UserInput] <Object>] [<CommonParameters>]
```

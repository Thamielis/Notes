Submit-OAIToolOutputs
---------------------

### Synopsis
Submits tool outputs for a specific thread and run.

---

### Description

The Submit-OAIToolOutputs function is used to submit tool outputs for a specific thread and run in an application. It sends a POST request to the specified URL with the provided tool outputs.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/runs/submitToolOutputs](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs)

---

### Examples
> EXAMPLE 1

```PowerShell
Submit-OAIToolOutputs -threadId 123 -runId 456 -toolOutputs $outputs
```

---

### Parameters
#### **ThreadId**
The ID of the thread for which the tool outputs are being submitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **RunId**
The ID of the run for which the tool outputs are being submitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **ToolOutputs**
The tool outputs to be submitted. This parameter should be an object containing the tool outputs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |false        |

---

### Syntax
```PowerShell
Submit-OAIToolOutputs [-ThreadId] <Object> [-RunId] <Object> [-ToolOutputs] <Object> [<CommonParameters>]
```

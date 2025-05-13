New-OpenAIChat
--------------

### Synopsis
Creates a new OpenAI chat configuration object.

---

### Description

The New-OpenAIChat function initializes a new OpenAI chat configuration object with a specified model. 
It generates a verbose message containing the timestamp and the configuration details.

---

### Examples
> EXAMPLE 1

```PowerShell
New-OpenAIChat -model 'gpt-4o-mini'
This example creates a new OpenAI chat configuration object using the 'gpt-3.5-turbo' model.
```
> EXAMPLE 2

```PowerShell
New-OpenAIChat
This example creates a new OpenAI chat configuration object using the default 'gpt-4o-mini' model.
```

---

### Parameters
#### **model**
Specifies the model to be used for the OpenAI chat. The default value is 'gpt-4o-mini'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
New-OpenAIChat [[-model] <Object>] [<CommonParameters>]
```

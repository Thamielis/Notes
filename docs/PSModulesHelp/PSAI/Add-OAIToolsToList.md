Add-OAIToolsToList
------------------

### Synopsis
Adds tools and functions to a list for use with OpenAI Assistants.

---

### Description

The Add-OAIToolsToList function is used to add tools and functions to a list, which can be used with OpenAI Assistants. It takes in parameters for the tools, function JSON, and a hashtable representing the body of the request. The function then constructs a list of tools and functions based on the provided parameters and updates the 'tools' property of the body hashtable.

---

### Related Links
* [https://platform.openai.com/docs/assistants/tools/defining-functions](https://platform.openai.com/docs/assistants/tools/defining-functions)

---

### Examples
> EXAMPLE 1

```PowerShell
Add-OAIToolsToList -Tools 'spellcheck' -FunctionJson @('{"type": "function", "function": "function_json"}') -Body $body
Adds the 'spellcheck' tool and a function JSON object to the list of tools in the body hashtable.
```

---

### Parameters
#### **Tools**
An optional array of strings representing the tools to be added to the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **FunctionJson**
An optional array of function JSON objects representing the functions to be added to the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Body**
A mandatory hashtable representing the body of the request.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|true    |3       |false        |

---

### Syntax
```PowerShell
Add-OAIToolsToList [[-Tools] <Object>] [[-FunctionJson] <Object>] [-Body] <Hashtable> [<CommonParameters>]
```

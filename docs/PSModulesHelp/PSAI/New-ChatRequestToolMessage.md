New-ChatRequestToolMessage
--------------------------

### Synopsis
Creates a new chat request tool message.

---

### Description

The New-ChatRequestToolMessage function creates a new chat request tool message with the specified parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChatRequestToolMessage -toolCallId 123 -toolFunctionName "MyTool" -content "Hello, world!"
This example creates a new chat request tool message with the tool call ID 123, tool function name "MyTool", and content "Hello, world!".
```

---

### Parameters
#### **toolCallId**
The ID of the tool call.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **toolFunctionName**
The name of the tool function.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **content**
The content of the tool message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |false        |

---

### Syntax
```PowerShell
New-ChatRequestToolMessage [-toolCallId] <Object> [-toolFunctionName] <Object> [-content] <Object> [<CommonParameters>]
```

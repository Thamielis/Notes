New-OAIThreadQuery
------------------

### Synopsis
Creates a new thread query.

---

### Description

The New-OAIThreadQuery function creates a new thread query by invoking the New-OAIThread cmdlet and submitting a message using the Submit-OAIMessage cmdlet.

---

### Examples
> EXAMPLE 1

```PowerShell
New-OAIThreadQuery -UserInput "Hello" -Assistant $assistant
This example creates a new thread query with the user input "Hello" and the specified assistant.
```

---

### Parameters
#### **UserInput**
The user input to be included in the query.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Assistant**
The assistant to be used for the query.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Outputs
* System.Object[]
The output consists of an array containing the created thread, the run status, and the message.

---

### Syntax
```PowerShell
New-OAIThreadQuery [-UserInput] <Object> [-Assistant] <Object> [<CommonParameters>]
```

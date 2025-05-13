New-OAIChatMessage
------------------

### Synopsis
Creates a new chat message object.

---

### Description

The New-OAIChatMessage function creates a new chat message object with the specified content and role.

---

### Examples
> EXAMPLE 1

```PowerShell
New-OAIChatMessage -Content "Hello, how can I assist you?" -Role 'assistant'
Creates a new chat message object with the content "Hello, how can I assist you?" and the role 'assistant'.
```

---

### Parameters
#### **Content**
The content of the chat message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Role**
The role of the chat message. Valid values are 'system', 'user', and 'assistant'. The default value is 'user'.
Valid Values:

* system
* user
* assistant

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Outputs
* System.Management.Automation.PSCustomObject
A custom object representing the chat message with the 'role' and 'content' properties.

---

### Syntax
```PowerShell
New-OAIChatMessage [[-Content] <Object>] [[-Role] <Object>] [<CommonParameters>]
```

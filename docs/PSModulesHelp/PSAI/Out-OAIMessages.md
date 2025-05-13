Out-OAIMessages
---------------

### Synopsis
Outputs messages with roles and content.

---

### Description

The Out-OAIMessages function is used to output messages with roles and content. It accepts an array of messages and an optional switch parameter to exclude the header.

---

### Examples
> EXAMPLE 1

```PowerShell
$messages = @(
    [PSCustomObject]@{
        role = "Info"
        content = [PSCustomObject]@{
            text = [PSCustomObject]@{
                value = "This is an informational message."
            }
        }
    },
    [PSCustomObject]@{
        role = "Warning"
        content = [PSCustomObject]@{
            text = [PSCustomObject]@{
                value = "This is a warning message."
            }
        }
    }
)
Out-OAIMessages -Messages $messages

This example demonstrates how to use the Out-OAIMessages function to output messages.
```

---

### Parameters
#### **Messages**
Specifies the array of messages to be output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **NoHeader**
Specifies whether to exclude the header. By default, the header is included.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Out-OAIMessages [[-Messages] <Object>] [-NoHeader] [<CommonParameters>]
```

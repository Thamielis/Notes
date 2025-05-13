ConvertTo-ToolFormat
--------------------

### Synopsis
Converts an array of functions into a tool format.

---

### Description

The ConvertTo-ToolFormat function takes an array of functions and converts them into a tool format. Each function in the array is transformed into a hashtable with a 'type' key set to 'function' and a 'function' key set to the original function.

---

### Examples
> EXAMPLE 1

```PowerShell
$functions = @(
    @{
        Name = 'Get-User'
        Description = 'Retrieves user information'
        Parameters = @(
            @{
                Name = 'Username'
                Type = 'String'
                Description = 'The username of the user'
            }
        )
    }
)
ConvertTo-ToolFormat -functions $functions
```

---

### Parameters
#### **functions**
An array of hashtables representing functions.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Hashtable[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
ConvertTo-ToolFormat [[-functions] <Hashtable[]>] [<CommonParameters>]
```

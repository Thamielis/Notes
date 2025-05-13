ConvertTo-OAIMessage
--------------------

### Synopsis
Converts a message to an OpenAPI message format.

---

### Description

The ConvertTo-OAIMessage function takes a message as input and converts it to an OpenAPI message format. It uses the ConvertTo-Json cmdlet to convert the message to JSON format and then uses the ConvertFrom-Json cmdlet with the -AsHashtable parameter to convert the JSON back to a hashtable.

---

### Examples
> EXAMPLE 1

```PowerShell
$m=[pscustomobject](New-ChatRequestAssistantMessage test)
$m
$m | ConvertTo-OAIMessage
```

---

### Parameters
#### **Message**
The message to be converted.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

---

### Syntax
```PowerShell
ConvertTo-OAIMessage [[-Message] <Object>] [<CommonParameters>]
```

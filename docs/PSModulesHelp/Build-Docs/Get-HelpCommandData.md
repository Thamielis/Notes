Get-HelpCommandData
-------------------

### Synopsis
A short one-line action-based description, e.g. 'Tests if a function is valid'

---

### Description

A longer description of the function, its purpose, common use cases, etc.

---

### Related Links
* [Specify a URI to a help page, this will show when Get-Help -Online is used.](Specify a URI to a help page, this will show when Get-Help -Online is used.)

---

### Examples
> EXAMPLE 1

```PowerShell
Test-MyTestFunction -Verbose
Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
```

---

### Parameters
#### **Name**

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **HelpSource**

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |1       |true (ByValue)|

---

### Notes
Information or caveats about the function e.g. 'This function is not supported in Linux'

---

### Syntax
```PowerShell
Get-HelpCommandData [-Name] <String> [<CommonParameters>]
```
```PowerShell
Get-HelpCommandData [-HelpSource] <PSObject> [<CommonParameters>]
```

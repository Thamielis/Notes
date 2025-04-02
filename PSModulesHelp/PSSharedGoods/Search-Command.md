Search-Command
--------------

### Synopsis
Searches for a specific command by name.

---

### Description

This function checks if a command with the specified name exists in the current session.

---

### Examples
> EXAMPLE 1

```PowerShell
Search-Command -CommandName "Get-Process"
Returns $true if the command "Get-Process" exists, otherwise $false.
```
> EXAMPLE 2

```PowerShell
Search-Command -CommandName "UnknownCommand"
Returns $false as "UnknownCommand" does not exist as a command.
```

---

### Parameters
#### **CommandName**
Specifies the name of the command to search for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Search-Command [[-CommandName] <String>] [<CommonParameters>]
```

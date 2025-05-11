Search-StartMenu
----------------

### Synopsis
Search the Start Menu for items that match the provided text. This script
searches both the name (as displayed on the Start Menu itself,) and the
destination of the link.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Search-StartMenu "Character Map" | Invoke-Item
Searches for the "Character Map" appication, and then runs it
PS > Search-StartMenu PowerShell | Select-FilteredObject | Invoke-Item
Searches for anything with "PowerShell" in the application name, lets you
pick which one to launch, and then launches it.
```

---

### Parameters
#### **Pattern**
The pattern to match

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
Search-StartMenu [-Pattern] <Object> [<CommonParameters>]
```

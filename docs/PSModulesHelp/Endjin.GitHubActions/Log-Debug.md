Log-Debug
---------

### Synopsis
Prints a debug message to the log. 
You must create a secret named ACTIONS_STEP_DEBUG with the value true to see the debug messages set by this command in the log.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Log-Debug -Message "Writing the foo variable..."
```

---

### Parameters
#### **Message**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Log-Debug [-Message] <String> [<CommonParameters>]
```

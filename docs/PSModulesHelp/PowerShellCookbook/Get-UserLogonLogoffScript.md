Get-UserLogonLogoffScript
-------------------------

### Synopsis
Get the logon or logoff scripts assigned to a specific user

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-UserLogonLogoffScript LEE-DESK\LEE Logon
Gets all logon scripts for the user 'LEE-DESK\Lee'
```

---

### Parameters
#### **Username**
The username to examine

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **ScriptType**

Valid Values:

* Logon
* Logoff

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Get-UserLogonLogoffScript [-Username] <Object> [-ScriptType] <Object> [<CommonParameters>]
```

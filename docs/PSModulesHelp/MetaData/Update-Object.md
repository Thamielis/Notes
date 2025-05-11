Update-Object
-------------

### Synopsis
Recursively updates a hashtable or custom object with new values

---

### Description

Updates the InputObject with data from the update object, updating or adding values.

---

### Examples
> EXAMPLE 1

```PowerShell
Update-Object -Input @{
   One = "Un"
   Two = "Dos"
} -Update @{
   One = "Uno"
   Three = "Tres"
}
Updates the InputObject with the values in the UpdateObject,
will return the following object:

@{
   One = "Uno"
   Two = "Dos"
   Three = "Tres"
}
```

---

### Parameters
#### **UpdateObject**
The object (or hashtable) with properties (or keys) to overwrite the InputObject

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **InputObject**
This base object (or hashtable) will be updated and overwritten by the UpdateObject

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |named   |true (ByValue)|

#### **ImportantInputProperties**
A list of values which (if found on InputObject) should not be updated from UpdateObject

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Update-Object [-UpdateObject] <Object> -InputObject <Object> [-ImportantInputProperties <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

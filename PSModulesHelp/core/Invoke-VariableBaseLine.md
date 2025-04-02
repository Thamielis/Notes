Invoke-VariableBaseLine
-----------------------

### Synopsis
A function used to keep your environment clean.

---

### Description

This function, when used at the beginning of a script or major setup of functions, will snapshot
the variables within the local scope. when ran for the second time with the -Clean parameter, usually
at the end of a script, will remove all the variables created during the script run. This is helpful
when working in ISE and you need to run your script multiple times while building. You don't want 
prexisting data to end up in the second run. Also when you have an infinite loop script that you need
the environment clean after each call to something.

---

### Related Links
* [https://github.com/masters274/](https://github.com/masters274/)

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-VarBaseLine -Clean
This will clean up all the variables created between the start and finish callse of this function
```

---

### Parameters
#### **Clean**
The name says it all...

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
N/A.

---

### Outputs
* Void.

---

### Notes
This ain't rocket surgery :-\

---

### Syntax
```PowerShell
Invoke-VariableBaseLine [-Clean] [<CommonParameters>]
```

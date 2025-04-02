Test-ModuleLoaded
-----------------

### Synopsis
Checks that all required modules are loaded.

---

### Description

Receives an array of strings, which should be the module names. 
The function then checks that these are loaded. If the required
modules are not loaded, the function will try to load them by name
via the default module path. Function returns a failure if it's
unable to load any of the required modules.

---

### Related Links
* [https://github.com/masters274/](https://github.com/masters274/)

---

### Examples
> EXAMPLE 1

Test-ModuleLoaded -RequiredModules "ActiveDirectory"
Verifies that the ActiveDirectory module is loaded. If not, it will attempt to load it.
if this fails, a $false will be returned, otherwise, a $true will be returned.
$arrayModules = ('ActiveDirectory','MyCustomModule')
$result = Test-ModuleLoaded -RequiredModules $arrayModules

Checks if the two modules are loaded, or loadable, if so, $result will contain a value of
$true, otherwise it will contain the value of $false.

---

### Parameters
#### **RequiredModules**
Parameter should be a string or array of strings.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **Quiet**
Avoids output to the screen.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
Requires at the very least, a string name of a module.

---

### Outputs
* Returns success or failure code ($true | $false), depending on if required modules are loaded.

---

### Notes
None yet.

---

### Syntax
```PowerShell
Test-ModuleLoaded [-RequiredModules] <String[]> [-Quiet] [<CommonParameters>]
```

Invoke-CmdScript
----------------

### Synopsis
Invoke the specified batch file (and parameters), but also propigate any
environment variable changes back to the PowerShell environment that
called it.

---

### Description

---

### Examples
> EXAMPLE 1

type foo-that-sets-the-FOO-env-variable.cmd
@set FOO=%*
echo FOO set to %FOO%.
PS > $env:FOO
PS > Invoke-CmdScript "foo-that-sets-the-FOO-env-variable.cmd" Test

C:\Temp>echo FOO set to Test.
FOO set to Test.

PS > $env:FOO
Test

---

### Parameters
#### **Path**
The path to the script to run

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ArgumentList**
The arguments to the script

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Invoke-CmdScript [-Path] <String> [[-ArgumentList] <String>] [<CommonParameters>]
```

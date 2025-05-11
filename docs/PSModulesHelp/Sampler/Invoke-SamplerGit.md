Invoke-SamplerGit
-----------------

### Synopsis
Executes git with the provided arguments.

---

### Description

This command executes git with the provided arguments and throws an error
if the call failed.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-SamplerGit -Argument @('config', 'user.name', 'MyName')
Calls git to set user name in the git config.
```

---

### Parameters
#### **Argument**
Specifies the arguments to call git with. It is passes as an array of strings,
e.g. @('tag', 'v2.0.0').

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

---

### Notes
Git does not throw an error that can be caught by the pipeline. For example
this git command error but does not throw 'hello' as one would expect.
```
PS> try { git describe --contains } catch { throw 'hello' }
fatal: cannot describe '144e0422398e89cc8451ebba738c0a410b628302'
```
So we have to determine if git worked or not by checking the last exit code
and then throw an error to stop the pipeline.

---

### Syntax
```PowerShell
Invoke-SamplerGit [-Argument] <String[]> [<CommonParameters>]
```

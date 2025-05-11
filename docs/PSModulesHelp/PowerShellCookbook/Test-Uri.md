Test-Uri
--------

### Synopsis
Connects to a given URI and returns status about it: URI, response code,
and time taken.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Test-Uri bing.com
Uri               : bing.com
StatusCode        : 200
StatusDescription : OK
ResponseLength    : 34001
TimeTaken         : 459.0009
```

---

### Parameters
#### **Uri**
The URI to test

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Test-Uri [[-Uri] <Object>] [<CommonParameters>]
```

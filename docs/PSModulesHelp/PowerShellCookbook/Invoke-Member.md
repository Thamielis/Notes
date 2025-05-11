Invoke-Member
-------------

### Synopsis
Enables easy access to methods and properties of pipeline objects.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
"Hello","World" | .\Invoke-Member Length
5
5
```
> EXAMPLE 2

```PowerShell
"Hello","World" | .\Invoke-Member -m ToUpper
HELLO
WORLD
```
> EXAMPLE 3

```PowerShell
"Hello","World" | .\Invoke-Member Replace l w
Hewwo
Worwd
```

---

### Parameters
#### **Method**
A switch parameter to identify the requested member as a method.
Only required for methods that take no arguments.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Switch]`|false   |named   |false        |M<br/>Me|

#### **Member**
The name of the member to retrieve

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ArgumentList**
Arguments for the method, if any

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |2       |false        |

#### **InputObject**
The object from which to retrieve the member

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |named   |true (ByValue)|

---

### Syntax
```PowerShell
Invoke-Member [[-Member] <String>] [-InputObject <Object>] [<CommonParameters>]
```
```PowerShell
Invoke-Member [-Method] [[-Member] <String>] [[-ArgumentList] <Object[]>] [-InputObject <Object>] [<CommonParameters>]
```

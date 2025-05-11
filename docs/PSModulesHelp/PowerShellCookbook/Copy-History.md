Copy-History
------------

### Synopsis
Copy selected commands from the history buffer into the clipboard as a script.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Copy-History
Copies the entire contents of the history buffer into the clipboard.
```
> EXAMPLE 2

```PowerShell
Copy-History -5
Copies the last five commands into the clipboard.
```
> EXAMPLE 3

```PowerShell
Copy-History 2,5,8,4
Copies commands 2,5,8, and 4.
```
> EXAMPLE 4

Copy-History (1..10+5+6)
Copies commands 1 through 10, then 5, then 6, using PowerShell's array
slicing syntax.

---

### Parameters
#### **Range**
The range of history IDs to copy

|Type       |Required|Position|PipelineInput|Aliases|
|-----------|--------|--------|-------------|-------|
|`[Int32[]]`|false   |1       |false        |Id     |

---

### Syntax
```PowerShell
Copy-History [[-Range] <Int32[]>] [<CommonParameters>]
```

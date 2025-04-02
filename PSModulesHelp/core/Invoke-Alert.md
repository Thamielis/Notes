Invoke-Alert
------------

### Synopsis
Audible tone that can be easily called when some event is triggered.

---

### Description

Great for monitoring things in the background, when you need to be working on something else.

---

### Examples
> EXAMPLE 1

```PowerShell
The following will beep 3 times when the listed IP is reachable
While (!(Test-Connection 8.8.8.8 -Q -C 1)) { sleep -s 1 }; Alert
```
> EXAMPLE 2

```PowerShell
The following will beep once the IP is reachable, until you close the window, or Ctrl+C
While (!(Test-Connection 8.8.8.8 -Q -C 1)) { sleep -s 1 }; Alert -c 0
```

---

### Parameters
#### **Duration**
This is the count or duration in seconds that the tone will be generated. A value of zero will
beep until interrupted. Negative integers will beep only once.

|Type     |Required|Position|PipelineInput|Aliases                     |
|---------|--------|--------|-------------|----------------------------|
|`[Int32]`|false   |1       |false        |Count<br/>c<br/>Number<br/>n|

---

### Syntax
```PowerShell
Invoke-Alert [[-Duration] <Int32>] [<CommonParameters>]
```

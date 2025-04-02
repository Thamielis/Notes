Show-PSOneApplicationWindow
---------------------------

### Synopsis
Brings main application window to the front (top most position on screen)

---

### Description

Uses a number of strategies to force an application window to the top.

---

### Related Links
* [https://powershell.one/powershell-internals/extending-powershell/vbscript-and-csharp](https://powershell.one/powershell-internals/extending-powershell/vbscript-and-csharp)

---

### Examples
> EXAMPLE 1

```PowerShell
Show-PSOneApplicationWindow -Id $pid -Maximize 
Brings current PowerShell window to the top and maximizes the window
```
> EXAMPLE 2

Get-Process -Name Notepad | Show-PSOneApplicationWindow -Maximize
Brings notepad editor window to the top and maximizes it. 
If there is no notepad application running, an exception is thrown.
If there is more than one instance of notepad running, only the last instance is affected

---

### Parameters
#### **Id**
Process Id of process. 
Process must have a main window and must not be hidden.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Int32]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Process**
Process. Process must have a main window and must not be hidden.

|Type       |Required|Position|PipelineInput |
|-----------|--------|--------|--------------|
|`[Process]`|true    |1       |true (ByValue)|

#### **Maximize**
maximizes the window after it has been brought to the top

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Show-PSOneApplicationWindow [-Id] <Int32> [-Maximize] [<CommonParameters>]
```
```PowerShell
Show-PSOneApplicationWindow [-Process] <Process> [-Maximize] [<CommonParameters>]
```

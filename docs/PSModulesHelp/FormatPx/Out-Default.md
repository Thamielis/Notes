Out-Default
-----------

### Synopsis
Sends the output to the default formatter and to the default output cmdlet.

---

### Description

The Out-Default cmdlet sends output to the default formatter and the default output cmdlet. This cmdlet has no effect on the formatting or output of Windows PowerShell commands. It is a placeholder that lets you write your own Out-Default function or cmdlet.

---

### Related Links
* [Out-File](Out-File)

* [Out-Host](Out-Host)

* [Out-Null](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Out-Null)

* [Out-Printer](Out-Printer)

* [Out-String](Out-String)

---

### Parameters
#### **InputObject**
Accepts input into the cmdlet.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

---

### Inputs
object

You can pipe any object into Out-Default.

---

### Outputs
* None

---

### Notes
You should never manually call Out-Default. Out-Default is implicitly invoked automatically at the end of every command.

---

### Syntax
```PowerShell
Out-Default [-InputObject <PSObject>] [<CommonParameters>]
```

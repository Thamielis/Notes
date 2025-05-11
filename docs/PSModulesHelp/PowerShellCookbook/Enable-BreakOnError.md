Enable-BreakOnError
-------------------

### Synopsis
Creates a breakpoint that only fires when PowerShell encounters an error

---

### Description

---

### Examples
> EXAMPLE 1

Enable-BreakOnError
ID Script           Line Command         Variable        Action
-- ------           ---- -------         --------        ------
 0                       Out-Default                     ...

PS > 1/0
Entering debug mode. Use h or ? for help.

Hit Command breakpoint on 'Out-Default'

PS > $error
Attempted to divide by zero.

---

### Syntax
```PowerShell
Enable-BreakOnError [<CommonParameters>]
```

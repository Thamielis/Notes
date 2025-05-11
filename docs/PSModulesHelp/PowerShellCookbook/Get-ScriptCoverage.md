Get-ScriptCoverage
------------------

### Synopsis
Uses conditional breakpoints to obtain information about what regions of
a script are executed when run.

---

### Description

---

### Examples
> EXAMPLE 1
```powershell
Get-Content c:\temp\looper.ps1
param($userInput)

for($count = 0; $count -lt 10; $count++)
{
    "Count is: $count"
}

if($userInput -eq "One")
{
    "Got 'One'"
}

if($userInput -eq "Two")
{
    "Got 'Two'"
}

PS > $action = { c:\temp\looper.ps1 -UserInput 'One' }
PS > $coverage = Get-ScriptCoverage c:\temp\looper.ps1 -Action $action
PS > $coverage | Select Content,StartLine,StartColumn | Format-Table -Auto

Content   StartLine StartColumn
-------   --------- -----------
userInput         1           7
Got 'Two'        15           5
```

This example exercises a 'looper.ps1' script, and supplies it with some
user input. The output demonstrates that we didn't exercise the
"Got 'Two'" statement.

---

### Parameters
#### **Path**
The path of the script to monitor

| Type       | Required | Position | PipelineInput |
|------------|----------|----------|---------------|
| `[Object]` | false    | 1        | false         |

#### **Action**
The command to exercise the script

| Type            | Required | Position | PipelineInput |
|-----------------|----------|----------|---------------|
| `[ScriptBlock]` | false    | 2        | false         |

---

### Syntax
```PowerShell
Get-ScriptCoverage [[-Path] <Object>] [[-Action] <ScriptBlock>] [<CommonParameters>]
```

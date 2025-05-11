Invoke-Formatter
----------------

### Synopsis
Formats a script text based on the input settings or default settings.

---

### Description

The `Invoke-Formatter` cmdlet takes a string input and formats it according to defined settings. If no Settings parameter is provided, the cmdlet assumes the default code formatting settings as defined in `Settings/CodeFormatting.psd1`.

---

### Related Links
* [Online Version:](https://learn.microsoft.com/powershell/module/psscriptanalyzer/invoke-formatter?view=ps-modules&wt.mc_id=ps-gethelp)

---

### Examples
> EXAMPLE 1 - Format the input script text using the default settings

```PowerShell
$scriptDefinition = @'
function foo {
"hello"
  }
'@

Invoke-Formatter -ScriptDefinition $scriptDefinition

function foo {
    "hello"
}
```
> EXAMPLE 2 - Format the input script using the settings defined in a hashtable

```PowerShell
$scriptDefinition = @'
function foo {
"hello"
}
'@

$settings = @{
    IncludeRules = @("PSPlaceOpenBrace", "PSUseConsistentIndentation")
    Rules = @{
        PSPlaceOpenBrace = @{
            Enable = $true
            OnSameLine = $false
        }
        PSUseConsistentIndentation = @{
            Enable = $true
        }
    }
}

Invoke-Formatter -ScriptDefinition $scriptDefinition -Settings $settings

function foo
{
    "hello"
}
```
> EXAMPLE 3 - Format the input script text using the settings defined a `.psd1` file

```PowerShell
Invoke-Formatter -ScriptDefinition $scriptDefinition -Settings /path/to/settings.psd1
```

---

### Parameters
#### **Range**
The range within which formatting should take place. The value of this parameter must be an array of four integers. These numbers must be greater than 0. The four integers represent the following four values in this order:
* starting line number
* starting column number
* ending line number
* ending column number

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |3       |True         |

#### **ScriptDefinition**
The text of the script to be formatted represented as a string. This is not a ScriptBlock object.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |True (ByPropertyName, ByValue)|

#### **Settings**
A settings hashtable or a path to a PowerShell data file (`.psd1`) that contains the settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |True         |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
Invoke-Formatter [-ScriptDefinition] <String> [[-Settings] <Object>] [[-Range] <Int32[]>] [<CommonParameters>]
```

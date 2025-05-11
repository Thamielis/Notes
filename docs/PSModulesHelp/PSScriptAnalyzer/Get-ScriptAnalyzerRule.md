Get-ScriptAnalyzerRule
----------------------

### Synopsis
Gets the script analyzer rules on the local computer.

---

### Description

Gets the script analyzer rules on the local computer. You can select rules by Name, Severity, Source, or SourceType, or even particular words in the rule description.

Use this cmdlet to create collections of rules to include and exclude when running the `Invoke-ScriptAnalyzer` cmdlet.

To get information about the rules, see the value of the Description property of each rule.

The PSScriptAnalyzer module tests the PowerShell code in a script, module, or DSC resource to determine if it fulfils best practice standards.

---

### Related Links
* [Online Version:](https://learn.microsoft.com/powershell/module/psscriptanalyzer/get-scriptanalyzerrule?view=ps-modules&wt.mc_id=ps-gethelp)

* [Invoke-ScriptAnalyzer](Invoke-ScriptAnalyzer)

* [PSScriptAnalyzer on GitHub](https://github.com/PowerShell/PSScriptAnalyzer)

---

### Examples
> EXAMPLE 1 - Get all Script Analyzer rules on the local computer

```PowerShell
Get-ScriptAnalyzerRule
```
> EXAMPLE 2 - Gets only rules with the Error severity

```PowerShell
Get-ScriptAnalyzerRule -Severity Error
```
> EXAMPLE 3 - Run only the DSC rules with the Error severity

$DSCError = Get-ScriptAnalyzerRule -Severity Error | Where-Object SourceName -eq PSDSC
$Path = "$home\Documents\WindowsPowerShell\Modules\MyDSCModule\*"
Invoke-ScriptAnalyzerRule -Path $Path -IncludeRule $DSCError -Recurse
Using the IncludeRule parameter of `Invoke-ScriptAnalyzerRule` is more efficient than using its Severity parameter, which is applied only after using all rules to analyze all module files.
> EXAMPLE 4 - Get rules by name and severity

```PowerShell
$TestParameters = Get-ScriptAnalyzerRule -Severity Error, Warning -Name *Parameter*, *Alias*
```
> EXAMPLE 5 - Get custom rules

```PowerShell
Get-ScriptAnalyzerRule -CustomRulePath $home\Documents\WindowsPowerShell\Modules\*StrictRules -RecurseCustomRulePath
```

---

### Parameters
#### **CustomRulePath**
By default, PSScriptAnalyzer gets only the standard rules specified in the `Microsoft.Windows.PowerShell.ScriptAnalyzer.BuiltinRules.dll` file in the module. Use this parameter to get the custom Script Analyzer rules in the specified path and the standard Script Analyzer rules.
Enter the path to a .NET assembly or module that contains Script Analyzer rules. You can enter only one value, but wildcards are supported. To get rules in subdirectories of the path, use the RecurseCustomRulePath parameter.
You can create custom rules using a .NET assembly or a PowerShell module, such as the Community Analyzer Rules (https://github.com/PowerShell/PSScriptAnalyzer/blob/development/Tests/Engine/CommunityAnalyzerRules/CommunityAnalyzerRules.psm1)in the GitHub repository.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |False        |CustomizedRulePath|

#### **Name**
Gets only rules with the specified names or name patterns. Wildcards are supported. If you list multiple names or patterns, it gets all rules that match any of the name patterns.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **RecurseCustomRulePath**
Searches the CustomRulePath location recursively to add rules defined in files in subdirectories of the path. By default, `Get-ScriptAnalyzerRule` adds only the custom rules in the specified path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Severity**
Gets only rules with the specified severity values. Valid values are:
* Information
* Warning
* Error
Valid Values:

* Warning
* Error
* Information

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
None

You can't pipe input to this cmdlet.

---

### Outputs
* Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.RuleInfo

---

### Notes

---

### Syntax
```PowerShell
Get-ScriptAnalyzerRule [-CustomRulePath <String[]>] [-Name <String[]>] [-RecurseCustomRulePath] [-Severity <String[]>] [<CommonParameters>]
```

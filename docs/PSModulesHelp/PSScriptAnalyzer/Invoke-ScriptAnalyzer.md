Invoke-ScriptAnalyzer
---------------------

### Synopsis
Evaluates a script or module based on selected best practice rules

---

### Description

`Invoke-ScriptAnalyzer` evaluates scripts or module files (`.ps1`, `.psm1`, and `.psd1` files) based on a collection of best practice rules and returns objects that represent rule violations. It also includes special rules to analyze DSC resources.

`Invoke-ScriptAnalyzer` comes with a set of built-in rules. By default, it uses all rules. You can use the IncludeRule and ExcludeRule parameters to select the rules you want. You can use the `Get-ScriptAnalyzerRule` cmdlet to examine and select the rules you want to include or exclude from the evaluation.

You can also use customized rules that you write in PowerShell scripts, or compile in assemblies using C#. Custom rules can also be selected using the IncludeRule and ExcludeRule parameters.

You can also include a rule in the analysis, but suppress the output of that rule for selected functions or scripts. This feature should be used only when necessary. To get rules that were suppressed, run `Invoke-ScriptAnalyzer` with the SuppressedOnly parameter.

For usage in CI systems, the EnableExit exits the shell with an exit code equal to the number of error records.

---

### Related Links
* [Online Version:](https://learn.microsoft.com/powershell/module/psscriptanalyzer/invoke-scriptanalyzer?view=ps-modules&wt.mc_id=ps-gethelp)

* [Get-ScriptAnalyzerRule](Get-ScriptAnalyzerRule)

* [PSScriptAnalyzer on GitHub](https://github.com/PowerShell/PSScriptAnalyzer)

---

### Examples
> EXAMPLE 1 - Run all Script Analyzer rules on a script

```PowerShell
Invoke-ScriptAnalyzer -Path C:\Scripts\Get-LogData.ps1
```
> EXAMPLE 2 - Run all Script Analyzer rules on all files in the Modules directory

```PowerShell
Invoke-ScriptAnalyzer -Path $home\Documents\WindowsPowerShell\Modules -Recurse
```
> EXAMPLE 3 - Run a single rule on a module

```PowerShell
Invoke-ScriptAnalyzer -Path C:\Windows\System32\WindowsPowerShell\v1.0\Modules\PSDiagnostics -IncludeRule PSAvoidUsingPositionalParameters
```
> EXAMPLE 4 - Run all rules except two on your modules

```PowerShell
Invoke-ScriptAnalyzer -Path C:\ps-test\MyModule -Recurse -ExcludeRule PSAvoidUsingCmdletAliases, PSAvoidUsingInternalURLs
```
> EXAMPLE 5 - Run Script Analyzer with custom rules

```PowerShell
Invoke-ScriptAnalyzer -Path D:\test_scripts\Test-Script.ps1 -CustomRulePath C:\CommunityAnalyzerRules -IncludeDefaultRules
```
> EXAMPLE 6 - Run only the rules that are Error severity and have the PSDSC source name

```PowerShell
$DSCError = Get-ScriptAnalyzerRule -Severity Error | Where SourceName -eq PSDSC
$Path = "$home\Documents\WindowsPowerShell\Modules\MyDSCModule"
Invoke-ScriptAnalyzerRule -Path $Path -IncludeRule $DSCError -Recurse
```
> EXAMPLE 7 - Suppressing rule violations

function Get-Widgets
{
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingCmdletAliases", "", Justification="Resolution in progress.")]
    Param()

    dir $pshome
    ...
}

Invoke-ScriptAnalyzer -Path .\Get-Widgets.ps1

RuleName                            Severity     FileName   Line  Message
--------                            --------     --------   ----  -------
PSProvideCommentHelp                Information  ManageProf 14    The cmdlet 'Get-Widget' does not have a help comment.
                                                 iles.psm1

Invoke-ScriptAnalyzer -Path .\Get-Widgets.ps1 -SuppressedOnly

Rule Name                           Severity     File Name  Line  Justification
---------                           --------     ---------  ----  -------------
PSAvoidUsingCmdletAliases           Warning      ManageProf 21    Resolution in progress.
                                                 iles.psm1
PSUseSingularNouns                  Warning      ManageProf 14
                                                 iles.psm1
The second command uses the SuppressedOnly parameter to report violations of the rules that are suppressed script file.
In .\ScriptAnalyzerProfile.txt

@{
    Severity = @('Error', 'Warning')
    IncludeRules = 'PSAvoid*'
    ExcludeRules = '*WriteHost'
}

Invoke-ScriptAnalyzer -Path $pshome\Modules\BitLocker -Profile .\ScriptAnalyzerProfile.txt
If you include a conflicting parameter in the `Invoke-ScriptAnalyzer` command, such as `-Severity Error`, the cmdlet uses the profile value and ignores the parameter.
> EXAMPLE 9 - Analyze a script stored as a string

Invoke-ScriptAnalyzer -ScriptDefinition "function Get-Widgets {Write-Host 'Hello'}"

RuleName                            Severity     FileName   Line  Message
--------                            --------     --------   ----  -------
PSAvoidUsingWriteHost               Warning                 1     Script
                                                                  because
                                                                  there i
                                                                  suppres
                                                                  Write-O
PSUseSingularNouns                  Warning                 1     The cmd
                                                                  noun sh
When you use the ScriptDefinition parameter, the FileName property of the DiagnosticRecord object is `$null`.

---

### Parameters
#### **CustomRulePath**
Enter the path to a file that defines rules or a directory that contains files that define rules. Wildcard characters are supported. When CustomRulePath is specified, only the custom rules found in the specified paths are used for the analysis. If `Invoke-ScriptAnalyzer` cannot find rules in the , it runs the standard rules without notice.
To add rules defined in subdirectories of the path, use the RecurseCustomRulePath parameter. To include the built-in rules, add the IncludeDefaultRules parameter.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |False        |CustomizedRulePath|

#### **EnableExit**
On completion of the analysis, this parameter exits the PowerShell sessions and returns an exit code equal to the number of error records. This can be useful in continuous integration (CI) pipeline.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludeRule**
Omits the specified rules from the Script Analyzer test. Wildcard characters are supported.
Enter a comma-separated list of rule names, a variable that contains rule names, or a command that gets rule names. You can also specify a list of excluded rules in a Script Analyzer profile file. You can exclude standard rules and rules in a custom rule path.
When you exclude a rule, the rule does not run on any of the files in the path. To exclude a rule on a particular line, parameter, function, script, or class, adjust the Path parameter or suppress the rule. For information about suppressing a rule, see the examples.
If a rule is specified in both the ExcludeRule and IncludeRule collections, the rule is excluded.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Fix**
Fixes certain warnings that contain a fix in their DiagnosticRecord .
When you used Fix , `Invoke-ScriptAnalyzer` applies the fixes before running the analysis. Make sure that you have a backup of your files when using this parameter. It tries to preserve the file encoding but there are still some cases where the encoding can change.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IncludeDefaultRules**
Invoke default rules along with Custom rules.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IncludeRule**
Runs only the specified rules in the Script Analyzer test. By default, PSScriptAnalyzer runs all rules.
Enter a comma-separated list of rule names, a variable that contains rule names, or a command that gets rule names. Wildcard characters are supported. You can also specify rule names in a Script Analyzer profile file.
When you use the CustomizedRulePath parameter, you can use this parameter to include standard rules and rules in the custom rule paths.
If a rule is specified in both the ExcludeRule and IncludeRule collections, the rule is excluded.
The Severity parameter takes precedence over IncludeRule . For example, if Severity is `Error`, you cannot use IncludeRule to include a `Warning` rule.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **IncludeSuppressed**
Include suppressed diagnostics in output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Path**
Specifies the path to the scripts or module to be analyzed. Wildcard characters are supported.
Enter the path to a script (`.ps1`) or module file (`.psm1`) or to a directory that contains scripts or modules. If the directory contains other types of files, they are ignored.
To analyze files that are not in the root directory of the specified path, use a wildcard character (`C:\Modules\MyModule\ `) or the Recurse * parameter.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |0       |True (ByPropertyName, ByValue)|PSPath |

#### **Recurse**
Runs Script Analyzer on the files in the Path directory and all subdirectories recursively.
Recurse applies only to the Path parameter value. To search the CustomRulePath recursively, use the RecurseCustomRulePath parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RecurseCustomRulePath**
Adds rules defined in subdirectories of the CustomRulePath location. By default, `Invoke-ScriptAnalyzer` uses only the custom rules defined in the specified file or directory. To include the built-in rules, use the IncludeDefaultRules parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ReportSummary**
Write a summary of the violations found to the host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SaveDscDependency**
Resolve DSC resource dependencies.
When `Invoke-ScriptAnalyzer` is run with this parameter, it looks for instances of `Import-DSCResource -ModuleName <somemodule>`. If `<somemodule>` is cannot be found by searching the `$env:PSModulePath`, `Invoke-ScriptAnalyzer` returns parse error. This error is caused by the PowerShell parser not being able to find the symbol for `<somemodule>`.
If `Invoke-ScriptAnalyzer` finds the module in the PowerShell Gallery, it downloads the missing module to a temp path. The temp path is then added to `$env:PSModulePath` for duration of the scan. The temp location can be found in `$LOCALAPPDATA/PSScriptAnalyzer/TempModuleDir`.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ScriptDefinition**
Runs the analysis on commands, functions, or expressions in a string. You can use this feature to analyze statements, expressions, and functions, independent of their script context.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Settings**
A path to a file containing a user-defined profile or a hashtable object containing settings for ScriptAnalyzer.
Runs `Invoke-ScriptAnalyzer` with the parameters and values specified in the file or hashtable.
If the path or the content of the file or hashtable is invalid, it is ignored. The parameters and values in the profile take precedence over the same parameter and values specified at the command line.
A Script Analyzer profile file is a text file that contains a hashtable with one or more of the following keys:
* CustomRulePath
* ExcludeRules
* IncludeDefaultRules
* IncludeRules
* RecurseCustomRulePath
* Rules
* Severity
The keys and values in the profile are interpreted as if they were standard parameters and values of `Invoke-ScriptAnalyzer`, similar to splatting. For more information, see about_Splatting (https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_splatting).

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |named   |False        |Profile|

#### **Severity**
After running Script Analyzer with all rules, this parameter selects rule violations with the specified severity.
Valid values are:
* Error
* Warning
* Information.
You can specify one ore more severity values.
The parameter filters the rules violations only after running all rules. To filter rules efficiently, use `Get-ScriptAnalyzerRule` to select the rules you want to run.
The Severity parameter takes precedence over IncludeRule . For example, if Severity is `Error`, you cannot use IncludeRule to include a `Warning` rule.
Valid Values:

* Warning
* Error
* Information
* ParseError

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **SuppressedOnly**
Returns violations only for rules that are suppressed.
Returns a SuppressedRecord object ( Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.SuppressedRecord ).
To suppress a rule, use the SuppressMessageAttribute . For help, see the examples.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

You cannot pipe input to this cmdlet.

---

### Outputs
* Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord

* Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.SuppressedRecord

---

### Notes

---

### Syntax
```PowerShell
Invoke-ScriptAnalyzer [-Path] <String> [-CustomRulePath <String[]>] [-EnableExit] [-ExcludeRule <String[]>] [-Fix] [-IncludeDefaultRules] [-IncludeRule <String[]>] [-Recurse] [-RecurseCustomRulePath] [-ReportSummary] [-SaveDscDependency] [-Settings <Object>] [-Severity <String[]>] [-SuppressedOnly] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Invoke-ScriptAnalyzer [-Path] <String> [-CustomRulePath <String[]>] [-EnableExit] [-ExcludeRule <String[]>] [-Fix] [-IncludeDefaultRules] [-IncludeRule <String[]>] -IncludeSuppressed [-Recurse] [-RecurseCustomRulePath] [-ReportSummary] [-SaveDscDependency] [-Settings <Object>] [-Severity <String[]>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Invoke-ScriptAnalyzer [-ScriptDefinition] <String> [-CustomRulePath <String[]>] [-EnableExit] [-ExcludeRule <String[]>] [-IncludeDefaultRules] [-IncludeRule <String[]>] -IncludeSuppressed [-Recurse] [-RecurseCustomRulePath] [-ReportSummary] [-SaveDscDependency] [-Settings <Object>] [-Severity <String[]>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Invoke-ScriptAnalyzer [-ScriptDefinition] <String> [-CustomRulePath <String[]>] [-EnableExit] [-ExcludeRule <String[]>] [-IncludeDefaultRules] [-IncludeRule <String[]>] [-Recurse] [-RecurseCustomRulePath] [-ReportSummary] [-SaveDscDependency] [-Settings <Object>] [-Severity <String[]>] [-SuppressedOnly] [-Confirm] [-WhatIf] [<CommonParameters>]
```

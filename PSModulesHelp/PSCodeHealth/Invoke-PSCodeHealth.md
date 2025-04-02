Invoke-PSCodeHealth
-------------------

### Synopsis
Gets quality and maintainability metrics for PowerShell code contained in scripts, modules or directories.

---

### Description

Gets quality and maintainability metrics for PowerShell code contained in scripts, modules or directories.
These metrics relate to :  
  - Length of functions  
  - Complexity of functions  
  - Code smells, styling issues and violations of best practices (using PSScriptAnalyzer)  
  - Tests and test coverage (using Pester to run tests)  
  - Comment-based help in functions

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-PSCodeHealth -Path 'C:\GitRepos\MyModule' -Recurse -TestsPath 'C:\GitRepos\MyModule\Tests\Unit'
Gets quality and maintainability metrics for code from PowerShell files in the directory C:\GitRepos\MyModule\ and any subdirectories.  
This command will look for tests located in the directory C:\GitRepos\MyModule\Tests\Unit, and any subdirectories.
```
> EXAMPLE 2

```PowerShell
Invoke-PSCodeHealth -Path 'C:\GitRepos\MyModule' -TestsPath 'C:\GitRepos\MyModule\Tests' -Recurse -Exclude "*example*"
Gets quality and maintainability metrics for code from PowerShell files in the directory C:\GitRepos\MyModule\ and any subdirectories, except for files containing "example" in their name.  
This command will look for tests located in the directory C:\GitRepos\MyModule\Tests\, and any subdirectories.
```
> EXAMPLE 3

```PowerShell
Invoke-PSCodeHealth -Path 'C:\GitRepos\MyModule' -TestsPath 'C:\GitRepos\MyModule\Tests' -HtmlReportPath .\Report.html -PassThru
Gets quality and maintainability metrics for code from PowerShell files in the directory C:\GitRepos\MyModule\.  
This command will create an HTML report (Report.html) in the current directory and a PSCodeHealth.Overall.HealthReport object to the pipeline.  
The styling of HTML elements will reflect their compliance, based on the default compliance rules.
```
> EXAMPLE 4

```PowerShell
Invoke-PSCodeHealth -Path 'C:\GitRepos\MyModule' -TestsPath 'C:\GitRepos\MyModule\Tests' -HtmlReportPath .\Report.html -CustomSettingsPath .\MySettings.json
Gets quality and maintainability metrics for code from PowerShell files in the directory C:\GitRepos\MyModule\.  
This command will create an HTML report (Report.html) in the current directory and a PSCodeHealth.Overall.HealthReport object to the pipeline.  
The styling of HTML elements will reflect their compliance, based on the default compliance rules and any custom rules in the file .\MySettings.json.
```

---

### Parameters
#### **Path**
To specify the path of the directory to search for PowerShell files to analyze.  
If the Path is not specified and the current location is in a FileSystem PowerShell drive, this will default to the current directory.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |1       |true (ByValue)|

#### **TestsPath**
To specify the file or directory where tests are located.  
If not specified, the command will look for tests in the same directory as each function.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **TestsResult**
To use an existing Pester tests result object for generating the following metrics :  
  - NumberOfTests  
  - NumberOfFailedTests  
  - NumberOfPassedTests  
  - TestsPassRate (%)  
  - TestCoverage (%)  
  - CommandsMissedTotal

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |3       |false        |

#### **Recurse**
To search PowerShell files in the Path directory and all subdirectories recursively.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Exclude**
To specify file(s) to exclude from both the code analysis point of view and the test coverage point of view.  
The value of this parameter qualifies the Path parameter.  
Enter a path element or pattern, such as *example*. Wildcards are permitted.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **HtmlReportPath**
To instruct Invoke-PSCodeHealth to generate an HTML report, and specify the path where the HTML file should be saved.  
The path must include the folder path (which has to exist) and the file name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **CustomSettingsPath**
To specify the path of a file containing user-defined compliance rules (metrics thresholds, etc...) in JSON format.  
Any compliance rule specified in this file override the default, and rules not specified in this file will use the default from PSCodeHealthSettings.json.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PassThru**
When the parameter HtmlReportPath is used, by default, Invoke-PSCodeHealth doesn't output a [PSCodeHealth.Overall.HealthReport] object to the pipeline.  
The PassThru parameter allows to instruct Invoke-PSCodeHealth to output both an HTML report file and a [PSCodeHealth.Overall.HealthReport] object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* PSCodeHealth.Overall.HealthReport

---

### Syntax
```PowerShell
Invoke-PSCodeHealth [[-Path] <String>] [[-TestsPath] <String>] [[-TestsResult] <PSObject>] [-Recurse] [-Exclude <String[]>] [<CommonParameters>]
```
```PowerShell
Invoke-PSCodeHealth [[-Path] <String>] [[-TestsPath] <String>] [[-TestsResult] <PSObject>] [-Recurse] [-Exclude <String[]>] -HtmlReportPath <String> [-CustomSettingsPath <String>] [-PassThru] [<CommonParameters>]
```

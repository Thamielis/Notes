Get-ParameterValue
------------------

### Synopsis
Get parameter values from PSBoundParameters + DefaultValues and optionally, a configuration file

---

### Description

This function gives command authors an easy way to combine default parameter values and actual arguments.
It also supports user-specified default parameter values loaded from a configuration file.

It returns a hashtable (like PSBoundParameters) which combines these parameter defaults with parameter values passed by the caller.

---

### Parameters
#### **FromFile**
The base name of a configuration file to read defaults from
If specified, the command will read a ".psd1" file with this name
Suggested Value: $MyInvocation.MyCommand.Noun

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **CommandKey**
If your configuration file has defaults for multiple commands, pass
the top-level key which contains defaults for this invocation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **AllowedVariables**
Allows extending the valid variables which are allowed to be referenced in configuration
BEWARE: This exposes the value of these variables in the calling context to the configuration file
You are reponsible to only allow variables which you know are safe to share

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

---

### Syntax
```PowerShell
Get-ParameterValue [[-FromFile] <String>] [[-CommandKey] <String>] [[-AllowedVariables] <String[]>] [<CommonParameters>]
```

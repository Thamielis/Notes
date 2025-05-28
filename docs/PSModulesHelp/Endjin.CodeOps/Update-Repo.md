Update-Repo
-----------

### Synopsis

Update-Repo [-OrgName] <string> [-RepoName] <string> [-BranchName] <string> [-RepoChanges] <scriptblock> [-CommitMessage] <string> [-PrTitle] <string> [[-RepoChangesArguments] <array>] [[-PrBody] <string>] [[-PrLabels] <string[]>] [-PassThruPullRequestUri] [-UseGitSSH] [-WhatIf] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BranchName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |2       |false        |

#### **CommitMessage**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |4       |false        |

#### **OrgName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |0       |false        |

#### **PassThruPullRequestUri**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **PrBody**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |7       |false        |

#### **PrLabels**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |8       |false        |

#### **PrTitle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |5       |false        |

#### **RepoChanges**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|true    |3       |false        |

#### **RepoChangesArguments**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[array]`|false   |6       |false        |

#### **RepoName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

#### **UseGitSSH**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Update-Repo; CommonParameters=True; parameter=System.Object[]}}
```

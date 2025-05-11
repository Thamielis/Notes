Remove-GitHubGistFile
---------------------

### Synopsis
Removes one or more files from an existing gist on GitHub.

---

### Description

Removes one or more files from an existing gist on GitHub.

This is a helper function built on top of Set-GitHubGist.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubGistFile -Gist 1234567 -FileName ('foo.txt')
Removes the file 'foo.txt' from the specified gist.
```
> EXAMPLE 2

```PowerShell
Remove-GitHubGistFile -Gist 1234567 -FileName ('foo.txt') -Force
Removes the file 'foo.txt' from the specified gist without prompting for confirmation.
```
> EXAMPLE 3

```PowerShell
@('foo.txt', 'bar.txt') | Remove-GitHubGistFile -Gist 1234567
Removes the files 'foo.txt' and 'bar.txt' from the specified gist.
```

---

### Parameters
#### **Gist**
The ID for the gist to update.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **FileName**
An array of filenames (no paths, just names) to remove from the gist.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |3       |true (ByValue)|

#### **Force**
If this switch is specified, you will not be prompted for confirmation of command execution.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Returns the updated gist.  By default, this cmdlet does not generate any output.
You can use "Set-GitHubConfiguration -DefaultPassThru" to control the default behavior
of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Inputs
GitHub.Gist
GitHub.GistComment
GitHub.GistCommit
GitHub.GistFork
GitHub.GistSummary

---

### Outputs
* GitHub.Gist

---

### Syntax
```PowerShell
Remove-GitHubGistFile [-Gist] <String> [-FileName] <String[]> [-Force] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

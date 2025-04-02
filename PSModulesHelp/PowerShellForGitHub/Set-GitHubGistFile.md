Set-GitHubGistFile
------------------

### Synopsis
Updates content of file(s) in an existing gist on GitHub,
or adds them if they aren't already part of the gist.

---

### Description

Updates content of file(s) in an existing gist on GitHub,
or adds them if they aren't already part of the gist.

This is a helper function built on top of Set-GitHubGist.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubGistFile -Gist 1234567 -Content 'Body of my file.' -FileName 'sample.txt'
Adds a file named 'sample.txt' that has the body of "Body of my file." to the existing
specified gist, or updates the contents of 'sample.txt' in the gist if is already there.
```
> EXAMPLE 2

```PowerShell
Set-GitHubGistFile -Gist 1234567 -File 'c:\files\foo.txt'
Adds the file 'foo.txt' to the existing specified gist, or updates its content if it
is already there.
```
> EXAMPLE 3

```PowerShell
Set-GitHubGistFile -Gist 1234567 -File ('c:\files\foo.txt', 'c:\other\bar.txt', 'c:\octocat.ps1')
Adds all three files to the existing specified gist, or updates the contents of the files
in the gist if they are already there.
```

---

### Parameters
#### **Gist**
The ID for the gist to update.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **File**
An array of filepaths that should be part of this gist.
Use this when you have multiple files that should be part of a gist, or when you simply
want to reference an existing file on disk.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |3       |true (ByValue)|

#### **FileName**
The name of the file that Content should be stored in within the newly created gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Content**
The content of a single file that should be part of the gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

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
Set-GitHubGistFile [-Gist] <String> [-FileName] <String> [-Content] <String> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubGistFile [-Gist] <String> [-File] <String[]> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

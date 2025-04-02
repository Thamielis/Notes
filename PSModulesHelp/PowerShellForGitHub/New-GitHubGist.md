New-GitHubGist
--------------

### Synopsis
Creates a new gist on GitHub.

---

### Description

Creates a new gist on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubGist -FileName 'sample.txt' -Content 'Body of my file.' -Description 'This is my gist!' -Public
Creates a new public gist with a single file named 'sample.txt' that has the body of "Body of my file."
```
> EXAMPLE 2

```PowerShell
New-GitHubGist -File 'c:\files\foo.txt' -Description 'This is my gist!'
Creates a new private gist with a single file named 'foo.txt'.  Will populate it with the
content of the file at c:\files\foo.txt.
```
> EXAMPLE 3

```PowerShell
New-GitHubGist -File ('c:\files\foo.txt', 'c:\other\bar.txt', 'c:\octocat.ps1') -Description 'This is my gist!'
Creates a new private gist with a three files named 'foo.txt', 'bar.txt' and 'octocat.ps1'.
Each will be populated with the content from the file on disk at the specified location.
```

---

### Parameters
#### **File**
An array of filepaths that should be part of this gist.
Use this when you have multiple files that should be part of a gist, or when you simply
want to reference an existing file on disk.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |2       |true (ByValue)|

#### **FileName**
The name of the file that Content should be stored in within the newly created gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Content**
The content of a single file that should be part of the gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Description**
A descriptive name for this gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Public**
When specified, the gist will be public and available for anyone to see.

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
String - Filename(s) of file(s) that should be the content of the gist.

---

### Outputs
* GitHub.GitDetail

---

### Syntax
```PowerShell
New-GitHubGist [-File] <String[]> [-Description <String>] [-Public] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubGist [-FileName] <String> [-Content] <String> [-Description <String>] [-Public] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

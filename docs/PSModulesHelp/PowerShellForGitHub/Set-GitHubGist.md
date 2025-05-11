Set-GitHubGist
--------------

### Synopsis
Updates a gist on GitHub.

---

### Description

Updates a gist on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubGist -Gist 6cad326836d38bd3a7ae -Description 'This is my newer description'
Updates the description for the specified gist.
```
> EXAMPLE 2

```PowerShell
Set-GitHubGist -Gist 6cad326836d38bd3a7ae -Delete 'hello_world.rb' -Force
Deletes the 'hello_world.rb' file from the specified gist without prompting for confirmation.
```
> EXAMPLE 3

```PowerShell
Set-GitHubGist -Gist 6cad326836d38bd3a7ae -Delete 'hello_world.rb' -Description 'This is my newer description'
Deletes the 'hello_world.rb' file from the specified gist and updates the description.
```
> EXAMPLE 4

```PowerShell
Set-GitHubGist -Gist 6cad326836d38bd3a7ae -Update @{'hello_world.rb' = @{ 'fileName' = 'hello_universe.rb' }}
Renames the 'hello_world.rb' file in the specified gist to be 'hello_universe.rb'.
```
> EXAMPLE 5

```PowerShell
Set-GitHubGist -Gist 6cad326836d38bd3a7ae -Update @{'hello_world.rb' = @{ 'fileName' = 'hello_universe.rb' }}
Renames the 'hello_world.rb' file in the specified gist to be 'hello_universe.rb'.
```

---

### Parameters
#### **Gist**
The ID for the gist to update.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|GistId |

#### **Update**
A hashtable of files to update in the gist.
The key should be the name of the file in the gist as it exists right now.
The value should be another hashtable with the following optional key/value pairs:
    fileName - Specify a new name here if you want to rename the file.
    filePath - Specify a path to a file on disk if you wish to update the contents of the
               file in the gist with the contents of the specified file.
               Should not be specified if you use 'content' (below)
    content  - Directly specify the raw content that the file in the gist should be updated with.
               Should not be used if you use 'filePath' (above).

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **Delete**
A list of filenames that should be removed from this gist.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Description**
New description for this gist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* GitHub.GistDetail

---

### Syntax
```PowerShell
Set-GitHubGist [-Gist] <String> [-Update <Hashtable>] [-Delete <String[]>] [-Description <String>] [-Force] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

Set-GitHubProjectCard
---------------------

### Synopsis
Modify a GitHub Project Card.

---

### Description

Modify a GitHub Project Card.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubProjectCard -Card 999999 -Note UpdatedNote
Sets the card note to 'UpdatedNote' for the card with ID 999999.
```
> EXAMPLE 2

```PowerShell
Set-GitHubProjectCard -Card 999999 -Archive
Archives the card with ID 999999.
```
> EXAMPLE 3

```PowerShell
Set-GitHubProjectCard -Card 999999 -Restore
Restores the card with ID 999999.
```

---

### Parameters
#### **Card**
ID of the card to modify.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|true    |named   |true (ByPropertyName)|CardId |

#### **Note**
The note content for the card.  Only valid for cards without another type of content,
so this cannot be specified if the card already has a content_id and content_type.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Content|

#### **Archive**
Archive a project card.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Restore**
Restore a project card.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Returns the updated Project Card.  By default, this cmdlet does not generate any output.
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
GitHub.ProjectCard

---

### Outputs
* GitHub.ProjectCard

---

### Syntax
```PowerShell
Set-GitHubProjectCard -Card <Int64> [-Note <String>] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubProjectCard -Card <Int64> [-Note <String>] [-Archive] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubProjectCard -Card <Int64> [-Note <String>] [-Restore] [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

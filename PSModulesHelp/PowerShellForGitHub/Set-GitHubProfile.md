Set-GitHubProfile
-----------------

### Synopsis
Updates profile information for the current authenticated user on GitHub.

---

### Description

Updates profile information for the current authenticated user on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubProfile -Location 'Seattle, WA' -Hireable:$false
Updates the current user to indicate that their location is "Seattle, WA" and that they
are not currently hireable.
```

---

### Parameters
#### **Name**
The new name of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Email**
The publicly visible email address of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Blog**
The new blog URL of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Company**
The new company of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Location**
The new location of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Bio**
The new short biography of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Hireable**
Specify to indicate a change in hireable availability for the current authenticated user's
GitHub profile.  To change to "not hireable", specify -Hireable:$false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Returns the updated User Profile.  By default, this cmdlet does not generate any output.
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
|`[String]`|false   |7       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* GitHub.User

---

### Syntax
```PowerShell
Set-GitHubProfile [[-Name] <String>] [[-Email] <String>] [[-Blog] <String>] [[-Company] <String>] [[-Location] <String>] [[-Bio] <String>] [-Hireable] [-PassThru] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

Update-GitHubUser
-----------------

### Synopsis
Update the authenticated user

---

### Description

**Note:** If your email is set to private and you send an `email` parameter as part of this request
to update your profile, your privacy settings are still enforced: the email address will not be
displayed on your public profile or via the API.

---

### Examples
> EXAMPLE 1

Update-GitHubUser -Name 'octocat'
Update the authenticated user's name to 'octocat'
> EXAMPLE 2

Update-GitHubUser -Location 'San Francisco'
Update the authenticated user's location to 'San Francisco'
> EXAMPLE 3

Update-GitHubUser -Hireable $true -Bio 'I love programming'
Update the authenticated user's hiring availability to 'true' and their biography to 'I love programming'

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

#### **TwitterUsername**
The new Twitter username of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Company**
The new company of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Location**
The new location of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Hireable**
The new hiring availability of the user.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |7       |false        |

#### **Bio**
The new short biography of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

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
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Update the authenticated user](https://docs.github.com/rest/users/users#update-the-authenticated-user)

---

### Syntax
```PowerShell
Update-GitHubUser [[-Name] <String>] [[-Email] <String>] [[-Blog] <String>] [[-TwitterUsername] <String>] [[-Company] <String>] [[-Location] <String>] [[-Hireable] <Boolean>] [[-Bio] <String>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

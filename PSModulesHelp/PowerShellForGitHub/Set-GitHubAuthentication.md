Set-GitHubAuthentication
------------------------

### Synopsis
Allows the user to configure the API token that should be used for authentication
with the GitHub API.

---

### Description

Allows the user to configure the API token that should be used for authentication
with the GitHub API.

The token will be stored on the machine as a SecureString and will automatically
be read on future PowerShell sessions with this module.  If the user ever wishes
to remove their authentication from the system, they simply need to call
Clear-GitHubAuthentication.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubAuthentication
Prompts the user for their GitHub API Token and stores it in a file on the machine as a
SecureString for use in future PowerShell sessions.
```
> EXAMPLE 2

" | ConvertTo-SecureString -AsPlainText -Force)
$cred = New-Object System.Management.Automation.PSCredential "username is ignored", $secureString
Set-GitHubAuthentication -Credential $cred
$secureString = $null # clear this out now that it's no longer needed
$cred = $null # clear this out now that it's no longer needed
Allows you to specify your access token as a plain-text string ("<Your Access Token>")
which will be securely stored on the machine for use in all future PowerShell sessions.
> EXAMPLE 3

```PowerShell
Set-GitHubAuthentication -SessionOnly
Prompts the user for their GitHub API Token, but keeps it in memory only for the duration
of this PowerShell session.
```
> EXAMPLE 4

Set-GitHubAuthentication -Credential $cred -SessionOnly
Uses the API token stored in the password field of the provided credential object for
authentication, but keeps it in memory only for the duration of this PowerShell session..

---

### Parameters
#### **Credential**
If provided, instead of prompting the user for their API Token, it will be extracted
from the password field of this credential object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |1       |false        |

#### **SessionOnly**
By default, this method will store the provided API Token as a SecureString in a local
file so that it can be restored automatically in future PowerShell sessions.  If this
switch is provided, the file will not be created/updated and the authentication information
will only remain in memory for the duration of this PowerShell session.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Set-GitHubAuthentication [[-Credential] <PSCredential>] [-SessionOnly] [-WhatIf] [-Confirm] [<CommonParameters>]
```

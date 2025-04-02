Set-RDMPersonalSSHKey
---------------------

### Synopsis
Set 'My Personal SSH key' from 'My Account Settings'

---

### Description

Set 'My Personal SSH key' from 'My Account Settings'. It can be updated in three ways:
1) InputObject: From a PSConnection object obtained from Get-RDMPersonalSSHKey.
2) Key: From a new SSH key obtained from New-RDMSSHKey.
3) Filename: From a private key file ('.pri', '.ppk', '.key')

---

### Related Links
* [Get-RDMPersonalSSHKey](Get-RDMPersonalSSHKey)

* [New-RDMSSHKey](New-RDMSSHKey)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $sshKey = Get-RDMPersonalSSHKey;
        $sshKey.Credentials.PrivateKeyAutomaticallyLoadToKeyAgent = $true
        Set-RDMPersonalSSHKey -InputObject $sshKey
Modify 'My Personal SSH Key' to automatically load to SSH key agent
```
> EXAMPLE 2

```PowerShell
PS C:\> New-RDMSSHKey -Algorithm ED25519 -Format OpenSSH -Comment 'asdf' -Size 1024 -Round 12 | Set-RDMPersonalSSHKey
Create a new PSSHKey and save it as 'My Personal SSH Key'
```
> EXAMPLE 3

```PowerShell
PS C:\> Set-RDMPersonalSSHKey -Filename 'C:\my\path\filea.ppk'
Change the private key file for 'My Personal SSH Key'
```

---

### Parameters
#### **AutomaticallyLoadToKeyAgent**
Automatically load to SSH key agent

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Filename**
Private key file ('.pri', '.ppk', '.key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **InputObject**
Entry representing 'My Personal SSH Key'

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |named   |true (ByValue)|

#### **Key**
SSH key generated with New-RDMSSHKey

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSSSHKey]`|true    |named   |true (ByValue)|

#### **Passphrase**
Passphrase for the private key

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |false        |

#### **Password**
Overrides the password

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |false        |

#### **SavePassphrase**
Save the passphrase in the credential

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UserName**
Overrides the username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

PSConnection object obtained from Get-RDMPersonalSSHKey

RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSSHKey

PSSSHKey object obtained from New-RDMSSHkey

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPersonalSSHKey -detailed". For technical information, type "Get-Help Set-RDMPersonalSSHKey -full".

---

### Syntax
```PowerShell
Set-RDMPersonalSSHKey -InputObject <PSConnection> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMPersonalSSHKey -Key <PSSSHKey> [-UserName <String>] [-Password <SecureString>] [-Passphrase <SecureString>] [-SavePassphrase <Boolean>] [-AutomaticallyLoadToKeyAgent] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMPersonalSSHKey -Filename <String> [-UserName <String>] [-Password <SecureString>] [-Passphrase <SecureString>] [-SavePassphrase <Boolean>] [-AutomaticallyLoadToKeyAgent] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

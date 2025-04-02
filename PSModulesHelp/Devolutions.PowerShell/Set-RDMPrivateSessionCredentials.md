Set-RDMPrivateSessionCredentials
--------------------------------

### Synopsis
Save credentials in a session

---

### Description

Save credentials in a session

---

### Parameters
#### **CredentialEntryID**
Specifies the credentials type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **CredentialsType**
Specifies the credentials type.
Valid Values:

* SessionSpecific
* Embedded
* Parent
* Inherited
* MyDefault
* Personal
* None
* PrivateVaultSearch

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

#### **PSConnection**
Specifies the connection to set credentials to.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |named   |false        |

#### **SetSession**
Specifies the credentials type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionCredentials -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionCredentials -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionCredentials -CredentialEntryID <String> -PSConnection <PSConnection> [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionCredentials -CredentialsType <SessionSpecific | Embedded | Parent | Inherited | MyDefault | Personal | None | PrivateVaultSearch> -PSConnection <PSConnection> [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

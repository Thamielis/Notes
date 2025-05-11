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
|`[String]`|true    |1       |false        |

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
|`[String]`|true    |1       |false        |

#### **PSConnection**
Specifies the connection to set credentials to.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |1       |false        |

#### **SetSession**
Specifies the credentials type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

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
Set-RDMPrivateSessionCredentials [-CredentialEntryID] <String> [-PSConnection] <PSConnection> [[-SetSession]] [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionCredentials [-CredentialsType] <String> [-PSConnection] <PSConnection> [[-SetSession]] [<CommonParameters>]
```

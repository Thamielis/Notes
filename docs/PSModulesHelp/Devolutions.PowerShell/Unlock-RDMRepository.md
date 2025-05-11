Unlock-RDMRepository
--------------------

### Synopsis
Unlock the vault to be loaded

---

### Description

Unlock the vault to load it. If this fails, the user will be prompted for the password.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Unlock-RDMRepository -Password 'pa$sWord!'
PS C:\> Get-RDMDataSource -Name 'myDataSourceWithOnlyProtectedVaults' | Set-RDMCurrentDataSource
Unlock the last used vault in the data source named 'myDataSourceWithOnlyProtectedVaults before accessing it'
```
> EXAMPLE 2

PS C:\> Unlock-RDMRepository -Password (ConvertTo-SecureString -AsPlainText -String 'pa$sWord!')
PS C:\> Get-RDMVault -Name 'myLockedVault' | Set-RDMCurrentVault
Unlock the vault 'myLockedVault' before accessing it'

---

### Parameters
#### **Password**
Password to unlock the vault. Accepts a string or SecureString.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSPassword]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Unlock-RDMRepository -detailed". For technical information, type "Get-Help Unlock-RDMRepository -full".

---

### Syntax
```PowerShell
Unlock-RDMRepository [-Password] <PSPassword> [<CommonParameters>]
```

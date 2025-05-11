Get-DSEntriesPermissions
------------------------

### Synopsis
Gets the permissions for all entries in a vault or for a specific entry

---

### Description

Recursivly gets all permissions for all entries in a given vault or for a specific entry.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-DSEntriesPermissions -VaultID $vaultID
Get all permisissions in the vault whose ID is stored in $vaultID.
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-DSEntriesPermissions -VaultName 'My Vault'
Get all permisissions in the vault name 'My Vault'.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-DSEntriesPermissions -Entry $entryID
Get all permisissions for the entry whose ID is stored in $entryID.
```

---

### Parameters
#### **EntryID**
ID of the entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **IncludePrincipalsName**
Add a PrincipalsName field containing the name associated with the ids of the Principals field.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultID**
Id of the vault containing the entries

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **VaultName**
Name of the vault containing the entries. Case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSCustomObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSCustomObject[])

---

### Notes
For more information, type "Get-Help Get-DSEntriesPermissions -detailed". For technical information, type "Get-Help Get-DSEntriesPermissions -full".

---

### Syntax
```PowerShell
Get-DSEntriesPermissions [-EntryID] <Guid> [-IncludePrincipalsName] [<CommonParameters>]
```
```PowerShell
Get-DSEntriesPermissions [-VaultID] <Guid> [-IncludePrincipalsName] [<CommonParameters>]
```
```PowerShell
Get-DSEntriesPermissions [-VaultName] <String> [-IncludePrincipalsName] [<CommonParameters>]
```

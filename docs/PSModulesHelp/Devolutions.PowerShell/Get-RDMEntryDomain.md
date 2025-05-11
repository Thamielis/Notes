Get-RDMEntryDomain
------------------

### Synopsis
Get the domain from the specified entry.

---

### Description

Get the domain of the specified entry.
    To obtain the domain, the user must be able to copy it. Generally, this means the right to view it. The status of the entry, such as Locked or Expired, can also prevent the obtention of the domain.

---

### Related Links
* [Set-RDMEntryDomain](Set-RDMEntryDomain)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $entry = Get-RDMEntry -Name EntryA;
    Get-RDMEntryDomain -InputObject $entry
Get the domain from the entry named EntryA.
```
> EXAMPLE 2

PS C:\> $entries = Get-RDMEntry | Where { (Get-RDMEntryDomain -InputObject $_) -eq 'mydomain' };
    $entries | Set-RDMEntryDomain -InputObject $entry -Domain 'newDomain' -Set;
    Update-RDMEntries
For all entries whose domain is 'mydomain', update it to 'newDomain' and save the change. After all the modifications, refresh the entries list.

---

### Parameters
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

#### **ID**
ID of the entry to modify. Use the VaultMode parameter to search in the User vault or the Global vault.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
Specifies the entry to get the domain from.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
        - Default: Current vault that has been set.
        - User: Vault specific to the current user.
        - Global: Global vault of the data source.
Valid Values:

* Default
* User
* Global

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VaultMode]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

PSConnection object of the entry to extract the domain from.

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
For more information, type "Get-Help Get-RDMEntryDomain -detailed". For technical information, type "Get-Help Get-RDMEntryDomain -full".

---

### Syntax
```PowerShell
Get-RDMEntryDomain [-ID] <Guid> [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryDomain [-InputObject] <PSConnection> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

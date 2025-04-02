Get-RDMEntryUsername
--------------------

### Synopsis
Get the username from an entry

---

### Description

Get the username from an entry.
    To obtain the username, the user must be able to copy it. Generally, this means the right to view it. The status of the entry, such as Locked or Expired, can also prevent the obtention of the username.

---

### Related Links
* [Set-RDMEntryUsername](Set-RDMEntryUsername)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMEntry -Name 'MyEntry' | Get-RDMEntryUsername
Obtain the username of the entry named 'MyEntry'
```

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
Specifies the entry to get the username from.

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

PSConnection object representing the entry from which the username will be extracted.

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
For more information, type "Get-Help Get-RDMEntryUsername -detailed". For technical information, type "Get-Help Get-RDMEntryUsername -full".

---

### Syntax
```PowerShell
Get-RDMEntryUsername [-ID] <Guid> [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryUsername [-InputObject] <PSConnection> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

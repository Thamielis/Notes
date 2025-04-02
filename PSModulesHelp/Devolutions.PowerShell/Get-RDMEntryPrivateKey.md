Get-RDMEntryPrivateKey
----------------------

### Synopsis
Get an entry's private key

---

### Description

Get an entry's private key.
Two types of private key are supported: Embedded data and File (local). The user must also have the right to edit the entry.
Additionaly, the 'ExportPath' parameter allows for the key to be saved into a file. Only a vault owner or administrator can export the key.")]

---

### Related Links
* [Get-RDMEntry](Get-RDMEntry)

* [Get-RDMSession](Get-RDMSession)

* [Get-RDMPrivateSession](Get-RDMPrivateSession)

---

### Examples
> EXAMPLE

```PowerShell
Get-RDMEntry -Name 'My Private Key Cred' | Get-RDMEntryPrivateKey -ExportPath 'myfile.key' | Out-Null
Save the private key from the entry named 'My Private Key Cred' into a file named 'myfile.key'.
```

---

### Parameters
#### **ExportPath**
Export file for the private key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

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
ID of the entry for which the private key is fetched

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
ID of the entry for which the private key is fetched

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |1       |false        |

#### **NoClobber**
NoClobber prevents an existing file from being overwritten and displays a message that the file already exists. By default, if a file exists in the specified path, it is overwritten.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
* Default: Current vault that has been set.
* User: Vault specific to the current user.
* Global: Global vault of the data source.
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

The entry containing the private key

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
For more information, type "Get-Help Get-RDMEntryPrivateKey -detailed". For technical information, type "Get-Help Get-RDMEntryPrivateKey -full".

---

### Syntax
```PowerShell
Get-RDMEntryPrivateKey [-ID] <Guid> [[-ExportPath] <String>] [-NoClobber] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryPrivateKey [-InputObject] <PSConnection> [[-ExportPath] <String>] [-NoClobber] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryPrivateKey -InputObject <PSConnection> [[-ExportPath] <String>] [-NoClobber] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

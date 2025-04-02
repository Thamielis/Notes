New-DSCredentialEntry
---------------------

### Synopsis
Create a new entry of type 'Credentials'.

---

### Description

Create a new entry of type 'Credentials' with the parameters supplied. For the supported subtypes, see the ConnectionSubType parameter.

---

### Related Links
* [New-DSEntryBase](New-DSEntryBase)

* [New-DSRDPEntry](New-DSRDPEntry)

* [New-DSSSHShellEntry](New-DSSSHShellEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\>     $NewCredEntry = @{
        VaultId                                  = ([guid]::Empty)
        EntryName                                = 'rootlocal '
        Username                                 = 'root'
        Password                                 = 'Pa$$w0rd!'
        Folder                                   = 'Powershell rules'
        credentialViewedCommentIsRequired        = $true
        credentialViewedPrompt                   = $true
        ticketNumberIsRequiredOnCredentialViewed = $true
        checkOutMode                             = 'Default'
        Description                              = 'This is a description'
        Tags                                     = '1 2 3 4 5'
    };
                
    New-DSCredentialEntry @NewCredEntry
Create a 'Username/Password' credential.
```

---

### Parameters
#### **AllowOffline**
Entry's offline mode.
Valid Values:

* Default
* True
* False
* Inherited

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[AllowOffline]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CheckoutMode**
Entry's checkout mode.
Valid Values:

* Default
* NotSupported
* Automatic
* Manual
* Inherited
* Optional
* AutomaticWhenAvailable

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CheckOutMode]`|false   |named   |false        |

#### **ConnectionSubType**
Connection sub-type. Used for connections of type Credentials. Supported sub-type are Default (Username/Password) or PrivateKey
Valid Values:

* Default
* KeePass
* LastPass
* PasswordSafe
* OnePassword
* RoboForm
* ChromePasswordManager
* FirefoxPasswordManager
* WindowsVault
* PasswordVaultManager
* AddOn
* SecretServer
* DataVault
* ConnectionString
* PrivateKey
* Passwordstate
* PleasantPasswordServer
* AuthAnvilPasswordServer
* ManagedEngine
* AppleKeychain
* CyberArk
* PMPro
* DPS
* PasswordBox
* PassPortal
* OTP
* OneTimeCodeList
* Custom
* LAPS
* Dashlane
* TeamPass
* TrueKey
* StickyPassword
* Hub
* OnePasswordTeam
* ZohoPassword
* BeyondTrustPasswordSafe
* SecurityPattern
* CyberArkAim
* PasswordList
* TPAM
* Centrify
* Bitwarden
* MatesoPasswordSafe
* HashiCorpVault
* KeeperEnterprise
* DpsPam
* AzureKeyVault
* ApplicationPassword
* ApiKey
* RSASecurID
* TopicusKeyHub
* ITGlue
* KasperskyPasswordManager
* AzureServicePrincipal
* PsonoPasswordManager
* SecretServerRest
* Undefined
* Hudu
* ITPortal
* HubPersonal
* HubPam
* AccessCode
* PasswordDepot
* X509
* Cerby
* Passkey
* DropBoxPasswords

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[CredentialResolverConnectionType]`|false   |named   |false        |

#### **CredentialViewedCommentIsRequired**
A comment is required to view entry's credentials

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CredentialViewedPrompt**
Prompt the user for comment/ticket number

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Description**
Entry's description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Domain**
Domain's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Expiration**
Entry's expiration date (ISO-8601 format (yyyy-mm-ddThh:mm:ss.000Z)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Group**
Entry's location in the vault (folder name, noot ID)

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |7       |false        |Folder |

#### **MnemonicPassword**
Entry's mnemonic password to help remembering the password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Name**
Entry's name

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|true    |1       |false        |EntryName|

#### **Password**
Entry's password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **PrivateKeyPassphrase**
Private key passphrase

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PrivateKeyPath**
Full private key path (*.ppk)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PrivateKeyType**
Private key type. The default type is Data.
Valid Values:

* NoKey
* File
* Data
* Link
* MyDefault
* PrivateVault
* UserVaultSearchString

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PrivateKeyType]`|false   |named   |false        |

#### **PromptForPassphrase**
Prompt for passphrase before checkout.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PromptForPassword**
Prompt for password when checkout

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Tags**
Entry's tags (keywords). Each word separated by a space is considered a keyword.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TicketNumberIsRequiredOnCredentialViewed**
A ticket number is required to view entry's credentials

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Username**
Entry's username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **VaultID**
Entry's vault ID.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |6       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSCredentialEntry -detailed". For technical information, type "Get-Help New-DSCredentialEntry -full".

---

### Syntax
```PowerShell
New-DSCredentialEntry [-ConnectionSubType <Default | PrivateKey>] [-Name] <String> [[-Domain] <String>] [[-Username] <String>] [[-Password] <String>] [[-MnemonicPassword] <String>] [[-VaultID] <Guid>] [[-Group] <String>] [-PromptForPassword] [-Description <String>] [-Tags <String>] [-Expiration <String>] [-CredentialViewedCommentIsRequired] [-TicketNumberIsRequiredOnCredentialViewed] [-CredentialViewedPrompt] [-CheckoutMode <Default | NotSupported | Automatic | Manual | Inherited | Optional | AutomaticWhenAvailable>] [-AllowOffline <Default | True | False | Inherited>] [-PrivateKeyType <Data | NoKey>] [-PrivateKeyPath <String>] [-PrivateKeyPassphrase <String>] [-PromptForPassphrase] [-AsLegacyResponse] [<CommonParameters>]
```

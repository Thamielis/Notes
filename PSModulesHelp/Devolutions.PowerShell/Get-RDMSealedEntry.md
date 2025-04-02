Get-RDMSealedEntry
------------------

### Synopsis
Get sealed entries.

---

### Description

To get sealed entries, ensure that you are using a Devolutions Server data source, as only this type supports the operation. The returned object will contain only basic information. To unseal the entry, use the command Unprotect-RDMSealedEntry.

---

### Related Links
* [Unprotect-RDMSealedEntry](Unprotect-RDMSealedEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMSealedEntry -Name 'InCaseOfEmergency' | Unprotect-RDMSealedEntry;
PS C:\> $unsealedEntry = Get-RDMEntry -Name 'InCaseOfEmergency';
PS C:\> $password = Get-RDMEntryPassword -InputObject $unsealedEntry -AsPlainText;
PS C:\> $unsealedEntry.SealState = 'Sealed';
PS C:\> Set-RDMEntry -InputObject $unsealedEntry;
Unseal the entry 'InCaseOfEmergency', get its password, and reseal the entry
```

---

### Parameters
#### **CaseSensitive**
Filtering by name and group name will be case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **GroupName**
Filter the entries by the group. Support wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ID**
Filter the entries by their ID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |1       |false        |

#### **IncludeSubFolders**
Filtering by group name will include entries in subfolders

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LiteralGroupName**
Filter the entries by the group. Support wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **LiteralName**
Filter the entries by their name. No wildcard supports.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Name**
Filter the entries by their name. Support wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Type**
Filter the result by the connection type
Valid Values:

* ADConsole
* AddOn
* Agent
* AppleRemoteDesktop
* ApplicationTool
* Aws
* Azure
* AzureQueueStorage
* AzureStorage
* AzureTableStorage
* BeyondTrustPasswordSafeConsole
* ChromeRemoteDesktop
* CitrixWeb
* CommandLine
* Computer
* Contact
* ControlUp
* Credential
* Customer
* CyberArkJump
* CyberArkPSM
* Dameware
* Database
* DataEntry
* DataReport
* DataSource
* DeskRoll
* Desktone
* DevolutionsProxy
* Document
* DropBox
* FileExplorer
* Ftp
* FtpNative
* Gateway
* Group
* Host
* HpRgs
* HyperV
* ICA
* IDrac
* Ilo
* IntelAMT
* InventoryReport
* Iterm
* LogMeIn
* PCAnywhere
* PlayList
* PortForward
* PowerShell
* PowerShellRemoteConsole
* ProxyTunnel
* PSExec
* Putty
* Radmin
* RDCommander
* RDPConfigured
* RDPFilename
* ResetPassword
* S3
* Scp
* ScreenConnect
* ScreenHero
* SecureCRT
* Serial
* SessionTool
* Sftp
* Sheet
* SkyDrive
* SNMPReport
* Spiceworks
* Splunk
* SSHShell
* SSHTunnel
* Sync
* TeamViewer
* TeamViewerConsole
* Telnet
* TemplateGroup
* TerminalConsole
* TFtp
* VirtualBox
* VirtualPC
* VMRC
* VMWare
* VMWareConsole
* VNC
* VPN
* Wayk
* WaykDenConsole
* WebBrowser
* WebDav
* WindowsAdminCenter
* WindowsVirtualPC
* XenServer
* XWindow

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ConnectionType[]]`|false   |named   |false        |

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
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSealedConnection[]

---

### Notes
For more information, type "Get-Help Get-RDMSealedEntry -detailed". For technical information, type "Get-Help Get-RDMSealedEntry -full".

---

### Syntax
```PowerShell
Get-RDMSealedEntry [[-ID] <Guid[]>] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMSealedEntry [[-Name] <String[]>] [[-GroupName] <String[]>] [-Type <ADConsole | AddOn | Agent | AppleRemoteDesktop | ApplicationTool | Aws | Azure | AzureQueueStorage | AzureStorage | AzureTableStorage | BeyondTrustPasswordSafeConsole | ChromeRemoteDesktop | CitrixWeb | CommandLine | Computer | Contact | ControlUp | Credential | Customer | CyberArkJump | CyberArkPSM | Dameware | Database | DataEntry | DataReport | DataSource | DeskRoll | Desktone | DevolutionsProxy | Document | DropBox | FileExplorer | Ftp | FtpNative | Gateway | Group | Host | HpRgs | HyperV | ICA | IDrac | Ilo | IntelAMT | InventoryReport | Iterm | LogMeIn | PCAnywhere | PlayList | PortForward | PowerShell | PowerShellRemoteConsole | ProxyTunnel | PSExec | Putty | Radmin | RDCommander | RDPConfigured | RDPFilename | ResetPassword | S3 | Scp | ScreenConnect | ScreenHero | SecureCRT | Serial | SessionTool | Sftp | Sheet | SkyDrive | SNMPReport | Spiceworks | Splunk | SSHShell | SSHTunnel | Sync | TeamViewer | TeamViewerConsole | Telnet | TemplateGroup | TerminalConsole | TFtp | VirtualBox | VirtualPC | VMRC | VMWare | VMWareConsole | VNC | VPN | Wayk | WaykDenConsole | WebBrowser | WebDav | WindowsAdminCenter | WindowsVirtualPC | XenServer | XWindow>] [-CaseSensitive] [-IncludeSubFolders] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMSealedEntry [[-LiteralName] <String[]>] [[-LiteralGroupName] <String[]>] [-Type <ADConsole | AddOn | Agent | AppleRemoteDesktop | ApplicationTool | Aws | Azure | AzureQueueStorage | AzureStorage | AzureTableStorage | BeyondTrustPasswordSafeConsole | ChromeRemoteDesktop | CitrixWeb | CommandLine | Computer | Contact | ControlUp | Credential | Customer | CyberArkJump | CyberArkPSM | Dameware | Database | DataEntry | DataReport | DataSource | DeskRoll | Desktone | DevolutionsProxy | Document | DropBox | FileExplorer | Ftp | FtpNative | Gateway | Group | Host | HpRgs | HyperV | ICA | IDrac | Ilo | IntelAMT | InventoryReport | Iterm | LogMeIn | PCAnywhere | PlayList | PortForward | PowerShell | PowerShellRemoteConsole | ProxyTunnel | PSExec | Putty | Radmin | RDCommander | RDPConfigured | RDPFilename | ResetPassword | S3 | Scp | ScreenConnect | ScreenHero | SecureCRT | Serial | SessionTool | Sftp | Sheet | SkyDrive | SNMPReport | Spiceworks | Splunk | SSHShell | SSHTunnel | Sync | TeamViewer | TeamViewerConsole | Telnet | TemplateGroup | TerminalConsole | TFtp | VirtualBox | VirtualPC | VMRC | VMWare | VMWareConsole | VNC | VPN | Wayk | WaykDenConsole | WebBrowser | WebDav | WindowsAdminCenter | WindowsVirtualPC | XenServer | XWindow>] [-CaseSensitive] [-IncludeSubFolders] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

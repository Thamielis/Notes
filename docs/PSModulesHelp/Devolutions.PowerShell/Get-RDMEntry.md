Get-RDMEntry
------------

### Synopsis
Retrieve entries in the specified vault

---

### Description

Retrieve entries in the specified vault. The vault is specified by the VaultMode parameter.
    The parameter GroupName search for entries in a specific folder. The switch IncludeSubFolders is required to look in all subfolders of the specified groups. It is also possible to use the wildcard '*' at the end of the GroupName to look in the subfolders.

---

### Related Links
* [New-RDMEntry](New-RDMEntry)

* [Remove-RDMEntry](Remove-RDMEntry)

* [Set-RDMEntry](Set-RDMEntry)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMEntry -IncludeDocumentsStoredInDatabase -IncludeLocalPlaylists -IncludeUserSpecificSettings
Retrieves all available entries in the current vault. Documents, playlists and user specific settings will be included in the returned entries.
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMEntry -Name Folder?, *Folder -VaultMode Global -CaseSensitive
Retrieves all available entries whose name is Folder appended with a character or is ending with Folder in the system vault. The search is case sensitive.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMEntry -GroupName Folder\SubFolder -VaultMode User -IncludeSubFolders
Retrieves all available entries in the group named Folder\SubFolder and its subfolders.
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

#### **IncludeDocumentsStoredInDatabase**
Document entries returned will include attachment from documents

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeLocalPlaylists**
PlayList entries will include dependable connections and local playlists from playlist connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeSubFolders**
Filtering by group name will include entries in subfolders

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeUserSpecificSettings**
Entries returned will include user specific settings

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
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

---

### Notes
For more information, type "Get-Help Get-RDMEntry -detailed". For technical information, type "Get-Help Get-RDMEntry -full".

---

### Syntax
```PowerShell
Get-RDMEntry [[-ID] <Guid[]>] [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists] [-IncludeUserSpecificSettings] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntry [[-Name] <String[]>] [[-GroupName] <String[]>] [-Type <ADConsole | AddOn | Agent | AppleRemoteDesktop | ApplicationTool | Aws | Azure | AzureQueueStorage | AzureStorage | AzureTableStorage | BeyondTrustPasswordSafeConsole | ChromeRemoteDesktop | CitrixWeb | CommandLine | Computer | Contact | ControlUp | Credential | Customer | CyberArkJump | CyberArkPSM | Dameware | Database | DataEntry | DataReport | DataSource | DeskRoll | Desktone | DevolutionsProxy | Document | DropBox | FileExplorer | Ftp | FtpNative | Gateway | Group | Host | HpRgs | HyperV | ICA | IDrac | Ilo | IntelAMT | InventoryReport | Iterm | LogMeIn | PCAnywhere | PlayList | PortForward | PowerShell | PowerShellRemoteConsole | ProxyTunnel | PSExec | Putty | Radmin | RDCommander | RDPConfigured | RDPFilename | ResetPassword | S3 | Scp | ScreenConnect | ScreenHero | SecureCRT | Serial | SessionTool | Sftp | Sheet | SkyDrive | SNMPReport | Spiceworks | Splunk | SSHShell | SSHTunnel | Sync | TeamViewer | TeamViewerConsole | Telnet | TemplateGroup | TerminalConsole | TFtp | VirtualBox | VirtualPC | VMRC | VMWare | VMWareConsole | VNC | VPN | Wayk | WaykDenConsole | WebBrowser | WebDav | WindowsAdminCenter | WindowsVirtualPC | XenServer | XWindow>] [-CaseSensitive] [-IncludeSubFolders] [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists] [-IncludeUserSpecificSettings] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntry [[-LiteralName] <String[]>] [[-LiteralGroupName] <String[]>] [-Type <ADConsole | AddOn | Agent | AppleRemoteDesktop | ApplicationTool | Aws | Azure | AzureQueueStorage | AzureStorage | AzureTableStorage | BeyondTrustPasswordSafeConsole | ChromeRemoteDesktop | CitrixWeb | CommandLine | Computer | Contact | ControlUp | Credential | Customer | CyberArkJump | CyberArkPSM | Dameware | Database | DataEntry | DataReport | DataSource | DeskRoll | Desktone | DevolutionsProxy | Document | DropBox | FileExplorer | Ftp | FtpNative | Gateway | Group | Host | HpRgs | HyperV | ICA | IDrac | Ilo | IntelAMT | InventoryReport | Iterm | LogMeIn | PCAnywhere | PlayList | PortForward | PowerShell | PowerShellRemoteConsole | ProxyTunnel | PSExec | Putty | Radmin | RDCommander | RDPConfigured | RDPFilename | ResetPassword | S3 | Scp | ScreenConnect | ScreenHero | SecureCRT | Serial | SessionTool | Sftp | Sheet | SkyDrive | SNMPReport | Spiceworks | Splunk | SSHShell | SSHTunnel | Sync | TeamViewer | TeamViewerConsole | Telnet | TemplateGroup | TerminalConsole | TFtp | VirtualBox | VirtualPC | VMRC | VMWare | VMWareConsole | VNC | VPN | Wayk | WaykDenConsole | WebBrowser | WebDav | WindowsAdminCenter | WindowsVirtualPC | XenServer | XWindow>] [-CaseSensitive] [-IncludeSubFolders] [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists] [-IncludeUserSpecificSettings] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

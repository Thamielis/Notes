Get-RDMSession
--------------

### Synopsis
Retrieve the list of available sessions.

---

### Description

Retrieve the list of available sessions for the current selected data source.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

* [Set-RDMDataSource](Set-RDMDataSource)

* [Set-RDMSession](Set-RDMSession)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMSession
Retrieves the list of available sessions.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMSession; $list[0]
Retrieves the list of available sessions and displays the first item.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMSession; $list[1].Name = "New Name";Set-RDMSession $list[1]
Retrieves the list of available sessions, modify the name of the second session, update the session.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

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
GroupName

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ID**
ID of the desired session

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

#### **IncludeDocumentsStoredInDatabase**
Include attachment from documents

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeLocalPlaylists**
Include dependable connections and local playlists from playlist connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeSubFolders**
Include subfolders from the group name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeUserSpecificSettings**
Include user specific settings

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LiteralName**
Session name. No characters are interpreted as wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Name**
Session name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Type**
Filter the result by the connection type
Valid Values:

* Undefined
* RDPConfigured
* RDPFilename
* CommandLine
* VNC
* WebBrowser
* LogMeIn
* TeamViewer
* Putty
* Ftp
* VirtualPC
* Radmin
* Dameware
* VMWare
* PCAnywhere
* ICA
* XWindow
* HyperV
* AddOn
* RemoteAssistance
* VPN
* VirtualBox
* VMRC
* XenServer
* WindowsVirtualPC
* Group
* Credential
* HpRgs
* Desktone
* ApplicationTool
* SessionTool
* Contact
* DataEntry
* DataReport
* Agent
* Computer
* DropBox
* S3
* AzureStorage
* CitrixWeb
* PowerShell
* HostSessionTool
* Shortcut
* IntelAMT
* Azure
* Document
* VMWareConsole
* InventoryReport
* SkyDrive
* ScreenConnect
* AzureTableStorage
* AzureQueueStorage
* TemplateGroup
* Host
* Database
* Customer
* ADConsole
* Aws
* SNMPReport
* Sync
* Gateway
* PlayList
* TerminalConsole
* PSExec
* AppleRemoteDesktop
* Spiceworks
* DeskRoll
* SecureCRT
* Iterm
* Sheet
* Splunk
* PortForward
* TeamViewerConsole
* ScreenHero
* Telnet
* Serial
* SSHTunnel
* SSHShell
* ResetPassword
* Wayk
* ControlUp
* DataSource
* ChromeRemoteDesktop
* RDCommander
* IDrac
* Ilo
* WebDav
* BeyondTrustPasswordSafeConsole
* DevolutionsProxy
* FtpNative
* PowerShellRemoteConsole
* ProxyTunnel
* Root
* BeyondTrustPasswordSafe
* FileExplorer
* Scp
* Sftp
* AzureBlobStorage
* TFtp
* GoToAssist
* IPTable
* Hub
* GoogleDrive
* GoogleCloud
* NoVNC
* Splashtop
* JumpDesktop
* BoxNet
* MSPAnywhere
* Repository
* CyberArkPSM
* CloudBerryRemoteAssistant
* ITGlue
* SmartFolder
* CyberArkJump
* WindowsAdminCenter
* DevolutionsGateway
* WaykDenConsole
* RDGatewayConsole
* CyberArkDashboard
* DVLSPamDashboard
* SMB
* AppleRemoteManagement
* RustDesk
* PAM
* TakeControl
* CustomImage
* AzureBastion
* WindowsTerminal
* DevolutionsGatewayTunnel
* UnixTerminal
* SSHKeyDashboard
* CyberArkAccount
* CyberArkMachine
* DellRemoteAccessController
* AzurePIM
* ScriptDashboard
* HPIntegratedLightsOut
* TN3270
* SplashtopDashboard
* NativeApplicationLogin
* EntraIDConsole
* NiceDCV
* RDPOverDelineaSecretServerProxy
* SSHOverDelineaSecretServerProxy

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ConnectionType]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Get-RDMSession -detailed". For technical information, type "Get-Help Get-RDMSession -full".

---

### Syntax
```PowerShell
Get-RDMSession [-GroupName <String>] [-LiteralName <String>] [-Name <String>] [-IncludeSubFolders] [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists] [-IncludeUserSpecificSettings] [-CaseSensitive] [-ID <Guid>] [-Type <ADConsole | AddOn | Agent | AppleRemoteDesktop | ApplicationTool | Aws | Azure | AzureQueueStorage | AzureStorage | AzureTableStorage | BeyondTrustPasswordSafeConsole | ChromeRemoteDesktop | CitrixWeb | CommandLine | Computer | Contact | ControlUp | Credential | Customer | CyberArkJump | CyberArkPSM | Dameware | Database | DataEntry | DataReport | DataSource | DeskRoll | Desktone | DevolutionsProxy | Document | DropBox | FileExplorer | Ftp | FtpNative | Gateway | Group | Host | HpRgs | HyperV | ICA | IDrac | Ilo | IntelAMT | InventoryReport | Iterm | LogMeIn | PCAnywhere | PlayList | PortForward | PowerShell | PowerShellRemoteConsole | ProxyTunnel | PSExec | Putty | Radmin | RDCommander | RDPConfigured | RDPFilename | ResetPassword | S3 | Scp | ScreenConnect | ScreenHero | SecureCRT | Serial | SessionTool | Sftp | Sheet | SkyDrive | SNMPReport | Spiceworks | Splunk | SSHShell | SSHTunnel | Sync | TeamViewer | TeamViewerConsole | Telnet | TemplateGroup | TerminalConsole | TFtp | VirtualBox | VirtualPC | VMRC | VMWare | VMWareConsole | VNC | VPN | Wayk | WaykDenConsole | WebBrowser | WebDav | WindowsAdminCenter | WindowsVirtualPC | XenServer | XWindow>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

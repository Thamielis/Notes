New-RDMEntry
------------

### Synopsis
Create a new entry.

---

### Description

Create a new entry. To save the new entry, the SetSession switch must be used. To save in the user vault ou the system vault, use the VaultMode parameter.

---

### Related Links
* [Get-RDMEntry](Get-RDMEntry)

* [Remove-RDMEntry](Remove-RDMEntry)

* [Set-RDMEntry](Set-RDMEntry)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> New-RDMEntry -Name 'New Entry' -Host 'myServer' -Type 'RDPConfigured' -Set -VaultMoode User
Create & save a new entry in the user vault.
```
> EXAMPLE 2

```PowerShell
PS C:\> $folder = New-RDMEntry -Name 'New Folder' -Type 'Group';
        $folder.GroupDetails.UserName = 'MyUserName';
        $folder.GroupDetails.Domain = 'MyDomain';
        Set-RDMEntry -InputObject $folder
Create a new entry without saving it and store it in $folder. Add some additionnal information in the GroupDetails. Save the entry in the current vault.
```

---

### Parameters
#### **DocumentAttachment**
New document attachement.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[PSConnectionAttachment]`|false   |named   |false        |

#### **DocumentFileName**
New document file name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **Group**
Folder where the entry will be. It is corresponding to the property 'Group' of the PSConnection object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Host**
Host of the entry. Value available for specific entry types only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Name**
Name of the entry. It can not be empty. However, if the parameter Host is not empty, it will be use as a fallback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Set**
Save the entry based on the vault mode:
        - Default => In the current vault
        - User => In the user vault
        - Global => In the system vault

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TemplateID**
Id of the template used to create the entry. It is mandatory for entry of the type 'TemplateGroup'.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |5       |false        |

#### **Type**
Type of the entry to create. Must be on of the following:
        'ADConsole', 'AddOn', 'Agent', 'AppleRemoteDesktop', 'ApplicationTool', 'Aws', 'Azure', 'AzureQueueStorage', 'AzureStorage', 'BeyondTrustPasswordSafeConsole',
        'ChromeRemoteDesktop', 'CitrixWeb', 'CommandLine', 'Computer', 'Contact', 'ControlUp', 'Credential', 'Customer', 'CyberArkJump', 'CyberArkPSM',
        'Dameware', 'Database', 'DataEntry', 'DataReport', 'DataSource', 'DeskRoll', 'Desktone', 'DevolutionsProxy, 'Document', 'DropBox', 'FileExplorer',
        'Ftp', 'FtpNative', 'Gateway', 'Group', 'Host', 'HpRgs, 'HyperV', 'ICA', 'IDrac', 'Ilo', 'IntelAMT', 'InventoryReport', 'Iterm',
        'LogMeIn', 'PCAnywhere', 'PlayList', 'PortForward', 'PowerShell', 'PowerShellRemoteConsole', 'ProxyTunnel', 'PSExec', 'Putty', 'Radmin', 'RDCommander',
        'RDPConfigured', 'RDPFilename', 'ResetPassword', 'S3', 'Scp','ScreenConnect', 'ScreenHero', 'ScriptDashboard', 'SecureCRT',  'Serial',  'SessionTool' , 'Sftp' , 'Sheet' ,
        'SkyDrive', 'SNMPReport', 'Spiceworks', 'Splunk', 'SSHShell', 'SSHTunnel', 'Sync', 'TeamViewer', 'TeamViewerConsole', 'Telnet', 'TemplateGroup', 'TerminalConsole',
        'TFtp','VirtualBox', 'VirtualPC', 'VMRC', 'VMWare', 'VMWareConsole', 'VNC', 'VPN', 'Wayk', 'WaykDenConsole', 'WebBrowser', , 'WebDav', 'WindowsAdminCenter',
        'WindowsVirtualPC', 'XenServer',  'XWindow'
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
|`[ConnectionType]`|true    |1       |false        |

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
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help New-RDMEntry -detailed". For technical information, type "Get-Help New-RDMEntry -full".

---

### Syntax
```PowerShell
New-RDMEntry [-Type] <ADConsole | AddOn | Agent | AppleRemoteDesktop | ApplicationTool | Aws | Azure | AzureQueueStorage | AzureStorage | AzureTableStorage | BeyondTrustPasswordSafeConsole | ChromeRemoteDesktop | CitrixWeb | CommandLine | Computer | Contact | ControlUp | Credential | Customer | CyberArkJump | CyberArkPSM | Dameware | Database | DataEntry | DataReport | DataSource | DeskRoll | Desktone | DevolutionsProxy | Document | DropBox | FileExplorer | Ftp | FtpNative | Gateway | Group | Host | HpRgs | HyperV | ICA | IDrac | Ilo | IntelAMT | InventoryReport | Iterm | LogMeIn | PCAnywhere | PlayList | PortForward | PowerShell | PowerShellRemoteConsole | ProxyTunnel | PSExec | Putty | Radmin | RDCommander | RDPConfigured | RDPFilename | ResetPassword | S3 | Scp | ScreenConnect | ScreenHero | ScriptDashboard | SecureCRT | Serial | SessionTool | Sftp | Sheet | SkyDrive | SNMPReport | Spiceworks | Splunk | SSHShell | SSHTunnel | Sync | TeamViewer | TeamViewerConsole | Telnet | TemplateGroup | TerminalConsole | TFtp | VirtualBox | VirtualPC | VMRC | VMWare | VMWareConsole | VNC | VPN | Wayk | WaykDenConsole | WebBrowser | WebDav | WindowsAdminCenter | WindowsVirtualPC | XenServer | XWindow> [[-Name] <String>] [[-Group] <String>] [[-Host] <String>] [[-TemplateID] <Guid>] [-DocumentAttachment <PSConnectionAttachment>] [-DocumentFileName <String>] [-Set] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```

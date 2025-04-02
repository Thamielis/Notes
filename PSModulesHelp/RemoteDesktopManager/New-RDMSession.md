New-RDMSession
--------------

### Synopsis
Create a new session instance.

---

### Description

Create a new session instance. The instance has not yet been saved. Assign the result to a variable then call "Set-RDMSession $s" to save the session.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

* [Set-RDMDataSource](Set-RDMDataSource)

* [Set-RDMSession](Set-RDMSession)

* [Remove-RDMSession](Remove-RDMSession)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $session = New-RDMSession -Name "New Session" -Host "myServer" -Type "RDPConfigured";Set-RDMSession $session
Create & save new session.
```

---

### Parameters
#### **DocumentAttachment**
New document attachement.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[PSConnectionAttachment]`|false   |7       |false        |

#### **DocumentFileName**
New document file name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Group**
Session group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Host**
New Session host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Name**
New PSSession name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **SetSession**
Save the session in the current data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |4       |false        |

#### **TemplateID**
Create PSSession from template.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |5       |false        |

#### **Type**
New session kind. Must be on of the following:
"ADConsole", "AddOn", "AppleRemoteDesktop", "ApplicationTool", "Aws", "Azure", "AzureQueueStorage", "AzureStorage", "BeyondTrustPasswordSafeConsole", "ChromeRemoteDesktop"CitrixWeb", "CommandLine", "Computer", "Contact", "ControlUp", "Credential", "Customer", "CyberArkJump", "CyberArkPSM", "Dameware", "Database", "DataEntry", "DataReport", "DataSource", "DeskRoll", "Desktone", "DevolutionsProxy", "Document", "DropBox", "FileExplorer", "Ftp", "FtpNative", "Gateway", "Group", "Host", "HpRgs", "HyperV", "ICA", "IDrac", "Ilo", "IntelAMT", "InventoryReport", "Iterm", "LogMeIn", "PCAnywhere", "PlayList", "PortForward", "PowerShell", "PowerShellRemoteConsole", "ProxyTunnel", "PSExec", "Putty", "Radmin", "RDCommander", "RDPConfigured", "RDPFilename", "ResetPassword", "S3", "Scp","ScreenConnect", "ScreenHero", "SecureCRT",  "Serial",  "SessionTool" , "Sftp" , "Sheet" , "SkyDrive", "SNMPReport"),"Spiceworks", "Splunk", "SSHShell", "SSHTunnel", "Sync", "TeamViewer", "TeamViewerConsole", "Telnet",""TemplateGroup", "TerminalConsole", "TFtp","VirtualBox", "VirtualPC", "VMRC", "VMWare", "VMWareConsole", "VNC", "VPN", "Wayk", "WaykDenConsole", "WebBrowser", , "WebDav", "WindowsAdminCenter", "WindowsVirtualPC", "XenServer",  "XWindow"
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

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |8       |false        |ConnectionType|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help New-RDMSession -detailed". For technical information, type "Get-Help New-RDMSession -full".

---

### Syntax
```PowerShell
New-RDMSession [[-Name] <String>] [[-Type] <String>] [[-Host] <String>] [[-Group] <String>] [[-DocumentAttachment] <PSConnectionAttachment>] [[-DocumentFileName] <String>] [[-TemplateID] <Guid>] [[-SetSession]] [<CommonParameters>]
```

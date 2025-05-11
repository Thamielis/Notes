New-RDMTemplate
---------------

### Synopsis
Create a new template instance.

---

### Description

Create a new template instance. The instance has not yet been saved. Assign the result to a variable then call "Set-RDMTemplate $s" to save the template.

---

### Related Links
* [Get-RDMTemplate](Get-RDMTemplate)

* [Set-RDMTemplate](Set-RDMTemplate)

* [Remove-RDMTemplate](Remove-RDMTemplate)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $session = New-RDMTemplate -Destination Database -Name "New Template"-Type "RDPConfigured";Set-RDMTemplate $template
Create & save new session.
```

---

### Parameters
#### **Destination**
Template destination
Valid Values:

* Local
* Database

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Name**
New PSSession name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetTemplate**
Save the session in the current data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |5       |false        |

#### **Type**
New session kind. Must be on of the following:
"ADConsole", "AddOn", "AppleRemoteDesktop", "ApplicationTool", "Aws", "Azure", "AzureQueueStorage", "AzureStorage", "BeyondTrustPasswordSafeConsole", "ChromeRemoteDesktop"CitrixWeb", "CommandLine", "Computer", "Contact", "ControlUp", "Credential", "Customer", "Dameware", "Database", "DataEntry", "DataReport", "DataSource", "DeskRoll", "Desktone", "DevolutionsProxy", "Document", "DropBox", "Ftp", "Gateway", "Group", "Host", "HpRgs", "HyperV", "ICA", "IDrac", "Ilo", "IntelAMT", "InventoryReport", "Iterm", "LogMeIn", "PCAnywhere", "PlayList", "PortForward", "PowerShell", "PowerShellRemoteConsole", "ProxyTunnel", "PSExec", "Putty", "Radmin", "RDCommander", "RDPConfigured", "RDPFilename", "ResetPassword", "S3", "ScreenConnect", "ScreenHero", "SecureCRT",  "Serial",  "SessionTool" , "Sheet" , "SkyDrive", "SNMPReport"),"Spiceworks", "Splunk", "SSHShell", "SSHTunnel", "Sync", "TeamViewer", "TeamViewerConsole", "Telnet",""TemplateGroup", "TerminalConsole", "VirtualBox", "VirtualPC", "VMRC", "VMWare", "VMWareConsole", "VNC", "VPN", "Wayk", "WebBrowser", , "WebDav", "WindowsVirtualPC", "XenServer",  "XWindow"
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
* Ftp
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
* ScreenConnect
* ScreenHero
* SecureCRT
* Serial
* SessionTool
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
* VirtualBox
* VirtualPC
* VMRC
* VMWare
* VMWareConsole
* VNC
* VPN
* Wayk
* WebBrowser
* WebDav
* WindowsVirtualPC
* XenServer
* XWindow

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|true    |3       |false        |ConnectionType|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTemplate

---

### Notes
For more information, type "Get-Help New-RDMTemplate -detailed". For technical information, type "Get-Help New-RDMTemplate -full".

---

### Syntax
```PowerShell
New-RDMTemplate [-Name] <String> [-Type] <String> [[-SetTemplate]] [-Destination] <String> [<CommonParameters>]
```

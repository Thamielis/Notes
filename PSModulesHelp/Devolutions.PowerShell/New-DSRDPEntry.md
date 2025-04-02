New-DSRDPEntry
--------------

### Synopsis
Create a new RDP entry.

---

### Description

Create a new RDP entry with the parameters supplied. All fields have a default value corresponding to those of Remote Desktop Manager.

---

### Related Links
* [New-DSEntryBase](New-DSEntryBase)

* [New-DSCredentialEntry](New-DSCredentialEntry)

* [New-DSSSHShellEntry](New-DSSSHShellEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $NewRDPEntry = @{
        VaultId                                  = ([guid]::Empty)
        Name                                     = 'rootlocal '
        Username                                 = 'root'
        Password                                 = 'Pa$$w0rd!'
        Group                                    = 'Powershell rules'
        credentialViewedCommentIsRequired        = $true
        credentialViewedPrompt                   = $true
        ticketNumberIsRequiredOnCredentialViewed = $true
        checkOutMode                             = 'Default'
        Description                              = 'This is a description'
        Tags                                     = '1 2 3 4 5'
        HostName                                 = 'TBD'
    };
                
    New-DSRDPEntry @NewRDPEntry
Create a new RDP entry.
```

---

### Parameters
#### **AdminMode**
Open the administration console

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AfterLoginDelay**
Delay (in miliseconds) to launch application after login. 500 ms by default. Must be betwen 0 and 60000.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **AfterLoginProgram**
Path (including filename) of application to launch in alternate shell

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **AlternateShell**
Path (including filename) of application to launch in alternate shell

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Animations**
Enable animations

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AudioCaptureRedirectionMode**
ecord audio from RDP session. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **AudioQualityMode**
RDP Audio Quality. Dynamic by default.
Valid Values:

* Dynamic
* High
* Medium
* Default

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[RDPAudioQualityMode]`|false   |named   |false        |

#### **AutoReconnection**
Enable automatic reconnection if RDP drop. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **AzureInstanceID**
Azure Cloud Service's instance ID

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **BandwidthAutoDetect**
Enable bandwith autodetection. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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

#### **ClientSpec**
Cache specifications
Valid Values:

* Default
* FullMode
* ThinClientMode
* SmallCacheMode

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[RDPClientSpec]`|false   |named   |false        |

#### **CloseCommentIsRequired**
A comment is required on close

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CloseCommentPrompt**
Prompt the user for comment/ticket number on close

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **DataCompression**
Enable data compression. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Description**
Entry's description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DesktopBackground**
Enable desktop background. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **DesktopComposition**
Enable desktop composition

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisplayMode**
Display mode used by RDP. Embedded by default.
Valid Values:

* External
* Embedded
* Default
* Unknown
* Undocked

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ConnectionDisplayMode]`|false   |named   |false        |

#### **DisplayMonitor**
Display monitor used by RDP. Primary by default.
Valid Values:

* Primary
* Secondary
* Current
* Configured
* Default
* First
* Second
* Third
* Fourth
* Fifth
* Sixth
* PromptOnConnection

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DisplayMonitor]`|false   |named   |false        |

#### **DisplayVirtualDesktop**
Virtual desktop used by RPD. Current by default
Valid Values:

* Current
* Default
* First
* Second
* Third
* Fourth
* Fifth
* Sixth
* PromptOnConnection

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[DisplayVirtualDesktop]`|false   |named   |false        |

#### **Domain**
Domain's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Expiration**
Entry's expiration date (ISO-8601 format (yyyy-mm-ddThh:mm:ss.000Z)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontSmoothing**
Enable font smoothing

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Group**
Entry's location in the vault (folder name, not ID)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **HostName**
RDP's host name (Address)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **HyperVInstance**
Hyper-V Instance

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **KeepAliveInternal**
Keep alive. 1000 by default.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **KeyboardHook**
Sets the destination for Windows key combinations (ALT+TAB, for example)
Valid Values:

* OnTheLocalComputer
* InFullScreenMode
* OnTheRemoteComputer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LoadAddonsMode**
Sets if addons load in embedded or not.
Valid Values:

* Default
* True
* False

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DefaultBoolean]`|false   |named   |false        |

#### **MnemonicPassword**
Ignored. Entry's mnemonic password to help remembering the password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Name**
Entry's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **NetworkAutoDetect**
Enable network autodetection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NetworkConnectionType**
Connection speed to use for RDP

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NewFieldsList**
Fields to add

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Field[]]`|false   |named   |false        |

#### **OpenCommentIsRequired**
A comment is required on open

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OpenCommentPrompt**
Prompt the user for comment/ticket number on open

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Password**
Entry's password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **PersistentBitmapCaching**
Enable persistent bitmap caching. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Port**
Port used by RDP. 3389 by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PromptCredentials**
Prompt for password when checkout

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RDPType**
RDP Type. Normal by default.
Valid Values:

* Normal
* Azure
* HyperV

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[RDPType]`|false   |named   |false        |

#### **RedirectDirectX**
Enable DirectX redirection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RedirectVideoPlayback**
Enable video playback redirection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoteApplicationCmdLine**
Parameters for the remote application

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemoteApplicationProgram**
Path (including filename and extension) of application to launch

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RoleName**
Azure Cloud Services role name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ShellWorkingDirectory**
Path for alternate shell directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ShowContentWhileDragging**
Enable content showing while dragging across screen. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SoundHook**
Choose destination for sounds. BringToThisComputer by default.
Valid Values:

* BringToThisComputer
* DoNotPlay
* LeaveAtRemoteComputer
* Default

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[SoundHook]`|false   |named   |false        |

#### **Tags**
Entry's tags (keywords). Each word separated by a space is considered a keyword.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TicketNumberIsRequiredOnClose**
A ticket number is required on close

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TicketNumberIsRequiredOnCredentialViewed**
A ticket number is required to view entry's credentials

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TicketNumberIsRequiredOnOpen**
A ticket number is required on open

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseEnhancedSessionMode**
Hyper-V enhanced session (Uses machine's local resources, such as USB drive or printer)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Username**
Entry's username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **UsesClipboard**
RDP access to clipboard. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UsesDevices**
RDP access to "devices" (Such as cameras...)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UsesHardDrives**
RDP access to hard drives. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UsesPrinters**
RDP access to printers

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UsesSerialPorts**
RDP access to serial ports. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **UsesSmartDevices**
RDP access to smart devices

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultID**
Entry's vault ID.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |5       |false        |

#### **VisualStyles**
Enable visual styles. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **WarnIfAlreadyOpened**
Warns the user if RDP session is already opened

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSRDPEntry -detailed". For technical information, type "Get-Help New-DSRDPEntry -full".

---

### Syntax
```PowerShell
New-DSRDPEntry -Name <String> [[-Domain] <String>] [[-Username] <String>] [[-Password] <String>] [[-MnemonicPassword] <String>] [[-VaultID] <Guid>] [[-Group] <String>] [-PromptCredentials] [-Description <String>] [-Tags <String>] [-Expiration <String>] [-WarnIfAlreadyOpened] [-CredentialViewedCommentIsRequired] [-TicketNumberIsRequiredOnCredentialViewed] [-CredentialViewedPrompt] [-OpenCommentPrompt] [-OpenCommentIsRequired] [-TicketNumberIsRequiredOnOpen] [-CloseCommentPrompt] [-CloseCommentIsRequired] [-TicketNumberIsRequiredOnClose] [-CheckoutMode <Default | NotSupported | Automatic | Manual | Inherited | Optional | AutomaticWhenAvailable>] [-AllowOffline <Default | True | False | Inherited>] -HostName <String> [-AdminMode] [-Port <String>] [-RDPType <Normal | Azure | HyperV>] [-RoleName <String>] [-AzureInstanceID <Int32>] [-HyperVInstance <String>] [-UseEnhancedSessionMode] [-UsesClipboard <Boolean>] [-UsesDevices] [-UsesHardDrives <Boolean>] [-UsesPrinters] [-UsesSerialPorts <Boolean>] [-UsesSmartDevices] [-SoundHook <BringToThisComputer | DoNotPlay | LeaveAtRemoteComputer | Default>] [-AudioQualityMode <Dynamic | High | Medium | Default>] [-AudioCaptureRedirectionMode <Boolean>] [-KeyboardHook <OnTheLocalComputer | InFullScreenMode | OnTheRemoteComputer>] [-AlternateShell <String>] [-ShellWorkingDirectory <String>] [-AfterLoginProgram <String>] [-AfterLoginDelay <Int32>] [-RemoteApplicationProgram <String>] [-RemoteApplicationCmdLine <String>] [-NetworkConnectionType <String>] [-DesktopBackground <Boolean>] [-FontSmoothing] [-DesktopComposition] [-Animations] [-VisualStyles <Boolean>] [-NetworkAutoDetect] [-AutoReconnection <Boolean>] [-RedirectDirectX] [-RedirectVideoPlayback] [-ShowContentWhileDragging <Boolean>] [-DataCompression <Boolean>] [-PersistentBitmapCaching <Boolean>] [-BandwidthAutoDetect <Boolean>] [-LoadAddonsMode <Default | True | False>] [-ClientSpec <Default | FullMode | ThinClientMode | SmallCacheMode>] [-KeepAliveInternal <Int32>] [-DisplayMode <Embedded | External | Undocked>] [-DisplayMonitor <Primary | Secondary | Current | Configured | Default | First | Second | Third | Fourth | Fifth | Sixth | PromptOnConnection>] [-DisplayVirtualDesktop <Current | Default | First | Second | Third | Fourth | Fifth | Sixth | PromptOnConnection>] [-NewFieldsList <Field[]>] [-AsLegacyResponse] [<CommonParameters>]
```

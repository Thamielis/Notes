New-DSSSHShellEntry
-------------------

### Synopsis
Create a new SSH Shell entry.

---

### Description

Create a new SSH Shell entry using supplied parameters. New fields in RDM are automatically supported with the 'NewFieldsList' parameter

---

### Related Links
* [New-DSEntryBase](New-DSEntryBase)

* [New-DSCredentialEntry](New-DSCredentialEntry)

* [New-DSRDPEntry](New-DSRDPEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $parameters = @{
        Name        = 'TestSSHShell'
        HostName    = 'hostname'
        Username    = 'username'
        Password    = 'Pa$$w0rd!'
        VaultID     = '00000000-0000-0000-0000-000000000000'
        Tags        = 'Test "SSH Shell"'
        Group       = 'Powershell rules'
        }

        New-DSSSHShellEntry @parameters
Create a new SSH entry.
```

---

### Parameters
#### **AfterConnectMacroDelay**
Delay in ms before starting after-connection macros. The default value is the minimal one, 500 ms.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **AfterConnectMacroEnterAfterCommand**
If it should send 'Enter' input after entering an after-connection macro. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **AfterConnectMacros**
Macros to run after connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AlwaysAskForPassword**
If it should always ask for password when checking out

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoWrap**
Toggle terminal autowrapping
Valid Values:

* Default
* On
* Off

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[TerminalAutoWrap]`|false   |named   |false        |

#### **BackspaceKeyMode**
Keyboard backspace key mode (Default/Control-H/Control-? (ASCII code 127))
Valid Values:

* Default
* ControlH
* ControlQuestionMark

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[TerminalBackspaceKeyMode]`|false   |named   |false        |

#### **BeforeDisconnectMacro**
Macros to run before disconnect

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BeforeDisconnectMacroDelay**
Delay in ms before starting before-disconnect macro. The default value is the minimal one, 500 ms.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **BeforeDisconnectMacroEnterAfterCommand**
If it should send 'Enter' input after entering a before-disconnect macro. True by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **BellMode**
Select bell mode behavior (Default/None/Sound/Visual)
Valid Values:

* Default
* None
* Sound
* Visual
* ChangeTabColor

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[TerminalBellMode]`|false   |named   |false        |

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

#### **CursorBlink**
Toggle terminal cursor blink
Valid Values:

* Default
* On
* Off

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[TerminalCursorBlink]`|false   |named   |false        |

#### **CursorKeyMode**
Keyboard cursor key mode (Default/Normal/Application)
Valid Values:

* Default
* Normal
* Application

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[TerminalCursorKeyMode]`|false   |named   |false        |

#### **CursorType**
Select terminal cursor type (Block/Underline/Vertical line)
Valid Values:

* Default
* Block
* Underline
* VerticalLine

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[TerminalCursorType]`|false   |named   |false        |

#### **Description**
Entry's description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DisableKeypadMode**
Disable terminal application keypad mode
Valid Values:

* Default
* True
* False

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DefaultBoolean]`|false   |named   |false        |

#### **DisplayMode**
Display mode used by SSH Shell. Embedded by default.
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
Display monitor used by SSH Shell. Primary by default.
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
Virtual desktop used by SSH Shell.
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

#### **DoubleClickDelimiters**
Delemiters for double-clicking in terminal

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Encoding**
Select terminal encoding
Valid Values:

* Default
* UseFontEncoding
* UTF_8
* ISO_8859_1
* ISO_8859_2
* ISO_8859_3
* ISO_8859_4
* ISO_8859_5
* ISO_8859_6
* ISO_8859_7
* ISO_8859_8
* ISO_8859_9
* ISO_8859_10
* ISO_8859_11
* ISO_8859_13
* ISO_8859_14
* ISO_8859_15
* ISO_8859_16
* KOI8_U
* KOI8_R
* HP_ROMAN8
* VSCII
* DEC_MCS
* Win1250
* Win1251
* Win1252
* Win1253
* Win1254
* Win1255
* Win1256
* Win1257
* Win1258
* CP437
* CP620
* CP819
* CP852
* CP878
* CP932
* EUCJP
* CP936

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[TerminalEncoding]`|false   |named   |false        |

#### **FontMode**
Select font mode (Default/Override)
Valid Values:

* Default
* Override

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[TerminalFontMode]`|false   |named   |false        |

#### **ForceNonDestructiveBackspace**
Force non-destructive backspaces (Disable character 127)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FunctionKeyMode**
Keyboard fn key mode
Valid Values:

* Default
* EscN
* Linux
* XtermR6
* VT400
* VT100Plus
* SCO
* Common
* Alternative
* HpUx
* Linux220
* LinuxAlternative
* Pick
* VT52
* Wyse
* Xterm

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[TerminalFunctionKeysMode]`|false   |named   |false        |

#### **Group**
Entry's location in the vault (folder name, not ID)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HomeEndKeyMode**
Keyboard home/end key mode (Default/Standard/RXVT)
Valid Values:

* Default
* Standard
* Rxvt

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[TerminalHomeEndKeyMode]`|false   |named   |false        |

#### **HostName**
Entry's hostname

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HostPort**
Entry's host port. 22 by default.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ImplicitCRinLF**
Convert CR to LF

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ImplicitLFinCR**
Convert LF to CR

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InitialKeypadMode**
Terminal's initial keypad mode (Default/Enable (Application in Putty)/Disable (Normal in Putty))
Valid Values:

* Default
* Enable
* Disable

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[TerminalKeypadMode]`|false   |named   |false        |

#### **LocalEcho**
Toggle terminal local echo
Valid Values:

* Default
* Auto
* On
* Off

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[TerminalLocalEcho]`|false   |named   |false        |

#### **MaxScrollbackLines**
Terminal max scrollback lines. 2000 lines by default.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Name**
Entry's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

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

#### **OverrideTerminalName**
Override terminal type

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Password**
Entry's password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
Private key type. The default type is NoKey.
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

#### **ProxyDNSLookupType**
Proxy DNS lookup mode. Automatic by default.
Valid Values:

* Automatic
* Yes
* No

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[TelnetTerminalDnsLookupType]`|false   |named   |false        |

#### **ProxyExcludedHosts**
Proxy excluded hosts

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProxyHost**
Proxy Hostname

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProxyHostPort**
Proxy host port

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProxyLocalHostConnections**
Proxy localhost connections

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProxyMode**
Proxy mode (Only None/custom supported)
Valid Values:

* None
* Link
* Custom

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[ProxyMode]`|false   |named   |false        |

#### **ProxyPassword**
Proxy password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProxyTelnetCommand**
Telnet/local proxy command (blank for default)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProxyType**
Proxy type. Socks5 by default.
Valid Values:

* Socks5
* Socks4
* Http

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProxyUsername**
Proxy username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemoteCommand**
Ignored. Absolute path of the application on the remote computer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Tags**
Entry's tags (keywords). Each word separated by a space is considered a keyword.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|false   |named   |false        |Keywords|

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

#### **Username**
Entry's username

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VaultID**
Entry's vault ID.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

#### **WarnIfAlreadyOpened**
Warns the user if session is already opened

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
For more information, type "Get-Help New-DSSSHShellEntry -detailed". For technical information, type "Get-Help New-DSSSHShellEntry -full".

---

### Syntax
```PowerShell
New-DSSSHShellEntry [-Group <String>] -Name <String> [-Password <String>] [-Description <String>] [-Tags <String>] [-DisplayMode <Embedded | External>] [-DisplayMonitor <Primary | Secondary | Current | Configured | Default | First | Second | Third | Fourth | Fifth | Sixth | PromptOnConnection>] [-DisplayVirtualDesktop <Current | Default | First | Second | Third | Fourth | Fifth | Sixth | PromptOnConnection>] [-VaultID <Guid>] [-AlwaysAskForPassword] [-Username <String>] [-PrivateKeyType <Data | NoKey>] [-PrivateKeyPath <String>] [-PrivateKeyPassphrase <String>] [-PromptForPassphrase] [-HostName <String>] [-HostPort <Int32>] [-AfterConnectMacroDelay <Int32>] [-AfterConnectMacros <String>] [-AfterConnectMacroEnterAfterCommand <Boolean>] [-BeforeDisconnectMacroDelay <Int32>] [-BeforeDisconnectMacro <String>] [-BeforeDisconnectMacroEnterAfterCommand <Boolean>] [-OverrideTerminalName <String>] [-Encoding <Default | UseFontEncoding | UTF_8 | ISO_8859_1 | ISO_8859_2 | ISO_8859_3 | ISO_8859_4 | ISO_8859_5 | ISO_8859_6 | ISO_8859_7 | ISO_8859_8 | ISO_8859_9 | ISO_8859_10 | ISO_8859_11 | ISO_8859_13 | ISO_8859_14 | ISO_8859_15 | ISO_8859_16 | KOI8_U | KOI8_R | HP_ROMAN8 | VSCII | DEC_MCS | Win1250 | Win1251 | Win1252 | Win1253 | Win1254 | Win1255 | Win1256 | Win1257 | Win1258 | CP437 | CP620 | CP819 | CP852 | CP878 | CP932 | EUCJP | CP936>] [-AutoWrap <Default | On | Off>] [-LocalEcho <Default | Auto | On | Off>] [-InitialKeypadMode <Default | Enable | Disable>] [-DisableKeypadMode <Default | True | False>] [-CursorType <Default | Block | Underline | VerticalLine>] [-CursorBlink <Default | On | Off>] [-ForceNonDestructiveBackspace] [-ImplicitCRinLF] [-ImplicitLFinCR] [-MaxScrollbackLines <Int32>] [-DoubleClickDelimiters <String>] [-FontMode <Default | Override>] [-BellMode <Default | None | Sound | Visual | ChangeTabColor>] [-RemoteCommand <String>] [-CursorKeyMode <Default | Normal | Application>] [-BackspaceKeyMode <Default | ControlH | ControlQuestionMark>] [-HomeEndKeyMode <Default | Standard | Rxvt>] [-FunctionKeyMode <Default | EscN | Linux | XtermR6 | VT400 | VT100Plus | SCO | Common | Alternative | HpUx | Linux220 | LinuxAlternative | Pick | VT52 | Wyse | Xterm>] [-ProxyMode <None | Custom>] [-ProxyType <Socks5 | Socks4 | Http>] [-ProxyHost <String>] [-ProxyHostPort <String>] [-ProxyUsername <String>] [-ProxyPassword <String>] [-ProxyLocalHostConnections <String>] [-ProxyExcludedHosts <String>] [-ProxyDNSLookupType <Automatic | Yes | No>] [-ProxyTelnetCommand <String>] [-WarnIfAlreadyOpened] [-CredentialViewedCommentIsRequired] [-TicketNumberIsRequiredOnCredentialViewed] [-CredentialViewedPrompt] [-OpenCommentPrompt] [-OpenCommentIsRequired] [-TicketNumberIsRequiredOnOpen] [-CloseCommentPrompt] [-CloseCommentIsRequired] [-TicketNumberIsRequiredOnClose] [-NewFieldsList <Field[]>] [-AsLegacyResponse] [<CommonParameters>]
```

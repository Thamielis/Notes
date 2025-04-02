Connect-NaController
--------------------

### Synopsis
Establish a connection to a Data ONTAP storage controller.

---

### Description

Establish a connection to a Data ONTAP storage controller.  Unless 'Transient' is true, this connection is saved in the global variable CurrentNaController.  All other cmdlets in the Data ONTAP PowerShell Toolkit utilize this global variable if their 'Controller' parameter is not explicitly provided.

Connections are established using RPC by default.  To use HTTPS (with automatic fallback to HTTP), supply the Credential parameter (see examples) or save credentials in the Toolkit credentials cache.

Use the RPC/HTTP/HTTPS parameters to limit connections to a specific protocol.

Use the Vfiler parameter to initiate a connection to a vfiler context.

---

### Related Links
* [Find-NaController](Find-NaController)

* [Initialize-NaController](Initialize-NaController)

* [Add-NaCredential](Add-NaCredential)

---

### Examples
> Example 1

```PowerShell
Connect-NaController 10.61.167.61
Connect to controller at address '10.61.167.61' using RPC.

Ontapi             : 1.12
OntapiMajorVersion : 1
OntapiMinorVersion : 12
Version            : NetApp Release 7.3.3: Thu Mar 11 22:29:52 PST 2010
Protocol           : RPC
Proxy              :
TimeoutMsec        : 10000
Vfiler             :
Name               : 10.61.167.61
Address            : 10.61.167.61
Port               : 0
Credentials        :
ValidateIncoming   : False
ValidateOutgoing   : False
Trace              : False

```
> Example 2

```PowerShell
Connect-NaController dunn -Credential (Get-Credential)
Connect to controller 'dunn' using HTTPS/HTTP.  PowerShell will prompt for credentials.

Ontapi             : 1.12
OntapiMajorVersion : 1
OntapiMinorVersion : 12
Version            : NetApp Release 7.3.3: Thu Mar 11 22:29:52 PST 2010
Protocol           : HTTPS
Proxy              :
TimeoutMsec        : 10000
Vfiler             :
Name               : dunn
Address            : 10.61.167.60
Port               : 443
Credentials        : System.Net.NetworkCredential
ValidateIncoming   : False
ValidateOutgoing   : False
Trace              : False

```
> Example 3

```PowerShell
Connect-NaController dunn -Vfiler vfiler1
Connect to vfiler 'vfiler1' on controller 'dunn' using RPC.

Ontapi             : 1.12
OntapiMajorVersion : 1
OntapiMinorVersion : 12
Version            : NetApp Release 7.3.3: Thu Mar 11 22:29:52 PST 2010
Protocol           : RPC
Proxy              :
TimeoutMsec        : 10000
Vfiler             : vfiler1
Name               : dunn
Address            : 10.61.167.60
Port               : 0
Credentials        :
ValidateIncoming   : False
ValidateOutgoing   : False
Trace              : False

```
> Example 4

```PowerShell
$password = ConvertTo-SecureString "p@ssword" -AsPlainText –Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "root",$password
Connect-NaController benson -Credential $cred
Connect to controller 'benson' using HTTP/HTTPS but suppress the credential prompt by creating a PSCredential object programmatically.

Ontapi             : 1.12
OntapiMajorVersion : 1
OntapiMinorVersion : 12
Version            : NetApp Release 7.3.3: Thu Mar 11 22:29:52 PST 2010
Protocol           : HTTPS
Proxy              :
TimeoutMsec        : 10000
Vfiler             :
Name               : benson
Address            : 10.61.167.61
Port               : 443
Credentials        : System.Net.NetworkCredential
ValidateIncoming   : False
ValidateOutgoing   : False
Trace              : False

```

---

### Parameters
#### **Name**
The name of the storage controller.  This value may also be a string representation of an IP address.  If not an address, the name must be resolvable to an address.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Filer  |

#### **Port**
The port on which to connect to the storage controller.  If not set, it defaults to 80 for HTTP and 443 for HTTPS.  This parameter only applies to HTTP/HTTPS protocols.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **Credential**
A System.Management.Automation.PSCredential object containing the credentials needed to log into the storage controller.  Specify this value to default to using HTTP/HTTPS instead of RPC.

|Type            |Required|Position|PipelineInput        |Aliases       |
|----------------|--------|--------|---------------------|--------------|
|`[PSCredential]`|false   |named   |true (ByPropertyName)|Cred<br/>Creds|

#### **HTTPS**
When using HTTP/HTTPS, this cmdlet always tries to establish a secure HTTPS connection to the storage controller, but it will fall back to HTTP if necessary.  Specify -HTTPS to fail the connection attempt in that case rather than fall back to HTTP.

|Type      |Required|Position|PipelineInput|Aliases                       |
|----------|--------|--------|-------------|------------------------------|
|`[Switch]`|false   |named   |false        |Secure<br/>ForceSecure<br/>SSL|

#### **HTTP**
When using HTTP/HTTPS, this cmdlet always tries to establish a secure HTTPS connection to the storage controller, but it will fall back to HTTP if necessary.  Specify -HTTP to skip the HTTPS connection attempt and only try HTTP.

|Type      |Required|Position|PipelineInput|Aliases                             |
|----------|--------|--------|-------------|------------------------------------|
|`[Switch]`|false   |named   |false        |Unsecure<br/>ForceUnsecure<br/>NoSSL|

#### **RPC**
Specify -RPC to limit the connection protocol to RPC, even if valid credentials are available.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Switch]`|false   |named   |false        |ForceRPC|

#### **Transient**
Set to true to prevent setting the global variable CurrentNaController.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Vfiler**
Name of vfiler to tunnel commands to.  If not specified, all commands are sent to the physical filer.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Timeout**
Connection timeout in milliseconds.  Only applies to HTTP/HTTPS connections.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* NetApp.Ontapi.Filer.NaController

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Connect-NaController [-Name] <String> [-Port <UInt16>] [-Credential <PSCredential>] [-HTTPS] [-HTTP] [-RPC] [-Transient] [-Vfiler <String>] [-Timeout <Int32>] [<CommonParameters>]
```

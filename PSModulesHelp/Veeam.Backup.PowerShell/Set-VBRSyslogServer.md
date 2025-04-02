Set-VBRSyslogServer
-------------------

### Synopsis
Modifies the existing syslog server settings.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet modifies the existing syslog server settings.
Note: To modify settings, specify new values for the necessary parameters. This cmdlet will overwrite the previous parameter values with the new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRSyslogServer](Get-VBRSyslogServer)

---

### Examples
> Modifying Protocol for Syslog Server

$server = Get-VBRSyslogServer
Set-VBRSyslogServer -Server $server -Protocol Tcp
This example shows how to modify the existing syslog server settings to use Tcp protocol.
Perform the following steps:
1. Run the Get-VBRSyslogServer cmdlet. Save the result to the $server variable.
2. Run the Set-VBRSyslogServer cmdlet. Set the $server variable as the Server parameter value. Specify the Tcp value as the Protocol parameter value.

---

### Parameters
#### **CertificateThumbprint**
Specifies the certificate thumbprint.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Port**
Specifies the port number that Veeam Backup & Replication will use to send messages.
Default: 514 for UDP, 514 for TCP, 6514 for TLS.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Protocol**
Specifies the transport that Veeam Backup & Replication will use: Udp, Tcp, Tls.
Use the CertificateThumbprint parameter to specify the certificate thumbprint for Tls transport.
Valid Values:

* Udp
* Tcp
* Tls

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRSyslogServerProtocol]`|false   |named   |False        |

#### **Server**
Specifies the syslog server you want to modify.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[VBRSyslogServer]`|true    |named   |True (ByValue)|

#### **ServerHost**
Specifies an IPv4 address or DNS name of the syslog server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSyslogServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSyslogServer [-CertificateThumbprint <String>] [-Port <Int32>] [-Protocol {Udp | Tcp | Tls}] -Server <VBRSyslogServer> [-ServerHost <String>] [<CommonParameters>]
```

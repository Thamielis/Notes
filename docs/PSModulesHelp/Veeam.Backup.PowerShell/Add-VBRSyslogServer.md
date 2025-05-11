Add-VBRSyslogServer
-------------------

### Synopsis
Adds a syslog server to Veeam Backup & Replication.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet adds a syslog server to manage Veeam Backup & Replication events.
Note: You can specify only one syslog server for one Veeam Backup & Replication server.

---

### Examples
> Adding Syslog Server

Add-VBRSyslogServer -ServerHost "172.17.53.28" -Port 514 -Protocol Udp
This command add a syslog server with the following settings:
- The IP address of the server is 172.17.53.28.
- The port that the syslog server uses is set to 514.
- The protocol is set to Udp.

---

### Parameters
#### **CertificateThumbprint**
Specifies the certificate thumbprint.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Port**
Specifies the port number that the syslog server uses to send messages.
Default: 514 for UDP, 514 for TCP, 6514 for TLS.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **Protocol**
Specifies the protocol that the syslog server uses: Udp, Tcp, Tls.
Use the CertificateThumbprint parameter to specify the certificate thumbprint for the Tls protocol.
Valid Values:

* Udp
* Tcp
* Tls

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRSyslogServerProtocol]`|true    |named   |False        |

#### **ServerHost**
Specifies an IPv4 address or DNS name of the syslog server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRSyslogServer [-CertificateThumbprint <String>] -Port <Int32> -Protocol {Udp | Tcp | Tls} -ServerHost <String> [<CommonParameters>]
```

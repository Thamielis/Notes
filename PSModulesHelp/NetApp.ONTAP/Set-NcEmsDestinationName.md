Set-NcEmsDestinationName
------------------------

### Synopsis
Updates an event destination.

---

### Description

Modifies an existing event destination. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcEmsDestinationName](Get-NcEmsDestinationName)

---

### Examples
> Example 1

```PowerShell
Set-NcEmsDestinationName -Name New1 -Destination 10.237.110.201 -SyslogPort 502 -SyslogTransport tcp_encrypted
Name            : New1
Destination     : 10.237.110.201
SyslogPort      : 502
SyslogTransport : tcp_encrypted
NcController    : 10.237.145.102
Certificate     :
Connectivity    : DataONTAP.C.Types.Ems.Connectivity
FilterName      : {important-events}
SystemDefined   : False
Type            : syslog

```

---

### Parameters
#### **Name**
Name of the Destination.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |0       |true (ByPropertyName)|DestinationName|

#### **CertificateCA**
Client certificate issuing CA.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CertificateSerialNummer**
Client certificate serial number.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Destination**
Name of the event destination.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SyslogPort**
Syslog port.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **SyslogTransport**
Syslog Transport Protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsDestinationNameOutput

---

### Notes
Category: Ems
Api: api/support/ems/destinations/{name}
Family: Controller

---

### Syntax
```PowerShell
Set-NcEmsDestinationName [-Name] <String> [-CertificateCA <String>] [-CertificateSerialNummer <String>] [-Destination <String>] [-SyslogPort <Int64>] [-SyslogTransport <String>] 
```
```PowerShell
[<CommonParameters>]
```

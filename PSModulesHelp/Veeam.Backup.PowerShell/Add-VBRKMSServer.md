Add-VBRKMSServer
----------------

### Synopsis
Adds KMS servers to the Veeam Backup & Replication console.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet adds a Key Management System server (KMS server) to the Veeam Backup & Replication console.
For more information on working with KMS servers, see the Key Management System Keys section in the Veeam Backup & Replication User Guide.
IMPORTANT! Before you run this cmdlet, you must get the certificate either from a file or from the certificates store.

---

### Examples
> Adding KMS Server to Veeam Backup & Replication Console

Add-VBRKMSServer -Name "thales.tech.local" -Port 5696 -CACertificate $ClientCertificate -ClientCertificate $ClientCertificate
This command adds the thales.tech.local server to the Veeam Backup & Replication console.

---

### Parameters
#### **CACertificate**
Specifies the KMS server certificate.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[X509Certificate2]`|true    |named   |False        |

#### **ClientCertificate**
Specifies the client certificate issued by the KMS administrator for Veeam Backup & Replication.
Note: The client certificate must contain a private key and be exportable.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[X509Certificate2]`|true    |named   |False        |

#### **Description**
Specifies description of the KMS server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the FQDN, IPv4 or IPv6 address of the KMS server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Port**
Specifies a port number to connect to the KMS server.
Deafult: 5696

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Add-VBRKMSServer -CACertificate <X509Certificate2> -ClientCertificate <X509Certificate2> [-Description <String>] -Name <String> [-Port <Int32>] [<CommonParameters>]
```

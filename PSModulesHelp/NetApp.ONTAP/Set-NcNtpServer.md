Set-NcNtpServer
---------------

### Synopsis
Modify a configuration for an external time server used by NTP.

---

### Description

Modify a configuration for an external time server used by NTP.

---

### Related Links
* [Get-NcNtpServer](Get-NcNtpServer)

* [Reset-NcNtpServer](Reset-NcNtpServer)

* [Test-NcNtpServer](Test-NcNtpServer)

* [Remove-NcNtpServer](Remove-NcNtpServer)

---

### Examples
> Example 1

Set-NcNtpServer -ServerName 10.72.211.100 -Version 3
Set the ntp server's version to 3

ServerName                               Version    IsPreferred    HasDefaultPublicNtpServer
----------                               -------    -----------    -------------------------
10.72.211.100                            3          True           False

---

### Parameters
#### **ServerName**
Host name, IPv4 address or IPv6 address for the external NTP time server

|Type      |Required|Position|PipelineInput        |Aliases                                         |
|----------|--------|--------|---------------------|------------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|NtpServer<br/>Name<br/>Address<br/>ServerAddress|

#### **Version**
NTP protocol version which can be '3', '4' or 'auto'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **IsPreferred**
Specify to set the server as preferred time source.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **IsAuthenticationEnabled**
Specifies if symmetric key authentication is in use for this time server.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **KeyId**
Specifies the symmetric authentication key ID being used for this time server.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.NtpServer.NtpServerInfo

---

### Notes
Category: ntp_server
API: ntp-server-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcNtpServer [-ServerName] <String> [[-Version] <String>] [-IsPreferred] [-IsAuthenticationEnabled <Boolean>] [-KeyId <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

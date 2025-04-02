Get-NcNtpServer
---------------

### Synopsis
Get the configuration of all the external time servers used by NTP.

---

### Description

Get the configuration of all the external time servers used by NTP.

---

### Related Links
* [New-NcNtpServer](New-NcNtpServer)

* [Set-NcNtpServer](Set-NcNtpServer)

* [Remove-NcNtpServer](Remove-NcNtpServer)

---

### Examples
> Example 1

Get-NcNtpServer
Get all available ntp configurations from the controller.

ServerName                               Version    IsPreferred    HasDefaultPublicNtpServer
----------                               -------    -----------    -------------------------
10.63.0.153                              auto       False          False
10.72.211.100                            3          True           False

---

### Parameters
#### **ServerName**
Host name, IPv4 address or IPv6 address for the external NTP time server(s)

|Type        |Required|Position|PipelineInput        |Aliases                                         |
|------------|--------|--------|---------------------|------------------------------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NtpServer<br/>Name<br/>Address<br/>ServerAddress|

#### **Version**
NTP protocol version(s) of the time server(s).

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[NtpServerInfo]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[NtpServerInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.NtpServer.NtpServerInfo

---

### Notes
Category: ntp_server
API: ntp-server-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNtpServer [[-ServerName] <String[]>] [[-Version] <String[]>] [-Attributes <NtpServerInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNtpServer [[-ServerName] <String[]>] [[-Version] <String[]>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNtpServer [[-ServerName] <String[]>] [[-Version] <String[]>] -Query <NtpServerInfo> [-Attributes <NtpServerInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

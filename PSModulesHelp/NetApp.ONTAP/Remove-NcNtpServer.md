Remove-NcNtpServer
------------------

### Synopsis
Remove a configuration for an external time server used by NTP.

---

### Description

Remove a configuration for an external time server used by NTP.

---

### Related Links
* [New-NcNtpServer](New-NcNtpServer)

* [Get-NcNtpServer](Get-NcNtpServer)

---

### Examples
> Example 1

```PowerShell
Remove-NcNtpServer 10.72.211.100
Remove the ntp server 10.72.211.100
```

---

### Parameters
#### **ServerName**
Host name, IPv4 address or IPv6 address for the external NTP time server

|Type      |Required|Position|PipelineInput        |Aliases                                         |
|----------|--------|--------|---------------------|------------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|NtpServer<br/>Name<br/>Address<br/>ServerAddress|

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
* 

---

### Notes
Category: ntp_server
API: ntp-server-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNtpServer [-ServerName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

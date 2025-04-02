Get-NcNtpServerStatus
---------------------

### Synopsis
Get the status of the selection of an external time server.

---

### Description

Get the status of the selection of an external time server.

---

### Examples
> Example 1

```PowerShell
PS E:\Debug> Get-NcNtpServerStatus
IsPeerReachable          : True
NcController             : 172.20.4.24
Node                     : sti8080-359
Offset                   : 1.039
SelectionState           : Currently Selected Server
Server                   : 10.235.48.111
IsPeerReachableSpecified : True

IsPeerReachable          : True
NcController             : 172.20.4.24
Node                     : sti8080-360
Offset                   : 1.029
SelectionState           : Currently Selected Server
Server                   : 10.235.48.111
IsPeerReachableSpecified : True

```

---

### Parameters
#### **Node**
Node

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **NtpServer**
Host name, IPv4 address or IPv6 address for the external NTP time server

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[NtpServerStatusInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
Specify to get an empty NtpServerStatusInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NtpServerStatusInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNtpServerStatus -Template" to get the initially empty NtpServerStatusInfo object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[NtpServerStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.NtpServer.NtpServerStatusInfo

---

### Notes
Category: ntp_server
API: ntp-server-status-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNtpServerStatus [[-Node] <String[]>] [[-NtpServer] <String[]>] [-Attributes <NtpServerStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNtpServerStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNtpServerStatus -Query <NtpServerStatusInfo> [-Attributes <NtpServerStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

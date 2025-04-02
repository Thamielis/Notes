Get-NcNtpServerKey
------------------

### Synopsis
Get the configuration of all NTP symmetric authentication keys.

---

### Description

Get the configuration of all NTP symmetric authentication keys.

---

### Examples
> Example 1

```PowerShell
Get-NcNtpServerKey
Get the configuration of all NTP symmetric authentication keys.

Id           : 1
NcController : 10.236.44.243
Type         : sha1
Value        : 2e874852e7d41cda65b23915aa5544838b366c51
IdSpecified  : True

Id           : 2
NcController : 10.236.44.243
Type         : sha1
Value        : da39a3ee5e6b4b0d3255bfef95601890afd80709
IdSpecified  : True

```
> Example 2

```PowerShell
Get-NcNtpServerKey -Id 1
Get the configuration of NTP symmetric authentication key with Id 1

Id           : 1
NcController : 10.236.44.243
Type         : sha1
Value        : 2e874852e7d41cda65b23915aa5544838b366c51
IdSpecified  : True

```
> Example 3

```PowerShell
$query = Get-NcNtpServerKey -Template
$query.Id = 1
Get-NcNtpServerKey -Query $query
Get the configuration of NTP symmetric authentication key with Id 1

Id           : 1
NcController : 10.236.44.243
Type         : sha1
Value        : 2e874852e7d41cda65b23915aa5544838b366c51
IdSpecified  : True

```

---

### Parameters
#### **Id**
NTP symmetric authentication key ID.  The ID must be in the range 1-65535.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[NtpKeyInfo]`|false   |named   |false        |

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

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[NtpKeyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.NtpServer.NtpKeyInfo

---

### Notes
Category: ntp-server
API: ntp-server-key-get-iter
Family: ontap-cluster

---

### Syntax
```PowerShell
Get-NcNtpServerKey [[-Id] <Int32>] [-Attributes <NtpKeyInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNtpServerKey -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNtpServerKey -Query <NtpKeyInfo> [-Attributes <NtpKeyInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

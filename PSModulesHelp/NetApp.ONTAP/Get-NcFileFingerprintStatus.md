Get-NcFileFingerprintStatus
---------------------------

### Synopsis
Returns information for one or several fingerprint operations.

---

### Description

Returns information for one or several fingerprint operations. 

Please specify either SessionID or Vserver and Volume parameters with this cmdlet. When queried with the SessionID, the cmdlet returns the progress of the fingerprint operation with from the specified session. When queried with Vserver and Volume, the cmdlet returns the progress of all the fingerprint operations running on that particular volume.

---

### Related Links
* [Get-NcFileFingerprint](Get-NcFileFingerprint)

* [Start-NcFileFingerprint](Start-NcFileFingerprint)

* [Stop-NcFileFingerprint](Stop-NcFileFingerprint)

---

### Examples
> Example 1

```PowerShell
Get-NcFileFingerprintStatus -Vserver primary1 -Volume aparajir_vol1
Get the status of all fingerprint operations running on primary1:/aparajir_vol1

File                        : /vol/aparajir_vol1/f1
NcController                : 10.63.1.232
OperationStatus             : completed
ProgressPercentage          : 100
SessionId                   : 16908290
Volume                      : aparajir_vol1
Vserver                     : primary1
ProgressPercentageSpecified : True
SessionIdSpecified          : True

```
> Example 2

```PowerShell
Get-NcFileFingerprintStatus -SessionID 16908291
Get the status of a specific fingerprint session

File                        : /vol/aparajir_vol1/f1
NcController                : 10.63.1.232
OperationStatus             : completed
ProgressPercentage          : 100
SessionId                   : 16908291
Volume                      : aparajir_vol1
Vserver                     : primary1
ProgressPercentageSpecified : True
SessionIdSpecified          : True

```

---

### Parameters
#### **SessionId**
Specify to filter by SessionId

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |1       |true (ByPropertyName)|

#### **File**
Specify to filter by file name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Vserver**
Specify to filter by vserver & volume

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Volume**
Specify to filter by vserver & volume

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[FingerprintStatusInfo]`|false   |named   |false        |

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[FingerprintStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.File.FingerprintStatusInfo

---

### Notes
Category: file
API: file-fingerprint-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcFileFingerprintStatus [-SessionId] <Int64> [[-File] <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileFingerprintStatus [-Vserver] <String> [-Volume] <String> [[-File] <String>] [-Attributes <FingerprintStatusInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileFingerprintStatus -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileFingerprintStatus -Query <FingerprintStatusInfo> [-Attributes <FingerprintStatusInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

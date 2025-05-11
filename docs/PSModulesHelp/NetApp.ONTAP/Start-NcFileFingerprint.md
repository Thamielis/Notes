Start-NcFileFingerprint
-----------------------

### Synopsis
Start the fingerprint computation on a file.

---

### Description

Start the fingerprint computation on a file. 

The fingerprint computation is started on the file, and a SessionID is returned. This SessionID is an unique identifier for the fingerprint operation. It can be used with the Get-NcFileFingerprintStatus cmdlet to know the current status of the operation and with the Get-NcFileFingerprint cmdlet to know get the fingerprint once operation completes.

---

### Related Links
* [Stop-NcFileFingerprint](Stop-NcFileFingerprint)

* [Get-NcFileFingerprint](Get-NcFileFingerprint)

* [Get-NcFileFingerprintStatus](Get-NcFileFingerprintStatus)

---

### Examples
> Example 1

```PowerShell
Start-NcFileFingerprint -File /vol/aparajir_vol1/f1 -VserverContext primary1 | Get-NcFileFingerprintStatus
Start an operation and get its status

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
#### **File**
Full path of the file on which fingerprint needs to be calculated.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Algorithm**
The digest algorithm which will be used for the fingerprint. Default Algorithm is SHA-256 Digest

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Scope**
The file scope which will be used for the fingerprint. By default it is calculated over both data and metadata.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.File.FileFingerprintSessionInfo

---

### Notes
Category: file
API: file-fingerprint-start
Family: vserver

---

### Syntax
```PowerShell
Start-NcFileFingerprint [-File] <String> [-Algorithm <String>] [-Scope <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Stop-NcFileFingerprint
----------------------

### Synopsis
Stop an ongoing fingerprint operation.

---

### Description

Stops an ongoing fingerprint operation. This cmdlet only aborts the fingerprint operations that have been started and have not finished. It returns an error if the operation has already been completed.

---

### Related Links
* [Start-NcFileFingerprint](Start-NcFileFingerprint)

* [Get-NcFileFingerprint](Get-NcFileFingerprint)

* [Get-NcFileFingerprintStatus](Get-NcFileFingerprintStatus)

---

### Examples
> Example 1

Stop-NcFileFingerprint -SessionId 16908292 -VserverContext primary1
Abort the operation

Stop file fingerprint
Are you sure you wish to stop the file fingerprint operation session 16908292?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

---

### Parameters
#### **SessionId**
Session id of the fingerprint operation that needs to be aborted

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |1       |true (ByPropertyName)|

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
Category: file
API: file-fingerprint-abort
Family: cluster, vserver

---

### Syntax
```PowerShell
Stop-NcFileFingerprint [-SessionId] <Int64> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

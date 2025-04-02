Get-NcSystemImageUpdateStatus
-----------------------------

### Synopsis
Get progress information for current or previous update.

---

### Description

Get progress information for current or previous update.

---

### Related Links
* [Start-NcSystemImageInstall](Start-NcSystemImageInstall)

* [Start-NcSystemImagePackageDownload](Start-NcSystemImagePackageDownload)

* [Start-NcSystemImageUpdate](Start-NcSystemImageUpdate)

---

### Examples
> Example 1

```PowerShell
Get-NcSystemImageUpdateStatus -Node fas3070cluster01-01
Get the system image update progrss for node fas3070cluster01-01.

LastMessage  : There is no update/install in progress
RunStatus    :
ExitStatus   :
ExitMessage  :
Phase        :

```

---

### Parameters
#### **Node**
Node for which to get status.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.SystemImageUpdateProgress

---

### Notes
Category: system
API: system-image-update-progress-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcSystemImageUpdateStatus [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

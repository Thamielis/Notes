Start-NcClusterImagePackageDownload
-----------------------------------

### Synopsis
Downloads the specified  package.

---

### Description

Downloads the specified  package. This API is asynchronous and returns immediately after the download is started. The download progress can be monitored by calling Get-NcClusterImageDownloadProgress cmdlet

---

### Related Links
* [Get-NcClusterImageDownload](Get-NcClusterImageDownload)

* [Test-NcClusterImage](Test-NcClusterImage)

* [Get-NcClusterImagePackage](Get-NcClusterImagePackage)

---

### Examples
> Example 1

```PowerShell
Start-NcClusterImagePackageDownload http://10.72.128.73/~aparajir/image.tgz
```

---

### Parameters
#### **PackageUrl**
The URL from which to start downloading the package.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Location<br/>Url|

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
Category: cluster image
API: cluster-image-package-download
Family: cluster

---

### Syntax
```PowerShell
Start-NcClusterImagePackageDownload [-PackageUrl] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

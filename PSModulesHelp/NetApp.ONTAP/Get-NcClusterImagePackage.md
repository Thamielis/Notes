Get-NcClusterImagePackage
-------------------------

### Synopsis
Get record of locally available packages

---

### Description

Get record of locally available packages

---

### Related Links
* [Get-NcClusterImage](Get-NcClusterImage)

* [Start-NcClusterImagePackageDownload](Start-NcClusterImagePackageDownload)

* [Start-NcClusterImageUpdate](Start-NcClusterImageUpdate)

* [Remove-NcClusterImagePackage](Remove-NcClusterImagePackage)

* [Test-NcClusterImage](Test-NcClusterImage)

---

### Examples
> Example 1

Get-NcClusterImagePackage
NcController                            PackageDetails                          PackageVersion
------------                            --------------                          --------------
10.225.215.73                           {Upgrade Manager Installation Rules}    Fullsteam__8.3.0

---

### Parameters
#### **PackageVersion**
Specify the package version(s) to be retrieved.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Version<br/>Package|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterImagePackageLocalInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  
Use "Get-NcClusterImagePackage -Template" to get the initially empty ClusterImagePackageLocalInfo object.  If not specified, all data is returned for each object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ClusterImagePackageLocalInfo]`|false   |named   |false        |

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
Specify to get an empty ClusterImagePackageLocalInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterImagePackageLocalInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterImagePackage -Template" to get the initially empty ClusterImagePackageLocalInfo object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ClusterImagePackageLocalInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterImage.ClusterImagePackageLocalInfo

---

### Notes
Category: cluster image
API: cluster-image-package-local-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterImagePackage [[-PackageVersion] <String[]>] [-Attributes <ClusterImagePackageLocalInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImagePackage -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImagePackage -Query <ClusterImagePackageLocalInfo> [-Attributes <ClusterImagePackageLocalInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

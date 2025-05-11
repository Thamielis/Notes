Test-NcClusterImage
-------------------

### Synopsis
Validates the various logical and  physical components of a cluster to ensure that a non-disruptive  update can occur.

---

### Description

Validates the various logical and  physical components of a cluster to ensure that a non-disruptive  update can occur.

---

### Related Links
* [Get-NcClusterImagePackage](Get-NcClusterImagePackage)

* [Start-NcClusterImagePackageDownload](Start-NcClusterImagePackageDownload)

---

### Examples
> Example 1

Test-NcClusterImage Fullsteam__8.3.0
Validate the Fullsteam__8.3.0 package

NcController                  NduCheck                      NduStatus                     RequiredAction
------------                  --------                      ---------                     --------------
10.225.215.73                 CIFS status                   OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 Cluster health status         OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 Disk status                   OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 High Availability status      OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 LIF status                    OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 LIFs on home node status      OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 MetroCluster configuration... OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 SnapMirror status             OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 mgmt RDB ring status          OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 mgmt epoch status             OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 vifmgr RDB ring status        OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 vifmgr epoch status           OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 vldb RDB ring status          OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 vldb epoch status             OK                            DataONTAP.C.Types.ClusterI...
10.225.215.73                 Overall Status                OK                            DataONTAP.C.Types.ClusterI...

---

### Parameters
#### **PackageVersion**
The package version to validate.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Version<br/>Package|

#### **Nodes**

|Type        |Required|Position|PipelineInput        |Aliases                        |
|------------|--------|--------|---------------------|-------------------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|NodeNames<br/>NodeName<br/>Node|

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
* DataONTAP.C.Types.ClusterImage.ClusterImageValidationReportListInfo

---

### Notes
Category: cluster image
API: cluster-image-validate
Family: cluster

---

### Syntax
```PowerShell
Test-NcClusterImage [-PackageVersion] <String> [[-Nodes] <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

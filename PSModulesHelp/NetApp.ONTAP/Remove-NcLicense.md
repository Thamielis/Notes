Remove-NcLicense
----------------

### Synopsis
Removes license for a Data ONTAP service.

---

### Description

Removes license for a Data ONTAP service.

---

### Related Links
* [Get-NcLicense](Get-NcLicense)

* [Add-NcLicense](Add-NcLicense)

---

### Examples
> Example 1

```PowerShell
Remove-NcLicense fcp
Remove the fcp license.
```

---

### Parameters
#### **Package**
Package to remove.  
Possible values: 
"base"                - Cluster Base License
"nfs"                 - NFS License
"cifs"                - CIFS License
"iscsi"               - iSCSI License
"fcp"                 - FCP License
"cdmi"                - CDMI License
"snaprestore"         - SnapRestore License
"snapmirror"          - SnapMirror License
"flexclone"           - FlexClone License
"snapvault"           - SnapVault License
"snaplock"            - SnapLock License
"snapmanagersuite"    - SnapManagerSuite License
"snapprotectapps"     - SnapProtectApp License
"v_storageattach"     - Virtual Attached Storage License

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **SerialNumber**
Serial number of the node associated with the license. If this parameter is not provided, the default serial number used is the cluster serial number.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

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

#### **Unused**
If specified, licenses that have no controller affiliation in the cluster will be removed. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Expired**
If specified, licenses that have expired in the cluster will be removed. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: license
API: license-v2-delete,license-v2-delete-unused,license-v2-delete-expired
Family: cluster

---

### Syntax
```PowerShell
Remove-NcLicense [-Package] <String> [[-SerialNumber] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcLicense -Unused [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Remove-NcLicense -Expired [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```

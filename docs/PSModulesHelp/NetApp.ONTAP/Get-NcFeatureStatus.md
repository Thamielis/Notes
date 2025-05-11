Get-NcFeatureStatus
-------------------

### Synopsis
Get status information for managed features.

---

### Description

Get status information for managed features.

---

### Examples
> Example 1

Get-NcFeatureStatus
Get the feature status descriptions for the current cluster.

FeatureName                    Status               Notes
-----------                    ------               -----
cifs                           available            -
nfs                            available            -
iscsi                          available            -
fcp                            not_available        Feature not licensed
dedupe                         on                   -
flexclone                      available            -
compression                    on                   -
snaprestore                    available            -
snaplock                       not_available        Feature not supported
snaplock_enterprise            not_available        Feature not supported
snapvault_primary              not_available        Feature not licensed
snapvault_secondary            not_available        Feature not licensed
snapmirror                     available            -
syncmirror                     on                   -
flexcache                      on                   -
ndmp                           on                   -
multistore                     not_available        Feature not supported
cdmi                           not_available        Feature not licensed
snapdrive_windows              not_available        Feature not licensed
snapmanager_exchange           not_available        Feature not licensed
snapmanager_sql                not_available        Feature not licensed
snapmanager_sharepoint         not_available        Feature not licensed
snapmanager_hyperv             not_available        Feature not licensed
snapdrive_unix                 not_available        Feature not licensed
snapmanager_oracle             not_available        Feature not licensed
snapmanager_sap                not_available        Feature not licensed

---

### Parameters
#### **Name**
Feature status name.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|false   |1       |true (ByPropertyName)|FeatureName|

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
* DataONTAP.C.Types.Feature.ManagedFeatureStatusInfo

---

### Notes
Category: feature
API: feature-status-list-info
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcFeatureStatus [[-Name] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

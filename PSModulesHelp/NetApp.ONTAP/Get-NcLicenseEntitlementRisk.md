Get-NcLicenseEntitlementRisk
----------------------------

### Synopsis
Returns license entitlement risk for cluster mode packages.

---

### Description

Returns license entitlement risk for cluster mode packages.

---

### Related Links
* [Get-NcLicense](Get-NcLicense)

* [Add-NcLicense](Add-NcLicense)

* [Remove-NcLicense](Remove-NcLicense)

---

### Examples
> Example 1

Get-NcLicenseEntitlementRisk -Package nfs
Get entitlement risk for NFS license

Package          : nfs
NcController     : 10.238.49.117
Action           : Verify all controllers are entitled
ActionCode       : verify_entitlement
NodeLicenseUsage : {aparajir-vsim1, aparajir-vsim2}
Risk             : medium

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[LicenseV2EntitlementRiskInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Package**
Name of one or more license package(s) whose entitlement risks you want information about
Possible values:
    'nfs'                 - NFS License
    'cifs'                - CIFS License
    'iscsi'               - iSCSI License
    'fcp'                 - FCP License
    'snaprestore'         - SnapRestore License
    'snapmirror'          - SnapMirror License
    'flexclone'           - FlexClone License
    'snapvault'           - SnapVault License
    'snaplock'            - SnapLock Compliance License
    snapmanagersuite'    - SnapManagerSuite License
    'snapprotectapps'     - SnapProtectApp License
    'v_storageattach'     - Virtual Attached Storage License
    'snaplock_enterprise' - SnapLock Enterprise License
    'insight_balance'     - OnCommand Balance

|Type        |Required|Position|PipelineInput        |Aliases         |
|------------|--------|--------|---------------------|----------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Name<br/>Service|

#### **Risk**
Entitlement risk for the license package.
Possible values:
   'high'           - Cluster license entitlement risk is high
   'medium'         - Cluster license entitlement risk is medium
   'low'            - Cluster license entitlement risk is low
   'unlicensed'     - No node-locked license present and corresponding features are not in use
   'unknown'        - License entitlement is unknown

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[LicenseV2EntitlementRiskInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.LicenseV2.LicenseV2EntitlementRiskInfo

---

### Notes
Category: License
API: license-v2-entitlement-risk-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcLicenseEntitlementRisk [-Attributes <LicenseV2EntitlementRiskInfo>] [-Controller <NcController[]>] [[-Package] <String[]>] [[-Risk] <String[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLicenseEntitlementRisk -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLicenseEntitlementRisk -Query <LicenseV2EntitlementRiskInfo> [-Attributes <LicenseV2EntitlementRiskInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

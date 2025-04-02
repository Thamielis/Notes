Disable-NcSecurityConfigOcsp
----------------------------

### Synopsis
Disable OCSP for one or more selected applications

---

### Description

Disable OCSP for one or more selected applications

---

### Examples
> Example 1

Disable-NcSecurityConfigOcsp -Application kmip
Disable OCSP for kmip applications

Disable OCSP for one or more selected applications
Are you sure you want to disable OCSP for one or more selected applications ?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

---

### Parameters
#### **Application**
Application Name
Possible values:
 'autosupport'            - AutoSupport, 
 'audit_log'              - Audit-Logging, 
 'composite_aggregates'   - Composite Aggregates, 
 'ems'                    - EMS, 
 'kmip'                   - KMIP, 
 'ldap_ad'                - LDAP-AD, 
 'ldap_nis_namemap'       - LDAP-NIS-NameMap, 
 'all'                    - All Applications

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
Category: security
API: security-config-ocsp-disable
Family: ontap-cluster

---

### Syntax
```PowerShell
Disable-NcSecurityConfigOcsp [-Application] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Get-NcSecurityConfigOcsp
------------------------

### Synopsis
Display OCSP Support Status for Applications

---

### Description

Display OCSP Support Status for Applications

---

### Examples
> Example 1

Get-NcSecurityConfigOcsp
Display OCSP Support Status for Applications

Application                                   IsOcspEnabled NcController                         IsOcspEnabledSpecified
-----------                                   ------------- ------------                         ----------------------
audit_log                                             False 10.140.111.42                                          True
autosupport                                           False 10.140.111.42                                          True
composite_aggregates                                  False 10.140.111.42                                          True
ems                                                   False 10.140.111.42                                          True
kmip                                                   True 10.140.111.42                                          True
ldap_ad                                               False 10.140.111.42                                          True
ldap_nis_namemap                                      False 10.140.111.42                                          True

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

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[SecurityConfigOcsp]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty security object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a security object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecurityConfigOcsp -Template" to get the initially empty security object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[SecurityConfigOcsp]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityConfigOcsp

---

### Notes
Category: security
API: security-config-ocsp-get-iter
Family: ontap-cluster

---

### Syntax
```PowerShell
Get-NcSecurityConfigOcsp [[-Application] <String[]>] [-Attributes <SecurityConfigOcsp>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityConfigOcsp -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityConfigOcsp -Query <SecurityConfigOcsp> [-Attributes <SecurityConfigOcsp>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

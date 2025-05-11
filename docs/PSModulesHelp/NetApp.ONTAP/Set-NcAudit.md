Set-NcAudit
-----------

### Synopsis
Set the cluster administrative audit settings.

---

### Description

Set the cluster administrative audit settings.

---

### Related Links
* [Get-NcAudit](Get-NcAudit)

* [Get-NcAuditLog](Get-NcAuditLog)

---

### Examples
> Example 1

```PowerShell
Set-NcAudit -CliSet $false -HttpSet $false -HttpGet $true
Set the cluster to have the given audit settings.  Any settings not specified remain unchanged.

CliGet             : False
CliSet             : False
HttpGet            : True
HttpSet            : False
OntapiGet          : False
OntapiSet          : True
SnmpGet            : False
SnmpSet            : True

```
> Example 2

```PowerShell
$t = Get-NcAudit -Template
$t.CliGet = $true
$t.OntapiGet = $true
$t.SnmpGet = $true
Set-NcAudit -Attributes $t
Set the cluster to have the given audit settings using an AuditInfo object.  Any settings not specified remain unchanged.

CliGet             : True
CliSet             : False
HttpGet            : True
HttpSet            : False
OntapiGet          : True
OntapiSet          : True
SnmpGet            : True
SnmpSet            : True

```

---

### Parameters
#### **CliSet**
If true, enable auditing of CLI set operations.  If false, disable auditing of CLI set operations.  If not specified, the setting will remain unchanged.
Note: This parameter is not applicable in ONTAP 8.4 and later.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CliGet**
If true, enable auditing of CLI get operations.  If false, disable auditing of CLI get operations.  If not specified, the setting will remain unchanged.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **HttpSet**
If true, enable auditing of HTTP set operations.  If false, disable auditing of HTTP set operations.  If not specified, the setting will remain unchanged.
Note: This parameter is not applicable in ONTAP 8.4 and later.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **HttpGet**
If true, enable auditing of HTTP get operations.  If false, disable auditing of HTTP get operations.  If not specified, the setting will remain unchanged.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SnmpSet**
If true, enable auditing of SNMP set operations.  If false, disable auditing of SNMP set operations.  If not specified, the setting will remain unchanged.
Note: This parameter is not applicable in ONTAP 8.4 and later.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SnmpGet**
If true, enable auditing of SNMP get operations.  If false, disable auditing of SNMP get operations.  If not specified, the setting will remain unchanged.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **OntapiSet**
If true, enable auditing of ONTAPI set operations.  If false, disable auditing of ONTAPI set operations.  If not specified, the setting will remain unchanged.
Note: This parameter is not applicable in ONTAP 8.4 and later.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **OntapiGet**
If true, enable auditing of ONTAPI get operations.  If false, disable auditing of ONTAPI get operations.  If not specified, the setting will remain unchanged.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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

#### **Attributes**
AuditInfo object containing the audit settings to give the cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Audit.AuditInfo

---

### Notes
Category: audit
API: audit-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcAudit [-CliSet <Boolean>] [-CliGet <Boolean>] [-HttpSet <Boolean>] [-HttpGet <Boolean>] [-SnmpSet <Boolean>] [-SnmpGet <Boolean>] [-OntapiSet <Boolean>] [-OntapiGet <Boolean>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcAudit [-Attributes] <Object> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

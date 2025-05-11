Get-NcAudit
-----------

### Synopsis
Get the cluster administrative audit settings.

---

### Description

Get the cluster administrative audit settings.

---

### Related Links
* [Set-NcAudit](Set-NcAudit)

* [Get-NcAuditLog](Get-NcAuditLog)

---

### Examples
> Example 1

```PowerShell
Get-NcAudit
Get all of the audit settings for the current cluster.

CliGet             : False
CliSet             : True
HttpGet            : False
HttpSet            : True
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
Get-NcAudit -Attributes $t
Get the value of only the specified audit settings: CliGet, OntapiGet, and SnmpGet.

CliGet             : False
CliSet             :
HttpGet            :
HttpSet            :
OntapiGet          : False
OntapiSet          :
SnmpGet            : False
SnmpSet            :

```

---

### Parameters
#### **Attributes**
Provide an AuditInfo object or an AuditConfigInfo depending upon the Data ONTAP version with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAudit -Template" to get the initially empty object.  If not specified, all data is returned for each object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[AuditInfo]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty object for use with advanced queries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Audit.AuditInfo

---

### Notes
Category: audit
API: audit-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcAudit [-Attributes <AuditInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAudit -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```

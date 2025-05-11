Get-NcAuditLog
--------------

### Synopsis
Get the cluster administrative audit settings

---

### Description

Get the cluster administrative audit settings

---

### Related Links
* [Get-NcAudit](Get-NcAudit)

* [Set-NcAudit](Set-NcAudit)

---

### Examples
> Example 1

```PowerShell
Get-NcAuditLog
Get the cluster administrative audit logs

Entry              : [kern_audit:info:74143] 8003e80000013f93:8003e80000013f94 :: sapanjcluster-1:console :: 
                     localhost:unknown :: sapanjcluster-1:root :: set -privilege diagnostic :: Success
NcController       : 10.238.33.150
Node               : sapanj-vsim1
Seq                : 25772789059
Timestamp          : 1445728302
SeqSpecified       : True
TimestampSpecified : True

Entry              : [kern_audit:info:74143] 8003e80000013f93:8003e80000013f95 :: sapanjcluster-1:console :: 
                     localhost:unknown :: sapanjcluster-1:root :: system show -node local :: Pending
NcController       : 10.238.33.150
Node               : sapanj-vsim1
Seq                : 25772789060
Timestamp          : 1445728302
SeqSpecified       : True
TimestampSpecified : True

```
> Example 2

```PowerShell
Get-NcAuditLog -Name sapanj-vsim1 -Sequence 30064774849 -TimeStamp 1445851071
Get a specific cluster administrative audit log.

Entry              : 
NcController       : 10.238.33.150
Node               : sapanj-vsim1
Seq                : 30064774849
Timestamp          : 1445851071
SeqSpecified       : True
TimestampSpecified : True

```

---

### Parameters
#### **Name**
Name of the node that logged the entry.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **TimeStamp**
Timestamp of the log entry.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Sequence**
Specifies a tie-breaker for entries with the same timestamp.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Provide an AuditLogInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAuditLog -Template" to get the initially empty AuditLogInfo object.  If not specified, all data is returned for each object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[AuditLogInfo]`|false   |named   |false        |

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
Specify to get an empty AuditLogInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an AuditLogInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAuditLog -Template" to get the initially empty AuditLogInfo object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[AuditLogInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Audit.AuditLogInfo

---

### Notes
Category: audit
API: audit-log-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAuditLog [[-Name] <String[]>] [-TimeStamp <Int32>] [-Sequence <Int64>] [-Attributes <AuditLogInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAuditLog -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAuditLog -Query <AuditLogInfo> [-Attributes <AuditLogInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

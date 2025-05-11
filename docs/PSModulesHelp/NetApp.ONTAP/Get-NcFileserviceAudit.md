Get-NcFileserviceAudit
----------------------

### Synopsis
Get audit configuration details.

---

### Description

Get audit configuration details.

---

### Related Links
* [New-NcFileserviceAudit](New-NcFileserviceAudit)

* [Set-NcFileserviceAudit](Set-NcFileserviceAudit)

* [Remove-NcFileserviceAudit](Remove-NcFileserviceAudit)

---

### Examples
> Example 1

```PowerShell
Get-NcFileserviceAudit
Get the fileservice audit configurations for all Vservers in the cluster.

AuditGuarantee              : True
Destination                 : /hashes
IsEnabled                   : False
NcController                : 10.63.165.62
RotateLimit                 : 0
RotateScheduleDay           : {1}
RotateScheduleDayofweek     : {-1}
RotateScheduleHour          : {0}
RotateScheduleMinute        : {5}
RotateScheduleMonth         : {-1}
RotateSize                  :
RotationScheduleDescription : 1@0:05
Vserver                     : beam01
AuditGuaranteeSpecified     : True
IsEnabledSpecified          : True
RotateLimitSpecified        : True

```
> Example 2

```PowerShell
$q = Get-NcFileserviceAudit -Template
$q.IsEnabled = $false
Get-NcFileserviceAudit -Query $q
Get all of the fileservice audit configurations that are currently disabled.

AuditGuarantee              : True
Destination                 : /hashes
IsEnabled                   : False
NcController                : 10.63.165.62
RotateLimit                 : 0
RotateScheduleDay           : {1}
RotateScheduleDayofweek     : {-1}
RotateScheduleHour          : {0}
RotateScheduleMinute        : {5}
RotateScheduleMonth         : {-1}
RotateSize                  :
RotationScheduleDescription : 1@0:05
Vserver                     : beam01
AuditGuaranteeSpecified     : True
IsEnabledSpecified          : True
RotateLimitSpecified        : True

```

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a FileserviceAuditConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFileserviceAudit -Template" to get the initially empty FileserviceAuditConfig object.  If not specified, all data is returned for each object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[FileserviceAuditConfig]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Template**
Specify to get an empty FileserviceAuditConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a FileserviceAuditConfig object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFileserviceAudit -Template" to get the initially empty FileserviceAuditConfig object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[FileserviceAuditConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileserviceAudit.FileserviceAuditConfig

---

### Notes
Category: fileservice audit
API: fileservice-audit-config-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcFileserviceAudit [[-Vserver] <String[]>] [-Attributes <FileserviceAuditConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileserviceAudit -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileserviceAudit -Query <FileserviceAuditConfig> [-Attributes <FileserviceAuditConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Get-NcQuotaStatus
-----------------

### Synopsis
Get quota status for all volumes in the cluster.

---

### Description

Get quota status for all volumes in the cluster.

---

### Related Links
* [Get-NcQuota](Get-NcQuota)

---

### Examples
> Example 1

Get-NcQuotaStatus
Get quota status for all of the volumes in the cluster.

Volume                   Status     Substatus  QuotaErrorMsgs                       Vserver
------                   ------     ---------  --------------                       -------
costea01_root_vol        off        none                                            costea01
grupoMode                off        none                                            costea01
pp_ds                    off        none                                            costea01
ppds_nfs                 off        none                                            costea01
unitTestLuns             off        none                                            costea01
vol1                     off        none                                            costea01
costea02_root_vol        off        none                                            costea02
snapMirrorSourceTest     off        none                                            costea02
beamvol1                 off        none                                            dlamotta01
beamvol2                 on         none                                            dlamotta01
dlamotta01_root_vol      off        none                                            dlamotta01
dlamotta02_root_vol      off        none                                            dlamotta02

> Example 2

$q = Get-NcQuotaStatus -Template
$q.Status = "on"
Get-NcQuotaStatus -Query $q
Get all of the volumes that have quotas enabled.

Volume                   Status     Substatus  QuotaErrorMsgs                       Vserver
------                   ------     ---------  --------------                       -------
beamvol2                 on         none                                            dlamotta01

---

### Parameters
#### **Volume**
Name of the volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide a QuotaStatusAttributes object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcQuotaStatus -Template" to get the initially empty QuotaStatusAttributes object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[QuotaStatusAttributes]`|false   |named   |false        |

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
Specify to get an empty QuotaStatusAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QuotaStatusAttributes object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQuotaStatus -Template" to get the initially empty QuotaStatusAttributes object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[QuotaStatusAttributes]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Quota.QuotaStatusAttributes

---

### Notes
Category: quota
API: quota-status-iter
Family: vserver, cluster

---

### Syntax
```PowerShell
Get-NcQuotaStatus [[-Volume] <String[]>] [-Vserver <String[]>] [-Attributes <QuotaStatusAttributes>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQuotaStatus [[-Volume] <String[]>] -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQuotaStatus [[-Volume] <String[]>] -Query <QuotaStatusAttributes> [-Attributes <QuotaStatusAttributes>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

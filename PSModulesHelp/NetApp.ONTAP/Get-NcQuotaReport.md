Get-NcQuotaReport
-----------------

### Synopsis
Get a quota report for all the quotas in the cluster.

---

### Description

Get a quota report for all the quotas in the cluster.

---

### Related Links
* [Get-NcQuota](Get-NcQuota)

---

### Examples
> Example 1

Get-NcQuotaReport
Get reports for all of the quotas on the current cluster.

QuotaType    QuotaTarget                    Volume           Qtree        DiskUsed         FilesUsed        Vserver
---------    -----------                    ------           -----        --------         ---------        -------
tree         /vol/beamvol2/qtree1           beamvol2                      0                1                dlamotta01

> Example 2

$q = Get-NcQuotaReport -Template
$q.DiskUsed = "<2097152"
Get-NcQuotaReport -Query $q
Get all the quotas that have used less than 2GB of disk space.

QuotaType    QuotaTarget                    Volume           Qtree                DiskUsed        FilesUsed Vserver
---------    -----------                    ------           -----                --------        --------- -------
tree         /vol/beamvol2/qtree1           beamvol2                                     0                1 dlamotta01

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Type**
The quota type (user, group, tree).

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |named   |true (ByPropertyName)|QuotaType|

#### **Target**
The quota target.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |named   |true (ByPropertyName)|QuotaTarget|

#### **Volume**
The quota target volume.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Qtree**
Name of the qtree for the quota.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a Quota object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcQuotaReport -Template" to get the initially empty Quota object.  If not specified, all data is returned for each object.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Quota]`|false   |named   |false        |

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
Specify to get an empty Quota object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a Quota object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQuotaReport -Template" to get the initially empty Quota object.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Quota]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Quota.Quota

---

### Notes
Category: quota
API: quota-report-iter
Family: vserver, cluster

---

### Syntax
```PowerShell
Get-NcQuotaReport [-Vserver <String[]>] [-Type <String[]>] [-Target <String[]>] [-Volume <String[]>] [-Qtree <String[]>] [-Attributes <Quota>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQuotaReport -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQuotaReport -Query <Quota> [-Attributes <Quota>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

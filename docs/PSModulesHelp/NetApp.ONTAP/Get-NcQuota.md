Get-NcQuota
-----------

### Synopsis
Get a list of quota rules in the cluster.

---

### Description

Get a list of quota rules in the cluster.

---

### Related Links
* [Set-NcQuota](Set-NcQuota)

* [Add-NcQuota](Add-NcQuota)

* [Remove-NcQuota](Remove-NcQuota)

---

### Examples
> Example 1

Get-NcQuota
Get all the quotas for the current cluster.

QuotaType    QuotaTarget                    Volume           Qtree               DiskLimit        FileLimit Vserver
---------    -----------                    ------           -----               ---------        --------- -------
group        1                              beamvol2         qtree1               20971520                - dlamotta01
tree         /vol/beamvol2/qtree1           beamvol2                               2560000          2000000 dlamotta01

> Example 1

$q = Get-NcQuota -Template
$q.FileLimit = "-"
Get-NcQuota -Query $q
Get all of the quotas on the current cluster with no file limits.

QuotaType    QuotaTarget                    Volume           Qtree               DiskLimit        FileLimit Vserver
---------    -----------                    ------           -----               ---------        --------- -------
group        1                              beamvol2         qtree1               20971520                - dlamotta01

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
For improved scalability in large clusters, provide a QuotaEntry object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcQuota -Template" to get the initially empty QuotaEntry object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[QuotaEntry]`|false   |named   |false        |

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
Specify to get an empty QuotaEntry object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QuotaEntry object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQuota -Template" to get the initially empty QuotaEntry object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[QuotaEntry]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Quota.QuotaEntry

---

### Notes
Category: quota
API: quota-list-entries-iter
Family: vserver, cluster

---

### Syntax
```PowerShell
Get-NcQuota [-Vserver <String[]>] [-Type <String[]>] [-Target <String[]>] [-Volume <String[]>] [-Qtree <String[]>] [-Attributes <QuotaEntry>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQuota -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQuota -Query <QuotaEntry> [-Attributes <QuotaEntry>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Get-NcIscsiService
------------------

### Synopsis
Get the list of iSCSI Services.

---

### Description

Get the list of iSCSI Services.

---

### Related Links
* [Add-NcIscsiService](Add-NcIscsiService)

* [Remove-NcIscsiService](Remove-NcIscsiService)

* [Set-NcIscsiService](Set-NcIscsiService)

---

### Examples
> Example 1

Get-NcIscsiService
Get all the iSCSI services present on the current cluster.

AliasName            IsAvailable  NodeName                                                               Vserver
---------            -----------  --------                                                               -------
costea01             True         iqn.1992-08.com.netapp:sn.8e332132edd111e0a7a0123478563412:vs.3        costea01
iscsivs1             True         iqn.1992-08.com.netapp:sn.15a9b8bf225611e1a794123478563412:vs.9        iscsivs1
iscsivs2             True         iqn.1992-08.com.netapp:sn.412f1b52225611e1a794123478563412:vs.10       iscsivs2
rashidvs             True         iqn.1992-08.com.netapp:sn.4def775f09f611e1a2de123478563412:vs.7        rashidvs
rashidvs2            True         iqn.1992-08.com.netapp:sn.b060374509f611e1a2de123478563412:vs.8        rashidvs2

> Example 2

$q = Get-NcIscsiService -Template
$q.IsAvailable = $true
$t = Get-NcIscsiService -Template
$t.NodeName = ""
Get-NcIscsiService -Query $q -Attributes $t
Get the node names of all the currently available iscsi services on the current cluster.

NodeName                                                               Vserver
--------                                                               -------
iqn.1992-08.com.netapp:sn.8e332132edd111e0a7a0123478563412:vs.3        costea01
iqn.1992-08.com.netapp:sn.15a9b8bf225611e1a794123478563412:vs.9        iscsivs1
iqn.1992-08.com.netapp:sn.412f1b52225611e1a794123478563412:vs.10       iscsivs2
iqn.1992-08.com.netapp:sn.4def775f09f611e1a2de123478563412:vs.7        rashidvs
iqn.1992-08.com.netapp:sn.b060374509f611e1a2de123478563412:vs.8        rashidvs2

---

### Parameters
#### **NodeName**
The iSCSI target name of the Vserver.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **AliasName**
The iSCSI target alias of the Vserver.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiServiceInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiService -Template" to get the initially empty IscsiServiceInfo object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[IscsiServiceInfo]`|false   |named   |false        |

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
Specify to get an empty IscsiServiceInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiServiceInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiService -Template" to get the initially empty IscsiServiceInfo object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[IscsiServiceInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiServiceInfo

---

### Notes
Category: iscsi
API: iscsi-service-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiService [[-NodeName] <String[]>] [[-AliasName] <String[]>] [-Attributes <IscsiServiceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiService -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiService -Query <IscsiServiceInfo> [-Attributes <IscsiServiceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

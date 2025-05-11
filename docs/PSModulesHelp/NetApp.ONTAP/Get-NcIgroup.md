Get-NcIgroup
------------

### Synopsis
List igroups.

---

### Description

List igroups.

---

### Related Links
* [New-NcIgroup](New-NcIgroup)

* [Remove-NcIgroup](Remove-NcIgroup)

---

### Examples
> Example 1

Get-NcIgroup -Vserver Lionetti01
List igroups owned by vserver 'Lionetti01'.

Name            : HyperV121
Type            : windows
Protocol        : fcp
Portset         :
ALUA            : True
ThrottleBorrow  : False
ThrottleReserve : 0
Partner         : True
VSA             : False
Initiators      : {10:00:00:05:33:26:88:2e, 10:00:00:05:33:26:88:2f}
Vserver         : Lionetti01

Name            : HyperV122
Type            : windows
Protocol        : fcp
Portset         :
ALUA            : True
ThrottleBorrow  : False
ThrottleReserve : 0
Partner         : True
VSA             : False
Initiators      : {10:00:00:05:33:26:60:70, 10:00:00:05:33:26:60:71}
Vserver         : Lionetti01

Name            : viaRPC.iqn.1991-05.com.microsoft:sql-cmode.sea-tm.netapp.com
Type            : windows
Protocol        : iscsi
Portset         :
ALUA            : True
ThrottleBorrow  : False
ThrottleReserve : 0
Partner         : True
VSA             : False
Initiators      : {iqn.1991-05.com.microsoft:sql-cmode.sea-tm.netapp.com}
Vserver         : Lionetti01

> Example 2

$q = Get-NcIgroup -Template
$q.Protocol = "fcp"
$a = Get-NcIgroup -Template
$a.Name = ""
Get-NcIgroup -Query $q -Attributes $a | select Name
Using an advanced query, list only the names of the FCP igroups across the cluster.

Name
----
HyperV121
HyperV122
fuji05_FC
viaRPC.10:00:00:05:33:26:75:cc.SEASQLCMODE
viaRPC.10:00:00:05:33:26:75:cd.SEASQLCMODE
fuji6_Data

---

### Parameters
#### **Name**
The name of one or more igroups to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|InitiatorGroupName|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Initiator**
Restrict results to the specified initiator(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an InitiatorGroupInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIgroup -Template" to get the initially empty InitiatorGroupInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[InitiatorGroupInfo]`|false   |named   |false        |

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
Specify to get an empty InitiatorGroupInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an InitiatorGroupInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIgroup -Template" to get the initially empty InitiatorGroupInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[InitiatorGroupInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Igroup.InitiatorGroupInfo

---

### Notes
Category: igroup
API: igroup-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIgroup [[-Name] <String[]>] [-Vserver <String[]>] [-Initiator <String[]>] [-Attributes <InitiatorGroupInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIgroup -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIgroup -Query <InitiatorGroupInfo> [-Attributes <InitiatorGroupInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

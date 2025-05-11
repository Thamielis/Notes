Get-NcIsns
----------

### Synopsis
Gets iSNS service configuration for a Vserver.

---

### Description

Gets iSNS service configuration for a Vserver.

---

### Related Links
* [Set-NcIsnsAddress](Set-NcIsnsAddress)

---

### Examples
> Example 1

```PowerShell
Get-NcIsns
Get the iSNS configuration for all the vservers in the current cluster.

IsIsnsEnabled                          : True
IsnsEntityId                           :
IsnsIpAddr                             : 192.168.182.10
LastSuccessfulUpdateTimestamp          :
LastUpdateAttemptTimestamp             :
LastUpdateResult                       :
NcController                           : 192.168.182.119
Vserver                                : joule
IsIsnsEnabledSpecified                 : True
LastSuccessfulUpdateTimestampSpecified : False
LastUpdateAttemptTimestampSpecified    : False

```
> Example 2

```PowerShell
$q = Get-NcIsns -Template
$q.IsIsnsEnabled = $true
Get-NcIsns -Query $q
Get all the iSNS configurations that are currently enabled.

IsIsnsEnabled                          : True
IsnsEntityId                           :
IsnsIpAddr                             : 192.168.182.10
LastSuccessfulUpdateTimestamp          :
LastUpdateAttemptTimestamp             :
LastUpdateResult                       :
NcController                           : 192.168.182.119
Vserver                                : joule
IsIsnsEnabledSpecified                 : True
LastSuccessfulUpdateTimestampSpecified : False
LastUpdateAttemptTimestampSpecified    : False

```

---

### Parameters
#### **EntityId**
One or more entity IDs corresponding with this iSNS configuration within the external iSNS server.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|IsnsEntityId|

#### **Address**
One or more IP addresses of iSNS servers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|IsnsIpAddr|

#### **Vserver**
One or more Vservers for the iSNS service.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiIsnsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIsns -Template" to get the initially empty IscsiIsnsInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[IscsiIsnsInfo]`|false   |named   |false        |

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
Specify to get an empty IscsiIsnsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiIsnsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIsns -Template" to get the initially empty IscsiIsnsInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[IscsiIsnsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiIsnsInfo

---

### Notes
Category: iscsi
API: iscsi-isns-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIsns [[-EntityId] <String[]>] [[-Address] <String[]>] [-Vserver <String[]>] [-Attributes <IscsiIsnsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIsns -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIsns -Query <IscsiIsnsInfo> [-Attributes <IscsiIsnsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

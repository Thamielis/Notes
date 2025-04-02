Get-NcSystemUserCapability
--------------------------

### Synopsis
Returns the objects and their operations which are permitted to user who called this API.

---

### Description

Returns the objects and their operations which are permitted to user who called this API.

---

### Examples
> Example 1

Get-NcSystemUserCapability volume*
Get the user capabilities for all the volume objects.

ObjectName                                              OperationList
----------                                              -------------
volume                                                  {add-other-volumes, autosize, cluster-max-volume, create...}
volume.64bit-upgrade                                    {start, status}
volume.check                                            {show, start, stop, test}
volume.clone                                            {create, show}
volume.clone.split                                      {show, start, stop}
volume.copy                                             {start}
volume.efficiency                                       {check, clear-statistics, config, modify...}
volume.efficiency.policy                                {create, delete, modify, show}
volume.efficiency.show-queue                            {show}
volume.file                                             {modify, reservation, show-disk-usage, show-filehandle}
volume.file.clone                                       {autodelete, clear, create, show-autodelete-list...}
volume.file.copy                                        {destroy, modify, show, start}
volume.file.move                                        {destroy, modify, show, start}
volume.file.repository.fhmap                            {show}
volume.file.source                                      {destroy, recover, show}
volume.flexcache                                        {create, delete, reset, show}
volume.flexcache.cache-policy                           {create, delete, modify, show}
volume.flexcache.delegations                            {show}
volume.flexcache.monitor.client                         {show}
volume.flexcache.monitor.server                         {show}
volume.lost-found                                       {delete, show}
volume.move                                             {abort, modify, show, start...}
volume.move.target-aggr                                 {show}
volume.qtree                                            {create, delete, modify, oplocks...}
volume.quota                                            {modify, off, on, report...}
volume.quota.policy                                     {copy, create, delete, rename...}
volume.quota.policy.rule                                {create, delete, modify, show}
volume.snapshot                                         {add-test-owners, compute-reclaimable, create, delete...}
volume.snapshot.autodelete                              {modify, show}
volume.snapshot.policy                                  {add-schedule, create, delete, modify...}
volume.storage-service                                  {locate-file, rename, show}
volume.transition-log                                   {delete, show}

---

### Parameters
#### **Name**
Name of one or more objects to get capability info.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CapabilityInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSystemUserCapability -Template" to get the initially empty CapabilityInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CapabilityInfo]`|false   |named   |false        |

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
Specify to get an empty CapabilityInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CapabilityInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSystemUserCapability -Template" to get the initially empty CapabilityInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CapabilityInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.CapabilityInfo

---

### Notes
Category: system
API: system-user-capability-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSystemUserCapability [[-Name] <String[]>] [-Attributes <CapabilityInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemUserCapability -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemUserCapability -Query <CapabilityInfo> [-Attributes <CapabilityInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

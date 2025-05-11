Get-NcFpolicyEvent
------------------

### Synopsis
Get a list of FPolicy event options.

---

### Description

Get a list of FPolicy event options. FPolicy event is consist of protocol, file operations, volume operation and filters.

---

### Related Links
* [New-NcFpolicyEvent](New-NcFpolicyEvent)

* [Set-NcFpolicyEvent](Set-NcFpolicyEvent)

* [Remove-NcFpolicyEvent](Remove-NcFpolicyEvent)

---

### Examples
> Example 1

Get-NcFpolicyEvent -Protocol cifs
Get all the FPolicy events for the cifs protocol.

EventName                : cifs_event
FileOperations           : {create, delete, read, write}
FilterString             :
NcController             : 10.63.165.62
Protocol                 : cifs
VolumeOperation          : False
Vserver                  : beam01
VolumeOperationSpecified : True

> Example 2

$q = Get-NcFpolicyEvent -Template
$q.FileOperations = @('delete')
Get-NcFpolicyEvent  -Query $q
Get all of the FPolicy policy events that include the 'delete' file operation.

EventName                : cifs_event
FileOperations           : {create, delete, read, write}
FilterString             :
NcController             : 10.63.165.62
Protocol                 : cifs
VolumeOperation          : False
Vserver                  : beam01
VolumeOperationSpecified : True

---

### Parameters
#### **Name**
One or more Fpolicy events to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |1       |true (ByPropertyName)|EventName|

#### **Vserver**
Restrict the results to one or more vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Protocol**
One or more protocols for the event.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FpolicyEventOptionsConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFpolicyEvent -Template" to get the initially empty FpolicyEventOptionsConfig object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[FpolicyEventOptionsConfig]`|false   |named   |false        |

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
Specify to get an empty FpolicyEventOptionsConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FpolicyEventOptionsConfig object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFpolicyEvent -Template" to get the initially empty FpolicyEventOptionsConfig object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[FpolicyEventOptionsConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyEventOptionsConfig

---

### Notes
Category: fpolicy
API: fpolicy-policy-event-get-iter
Family: vserver,cluster

---

### Syntax
```PowerShell
Get-NcFpolicyEvent [[-Name] <String[]>] [[-Vserver] <String[]>] [[-Protocol] <String[]>] [-Attributes <FpolicyEventOptionsConfig>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyEvent -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyEvent -Query <FpolicyEventOptionsConfig> [-Attributes <FpolicyEventOptionsConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

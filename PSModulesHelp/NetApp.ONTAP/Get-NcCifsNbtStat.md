Get-NcCifsNbtStat
-----------------

### Synopsis
Get the NetBIOS Name Service statistics for Vservers in cluster.

---

### Description

Get the NetBIOS Name Service statistics for Vservers in cluster.

---

### Examples
> Example 1

```PowerShell
Get-NcCifsNbtStat
Get the NetBIOS Name Service statistics.

NbtMode                              : b
NbtNameState                         : broadcast
NbtScope                             :
NetbiosName                          : CIFS01
NetbiosSuffix                        : 20
Node                                 : VxeRubble-02
RegisteredAddresses                  : {10.60.189.147, 10.60.189.148}
RegisteredType                       :
RegistrationTimeLeftMinutes          : 0
Vserver                              : vserver01
WinsEntries                          :
RegistrationTimeLeftMinutesSpecified : True

NbtMode                              : b
NbtNameState                         : broadcast
NbtScope                             :
NetbiosName                          : CIFS01
NetbiosSuffix                        : 00
Node                                 : VxeRubble-02
RegisteredAddresses                  : {10.60.189.147, 10.60.189.148}
RegisteredType                       :
RegistrationTimeLeftMinutes          : 0
Vserver                              : vserver01
WinsEntries                          :
RegistrationTimeLeftMinutesSpecified : True

NbtMode                              : b
NbtNameState                         : broadcast
NbtScope                             :
NetbiosName                          : RTPRRE
NetbiosSuffix                        : 1e
Node                                 : VxeRubble-02
RegisteredAddresses                  : {10.60.189.147, 10.60.189.148}
RegisteredType                       : group
RegistrationTimeLeftMinutes          : 0
Vserver                              : vserver01
WinsEntries                          :
RegistrationTimeLeftMinutesSpecified : True

NbtMode                              : b
NbtNameState                         : broadcast
NbtScope                             :
NetbiosName                          : RTPRRE
NetbiosSuffix                        : 00
Node                                 : VxeRubble-02
RegisteredAddresses                  : {10.60.189.147, 10.60.189.148}
RegisteredType                       : group
RegistrationTimeLeftMinutes          : 0
Vserver                              : vserver01
WinsEntries                          :
RegistrationTimeLeftMinutesSpecified : True

```
> Example 2

```PowerShell
$query = Get-NcCifsNbtStat -Template
$query.NbtNameState = "broadcast"
$query.NetbiosSuffix = 00
Get-NcCifsNbtStat -Query $query
Get the NetBIOS Name Service statistics for the given query.

NbtMode                              : b
NbtNameState                         : broadcast
NbtScope                             :
NetbiosName                          : CIFS01
NetbiosSuffix                        : 00
Node                                 : VxeRubble-02
RegisteredAddresses                  : {10.60.189.147, 10.60.189.148}
RegisteredType                       :
RegistrationTimeLeftMinutes          : 0
Vserver                              : vserver01
WinsEntries                          :
RegistrationTimeLeftMinutesSpecified : True

NbtMode                              : b
NbtNameState                         : broadcast
NbtScope                             :
NetbiosName                          : RTPRRE
NetbiosSuffix                        : 00
Node                                 : VxeRubble-02
RegisteredAddresses                  : {10.60.189.147, 10.60.189.148}
RegisteredType                       : group
RegistrationTimeLeftMinutes          : 0
Vserver                              : vserver01
WinsEntries                          :
RegistrationTimeLeftMinutesSpecified : True

```

---

### Parameters
#### **Name**
The NetBIOS name.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NetBIOSName|

#### **Node**
The name of the node on which nbtstat was done.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **RegisteredType**
The type of registration to get.  Possible values: "registered", "active", "permanent", "group".  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsNbtStat object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsCifsNbtStat -Template" to get the initially empty CifsNbtStat object.  If not specified, all data is returned for each object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CifsNbtstat]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty CifsNbtStat object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsNbtStat object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsNbtStat -Template" to get the initially empty CifsNbtStat object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CifsNbtstat]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsNbtstat

---

### Notes
Category: cifs
API: cifs-nbtstat-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsNbtStat [[-Name] <String[]>] [[-Node] <String[]>] [[-RegisteredType] <String[]>] [-Attributes <CifsNbtstat>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsNbtStat -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsNbtStat -Query <CifsNbtstat> [-Attributes <CifsNbtstat>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

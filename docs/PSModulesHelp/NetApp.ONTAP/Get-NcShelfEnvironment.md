Get-NcShelfEnvironment
----------------------

### Synopsis
Get the environmental information for storage shelves.

---

### Description

Get the environmental information for storage shelves.

---

### Related Links
* [Get-NcShelf](Get-NcShelf)

* [Get-NcShelfBay](Get-NcShelfBay)

---

### Examples
> Example 1

```PowerShell
Get-NcShelfEnvironment VxeRubble-01
Get the shelf environment info for the node VxeRubble-01.

ChannelName                : 1a
IsChannelMonitorEnabled    : True
IsShelfChannelFailure      : False
NodeName                   : VxeRubble-01
ShelfEnvironChannelAddress : {1, 2}
ShelfEnvironShelfList      : {1, 2}
ShelvesPresent             : 2

```

---

### Parameters
#### **NodeName**
The storage system name the command will be executed on.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Node   |

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

#### **ChannelName**
The adapter number or switch name and the port number (together, called the channel). If missing, then information for all shelves on all channels will be presented.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ShelfId**
The shelf number for which shelf data is requested. If specified, ChannelName must also be specified. If a ChannelName and ShelfId are both specified then information for the specified shelf will be presented (a single shelf). If ChannelName is specified, but ShelfId is missing, then information for all shelves on the channel will be presented.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |3       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ses.ShelfEnvironChannelInfo

---

### Notes
Category: ses
API: storage-shelf-environment-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcShelfEnvironment [-NodeName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcShelfEnvironment [-NodeName] <String> [-ChannelName] <String> [[-ShelfId] <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

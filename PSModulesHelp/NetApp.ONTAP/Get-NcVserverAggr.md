Get-NcVserverAggr
-----------------

### Synopsis
Displays a list of aggregates owned by Vservers.

---

### Description

Displays a list of aggregates owned by Vservers.

---

### Related Links
* [Get-NcVserver](Get-NcVserver)

* [New-NcVserver](New-NcVserver)

* [Add-NcVserverAggregate](Add-NcVserverAggregate)

* [Remove-NcVserverAggregate](Remove-NcVserverAggregate)

---

### Examples
> Example 1

Get-NcVserverAggr
Get aggr details for all vservers

Vserver                 Aggregate                      AggregateType        SnaplockType                      Available
-------                 ---------                      -------------        ------------                      ---------
primary1                aggr1                          vmdisk               non_snaplock                       784.4 MB
primary1                aggr2                          vmdisk               non_snaplock                       560.3 MB
primary1                locked_aggr                    vmdisk               compliance                         168.1 MB
primary1                locked_enterprise              vmdisk               enterprise                         168.1 MB

---

### Parameters
#### **Vserver**
Specify to filter by Vserver

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|VserverName|

#### **Aggregate**
Specify to filter by AggregateName

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|AggregateName|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ShowAggregates]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ShowAggregates]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.ShowAggregates

---

### Notes
Category: vserver
API: vserver-show-aggr-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVserverAggr [[-Vserver] <String[]>] [[-Aggregate] <String[]>] [-Attributes <ShowAggregates>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverAggr -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverAggr -Query <ShowAggregates> [-Attributes <ShowAggregates>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

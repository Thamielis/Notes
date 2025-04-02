Get-NcNetRoute
--------------

### Synopsis
Get a list of network route objects.

---

### Description

Get a list of network route objects.

---

### Related Links
* [New-NcNetRoute](New-NcNetRoute)

* [Remove-NcNetRoute](Remove-NcNetRoute)

---

### Examples
> Example 1

Get-NcNetRoute
Get the net routes for the given cluster.

Destination          Gateway              Metric Vserver
-----------          -------              ------ -------
0.0.0.0/0            10.63.0.1              20   beam-fs-ps
0.0.0.0/0            10.63.0.1              20   pester

> Example 2

Get-NcNetRoute -Query @{Metric=20}
Get all of the net routes with the given metric value.

Destination          Gateway              Metric Vserver
-----------          -------              ------ -------
0.0.0.0/0            10.63.0.1              20   beam-fs-ps
0.0.0.0/0            10.63.0.1              20   pester

---

### Parameters
#### **Destination**
Name of one or more route destinations.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Gateway**
Name of one or more route gateways.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Name of one or more vservers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetVsRoutesInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetRoute -Template" to get the initially empty NetVsRoutesInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[NetVsRoutesInfo]`|false   |named   |false        |

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
Specify to get an empty NetVsRoutesInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetVsRoutesInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetRoute -Template" to get the initially empty NetVsRoutesInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[NetVsRoutesInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetVsRoutesInfo

---

### Notes
Category: net
API: net-routes-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetRoute [[-Destination] <String[]>] [[-Gateway] <String[]>] [[-Vserver] <String[]>] [-Attributes <NetVsRoutesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetRoute -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetRoute -Query <NetVsRoutesInfo> [-Attributes <NetVsRoutesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

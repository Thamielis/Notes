Get-NcNetRouteLif
-----------------

### Synopsis
Get a list of network route objects and get the associated logical interfaces (LIFs).

---

### Description

Get a list of network route objects and get the associated logical interfaces (LIFs).

---

### Related Links
* [Get-NcNetRoute](Get-NcNetRoute)

* [Get-NcNetInterface](Get-NcNetInterface)

---

### Examples
> Example 1

Get-NcNetRouteLif -Vserver pester
Get the LIFs associated with net routes for the given vserver.

Destination          Gateway              Vserver                    LifNames
-----------          -------              -------                    --------
0.0.0.0/0            10.63.0.1            pester                     {pester_data1, pester_data2}

> Example 2

Get-NcNetRouteLif -Query @{LifNames="pester_data1"} -Attributes @{Destination="";Gateway=""}
Get the net route that contains the given LIF.  Restrict results to the given attributes.

Destination          Gateway              Vserver                    LifNames
-----------          -------              -------                    --------
0.0.0.0/0            10.63.0.1            pester

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
For improved scalability in large clusters, provide a NetVsRoutesLifInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetRouteLif -Template" to get the initially empty NetVsRoutesLifInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[NetVsRoutesLifInfo]`|false   |named   |false        |

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
Specify to get an empty NetVsRoutesLifInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetVsRoutesLifInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetRouteLif -Template" to get the initially empty NetVsRoutesLifInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[NetVsRoutesLifInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetVsRoutesLifInfo

---

### Notes
Category: net
API: net-routes-lifs-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetRouteLif [[-Destination] <String[]>] [[-Gateway] <String[]>] [[-Vserver] <String[]>] [-Attributes <NetVsRoutesLifInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetRouteLif -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetRouteLif -Query <NetVsRoutesLifInfo> [-Attributes <NetVsRoutesLifInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

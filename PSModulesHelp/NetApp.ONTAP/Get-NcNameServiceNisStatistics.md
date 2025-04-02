Get-NcNameServiceNisStatistics
------------------------------

### Synopsis
Retrieve NIS statistics of the cluster.

---

### Description

Retrieve NIS statistics of the cluster.

---

### Related Links
* [Reset-NcNameServiceNisStatistics](Reset-NcNameServiceNisStatistics)

---

### Examples
> Example 1

```PowerShell
Get-NcNameServiceNisStatistics
Get all NIS Statistics from a cluster

AvgRtt           : 0
Lookups          : 0
MaxRtt           : 0
MinRtt           : 0
NcController     : 10.238.49.117
Node             : aparajir-vsim1
NumEntryNotFound : 0
NumRtx           : 0
Server           : 10.72.136.21
TotalRtt         : 0
Vserver          : pstk

AvgRtt           : 0
Lookups          : 0
MaxRtt           : 0
MinRtt           : 0
NcController     : 10.238.49.117
Node             : aparajir-vsim1
NumEntryNotFound : 0
NumRtx           : 0
Server           : 10.72.136.23
TotalRtt         : 0
Vserver          : pstk

AvgRtt           : 0
Lookups          : 0
MaxRtt           : 0
MinRtt           : 0
NcController     : 10.238.49.117
Node             : aparajir-vsim2
NumEntryNotFound : 0
NumRtx           : 0
Server           : 10.72.136.21
TotalRtt         : 0
Vserver          : pstk

AvgRtt           : 0
Lookups          : 0
MaxRtt           : 0
MinRtt           : 0
NcController     : 10.238.49.117
Node             : aparajir-vsim2
NumEntryNotFound : 0
NumRtx           : 0
Server           : 10.72.136.23
TotalRtt         : 0
Vserver          : pstk

```
> Example 2

```PowerShell
Get-NcNameServiceNisStatistics -NISServer 10.72.136.23
Get NIS Statistics from one NIS server only.

AvgRtt           : 0
Lookups          : 0
MaxRtt           : 0
MinRtt           : 0
NcController     : 10.238.49.117
Node             : aparajir-vsim1
NumEntryNotFound : 0
NumRtx           : 0
Server           : 10.72.136.23
TotalRtt         : 0
Vserver          : pstk

AvgRtt           : 0
Lookups          : 0
MaxRtt           : 0
MinRtt           : 0
NcController     : 10.238.49.117
Node             : aparajir-vsim2
NumEntryNotFound : 0
NumRtx           : 0
Server           : 10.72.136.23
TotalRtt         : 0
Vserver          : pstk

```

---

### Parameters
#### **Node**
Name of the node(s) from which the statistics must be shown

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Name<br/>NodeName|

#### **Vserver**
Name of the vservers(s) from which the statistics must be shown.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **NISServer**
IP address of the NIS Server.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[NameserviceNisStatistics]`|false   |named   |false        |

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
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[NameserviceNisStatistics]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NameserviceNisStatistics

---

### Notes
Category: nameservice
API: name-service-nis-statistics-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNameServiceNisStatistics [[-Node] <String[]>] [-Vserver <String[]>] [-NISServer <String[]>] [-Attributes <NameserviceNisStatistics>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceNisStatistics -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceNisStatistics -Query <NameserviceNisStatistics> [-Attributes <NameserviceNisStatistics>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

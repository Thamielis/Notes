Get-NcNameServiceDNSStatistics
------------------------------

### Synopsis
Retrieve DNS statistics of the cluster.

---

### Description

Retrieve DNS statistics of the cluster.

---

### Related Links
* [Reset-NcNameServiceDNSStatistics](Reset-NcNameServiceDNSStatistics)

---

### Examples
> Example 1

```PowerShell
Get-NcNameServiceDNSStatistics
Get DNS Statistics of the entire cluster

Node               : aparajir-vsim1
Vserver            : pstk
NameServer         : 10.72.211.100
NcController       : 10.238.49.117
AvgRtt             : 1583259
DnsNumHostNotFound : 9
DnsNumTimedOut     : 345
Errors             : 3
MaxRtt             : 8009325
MinRtt             : 348
Queries            : 1020
TotalRtt           : 1614

Node               : aparajir-vsim2
Vserver            : pstk
NameServer         : 10.72.211.100
NcController       : 10.238.49.117
AvgRtt             : 1768690
DnsNumHostNotFound : 1
DnsNumTimedOut     : 336
Errors             : 3
MaxRtt             : 8009476
MinRtt             : 1151
Queries            : 894
TotalRtt           : 1581

```
> Example 2

```PowerShell
Get-NcNameServiceDNSStatistics -Node aparajir-vsim1
Get DNS Statistics from one node of the cluster

Node               : aparajir-vsim1
Vserver            : pstk
NameServer         : 10.72.211.100
NcController       : 10.238.49.117
AvgRtt             : 1583259
DnsNumHostNotFound : 9
DnsNumTimedOut     : 345
Errors             : 3
MaxRtt             : 8009325
MinRtt             : 348
Queries            : 1020
TotalRtt           : 1614

```

---

### Parameters
#### **Node**
Name of the node(s) from which the statistics must be shown.

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Name<br/>NodeName|

#### **Vserver**
Name of the vservers(s) from which the statistics must be shown

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **NameServer**
IP Address of the name servers(s) from which the statistics must be shown

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[NameserviceDnsStatistics]`|false   |named   |false        |

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
|`[NameserviceDnsStatistics]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NameserviceDnsStatistics

---

### Notes
Category: nameservice
API: name-service-dns-statistics-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNameServiceDNSStatistics [[-Node] <String[]>] [-Vserver <String[]>] [-NameServer <String[]>] [-Attributes <NameserviceDnsStatistics>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceDNSStatistics -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceDNSStatistics -Query <NameserviceDnsStatistics> [-Attributes <NameserviceDnsStatistics>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

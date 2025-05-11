Reset-NcNameServiceDNSStatistics
--------------------------------

### Synopsis
Reset DNS statistics.

---

### Description

Reset DNS statistics of the whole cluster or by node or vserver.

---

### Related Links
* [Get-NcNameServiceDNSStatistics](Get-NcNameServiceDNSStatistics)

---

### Examples
> Example 1

Reset-NcNameServiceDNSStatistics -Node aparajir-vsim2 -Vserver pstk -NameServer 10.72.211.100
Reset DNS Statistics for vserver pstk, on node aparajir-vsim1

Resetting DNS Statistics
Are you sure you want to reset DNS statistics of vserver pstk.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

Node               : aparajir-vsim2
Vserver            : pstk
NameServer         : 10.72.211.100
NcController       : 10.238.49.117
AvgRtt             : 0
DnsNumHostNotFound : 0
DnsNumTimedOut     : 0
Errors             : 0
MaxRtt             : 0
MinRtt             : 0
Queries            : 0
TotalRtt           : 0

---

### Parameters
#### **Node**
Name of the node whose DNS statistics is to be reset.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |1       |true (ByPropertyName)|NodeName<br/>Name|

#### **Vserver**
Name of the vservers whose DNS statistics will be reset.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **NameServer**
IP address of the name server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NameserviceDnsStatistics

---

### Notes
Category: nameservice
API: nameservice-dns-statistics-clear
Family: cluster, vserver

---

### Syntax
```PowerShell
Reset-NcNameServiceDNSStatistics [[-Node] <String>] [[-Vserver] <String>] [[-NameServer] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

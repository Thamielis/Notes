Reset-NcNameServiceNisStatistics
--------------------------------

### Synopsis
Reset Nis statistics.

---

### Description

Reset Nis statistics of the whole cluster or by node and vserver.

---

### Related Links
* [Get-NcNameServiceNisStatistics](Get-NcNameServiceNisStatistics)

---

### Examples
> Example 1

Reset-NcNameServiceNisStatistics -Node aparajir-vsim2 -Vserver pstk -NisServer 10.72.136.23
Reset Nis statistics

Resetting NIS Statistics
Are you sure you want to reset NIS statistics of vserver pstk.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

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

#### **NisServer**
IP address of the NIS server.

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
* DataONTAP.C.Types.Nameservice.NameserviceNisStatistics

---

### Notes
Category: nameservice
API: nameservice-nis-statistics-clear
Family: cluster, vserver

---

### Syntax
```PowerShell
Reset-NcNameServiceNisStatistics [[-Node] <String>] [[-Vserver] <String>] [[-NisServer] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

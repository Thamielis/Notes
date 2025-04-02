Get-NcSnaplockComplianceClock
-----------------------------

### Synopsis
Get the date and time from the SnapLock Node Compliance Clock

---

### Description

Get the date and time from the SnapLock Node Compliance Clock

---

### Related Links
* [Set-NcSnaplockComplianceClock](Set-NcSnaplockComplianceClock)

---

### Examples
> Example 1

Get-NcSnaplockComplianceClock -Node aparajir-vsim1
Get the Compliance Clock from node aparajir-vsim1

Formatted Time                      Unix Time

                                                                          --------------                      ---------

                                                                    12/3/2015 8:32:14 AM                     1449131534

---

### Parameters
#### **Node**
Name of the node from which the ComplianceClock needs to be fetched.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Name<br/>NodeName|

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
* DataONTAP.C.Types.Snaplock.ComplianceClockInfo

---

### Notes
Category: snaplock
API: snaplock-get-node-compliance-clock
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnaplockComplianceClock [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

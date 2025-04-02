Test-NcClusterHaHwAssist
------------------------

### Synopsis
Validate the hardware-assisted takeover configuration functionality.

---

### Description

Validate the hardware-assisted takeover configuration functionality.

---

### Related Links
* [Get-NcClusterHaHwAssist](Get-NcClusterHaHwAssist)

---

### Examples
> Example 1

```PowerShell
Test-NcClusterHaHwAssist -Node sfp-cmode-02-01
Test the hardware assist takeover for node sfp-cmode-02-01.

Storage Failover Hwassist: Operation successful.

```

---

### Parameters
#### **Node**
Node name for which the API is requested.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: cf
API: cf-hwassist-test
Family: cluster

---

### Syntax
```PowerShell
Test-NcClusterHaHwAssist [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

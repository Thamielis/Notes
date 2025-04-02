Get-NcHaInterconnectAutoResetConfiguration
------------------------------------------

### Synopsis
Iterate over list of nodes in the cluster to get their high-availability interconnect device auto-reset configuration information.

---

### Description

Iterate over list of nodes in the cluster to get their high-availability interconnect device auto-reset configuration information.

---

### Parameters
#### **NodeName**
The node to which this auto-reset configuration belongs.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|true    |1       |true (ByPropertyName)|Node   |

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[HaInterconnectResetConfig]`|false   |named   |false        |

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

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[HaInterconnectResetConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.HaInterconnect.HaInterconnectResetConfig

---

### Notes
Category: ha interconnect
API: ha-interconnect-auto-reset-configuration-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcHaInterconnectAutoResetConfiguration [-NodeName] <String[]> [-Attributes <HaInterconnectResetConfig>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectAutoResetConfiguration -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectAutoResetConfiguration -Query <HaInterconnectResetConfig> [-Attributes <HaInterconnectResetConfig>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

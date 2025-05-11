Get-NcNodePower
---------------

### Synopsis
Get power status information about a node

---

### Description

Get power status information about a node

---

### Related Links
* [Get-NcNode](Get-NcNode)

* [Restart-NcNode](Restart-NcNode)

---

### Examples
> Example 1

Get-NcNodePower f3250-215-73-75-01
Uses the Service Processor Network to get the power information

NcController                            Node                                    Status
------------                            ----                                    ------
10.225.215.73                           f3250-215-73-75-01                      on

---

### Parameters
#### **Name**
The name of the node to get power information from.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Node<br/>NodeName|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP.

|Type                   |Required|Position|PipelineInput|Aliases          |
|-----------------------|--------|--------|-------------|-----------------|
|`[SystemNodePowerInfo]`|false   |named   |false        |DesiredAttributes|

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
Can be used to obtain an empty SystemNodePowerInfo object to use with Attribute

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.SystemNodePowerInfo

---

### Notes
Category: system
API: system-node-power-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcNodePower [-Name] <String> [-Attributes <SystemNodePowerInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNodePower -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```

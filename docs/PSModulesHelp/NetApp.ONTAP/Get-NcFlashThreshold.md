Get-NcFlashThreshold
--------------------

### Synopsis
Get a list of Flash Cache threshold profiles objects.

---

### Description

Get a list of Flash Cache threshold profiles objects.

---

### Related Links
* [Get-NcFlashDevice](Get-NcFlashDevice)

---

### Examples
> Example 1

Get-NcFlashThreshold -Node tesla-01
Get the flash thresholds for the node tesla-01.

Node                           Profile            FlashThreshold
----                           -------            --------------
tesla-01                       default            {chip, chip, bank, bank...}

> Example 2

Get-NcFlashThreshold -Node tesla-01 | select -ExpandProperty FlashThreshold
Get the flash thresholds for all the profiles on node tesla-01.

Domain          Threshold Action
------          --------- ------
chip                   3% If no chip in containing bank was disabled, log an EMS event, and disable the chip
chip                   9% log an EMS event, and disable the chip
bank                  10% log an EMS event
bank                  20% log an EMS event, and disable the bank
card                  10% log an EMS event, and send an AutoSupport message
card                  15% log an EMS event
card                  20% log an EMS event
card                  25% log an EMS event
card                  30% log an EMS event, send an AutoSupport message, and disable the card

---

### Parameters
#### **Node**
The name of one or more systems which the flash thresholds apply.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Profile**
One or more profile names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FlashThresholdProfile object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFlashThreshold -Template" to get the initially empty FlashThresholdProfile object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[FlashThresholdProfile]`|false   |named   |false        |

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
Specify to get an empty FlashThresholdProfile object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FlashThresholdProfile object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFlashThreshold -Template" to get the initially empty FlashThresholdProfile object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[FlashThresholdProfile]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Flash.FlashThresholdProfile

---

### Notes
Category: flash
API: flash-thresholds-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcFlashThreshold [[-Node] <String[]>] [[-Profile] <String[]>] [-Attributes <FlashThresholdProfile>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFlashThreshold -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcFlashThreshold -Query <FlashThresholdProfile> [-Attributes <FlashThresholdProfile>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Update-NcServiceProcessorImage
------------------------------

### Synopsis
Install new service processor firmware image.

---

### Description

Install new service processor firmware image.

---

### Related Links
* [Get-NcServiceProcessorImage](Get-NcServiceProcessorImage)

* [Get-NcServiceProcessorImageUpdate](Get-NcServiceProcessorImageUpdate)

* [Enable-NcServiceProcessorImageUpdate](Enable-NcServiceProcessorImageUpdate)

* [Disable-NcServiceProcessorImageUpdate](Disable-NcServiceProcessorImageUpdate)

---

### Examples
> Example 1

```PowerShell
Update-NcServiceProcessorImage -Node sfp-cmode-02-01 -Baseline -UpdateType full
Update the service processor on node sfp-cmode-02-01 back to the firmware version packaged with ONTAP.

EndTime               :
IsInProgress          : False
NcController          : 10.63.165.62
Node                  : sfp-cmode-02-01
PercentDone           : 0
StartTime             :
IsInProgressSpecified : True
PercentDoneSpecified  : True

```

---

### Parameters
#### **Node**
Node on which the device is located.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **UpdateType**
Type of firmware update to perform.  
Possible values:  
'full'          - Replace the fimrware completely with new package,
'differential'  - Replace only parts of firmware which have changed in new package

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Package**
Name of the package file containing the firmware to be installed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **RetainLogs**
If specified, retain logs on the device after update.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Baseline**
If specified, Install the version packaged with ONTAP.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorImage

---

### Notes
Category: service processor
API: service-processor-image-update
Family: cluster

---

### Syntax
```PowerShell
Update-NcServiceProcessorImage [-Node] <String> [-UpdateType] <String> [-Package] <String> [-RetainLogs] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcServiceProcessorImage [-Node] <String> [-UpdateType] <String> [-Baseline] [-RetainLogs] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

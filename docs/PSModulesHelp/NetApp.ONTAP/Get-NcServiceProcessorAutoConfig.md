Get-NcServiceProcessorAutoConfig
--------------------------------

### Synopsis
Get Service Processor auto-configuration subnet name.

---

### Description

Get Service Processor auto-configuration subnet name.

---

### Related Links
* [Enable-NcServiceProcessorAutoConfig](Enable-NcServiceProcessorAutoConfig)

* [Get-NcServiceProcessorAutoConfig](Get-NcServiceProcessorAutoConfig)

---

### Examples
> Example 1

Get-NcServiceProcessorAutoConfig
NcController                            SubnetNameV4                            SubnetNameV6                           
------------                            ------------                            ------------                           
10.225.215.73                           test2

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                |Required|Position|PipelineInput        |Aliases          |
|--------------------|--------|--------|---------------------|-----------------|
|`[SpSubnetNameInfo]`|false   |named   |true (ByPropertyName)|DesiredAttributes|

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
Can be used to obtain an empty attribute element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ServiceProcessor.SpSubnetNameInfo

---

### Notes
Category: service processor
API: service-processor-auto-configuration-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcServiceProcessorAutoConfig [-Attributes <SpSubnetNameInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcServiceProcessorAutoConfig [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

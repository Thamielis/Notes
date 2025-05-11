Set-NcServiceProcessorApiService
--------------------------------

### Synopsis
Modify service processor API service configuration

---

### Description

Modify service processor API service configuration

---

### Related Links
* [Get-NcServiceProcessorApiService](Get-NcServiceProcessorApiService)

---

### Examples
> Example 1

```PowerShell
Set-NcServiceProcessorApiService -Disable
Disable service processor api services

IsEnabled          : False
NcController       : 10.225.215.73
Port               : 50000
IsEnabledSpecified : True
PortSpecified      : True

```

---

### Parameters
#### **Enable**
If specified, enables SP API Service.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Disable**
If specified, disables SP API Service.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Port**
SP API Service Port.

|Type     |Required|Position|PipelineInput        |Aliases   |
|---------|--------|--------|---------------------|----------|
|`[Int32]`|false   |1       |true (ByPropertyName)|PortNumber|

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
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorApiService

---

### Notes
Category: service processor
API: service-processor-api-service-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcServiceProcessorApiService [-Enable] [-Disable] [-Controller <NcController[]>] [[-Port] <Int32>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Enable-NcServiceProcessorImageUpdate
------------------------------------

### Synopsis
Enable automatic firmware update.

---

### Description

Enable automatic firmware update.

---

### Related Links
* [Disable-NcServiceProcessorImageUpdate](Disable-NcServiceProcessorImageUpdate)

---

### Examples
> Example 1

```PowerShell
Enable-NcServiceProcessorImageUpdate -Node sfp-cmode-02-01
Enable automatic updating for service processor on node sfp-cmode-02-01.

FirmwareImage                : primary
IsAutoupdateEnabled          : True
IsCurrent                    : True
LastUpdateStatus             : passed
NcController                 : 10.63.165.62
Node                         : sfp-cmode-02-01
Status                       : installed
Type                         : sp
Version                      : 2.2
IsAutoupdateEnabledSpecified : True
IsCurrentSpecified           : True

```

---

### Parameters
#### **Node**
Node on which the device is located.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorImage

---

### Notes
Category: service processor
API: service-processor-image-modify
Family: cluster

---

### Syntax
```PowerShell
Enable-NcServiceProcessorImageUpdate [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

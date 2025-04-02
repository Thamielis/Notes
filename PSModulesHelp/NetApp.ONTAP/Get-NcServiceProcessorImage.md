Get-NcServiceProcessorImage
---------------------------

### Synopsis
Get information about installed server processor firmware images.

---

### Description

Get information about installed server processor firmware images.

---

### Related Links
* [Get-NcServiceProcessor](Get-NcServiceProcessor)

* [Get-NcServiceProcessorNetwork](Get-NcServiceProcessorNetwork)

* [Get-NcServiceProcessorImageUpdate](Get-NcServiceProcessorImageUpdate)

* [Update-NcServiceProcessorImage](Update-NcServiceProcessorImage)

---

### Examples
> Example 1

```PowerShell
Get-NcServiceProcessorImage -Node sfp-cmode-02-01 -FirmwareImage primary
Get the primary image of the service processor on node sfp-cmode-02-01.

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

#### **FirmwareImage**
Firmware type for the device.
Possible values: 
'primary'   - Firmware which the device boots into by default,
'backup'    - Firmware which the device boots into if primary fails

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ServiceProcessorImage object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcServiceProcessorImage -Template" to get the initially empty ServiceProcessorImage object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput        |
|-------------------------|--------|--------|---------------------|
|`[ServiceProcessorImage]`|false   |named   |true (ByPropertyName)|

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
Specify to get an empty ServiceProcessorImage object for use with advanced queries involving the Attributes attribute.

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
API: service-processor-image-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcServiceProcessorImage [-Node] <String> [-FirmwareImage] <String> [-Attributes <ServiceProcessorImage>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcServiceProcessorImage [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

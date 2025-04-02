Get-NcServiceProcessorImageUpdate
---------------------------------

### Synopsis
Get firmware update progress.

---

### Description

Get firmware update progress.

---

### Related Links
* [Get-NcServiceProcessorImage](Get-NcServiceProcessorImage)

* [Update-NcServiceProcessorImage](Update-NcServiceProcessorImage)

---

### Examples
> Example 1

```PowerShell
Get-NcServiceProcessorImageUpdate -Node sfp-cmode-02-01
Get the service processor image update progress on node sfp-cmode-02-01.

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

#### **Attributes**
For improved scalability in large clusters, provide a ServiceProcessorImageUpdateProgressInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcServiceProcessorImageUpdate -Template" to get the initially empty ServiceProcessorImageUpdateProgressInfo object.  If not specified, all data is returned for each object.

|Type                                       |Required|Position|PipelineInput        |
|-------------------------------------------|--------|--------|---------------------|
|`[ServiceProcessorImageUpdateProgressInfo]`|false   |named   |true (ByPropertyName)|

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
Specify to get an empty ServiceProcessorImageUpdateProgressInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorImageUpdateProgressInfo

---

### Notes
Category: service processor
API: service-processor-image-update-progress-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcServiceProcessorImageUpdate [-Node] <String> [-Attributes <ServiceProcessorImageUpdateProgressInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcServiceProcessorImageUpdate [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

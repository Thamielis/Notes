Get-NcServiceProcessorSsh
-------------------------

### Synopsis
Return SSH security information about the Service Processor.

---

### Description

Return SSH security information about the Service Processor.

---

### Related Links
* [Add-NcServiceProcessorSshAllowedAddress](Add-NcServiceProcessorSshAllowedAddress)

* [Remove-NcServiceProcessorSshAllowedAddress](Remove-NcServiceProcessorSshAllowedAddress)

---

### Examples
> Example 1

Get-NcServiceProcessorSsh
Get all allowed addresses for the service processor

AllowedAddresses                                            NcController                                               
----------------                                            ------------                                               
{10.238.49.117/24}                                          10.225.215.73

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                       |Required|Position|PipelineInput        |Aliases          |
|---------------------------|--------|--------|---------------------|-----------------|
|`[ServiceProcessorSshInfo]`|false   |named   |true (ByPropertyName)|DesiredAttributes|

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
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorSshInfo

---

### Notes
Category: service processor
API: service-processor-ssh-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcServiceProcessorSsh [-Attributes <ServiceProcessorSshInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcServiceProcessorSsh [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

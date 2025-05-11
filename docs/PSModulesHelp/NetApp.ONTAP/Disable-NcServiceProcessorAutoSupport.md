Disable-NcServiceProcessorAutoSupport
-------------------------------------

### Synopsis
Disable autosupport on the SP module

---

### Description

Disable autosupport on the SP module

---

### Related Links
* [Enable-NcServiceProcessorAutosupport](Enable-NcServiceProcessorAutosupport)

* [Get-NcServiceProcessorAutosupport](Get-NcServiceProcessorAutosupport)

---

### Examples
> Example 1

Disable-NcServiceProcessorAutoSupport
Disable autosupport on the cluster

NcController                                                          IsEnabled                      IsEnabledSpecified
------------                                                          ---------                      ------------------
10.225.215.73                                                             False                                    True

---

### Parameters
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
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorAsupInfo

---

### Notes
Category: service processor
API: service-processor-asup-config-set
Family: cluster

---

### Syntax
```PowerShell
Disable-NcServiceProcessorAutoSupport [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

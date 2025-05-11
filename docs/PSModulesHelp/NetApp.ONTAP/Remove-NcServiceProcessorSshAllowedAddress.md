Remove-NcServiceProcessorSshAllowedAddress
------------------------------------------

### Synopsis
Remove IP addresses that are allowed to access the Service Processor

---

### Description

Remove IP addresses that are allowed to access the Service Processor

---

### Related Links
* [Add-NcServiceProcessorSshAllowedAddress](Add-NcServiceProcessorSshAllowedAddress)

* [Get-NcServiceProcessorSsh](Get-NcServiceProcessorSsh)

---

### Examples
> Example 1

Remove-NcServiceProcessorSshAllowedAddress -DisallowedAddresses
Remove the address

AllowedAddresses                                            NcController                                               
----------------                                            ------------                                               
                                                            10.225.215.73

---

### Parameters
#### **DisallowedAddresses**
List of public IP addresses to remove

|Type        |Required|Position|PipelineInput        |Aliases                                                         |
|------------|--------|--------|---------------------|----------------------------------------------------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|DisallowedAddress<br/>Address<br/>Addresses<br/>AllowedAddresses|

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
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorSshInfo

---

### Notes
Category: service processor
API: service-processor-ssh-remove-allowed-addresses
Family: cluster

---

### Syntax
```PowerShell
Remove-NcServiceProcessorSshAllowedAddress [-DisallowedAddresses] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Add-NcServiceProcessorSshAllowedAddress
---------------------------------------

### Synopsis
Add IP addresses that are allowed to access the Service  Processor

---

### Description

Add IP addresses that are allowed to access the Service  Processor

---

### Related Links
* [Get-NcServiceProcessorSsh](Get-NcServiceProcessorSsh)

* [Remove-NcServiceProcessorSshAllowedAddress](Remove-NcServiceProcessorSshAllowedAddress)

---

### Examples
> Example 1

Add-NcServiceprocessorSshAllowedAddress -AllowedAddresses 10.238.49.117/24
Add IP 10.238.49.117, netmask 24 to the list of allowed addresses

AllowedAddresses                                            NcController                                               
----------------                                            ------------                                               
{10.238.49.117/24}                                          10.225.215.73

---

### Parameters
#### **AllowedAddresses**
List of public IP addresses to add.

|Type        |Required|Position|PipelineInput        |Aliases                                 |
|------------|--------|--------|---------------------|----------------------------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|AllowedAddress<br/>Address<br/>Addresses|

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
API: service-processor-ssh-add-allowed-addresses  
Family: cluster

---

### Syntax
```PowerShell
Add-NcServiceProcessorSshAllowedAddress [-AllowedAddresses] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

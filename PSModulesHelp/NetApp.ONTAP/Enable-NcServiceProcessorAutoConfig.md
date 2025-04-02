Enable-NcServiceProcessorAutoConfig
-----------------------------------

### Synopsis
Enable Service Processor Auto-Configuration

---

### Description

Enable Service Processor Auto-Configuration

---

### Related Links
* [Disable-NcServiceProcessorAutoConfig](Disable-NcServiceProcessorAutoConfig)

* [Get-NcServiceProcessorAutoConfig](Get-NcServiceProcessorAutoConfig)

---

### Examples
> Example 1

Enable-NcServiceprocessorAutoconfig -AddressFamily IPv4 -Subnet test2
Enable autoconfiguration in test2 subnet

NcController                            SubnetNameV4                            SubnetNameV6                           
------------                            ------------                            ------------                           
10.225.215.73                           test2

---

### Parameters
#### **AddressFamily**
IPv4/IPv6 Address Family

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Family |

#### **Subnet**
Subnet name which will be used to automatically assign IPs

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[String]`|true    |2       |true (ByPropertyName)|SubnetName<br/>SubnetIP|

#### **Node**
Node Name. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* DataONTAP.C.Types.ServiceProcessor.SpSubnetNameInfo

---

### Notes
Category: service processor
API: service-processor-auto-configuration-enable
Family: cluster

---

### Syntax
```PowerShell
Enable-NcServiceProcessorAutoConfig [-AddressFamily] <String> [-Subnet] <String> [-Node <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Restart-NcServiceProcessor
--------------------------

### Synopsis
Reboot the service processor.

---

### Description

Reboot the service processor.

---

### Related Links
* [Get-NcServiceProcessor](Get-NcServiceProcessor)

---

### Examples
> Example 1

```PowerShell
Restart-NcServiceProcessor -Node sfp-cmode-02-01
Rebooting the service processor on node sfp-cmode-02-01.

DeviceRevision               : Not Applicable
FirmwareVersion              : 2.2
IpAddress                    : {10.63.165.55}
IpmiVersion                  :
IsAutoupdateEnabled          : True
IsIpConfigured               : True
MacAddress                   : 00:a0:98:1d:3c:a4
NcController                 : 10.63.165.62
Node                         : sfp-cmode-02-01
PartNum                      : Not Applicable
SerialNum                    : Not Applicable
Status                       : rebooting
Type                         : sp
IsAutoupdateEnabledSpecified : True
IsIpConfiguredSpecified      : True

```

---

### Parameters
#### **Node**
Node on which the device is located.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **FirmwareImage**
Firmware image to boot.  Default is 'primary'.
Possible values: 
'primary'   - Firmware which the device boots into by default,
'backup'    - Firmware which the device boots into if primary fails

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ServiceProcessor.ServiceProcessorInfo

---

### Notes
Category: service processor
API: service-processor-reboot
Family: cluster

---

### Syntax
```PowerShell
Restart-NcServiceProcessor [-Node] <String> [[-FirmwareImage] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

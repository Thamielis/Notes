Set-NcLunDeviceId
-----------------

### Synopsis
Set a SCSI peripheral device identifying information value on a LUN.

---

### Description

Set a SCSI peripheral device identifying information value on a LUN.

The value set will be returned in response to the SCSI command REPORT IDENTIFYING INFORMATION for the appropriate INFORMATION TYPE:

0000000b - Peripheral Device Identifying Information, a binary string 1 to 64 bytes long. In addition, if the Peripheral Device Identifying Information is between 00000001h (1d) and 0000270Fh (9999d), it will be returned in response to the vendor unique SCSI command GET DEV ID.

0000010b - Peripheral Device Text Identifying Information, a UTF-8 string 1 to 255 bytes long.

Either or both peripheral device identifying information values may be set or cleared independently.

---

### Related Links
* [Get-NcLun](Get-NcLun)

---

### Examples
> Example 1

Set-NcLunDeviceId /vol/testvol/exchangeLun Exchange0001 -Type text
Set the Peripheral Device Text Identifying Information value for lun 'exchangeLun' to 'Exchange0001'.

Path                        Size Protocol Online Mapped Thin Vserver  Comment
----                        ---- -------- ------ ------ ---- -------  -------
/vol/testvol/exchangeLun 20.0 GB hyper_v  False   True  True costea01

---

### Parameters
#### **Path**
Path of the LUN.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Id**
SCSI Peripheral Device Identifying Information.  Pass an empty string to clear the device ID.
If Type is "legacy", the value must be an integer in the range [1..9999].
If Type is "binary", the value must be a 1 to 64 byte value encoded as a hexadecimal string, for example "0000270F".
If Type is "text", the value is a free-form UTF-8 string between 1 and 255 bytes in length.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |2       |true (ByPropertyName)|DeviceId|

#### **Type**
Indicate which peripheral device identifying information value to change. Possible values:
"legacy" - Set the Peripheral Device Identifying Information for REPORT IDENTIFYING INFORMATION (INFORMATION TYPE 0000000b) appropriate for the the vendor unique SCSI command GET DEV ID and in the format compatible in ONTAP 7-Mode.
"binary" - Set the Peripheral Device Identifying Information for REPORT IDENTIFYING INFORMATION (INFORMATION TYPE 0000000b). This format allows setting all 64 bytes of the identifying information.
"text" - Set the Peripheral Device Text Identifying Information for REPORT IDENTIFYING INFORMATION (INFORMATION TYPE 0000010b).
The default value is "legacy".

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|false   |3       |true (ByPropertyName)|DeviceIdType|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
API: lun-set-device-id
Family: vserver

---

### Syntax
```PowerShell
Set-NcLunDeviceId [-Path] <String> [[-Id] <String>] [[-Type] <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

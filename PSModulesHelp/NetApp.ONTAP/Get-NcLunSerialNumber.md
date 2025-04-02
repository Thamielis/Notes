Get-NcLunSerialNumber
---------------------

### Synopsis
Get the serial number for the specified LUN

---

### Description

Get the serial number for the specified LUN.

Prior to Data ONTAP 8.1 release, the serial number is a 12-character string formed of upper and lower-case letters, numbers, and slash (/) and hyphen (-) characters.
         Starting Data ONTAP 8.1 release, the serial number is a 12-character string formed of upper and lower-case letters, numbers, and the characters /-#$%&*+<=>?[!]^~@ .

---

### Related Links
* [Set-NcLunSerialNumber](Set-NcLunSerialNumber)

* [Get-NcLun](Get-NcLun)

---

### Examples
> Example 1

Get-NcLunSerialNumber /vol/a2n_vol/tiny_lun -VserverContext san_vs
Get the serial number of one particular lun in vserver san_vs

Path                           Vserver                        SerialNumber
----                           -------                        ------------
/vol/a2n_vol/tiny_lun          san_vs                         T1k9b?EpjaaE

> Example 2

Get-NcLun | Get-NcLunSerialNumber
Get serial numbers of a group of luns (Get-NcLun can be used to restrict query to desired luns)

Path                           Vserver                        SerialNumber
----                           -------                        ------------
/vol/a2n_vol/1gLun             san_vs                         T1k9b?EpjaaV
/vol/a2n_vol/tiny_lun          san_vs                         T1k9b?EpjaaE
/vol/datastore2/disk1          san_vs2                        T1k9b?EpjaaW
/vol/datastore2/windows_lun    san_vs2                        T1k9b?EpjaaX

---

### Parameters
#### **Path**
The path of the lun.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunSerialNumberInfo

---

### Notes
Category: lun
API: lun-get-serial-number
Family: vserver

---

### Syntax
```PowerShell
Get-NcLunSerialNumber [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

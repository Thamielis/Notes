Set-NcIsnsAddress
-----------------

### Synopsis
Set the IP address of the iSNS service to register.

---

### Description

Set the IP address of the iSNS service to register. The iSNS service must have already been added to the current Vserver using Add-NcIsnsService.

---

### Related Links
* [Get-NcIsns](Get-NcIsns)

---

### Examples
> Example 1

```PowerShell
Set-NcIsnsAddress -Address 192.168.182.11
Set the address of the iSNS server to register.

IsIsnsEnabled                          : True
IsnsEntityId                           :
IsnsIpAddr                             : 192.168.182.11
LastSuccessfulUpdateTimestamp          :
LastUpdateAttemptTimestamp             :
LastUpdateResult                       :
NcController                           : 192.168.182.119
Vserver                                : joule
IsIsnsEnabledSpecified                 : True
LastSuccessfulUpdateTimestampSpecified : False
LastUpdateAttemptTimestampSpecified    : False

```

---

### Parameters
#### **Address**
The IP address, in dotted-decimal format, of the iSNS server with which to register.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Force**
If specified, the iSNS config will not fail if the Vserver management LIF is not configured for the Vserver.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* DataONTAP.C.Types.Iscsi.IscsiIsnsInfo

---

### Notes
Category: iscsi
API: iscsi-isns-config
Family: vserver

---

### Syntax
```PowerShell
Set-NcIsnsAddress [-Address] <String> [-Force] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

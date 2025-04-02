Add-NcIsnsService
-----------------

### Synopsis
Create the iSNS Service for a Vserver.

---

### Description

Create the iSNS Service for a Vserver.

---

### Related Links
* [Remove-NcIsnsService](Remove-NcIsnsService)

* [Enable-NcIsns](Enable-NcIsns)

* [Disable-NcIsns](Disable-NcIsns)

---

### Examples
> Example 1

```PowerShell
Add-NcIsnsService -Address 192.168.182.10 -Start
Add the iSNS service for the current Vserver and start it.

IsIsnsEnabled                          : True
IsnsEntityId                           :
IsnsIpAddr                             : 192.168.182.10
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
The IP address, in dotted-decimal format, of the iSNS server with which to register.  Example: 192.168.11.12

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|IsnsIpAddr|

#### **Start**
If specified, the service will be automatically started after creation completes. If omitted, the service will be left in the stopped state and the caller must subsequently call Enable-NcIsns to start the service.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
If specified, the iSNS create will not fail if the Vserver management LIF is not configured for the Vserver.

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
API: iscsi-isns-create
Family: vserver

---

### Syntax
```PowerShell
Add-NcIsnsService [-Address] <String> [-Start] [-Force] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

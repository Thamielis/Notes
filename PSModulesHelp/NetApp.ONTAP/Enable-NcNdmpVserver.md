Enable-NcNdmpVserver
--------------------

### Synopsis
Enable NDMP service on the vserver.

---

### Description

Enable NDMP service on the vserver. 

Enabling ndmp service on the vserver will not cause any disruption to NDMP operations that are running. Executing this cmdlet when the ndmp service is already enabled will not result in any errors.

---

### Related Links
* [Disable-NcNdmpVserver](Disable-NcNdmpVserver)

* [Disable-NcNdmp](Disable-NcNdmp)

* [Get-NcNdmpVserverAttr](Get-NcNdmpVserverAttr)

* [Set-NcNdmpVserverAttr](Set-NcNdmpVserverAttr)

* [Get-NcNdmpVserverSession](Get-NcNdmpVserverSession)

---

### Examples
> Example 1

Enable-NcNdmpVserver -VserverContext primary1
Enable vserver-scoped NDMP on primary1

PS >

---

### Parameters
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
* 

---

### Notes
Category: ndmp
API: ndmp-vserver-service-enable
Family: vserver

---

### Syntax
```PowerShell
Enable-NcNdmpVserver [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

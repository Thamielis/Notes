Add-NcFcpService
----------------

### Synopsis
Create an FCP Service in a Vserver. Each Vserver requires an online FCP Service in order to serve data via the Fibre Channel protocol.

---

### Description

Create an FCP Service in a Vserver. Each Vserver requires an online FCP Service in order to serve data via the Fibre Channel protocol.

---

### Related Links
* [Get-NcFcpService](Get-NcFcpService)

* [Remove-NcFcpService](Remove-NcFcpService)

---

### Examples
> Example 1

Add-NcFcpService
Create the FCP service on the current Vserver.

NodeName                    IsAvailable   Vserver
--------                    -----------   -------
20:04:00:a0:98:29:49:ba         True      dlamotta01

---

### Parameters
#### **NodeName**
The FCP World Wide Node Name (WWNN) for the FCP service. If not provided, one will be auto-generated. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |1       |true (ByPropertyName)|Name<br/>wwnn|

#### **Force**
If specified, allow setting the WWNN to a value outside NetApp's registered namespace. If false, the node name must match the namespace 2X:XX:00:a0:98:XX:XX:XX. The default is false. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Disable**
If specified, the FCP service will not be started upon creation.

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
* DataONTAP.C.Types.Fcp.FcpServiceInfo

---

### Notes
Category: fcp
API: fcp-service-create
Family: vserver

---

### Syntax
```PowerShell
Add-NcFcpService [[-NodeName] <String>] [-Force] [-Disable] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

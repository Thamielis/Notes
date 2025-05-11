Add-NcIscsiService
------------------

### Synopsis
Add an iSCSI Service in a Vserver. Each Vserver requires an online iSCSI Service in order to serve data via the iSCSI protocol.

---

### Description

Add an iSCSI Service in a Vserver. Each Vserver requires an online iSCSI Service in order to serve data via the iSCSI protocol.

---

### Related Links
* [Remove-NcIscsiService](Remove-NcIscsiService)

* [Get-NcIscsiService](Get-NcIscsiService)

---

### Examples
> Example 1

Add-NcIscsiService
Add an iSCSI service to the current vserver.

AliasName            IsAvailable  NodeName                                                               Vserver
---------            -----------  --------                                                               -------
dlamotta01           True         iqn.1992-08.com.netapp:sn.31df1198eddd11e0a7a0123478563412:vs.5        dlamotta01

---

### Parameters
#### **Name**
The iSCSI target alias for the iSCSI service. If not provided, the Vserver name will be used.

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |1       |false        |AliasName|

#### **NodeName**
The iSCSI target name for the Vserver. The target-name must conform to RFC 3720. If not provided, one will be auto-generated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Disable**
If provided, the iSCSI service will not be started upon completion.

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
* DataONTAP.C.Types.Iscsi.IscsiServiceInfo

---

### Notes
Category: iscsi
API: iscsi-service-create
Family: vserver

---

### Syntax
```PowerShell
Add-NcIscsiService [[-Name] <String>] [[-NodeName] <String>] [-Disable] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

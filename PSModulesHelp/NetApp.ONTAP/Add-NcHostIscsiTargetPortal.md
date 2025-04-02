Add-NcHostIscsiTargetPortal
---------------------------

### Synopsis
Add a Data ONTAP storage controller to the iSCSI Initiator target portals.  This portal is used to discover iSCSI targets.

---

### Description

Add a Data ONTAP storage controller to the iSCSI Initiator target portals.  This portal is used to discover iSCSI targets.

---

### Examples
> Example 1

```PowerShell
Add-NcHostIscsiTargetPortal
Add the iSCSI data LIF of the current vserver to the iSCSI discovered portals list.

DiscoveryMechanism : SendTargets:*10.60.189.173 0003260 Root\ISCSIPRT\0000_0
InitiatorName      : Root\ISCSIPRT\0000_0
TargetName         : iqn.1992-08.com.netapp:sn.31df1198eddd11e0a7a0123478563412:vs.5
IsConnected        : False
WmiPath            : \\WIN2K8DEVRRE0\Root\WMI:MSiSCSIInitiator_TargetClass.DiscoveryMechanism="SendTargets:*10.60.189.1
                     73 0003260 Root\\ISCSIPRT\\0000_0 ",TargetName="iqn.1992-08.com.netapp:sn.31df1198eddd11e0a7a01234
                     78563412:vs.5"

```
> Example 2

```PowerShell
Add-NcHostIscsiTargetPortal -Credential win2k8devrre0
Add the iSCSI data LIF of the current vserver to the list of discovered target portals using CHAP authentication.

DiscoveryMechanism : SendTargets:*10.60.189.173 0003260 Root\ISCSIPRT\0000_0
InitiatorName      : Root\ISCSIPRT\0000_0
TargetName         : iqn.1992-08.com.netapp:sn.31df1198eddd11e0a7a0123478563412:vs.5
IsConnected        : False
WmiPath            : \\WIN2K8DEVRRE0\Root\WMI:MSiSCSIInitiator_TargetClass.DiscoveryMechanism="SendTargets:*10.60.189.1
                     73 0003260 Root\\ISCSIPRT\\0000_0 ",TargetName="iqn.1992-08.com.netapp:sn.31df1198eddd11e0a7a01234
                     78563412:vs.5"

```

---

### Parameters
#### **Port**
The port to use to connect to the iSCSI target portal.  Default is 3260.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **InterfaceName**
Name of the iSCSI data LIF to add as a target portal.  If not supplied, all iSCSI data LIFs on the vserver will be added.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

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

#### **Credential**
The CHAP username/password to use to authenticate the target portal.  If not specified, no authentication will be used when connecting to the target portal.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **MutualChap**
If specified, mutual CHAP will be used.  To use mutual CHAP, an initiator CHAP secret must be set on the Configuration page of the iSCSI Initiator Properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RadiusVerify**
If specified, use RADIUS to authenticate target credentials.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RadiusGenerate**
If specified, use RADIUS to generate user authentication credentials.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.Toolkit.Windows.IscsiTargetInfo

---

### Notes
Category: host

---

### Syntax
```PowerShell
Add-NcHostIscsiTargetPortal [[-Port] <Int32>] [[-InterfaceName] <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcHostIscsiTargetPortal [[-Port] <Int32>] [-Credential <PSCredential>] [-MutualChap] [-RadiusVerify] [[-InterfaceName] <String>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcHostIscsiTargetPortal [[-Port] <Int32>] [-MutualChap] [-RadiusGenerate] [-RadiusVerify] [[-InterfaceName] <String>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

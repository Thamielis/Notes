Connect-NaHostIscsiTarget
-------------------------

### Synopsis
Establish a connection to a target discovered by the iSCSI Initiator.

---

### Description

Establish a connection to a target discovered by the iSCSI Initiator.

---

### Related Links
* [Add-NaHostIscsiTargetPortal](Add-NaHostIscsiTargetPortal)

* [Get-NaHostIscsiTarget](Get-NaHostIscsiTarget)

* [Disconnect-NaHostIscsiTarget](Disconnect-NaHostIscsiTarget)

* [Get-NaHostIscsiSession](Get-NaHostIscsiSession)

---

### Examples
> Example 1

Connect-NaHostIscsiTarget iqn.1992-08.com.netapp:sn.135107386
Connect to the target with an Iqn of iqn.1992-08.com.netapp:sn.135107386.

Connections    : {fffffa8003bb3018-000000000000001e}
Devices        : {\\?\scsi#disk&ven_netapp&prod_lun#1&1c121344&0&000000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}, }
NumConnections : 1
NumDevices     : 2
SessionId      : fffffa8003bb3018-400001370000001f
InitiatorName  : iqn.1991-05.com.microsoft:win2k8devrre0
TargetName     : iqn.1992-08.com.netapp:sn.135107386

> Example 2

Get-NaHostIscsiTarget | where { !$_.IsConnected} | Connect-NaHostIscsiTarget -Persistent
Connect to all targets that are currently not connected and add them to the favorite targets list.

Connections    : {fffffa8003bb3018-0000000000000022}
Devices        : {\\?\scsi#disk&ven_netapp&prod_lun#1&1c121344&0&000000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}, }
NumConnections : 1
NumDevices     : 2
SessionId      : fffffa8003bb3018-4000013700000023
InitiatorName  : iqn.1991-05.com.microsoft:win2k8devrre0
TargetName     : iqn.1992-08.com.netapp:sn.135107386

Connections    : {fffffa8003bb3018-0000000000000023}
Devices        : {\\?\scsi#disk&ven_netapp&prod_lun#1&1c121344&0&000100#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}}
NumConnections : 1
NumDevices     : 1
SessionId      : fffffa8003bb3018-4000013700000024
InitiatorName  : iqn.1991-05.com.microsoft:win2k8devrre0
TargetName     : iqn.1992-08.com.netapp:sn.135107303

---

### Parameters
#### **TargetName**
The Iqn of the target to connect.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **TargetIp**
IP address of the target portal to connect to.  If not specified, the default IP address will be used.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |named   |true (ByPropertyName)|DiscoveryMechanism|

#### **TargetPort**
The target port to connect to.  The default is 3260.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt16]`|false   |named   |true (ByPropertyName)|

#### **InitiatorIp**
Ip address the initiator should use to connect to the target.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Persistent**
Specify this flag to add this target to the list of favorite targets.  The iSCSI Initiator service ensures that all volumes and devices on a favorite target are available.  It attempts to restore connections to these targets when this machine restarts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HeaderDigest**
If specified, header digest will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DataDigest**
If specified, data digest will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableMultipath**
If specified, multi-path will be enabled for the established connection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Credential**
The CHAP username/password to use to authenticate the target.  If not specified, no authentication will be used when connecting to the target.

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
* DataONTAP.PowerShell.SDK.Cmdlets.Toolkit.Windows.IscsiSessionInfo

---

### Notes
Category: host

---

### Syntax
```PowerShell
Connect-NaHostIscsiTarget [-TargetName] <String> [-TargetIp <String>] [-TargetPort <UInt16>] [-InitiatorIp <String>] [-Persistent] [-HeaderDigest] [-DataDigest] [-EnableMultipath] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Connect-NaHostIscsiTarget [-TargetName] <String> [-TargetIp <String>] [-TargetPort <UInt16>] [-InitiatorIp <String>] [-Persistent] [-Credential <PSCredential>] [-MutualChap] [-HeaderDigest] 
```
```PowerShell
[-DataDigest] [-EnableMultipath] [-RadiusVerify] [<CommonParameters>]
```
```PowerShell
Connect-NaHostIscsiTarget [-TargetName] <String> [-TargetIp <String>] [-TargetPort <UInt16>] [-InitiatorIp <String>] [-Persistent] [-MutualChap] [-HeaderDigest] [-DataDigest] 
```
```PowerShell
[-EnableMultipath] [-RadiusGenerate] [-RadiusVerify] [<CommonParameters>]
```

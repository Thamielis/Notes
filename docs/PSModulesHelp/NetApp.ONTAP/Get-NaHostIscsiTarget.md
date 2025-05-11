Get-NaHostIscsiTarget
---------------------

### Synopsis
Get the targets discovered by the iSCSI Initiator.

---

### Description

Get the targets discovered by the iSCSI Initiator.

---

### Related Links
* [Connect-NaHostIscsiTarget](Connect-NaHostIscsiTarget)

* [Disconnect-NaHostIscsiTarget](Disconnect-NaHostIscsiTarget)

---

### Examples
> Example 1

```PowerShell
Get-NaHostIscsiTarget
Get the targets that have been discovered by the iSCSI Initiator.

DiscoveryMechanism : SendTargets:*10.61.169.28 0003260 Root\ISCSIPRT\0000_0
InitiatorName      : Root\ISCSIPRT\0000_0
TargetName         : iqn.1992-08.com.netapp:sn.135107386
IsConnected        : True

DiscoveryMechanism : SendTargets:*10.61.169.29 0003260 Root\ISCSIPRT\0000_0
InitiatorName      : Root\ISCSIPRT\0000_0
TargetName         : iqn.1992-08.com.netapp:sn.135107303
IsConnected        : True

```
> Example 2

```PowerShell
Get-NaHostIscsiTarget 10.61.169.29
Get the targets discovered on 10.61.169.29.

DiscoveryMechanism : SendTargets:*10.61.169.29 0003260 Root\ISCSIPRT\0000_0
InitiatorName      : Root\ISCSIPRT\0000_0
TargetName         : iqn.1992-08.com.netapp:sn.135107303
IsConnected        : True

```

---

### Parameters
#### **IpAddress**
Ip Address of a target portal used to discover this target.  If omitted, all discovered targets are retrieved.

|Type      |Required|Position|PipelineInput                 |Aliases      |
|----------|--------|--------|------------------------------|-------------|
|`[String]`|false   |named   |true (ByValue, ByPropertyName)|PortalAddress|

#### **Port**
The port that was used to discover this target.  Default is 3260.

|Type     |Required|Position|PipelineInput                 |Aliases   |
|---------|--------|--------|------------------------------|----------|
|`[Int32]`|false   |named   |true (ByValue, ByPropertyName)|PortalPort|

#### **TargetName**
The name of the target to get.  If omitted, all targets are returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

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
Get-NaHostIscsiTarget [-IpAddress <String>] [-Port <Int32>] [[-TargetName] <String>] [<CommonParameters>]
```

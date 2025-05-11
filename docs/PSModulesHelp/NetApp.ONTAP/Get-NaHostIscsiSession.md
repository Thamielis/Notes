Get-NaHostIscsiSession
----------------------

### Synopsis
Get current iSCSI sessions on the host machine.

---

### Description

Get current iSCSI sessions on the host machine.

---

### Related Links
* [Get-NaHostIscsiTarget](Get-NaHostIscsiTarget)

---

### Examples
> Example 1

Get-NaHostIscsiSession
Get the current iSCSI sessions on the host machine.

Connections    : {fffffa8003bb3018-0000000000000022}
Devices        : {\\?\scsi#disk&ven_netapp&prod_lun#1&1c121344&0&000000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}, \\?\scs
                 i#disk&ven_netapp&prod_lun#1&1c121344&0&000001#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}}
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

> Example 2

Get-NaHostIscsiSession | Select -ExpandProperty devices
Get the devices connected to the host machine.

DeviceInterfaceGuid : 53f56307-b6bf-11d0-94f20a0c91efb8b
DeviceInterfaceName : \\?\scsi#disk&ven_netapp&prod_lun#1&1c121344&0&000000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}
DeviceNumber        : 1
DeviceType          : 7
InitiatorName       : Root\ISCSIPRT\0000_0
LegacyName          : \\.\PhysicalDrive1
PartitionNumber     : 0
ScsiLun             : 0
ScsiPathId          : 0
ScsiPortNumber      : 3
ScsiTargetId        : 0
TargetName          : iqn.1992-08.com.netapp:sn.135107386

DeviceInterfaceGuid : 53f56307-b6bf-11d0-94f20a0c91efb8b
DeviceInterfaceName : \\?\scsi#disk&ven_netapp&prod_lun#1&1c121344&0&000001#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}
DeviceNumber        : 2
DeviceType          : 7
InitiatorName       : Root\ISCSIPRT\0000_0
LegacyName          : \\.\PhysicalDrive2
PartitionNumber     : 0
ScsiLun             : 1
ScsiPathId          : 0
ScsiPortNumber      : 3
ScsiTargetId        : 0
TargetName          : iqn.1992-08.com.netapp:sn.135107386

DeviceInterfaceGuid : 53f56307-b6bf-11d0-94f20a0c91efb8b
DeviceInterfaceName : \\?\scsi#disk&ven_netapp&prod_lun#1&1c121344&0&000100#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}
DeviceNumber        : 3
DeviceType          : 7
InitiatorName       : Root\ISCSIPRT\0000_0
LegacyName          : \\.\PhysicalDrive3
PartitionNumber     : 0
ScsiLun             : 0
ScsiPathId          : 0
ScsiPortNumber      : 3
ScsiTargetId        : 1
TargetName          : iqn.1992-08.com.netapp:sn.135107303

> Example 3

```PowerShell
Get-NaHostIscsiSession -TargetName iqn.1992-08.com.netapp:sn.99927627 | select -ExpandProperty Connections
Get a list of connections to the given target.

ConnectionId     : fffffa8003fb9018-0000000000000034
InitiatorAddress : 192.168.0.100
InitiatorPort    : 64465
TargetAddress    : 192.168.0.102
TargetPort       : 3260

ConnectionId     : fffffa8003fb9018-0000000000000035
InitiatorAddress : 192.168.0.100
InitiatorPort    : 12754
TargetAddress    : 192.168.0.102
TargetPort       : 3260

```

---

### Parameters
#### **TargetName**
The Iqn of the target to get sessions for.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|

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
Get-NaHostIscsiSession [[-TargetName] <String>] [<CommonParameters>]
```

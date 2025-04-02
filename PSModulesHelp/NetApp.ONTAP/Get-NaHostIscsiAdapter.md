Get-NaHostIscsiAdapter
----------------------

### Synopsis
Get information about the Microsoft iSCSI Initiator on the host machine.

---

### Description

Get information about the Microsoft iSCSI Initiator on the host machine.

---

### Related Links
* [Get-NaHostIscsiTarget](Get-NaHostIscsiTarget)

---

### Examples
> Example 1

```PowerShell
Get-NaHostIscsiAdapter
Get information about the Microsoft iSCSI Initiator on the host machine.

InstanceName    : Root\ISCSIPRT\0000_0
Vendor          : Microsoft Corporation
VendorModel     : iSCSI Initiator
SerialNumber    : MSFT-05-1991
DriverName      : msiscsi.sys
FirmwareVersion : 1.5
Iqn             : iqn.1991-05.com.microsoft:WIN2K8DEVRRE0

```

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.Toolkit.Windows.IscsiHbaInfo

---

### Notes
Category: host

---

### Syntax
```PowerShell
Get-NaHostIscsiAdapter [<CommonParameters>]
```

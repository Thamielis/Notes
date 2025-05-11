Get-NaHyperV
------------

### Synopsis
List Hyper-V virtual machines running on the local host along with all Data ONTAP storage resources that they are using.

---

### Description

List Hyper-V virtual machines running on the local host along with all Data ONTAP storage resources that they are using.

---

### Related Links
* [Get-NaHostDisk](Get-NaHostDisk)

---

### Examples
> Example 1

Get-NaHyperV | ft -AutoSize
List all Hyper-V virtual machines running on the local host that utilize Data ONTAP storage resources.

Name         Guid                                 Storage
----         ----                                 -------
OpalisVM     68073F14-5B9A-44F2-923F-766432BE9A68 {O:\OpalisVM.vhd}
W2k3OpalisVM F4043F56-79A1-4FA3-8F71-77E2CEBCF0E7 {P:\W2k3OpalisVM.vhd}

> Example 2

```PowerShell
(Get-NaHyperV OpalisVM).Storage
List the Data ONTAP storage resource(s) on Hyper-V virtual machine 'OpalisVM'.

VmDiskResourceName   : O:\OpalisVM.vhd
VmDiskResourceType   : VHD
HostDrivePath        : O:\
HostDiskName         : \\.\PHYSICALDRIVE3
HostVolume           : \\?\Volume{4044589b-4fd9-4c90-8495-f430945e7439}\
HostVolumeIsCsv      : False
ControllerName       : dunn
ControllerIgroup     : viaRPC.iqn.1991-05.com.microsoft:x3550rre7.rtprre.testdomain
ControllerAddress    : 10.61.167.60
ControllerLunPath    : /vol/opalis/opalisVM
ControllerVolumeName : opalis

```

---

### Parameters
#### **Name**
The name of one or more virtual machines to get.  Wildcards are permitted.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|VM     |

#### **All**
Specify to return all virtual machines, not just ones utilizing Data ONTAP storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.HostUtilities.DiskDiscovery.VirtualMachine

---

### Notes
Category: host

---

### Syntax
```PowerShell
Get-NaHyperV [[-Name] <String>] [-All] [<CommonParameters>]
```

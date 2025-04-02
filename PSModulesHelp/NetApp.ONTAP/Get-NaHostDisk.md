Get-NaHostDisk
--------------

### Synopsis
Lists all disks on the local host that are served by Data ONTAP LUNs.

---

### Description

Lists all disks on the local host including (when available) information about the underlying Data ONTAP LUNs.  This is useful for tracking which Data ONTAP controllers are serving storage to this host.

This cmdlet must be run with administrative privileges.

---

### Related Links
* [Get-NaHyperV](Get-NaHyperV)

* [Get-NaHostVolume](Get-NaHostVolume)

* [Initialize-NaHostDisk](Initialize-NaHostDisk)

* [Set-NaHostDisk](Set-NaHostDisk)

---

### Examples
> Example 1

Get-NaHostDisk -DataOntap
List all disks on the local Windows host that are served by Data ONTAP LUNs.

Disk       Size ControllerPath
----       ---- --------------
   1    50.0 GB benson:/vol/vol1/testlun
   2    50.0 GB benson:/vol/vol1/testlun2
   3     1.0 GB benson:/vol/vol1/lun3
   4    20.0 GB dunn:/vol/vol2/lun2
   5    20.0 GB dunn:/vol/vol2/lun1
   6    49.9 GB dunn:/vol/opalis/opalisVM
   7    20.0 GB dunn:/vol/vol2/lun5
   9    50.0 GB dunn:/vol/opalis/w2k3OpalisVM
  10    34.0 GB dunn:/vol/vol2/lun7b
  11    20.0 GB dunn:/vol/vol2/lun6

> Example 2

```PowerShell
Get-NaHostDisk 1 | fl *
List all details about disk 1.

HostDiskName         : \\.\PHYSICALDRIVE1
HostDiskWmiPath      : \\X3550RRE7\root\cimv2:Win32_DiskDrive.DeviceID="\\\\.\\PHYSICALDRIVE1"
HostDiskIndex        : 1
DiskSerialNumber     : HnT7cJYX0EIX
DiskSize             : 53694627840
ControllerName       : benson
ControllerIgroup     : viaRPC.iqn.1991-05.com.microsoft:x3550rre7.rtprre.testdomain
ControllerAddresses  : {10.61.167.61}
ControllerLunPath    : /vol/vol1/testlun
ControllerVolumeName : vol1

```
> Example 3

[wmi](Get-NaHostDisk 1).HostDiskWmiPath | fl *
Get even more info from Windows Management Instrumentation (WMI) about disk 1.

ConfigManagerErrorCode      : 0
LastErrorCode               :
NeedsCleaning               :
Status                      : OK
DeviceID                    : \\.\PHYSICALDRIVE1
StatusInfo                  :
Partitions                  : 1
BytesPerSector              : 512
ConfigManagerUserConfig     : False
DefaultBlockSize            :
Index                       : 1
InstallDate                 :
InterfaceType               : SCSI
MaxBlockSize                :
MaxMediaSize                :
MinBlockSize                :
NumberOfMediaSupported      :
SectorsPerTrack             : 63
Size                        : 53694627840
TotalCylinders              : 6528
TotalHeads                  : 255
TotalSectors                : 104872320
TotalTracks                 : 1664640
TracksPerCylinder           : 255
__GENUS                     : 2
__CLASS                     : Win32_DiskDrive
__SUPERCLASS                : CIM_DiskDrive
__DYNASTY                   : CIM_ManagedSystemElement
__RELPATH                   : Win32_DiskDrive.DeviceID="\\\\.\\PHYSICALDRIVE1"
__PROPERTY_COUNT            : 51
__DERIVATION                : {CIM_DiskDrive, CIM_MediaAccessDevice, CIM_LogicalDevice, CIM_LogicalElement...}
__SERVER                    : X3550RRE7
__NAMESPACE                 : root\cimv2
__PATH                      : \\X3550RRE7\root\cimv2:Win32_DiskDrive.DeviceID="\\\\.\\PHYSICALDRIVE1"
Availability                :
Capabilities                : {3, 4}
CapabilityDescriptions      : {Random Access, Supports Writing}
Caption                     : NETAPP LUN SCSI Disk Device
CompressionMethod           :
CreationClassName           : Win32_DiskDrive
Description                 : Disk drive
ErrorCleared                :
ErrorDescription            :
ErrorMethodology            :
FirmwareRevision            : 7350
Manufacturer                : (Standard disk drives)
MediaLoaded                 : True
MediaType                   : Fixed hard disk media
Model                       : NETAPP LUN SCSI Disk Device
Name                        : \\.\PHYSICALDRIVE1
PNPDeviceID                 : SCSI\DISK&VEN_NETAPP&PROD_LUN\1&1C121344&0&000200
PowerManagementCapabilities :
PowerManagementSupported    :
SCSIBus                     : 0
SCSILogicalUnit             : 0
SCSIPort                    : 3
SCSITargetId                : 2
SerialNumber                : HnT7cJYX0EIX
Signature                   : 3201900809
SystemCreationClassName     : Win32_ComputerSystem
SystemName                  : X3550RRE7
Scope                       : System.Management.ManagementScope
Path                        : \\X3550RRE7\root\cimv2:Win32_DiskDrive.DeviceID="\\\\.\\PHYSICALDRIVE1"
Options                     : System.Management.ObjectGetOptions
ClassPath                   : \\X3550RRE7\root\cimv2:Win32_DiskDrive
Properties                  : {Availability, BytesPerSector, Capabilities, CapabilityDescriptions...}
SystemProperties            : {__GENUS, __CLASS, __SUPERCLASS, __DYNASTY...}
Qualifiers                  : {dynamic, Locale, provider, UUID}
Site                        :
Container                   :

> Example 4

Get-NaHostDisk -Uninitialized
Get any uninitialized disks (with no partition information or volumes) on the system.

HostDrivePath                  Disk       Size ControllerPath
-------------                  ----       ---- --------------
                                  4    10.0 GB fas2040rre1:/vol/luns/test.lun

---

### Parameters
#### **DataOntap**
Get only disks stored on Data ONTAP LUNs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Uninitialized**
Get only uninitialized (newly created, with no partition information or volumes) disks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Disk**
Specify a Windows disk index to get details for a single disk.  Otherwise all disks are listed.

|Type      |Required|Position|PipelineInput                 |Aliases            |
|----------|--------|--------|------------------------------|-------------------|
|`[UInt32]`|true    |1       |true (ByValue, ByPropertyName)|DiskIndex<br/>Index|

---

### Inputs

---

### Outputs
* DataONTAP.HostUtilities.DiskDiscovery.DiskResource

---

### Notes
Category: host

---

### Syntax
```PowerShell
Get-NaHostDisk [-DataOntap] [-Uninitialized] [<CommonParameters>]
```
```PowerShell
Get-NaHostDisk [-Disk] <UInt32> [<CommonParameters>]
```

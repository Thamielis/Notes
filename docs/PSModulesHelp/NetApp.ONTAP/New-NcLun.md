New-NcLun
---------

### Synopsis
Create a LUN by one of two methods: by size or from file.

---

### Description

Create a LUN by one of two methods: by size or from file.

By size:  Create a new LUN of given size, with initially zero contents.  The LUN is created at the path given.  No file should already exist at the given path.  The directory specified in the path must be a qtree root directory.  The size of the created LUN may be larger than the size specified, in order to get an integral number of cylinders while reporting the geometry using SAN protocols.

From file:  Create a LUN from an existing file.  A new LUN is created at the given LUN path (which must be at a qtree root).  A hard link is created to the existing file.  The file contents are not copied or changed.  The file can be resized to a larger size, rounding up to a cylinder boundary.

---

### Related Links
* [Get-NcLun](Get-NcLun)

* [Remove-NcLun](Remove-NcLun)

---

### Examples
> Example 1

```PowerShell
New-NcLun /vol/bigvol/ExchangeTest 20gb -Unreserved
Create a new 20 GB LUN.

Protocol                           : image
Thin                               : True
Vserver                            : vserver1
Volume                             : bigvol
Qtree                              :
Path                               : /vol/bigvol/ExchangeTest
NcController                       : 10.61.172.155
Alignment                          : indeterminate
BackingSnapshot                    :
BlockSize                          : 512
CloneBackingSnapshot               :
Comment                            :
CreationTimestamp                  : 1317421474
CreationTimestampDT                : 9/30/2011 10:24:34 PM
DeviceBinaryId                     :
DeviceId                           :
DeviceTextId                       :
IsSpaceAllocEnabled                : False
IsSpaceReservationEnabled          : False
Mapped                             : False
MultiprotocolType                  : image
Online                             : True
PrefixSize                         : 0
ReadOnly                           : False
SerialNumber                       : 1k/T2$-sjT2Q
ShareState                         : none
Size                               : 21474836480
SizeUsed                           : 0
Staging                            : False
SuffixSize                         : 0
Uuid                               : f9d8d3ce-ebb2-11e0-8b71-123478563412
DeviceIdSpecified                  : False
IsSpaceAllocEnabledSpecified       : True
IsSpaceReservationEnabledSpecified : True
MappedSpecified                    : True
OnlineSpecified                    : True
ReadOnlySpecified                  : True
StagingSpecified                   : True

```
> Example 2

New-NcLun -Path /vol/san_vol/t1 -ForeignDisk "6000c29785c801bf5146d47aab30bfdf" -Unreserved -ThinProvisioningSupportEnabled -VserverContext pstk_san -Comment "Test lun"
Add a new thinly-provisioned LUN with a capacity equal to the size of foreign disk 6000c29785c801bf5146d47aab30bfdf.

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver
----                                           ----   -------- --------     ------ ------  ----  -------
/vol/san_vol/t1                            100.0 MB          0 image         True  False   True  pstk_san

---

### Parameters
#### **Path**
Path of the newly created LUN if successful. This path must not exist already (i.e. a file or directory with this same path).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Size**
New size for the LUN in bytes.  The format to use is: <number>[k|m|g|t] where the units are optional and "k" means kilobytes, "m" means megabytes, "g" means gigabytes, and "t" means terabytes.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **OsType**
The OS type for the LUN.  The default type if not specified is "image".  It is strongly recommended for the caller of this API to avoid using the "image" type because it could result in misconfigured LUNs.  For example, a LUN with OS type "image" could suffer major performance penalties when a Windows host is trying to access it.
The image type of the lun. This value determines the proper alignment settings for the desired host filesystem layout. Possible values:
"aix" - The LUN will be used to store an AIX filesystem
"hpux" - The LUN will be used to store an HP-UX filesystem
"hyper_v" - The LUN will be used to store Hyper-V VHDs (Virtual Hard Disks)
"image" - The default type indicating no assumptions will be made about the data stored in the LUN
"linux" - The LUN will be used to store a Linux filesystem with no partition table
"netware" - The LUN will be used to store a Netware filesystem
"openvms" - The LUN will be used to store an OpenVMS filesystem
"solaris" - The LUN will be used to store a Solaris filesystem, in a single slice partition
"solaris_efi" - The LUN will be used to store a Solaris filesystem with an EFI partition table
"vmware" - The LUN will be used to store a VMware Virtual Machine File System (VMFS) containing Virtual Machine Disk Files (VMDKs)
"windows" - The LUN will be used to store a Windows filesystem with a Master Boot Record (MBR) partition table.
"windows_2008" - The LUN will be used to store a Windows filesystem with a Master Boot Record (MBR) partition table on Windows 2008 or later
"windows_gpt" - The LUN will be used to store a Windows filesystem with a GUID Partition Table (GPT).
"xen" - The LUN stores Xen data.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Type   |

#### **Unreserved**
By default, the LUN is space-reserved.  If it is desired to manage space usage manually instead, this can be specified which will create a LUN without any space being reserved.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Thin   |

#### **ThinProvisioningSupportEnabled**
By default thin provisioning support is not enabled. If this switch is specified, standards compliant Thin Provisioning features will be enabled for the Lun, including in-band reporting of space threshold events. 
This parameter is available in ONTAP 8.3 and later.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |ThinSupport|

#### **PrefixSize**
The size of the prefix stream for this LUN in bytes.  Certain OS types store a small portion of the data corresponding to partition tables (or similar structures) in the prefix stream.  This is part of the LUN data and is transparent to hosts that access the LUN via block protocols.  The default size is based on the OS type.  Giving a value here overrides the default, but it is strongly recommended to avoid changing this default size.  The value in this field must be a multiple of 512 bytes.  Note that this value has no effect when the OS type is "image".This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **QosPolicyGroup**
QoS policy group defines measurable Service Level Objectives (SLOs) that apply to the storage objects with which the policy group is associated. If you do not assign a policy group to a lun, the system will not monitor and control the traffic to it.  This parameter is available in ONTAP 8.2 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Class**
The class of the LUN. Possible values:
"regular"            - The LUN is for normal blocks access,
"protocol_endpoint"  - The LUN is a vvol protocol endpoint,
"vvol"               - The LUN is a vvol data LUN.
The default value is "regular".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Comment**
A description for the LUN being created.  The comment can be at most 254 characters.
This parameter is available in ONTAP 8.3 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseExactSize**
Use the exact size specified instead of rounding to best fit geometry. If true, size must be a multiple of 512. The default value is false. This field may not be specified in combination with foreign-disk.
This parameter is available in ONTAP 9.2 and later.This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Application**
The application for the LUN being created. This value must match the application for the containing volume. 
This parameter is available in ONTAP 9.2 and later.This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **QosAdaptivePolicyGroup**
QoS adaptive policy group defines measurable Service Level Objectives (SLOs) that adjust based on the LUN's allocated space or used space.
This parameter is available in ONTAP 9.4 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BlockSize**
The physical size in bytes of a logical block for this LUN. Valid values for this field are 512 and 4096.
This parameter is available in ONTAP 9.5 and later.This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
The name/value pairs optionally stored with the LUN. This parameter is supported with Rest only.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[List <DataONTAP.C.Types.Lun.Attribute>]`|false   |named   |false        |

#### **AutoDelete**
LUN for auto deletion. Default value: False. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Copy**
Specifies LUN copy operation. This parameter is supported with Rest only.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Lun.Copy]`|false   |named   |false        |

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

#### **SourceFile**
A fully qualified path to the file to create the LUN from.  This must be in the same qtree as the LUN being created.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[String]`|true    |named   |false        |File<br/>FileName|

#### **ForeignDisk**
If a foreign Disk serial number is specified here, new size of the LUN will be of exact capacity as that of the Foreign Disk.
This parameter is available in ONTAP 8.3 and later.This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases                                              |
|----------|--------|--------|---------------------|-----------------------------------------------------|
|`[String]`|true    |named   |true (ByPropertyName)|Disk<br/>DiskSerialNumber<br/>ForeignDiskSerialNumber|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
API: lun-create-by-size, lun-create-from-file
Family: vserver

---

### Syntax
```PowerShell
New-NcLun [-Path] <String> [-Size] <String> [-OsType <String>] [-Unreserved] [-ThinProvisioningSupportEnabled] [-PrefixSize <Int64>] [-QosPolicyGroup <String>] [-Class <String>] [-Comment 
```
```PowerShell
<String>] [-UseExactSize <Boolean>] [-Application <String>] [-QosAdaptivePolicyGroup <String>] [-BlockSize <Int32>] [-VserverContext <String>] [-Attributes <List 
```
```PowerShell
<DataONTAP.C.Types.Lun.Attribute>>] [-AutoDelete <Boolean>] [-Copy <DataONTAP.C.Types.Lun.Copy>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcLun [-Path] <String> -SourceFile <String> [-OsType <String>] [-Unreserved] [-ThinProvisioningSupportEnabled] [-QosPolicyGroup <String>] [-Class <String>] [-Comment <String>] 
```
```PowerShell
[-Application <String>] [-QosAdaptivePolicyGroup <String>] [-BlockSize <Int32>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcLun [-Path] <String> -ForeignDisk <String> [-OsType <String>] [-Unreserved] [-ThinProvisioningSupportEnabled] [-PrefixSize <Int64>] [-QosPolicyGroup <String>] [-Class <String>] 
```
```PowerShell
[-Comment <String>] [-Application <String>] [-QosAdaptivePolicyGroup <String>] [-BlockSize <Int32>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

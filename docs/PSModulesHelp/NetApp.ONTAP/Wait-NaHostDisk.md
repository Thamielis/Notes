Wait-NaHostDisk
---------------

### Synopsis
Wait for a specific disk to appear, or wait for ongoing changes to the disk list to settle.

---

### Description

Wait for a specific disk to appear, or wait for ongoing changes to the disk list to settle.

---

### Related Links
* [Get-NaHostDisk](Get-NaHostDisk)

* [New-NaHostVolume](New-NaHostVolume)

---

### Examples
> Example 1

```PowerShell
Start-NaHostDiskRescan; Wait-NaHostDisk -SettlingTime 5000
Initiate a disk rescan and wait until any changes to the disk population are complete.
```
> Example 2

Start-NaHostDiskRescan; Wait-NaHostDisk -ControllerLunPath /vol/vol1/lun3 -ControllerName benson | New-NaHostVolume
Start a VDS rescan, wait for the given disk to become available and create a volume.

MountPoints Disk     Size GuidPaths
----------- ----     ---- ---------
{L:\}         11 994.0 MB {\\?\Volume{e092a3af-4176-4a48-808f-e865f8b35c48}\}

---

### Parameters
#### **DiskIndex**
The Windows disk index of a specific disk being sought.

|Type      |Required|Position|PipelineInput                 |Aliases       |
|----------|--------|--------|------------------------------|--------------|
|`[UInt32]`|true    |1       |true (ByValue, ByPropertyName)|Disk<br/>Index|

#### **Timeout**
The length of time in milliseconds to wait for a specific disk, or for stability in the disk list, before giving up.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **ControllerLunPath**
The path of the LUN that backs the host disk being sought, in the form /vol/<volume>/<lun> or /vol/<volume>/<qtree>/<lun>.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|true    |1       |true (ByPropertyName)|Lun<br/>Path|

#### **ControllerName**
The name of the controller hosting the LUN that backs the host disk being sought.

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |2       |true (ByPropertyName)|Controller<br/>Filer|

#### **SerialNumber**
The serial number of the host disk being sought.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **SettlingTime**
Length of disk population settling interval, in milliseconds.  If specified, this cmdlet will wait for the host disk list to remain stable for at least this length of time.

|Type     |Required|Position|PipelineInput|Aliases |
|---------|--------|--------|-------------|--------|
|`[Int32]`|true    |named   |false        |Settling|

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
Wait-NaHostDisk [-DiskIndex] <UInt32> [-Timeout <Int64>] [<CommonParameters>]
```
```PowerShell
Wait-NaHostDisk [-ControllerLunPath] <String> [-ControllerName] <String> [-Timeout <Int64>] [<CommonParameters>]
```
```PowerShell
Wait-NaHostDisk -SerialNumber <String> [-Timeout <Int64>] [<CommonParameters>]
```
```PowerShell
Wait-NaHostDisk -SettlingTime <Int32> [-Timeout <Int64>] [<CommonParameters>]
```

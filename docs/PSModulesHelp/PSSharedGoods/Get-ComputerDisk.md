Get-ComputerDisk
----------------

### Synopsis
Retrieves disk information from remote computers.

---

### Description

This function retrieves disk information from remote computers specified by the ComputerName parameter. It provides details such as Index, Model, Caption, SerialNumber, Description, MediaType, FirmwareRevision, Partitions, SizeGB, and PNPDeviceID.

---

### Examples
> EXAMPLE 1

Get-ComputerDisk -ComputerName AD1, AD2, EVO1, AD2019 | Format-Table -AutoSize *
Output:
WARNING: Get-ComputerSystem - No data for computer AD2019. Most likely an error on receiving side.

ComputerName Index Model                     Caption                   SerialNumber         Description MediaType             FirmwareRevision Partitions SizeGB PNPDeviceID
------------ ----- -----                     -------                   ------------         ----------- ---------             ---------------- ---------- ------ -----------
AD1              0 Microsoft Virtual Disk    Microsoft Virtual Disk                         Disk drive  Fixed hard disk media 1.0                       3    127 SCSI\DISK&VEN_MSFT&PROD_VIRTUAL_DISK\000000
AD2              0 Microsoft Virtual Disk    Microsoft Virtual Disk                         Disk drive  Fixed hard disk media 1.0                       3    127 SCSI\DISK&VEN_MSFT&PROD_VIRTUAL_DISK\000000
EVO1             0 WDC WD30EFRX-68AX9N0      WDC WD30EFRX-68AX9N0      WD-WMC1T2351095      Disk drive  Fixed hard disk media 80.00A80                  1   2795 SCSI\DISK&VEN_WDC&PROD_WD30EFRX-68AX9N0\4&191557A4&0&000000
EVO1             2 Samsung SSD 950 PRO 512GB Samsung SSD 950 PRO 512GB 0025_3857_61B0_0EF2. Disk drive  Fixed hard disk media 2B0Q                      3    477 SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_950\5&35365596&0&000000
EVO1             1 Samsung SSD 860 EVO 500GB Samsung SSD 860 EVO 500GB S3Z2NB0K176976A      Disk drive  Fixed hard disk media RVT01B6Q                  1    466 SCSI\DISK&VEN_SAMSUNG&PROD_SSD\4&191557A4&0&000100

---

### Parameters
#### **ComputerName**
Specifies the names of the remote computers from which to retrieve disk information.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to be used for retrieving disk information. Valid values are 'Default', 'Dcom', and 'Wsman'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Indicates whether to retrieve all available disk information.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
This function uses the Get-CimData cmdlet to retrieve disk information from remote computers.

---

### Syntax
```PowerShell
Get-ComputerDisk [[-ComputerName] <String[]>] [[-Protocol] <String>] [-All] [<CommonParameters>]
```

New-VBRStorageProtocolPolicy
----------------------------

### Synopsis
Creates protocol policies for storages.

---

### Description

This cmdlet creates a protocol policy for storages.  You can select a protocol over which you want to work with the storage system: iSCSI, FibreChannel, NFS or SMB.

---

### Related Links
* [Get-HP3Storage](Get-HP3Storage)

* [Set-HP3Storage](Set-HP3Storage)

---

### Examples
> Example 1

```PowerShell
$protocol = New-VBRStorageProtocolPolicy -iSCSI
This command creates an iSCSI protocol policy. Save it to the $protocol variable for future needs.
```
> Example 2

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServ"
$protocol = New-VBRStorageProtocolPolicy -iSCSI
Set-HP3Storage -Host $storage -ProtocolPolicy $protocol
This example shows how to change the protocol over which the HPE 3PAR StoreServ storage is connected.

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the New-VBRStorageProtocolPolicy cmdlet. Provide the iSCSI parameter. Save the result to the $protocol variable.
3. Run the Set-HP3Storage cmdlet. Set the $storage variable as the Host parameter value. Set the $protocol variable as the ProtocolPolicy parameter value.

---

### Parameters
#### **CreateExportRulesAutomatically**
For SMB and NFS protocols.
Indicates whether to automatically create export rules on the storage system during storage rescan, backup and restore operations.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FibreChannel**
Defines that the storage works over the FibreChannel protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **iSCSI**
Defines that the storage works over the iSCSI protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NFS**
Defines that the storage works over the NFS protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SMB**
Defines that the storage works over the SMB protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRStorageProtocolPolicy [-CreateExportRulesAutomatically] [-FibreChannel] [-iSCSI] [-NFS] [-SMB] [<CommonParameters>]
```

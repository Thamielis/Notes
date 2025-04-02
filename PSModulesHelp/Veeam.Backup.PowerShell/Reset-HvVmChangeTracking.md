Reset-HvVmChangeTracking
------------------------

### Synopsis
Clears change tracking data for a specific VM or specific virtual disk (VHD).

---

### Description

This cmdlet clears and resets change tracking data for a specific VM or for a specific virtual disk (VHD).

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Resetting Change Tracking Data for VM

$server = Get-VBRServer
Reset-HvVmChangeTracking -Server $server -VMName "Fileserver"
This example shows how to reset change tracking data for the Fileserver VM located on host represented by the $server variable.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
2. Run the Reset-HvVmChangeTracking cmdlet. Set the $server variable as the Server parameter value. Specify the VMName parameter value.
> Example 2. Resetting Change Tracking Data for Specified Virtual Disk

$server = Get-VBRServer
Reset-HvVmChangeTracking -Server $server -VhdPath "C:\Users\Public\Hyper-V\Virtual Hard Disks\hv_dns.vhdx"
This example shows how to reset change tracking data for the specified virtual disk. The VM is located on host represented by the $server variable.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
2. Run the Reset-HvVmChangeTracking cmdlet. Set the $server variable as the Server parameter value. Specify the VhdPath parameter value.

---

### Parameters
#### **Server**
Specifies the server where the VM reside.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |1       |False        |

#### **VhdPath**
Specifies the virtual disk (VHD). The cmdlet will reset change tracking data for this disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VMName**
Specifies the VM. The cmdlet will reset change tracking data for this VM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Reset-HvVmChangeTracking [-Server] <CHost> [-VhdPath <String>] [<CommonParameters>]
```
```PowerShell
Reset-HvVmChangeTracking [-Server] <CHost> [-VMName <String>] [<CommonParameters>]
```

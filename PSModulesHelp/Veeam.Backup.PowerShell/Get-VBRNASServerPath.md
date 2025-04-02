Get-VBRNASServerPath
--------------------

### Synopsis
Returns files paths to NFS network shared folders.

---

### Description

This cmdlet returns files paths to NFS network shared folders.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

---

### Examples
> Getting Files Paths to NFS Network Shared Folders

$server = Get-VBRUnstructuredServer -Name "\\LinuxSRV2049\November"
Get-VBRNASServerPath -Server $server
This example shows how to get file path to the \LinuxSRV2049\November share folder.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdelt. Specify the Name parameter value. Save the result to the $server parameter.
2. Run the Get-VBRNASServerPath cmdlet. Set the $server variable as the Server parameter value.

---

### Parameters
#### **Server**
Specifies NFS network shared folders. The cmdlet will return file paths to these shared folders. Accepts the VBRUnstructuredServer object. To create this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUnstructuredServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNASServerPath -Server <VBRUnstructuredServer> [<CommonParameters>]
```

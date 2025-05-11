Disconnect-VBRAzureBlobService
------------------------------

### Synopsis
Stops active sessions with Microsoft Azure Blob storage.

---

### Description

This cmdlet stops active sessions with Microsoft Azure Blob storage.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureBlobService](Connect-VBRAzureBlobService)

---

### Examples
> Stopping Active Session with Microsoft Azure Blob Storage

$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
$session = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
Disconnect-VBRAzureBlobService -Connection $session
This example shows how to stop an active session with Microsoft Azure Blob storage.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $session variable.
3. Run the Disconnect-VBRAzureBlobService cmdlet. Set the $session variable as the Connection parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with Microsoft Azure Blob storage. The cmdlet will stop the session with this object storage.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[IVBRAzureBlobConnection]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRAzureBlobConnection

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disconnect-VBRAzureBlobService -Connection <IVBRAzureBlobConnection> [<CommonParameters>]
```

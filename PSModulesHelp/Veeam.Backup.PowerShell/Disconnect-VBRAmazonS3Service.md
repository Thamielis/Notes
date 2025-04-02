Disconnect-VBRAmazonS3Service
-----------------------------

### Synopsis
Stops active sessions with Amazon S3 and S3 compatible object storage.

---

### Description

This cmdlet stops active sessions with Amazon S3 object storage. You can stop current sessions for the following types of Amazon object storage:
- Amazon S3
- S3 compatible (including IBM Cloud Object Storage)

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3Service](Connect-VBRAmazonS3Service)

---

### Examples
> Stopping Active Session with Amazon S3 Object Storage

$account = Get-VBRAmazonAccount -AccessKey "ABCDEFGHIGKLMNOP"
$session = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
Disconnect-VBRAmazonS3Service -Connection $session
This example shows how to stops an active session with Amazon S3 object storage.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $session variable.
3. Run the Disconnect-VBRAmazonS3Service cmdlet. Set the $session variable as the Connection parameter value.

---

### Parameters
#### **Connection**
Specifies a session with Amazon S3 object storage that you want to stop.

|Type                      |Required|Position|PipelineInput |
|--------------------------|--------|--------|--------------|
|`[IVBRAmazonS3Connection]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRAmazonS3Connection

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disconnect-VBRAmazonS3Service -Connection <IVBRAmazonS3Connection> [<CommonParameters>]
```

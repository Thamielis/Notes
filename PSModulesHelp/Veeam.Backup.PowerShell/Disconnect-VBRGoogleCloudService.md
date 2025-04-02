Disconnect-VBRGoogleCloudService
--------------------------------

### Synopsis
Stops active sessions with Google Cloud object storage.

---

### Description

This cmdlet stops active sessions with Google Cloud object storage.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

* [Connect-VBRGoogleCloudService](Connect-VBRGoogleCloudService)

---

### Examples
> Disconnecting Google Cloud Service

$account = Get-VBRGoogleCloudAccount -AccessKey "ABCDEFGHIGKLMNOP"
$session = Connect-VBRGoogleCloudService -Account $account -ServiceType CapacityTier
Disconnect-VBRGoogleCloudService -Connection $session
This example shows how to stops an active session with Google Cloud object storage.
Perform the following steps:
1. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
2. Run the Connect-VBRGoogleCloudService cmdlet. Specify the Account and the ServiceType parameters value. Save the result to the $session variable.
3. Run the Disconnect-VBRGoogleCloudService cmdlet. Set the $session variable as the Connection parameter value.

---

### Parameters
#### **Connection**
Specifies a session with Google Cloud object storage that you want to stop.

|Type                        |Required|Position|PipelineInput                 |
|----------------------------|--------|--------|------------------------------|
|`[VBRGoogleCloudConnection]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRGoogleCloudConnection

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disconnect-VBRGoogleCloudService -Connection <VBRGoogleCloudConnection> [<CommonParameters>]
```

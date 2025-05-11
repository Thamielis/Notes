Remove-VBRGoogleCloudComputeAccount
-----------------------------------

### Synopsis
Removes Google Cloud service account credentials records.

---

### Description

This cmdlet removes Google Cloud service account credentials records.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

---

### Examples
> Removing Google Cloud Service Account Credentials Record

$account = Get-VBRGoogleCloudComputeAccount -Name "GCP service account 1"
Remove-VBRGoogleCloudComputeAccount -Account $account
This example shows how to remove the GCP service account 1 Google Cloud service account credentials record.

Perform the following steps:
1. Run the Get-VBRGoogleCloudComputeAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Remove-VBRGoogleCloudComputeAccount cmdlet. Set the $account variable as the Account parameter.

---

### Parameters
#### **Account**
Specifies a Google Cloud service account credentials record that you want to remove.
Accepts the VBRGoogleCloudComputeAccount object.
To create this object, run the Add-VBRGoogleCloudComputeAccount cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeAccount]`|true    |named   |False        |

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
Remove-VBRGoogleCloudComputeAccount -Account <VBRGoogleCloudComputeAccount> [<CommonParameters>]
```

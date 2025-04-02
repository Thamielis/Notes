Set-VBRGoogleCloudComputeAccount
--------------------------------

### Synopsis
Modifies Google Cloud service account credentials record.

---

### Description

This cmdlet modifies an existing Google Cloud service account credentials record.

---

### Related Links
* [Get-VBRGoogleCloudComputeAccount](Get-VBRGoogleCloudComputeAccount)

---

### Examples
> Modifying Google Cloud Service Account Credentials Record

$account = Get-VBRGoogleCloudComputeAccount -Name "GCP service acc 1"
Set-VBRGoogleCloudComputeAccount -Account $account -Name "GCP service account 1"
This example shows how to modify the GCP service acc 1 Google Cloud service account credentials record.

Perform the following steps:
1. Run the Get-VBRGoogleCloudComputeAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Set-VBRGoogleCloudComputeAccount cmdlet. Set the $account variable as the Account parameter. Specify the Name parameter value.

---

### Parameters
#### **Account**
Specifies a Google Cloud service account credentials record that you want to modify.
Accepts the VBRGoogleCloudComputeAccount object.
To create this object, run the Add-VBRGoogleCloudComputeAccount cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeAccount]`|true    |named   |False        |

#### **Description**
Specifies a description for Google Cloud service account credentials records.
Veeam Backup & Replication will modify the description of the Google Cloud service account to the specified value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **JSONKey**
Specifies the path to the service account key in the JSON format.
Veeam Backup & Replication will modify the path to the Google Cloud service account key to the specified value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a name of the Google Cloud service account.
Veeam Backup & Replication will modify the name of the Google Cloud service account to the specified value.

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
Set-VBRGoogleCloudComputeAccount -Account <VBRGoogleCloudComputeAccount> [-Description <String>] [-JSONKey <String>] [-Name <String>] [<CommonParameters>]
```

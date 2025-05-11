Add-VBRGoogleCloudComputeAccount
--------------------------------

### Synopsis
Adds Google Cloud service account credentials record.

---

### Description

This cmdlet adds the VBRGoogleCloudComputeAccount object.
This object contains Google Cloud service account credentials records used to access the following services:
- Google Compute Engine.
- Google Cloud Platform Plug-in for Veeam Backup & Replication.
IMPORTANT This cmdlet does not create a Google Cloud service account. You must set up the Google Cloud service account beforehand, as described in Google Cloud documentation.

---

### Examples
> Creating Google Cloud Service Account

```PowerShell
Add-VBRGoogleCloudComputeAccount -Name "GCP service acc 1" -JSONKey "C:\Users\Admin\Downloads\eu-backup-253812-1bd00366edd2.json" -Description "Google Cloud Compute Administrator 1"
This command creates the GCP service acc 1 Google Cloud service account credentials record.
The cmdlet will use the json key located at the C:\Users\Admin\Downloads\eu-backup-253812-1bd00366edd2.json path.
```

---

### Parameters
#### **Description**
Specifies a description for Google Cloud service account credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **JSONKey**
Specifies the path to the service account key in the JSON format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Name**
Specifies a name of the Google Cloud service account.
Veeam Backup & Replication will save the Google Cloud service account under this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Add-VBRGoogleCloudComputeAccount [-Description <String>] -JSONKey <String> -Name <String> [<CommonParameters>]
```

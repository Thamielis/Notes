Get-VBRGoogleCloudComputeAccount
--------------------------------

### Synopsis
Returns Google Cloud service account credentials record.

---

### Description

This cmdlet returns Google Cloud service account credential records.

---

### Examples
> Example 1. Getting Google Cloud Service Account by ID

```PowerShell
Get-VBRGoogleCloudComputeAccount -Id "860aa7c0-3f4d-44f8-9deb-f86196f37660"
This command gets a Google Cloud service account credentials record with the 860aa7c0-3f4d-44f8-9deb-f86196f37660 ID.
```
> Example 2. Getting Google Cloud Service Account by Name

```PowerShell
Get-VBRGoogleCloudComputeAccount -Name "GCP service acc 1"
This command gets a Google Cloud credentials record with the GCP service acc 1 name.
```

---

### Parameters
#### **Id**
Specifies an ID of the service account.
The cmdlet will return the service account with this ID.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |False        |

#### **Name**
Specifies a name of the service account.
The cmdlet will return the service account with this name.

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
Get-VBRGoogleCloudComputeAccount [-Id <Guid>] [-Name <String>] [<CommonParameters>]
```

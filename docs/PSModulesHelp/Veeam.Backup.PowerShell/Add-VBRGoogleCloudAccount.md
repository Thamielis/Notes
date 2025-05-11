Add-VBRGoogleCloudAccount
-------------------------

### Synopsis
Creates Google Cloud credentials records.

---

### Description

This cmdlet creates the credentials records to access the Google Cloud service.

---

### Examples
> Creating Google Cloud Account

```PowerShell
Add-VBRGoogleCloudAccount -AccessKey "XXXXXXXXXXXXX" -SecretKey "XXXXXXXXXXXX" -Description "Google Cloud Administrator"
This command creates a Google Cloud credentials record.
```

---

### Parameters
#### **AccessKey**
Specifies an access key. The cmdlet will use this key to add Google Cloud credentials records to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Description**
Specifies a description for Google Cloud credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SecretKey**
Specifies a secret key. The cmdlet will use this secret key to add the Google Cloud credentials records to Veeam Backup & Replication.

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
Add-VBRGoogleCloudAccount -AccessKey <String> [-Description <String>] -SecretKey <String> [<CommonParameters>]
```

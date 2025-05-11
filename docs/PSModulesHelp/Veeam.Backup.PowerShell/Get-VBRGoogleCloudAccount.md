Get-VBRGoogleCloudAccount
-------------------------

### Synopsis
Returns Google Cloud credentials records.

---

### Description

This cmdlet returns an array of existing Google Cloud credentials records managed by Veeam Backup & Replication.

---

### Examples
> Example 1. Getting Google Cloud Account by Access Key

```PowerShell
Get-VBRGoogleCloudAccount -AccessKey "XXXXXXXXXXXXXXXXXXXXXXX"
This command gets a Google Cloud credentials record by the access key.
```
> Example 2. Getting Google Cloud Account by ID

```PowerShell
Get-VBRGoogleCloudAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c", "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c"
This command gets a Google Cloud credentials record by the ID.
```

---

### Parameters
#### **AccessKey**
Specifies an array of access keys for Google Cloud credentials records. The cmdlet will return Google Cloud credentials records with these access keys.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies an array of IDs for Google Cloud credentials records. The cmdlet will return Google Cloud credentials records with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRGoogleCloudAccount [-AccessKey <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRGoogleCloudAccount -Id <Guid[]> [<CommonParameters>]
```

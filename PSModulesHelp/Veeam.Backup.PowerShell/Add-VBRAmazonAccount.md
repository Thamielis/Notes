Add-VBRAmazonAccount
--------------------

### Synopsis
Creates AWS credentials records.

---

### Description

This cmdlet creates the VBRAmazonAccount object. This object contains AWS credentials records to access the following services:
- Amazon S3
- Amazon EC2
- S3 compatible (including IBM Cloud object storage)

---

### Examples
> Creating AWS Credentials Record

```PowerShell
Add-VBRAmazonAccount -AccessKey "ABCDEFGHIGKLMNOP" -SecretKey "vmdkflvm8908GUIEIE" -Description "Amazon credentials"
This command creates an AWS credentials record.
```

---

### Parameters
#### **AccessKey**
Specifies an access key. The cmdlet will use this key to add AWS credentials records to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Description**
Specifies a description for AWS credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SecretKey**
Specifies a secret key. The cmdlet will use this secret key to add the Amazon credentials records to Veeam Backup & Replication.

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
Add-VBRAmazonAccount -AccessKey <String> [-Description <String>] -SecretKey <String> [<CommonParameters>]
```

Get-VBRAmazonAccount
--------------------

### Synopsis
Returns AWS credentials records.

---

### Description

This cmdlet returns an array of existing AWS credentials records managed by Veeam Backup & Replication.
Veeam Backup & Replication will use these credentials records to access the following services:
- Amazon S3
- Amazon EC2
- S3 compatible (including IBM Cloud Object Storage)

---

### Examples
> Example 1. Getting AWS Credentials Record by Access Key

```PowerShell
Get-VBRAmazonAccount -AccessKey "XXXXXXXXXXXXXXXXXXXXXXX"
This command gets an AWS credentials record by the AWS access key.
```
> Example 2. Getting AWS Credentials Record by AWS ID

Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c", "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c
This command gets an AWS credentials record by the AWS ID.

---

### Parameters
#### **AccessKey**
Specifies an array of access keys for AWS credentials records.
The cmdlet will return AWS credentials records with these access keys.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Id**
Specifies an array of IDs for AWS credentials records. The cmdlet will return AWS credentials records with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

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
Get-VBRAmazonAccount [-AccessKey <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRAmazonAccount [-Id <Guid[]>] [<CommonParameters>]
```

Set-VBRAmazonAccount
--------------------

### Synopsis
Modifies AWS credentials records.

---

### Description

This cmdlet allows you to modify AWS credentials records.
You can modify credentials records for the following services:
- Amazon S3
- Amazon EC2
- S3 compatible (including IBM Cloud Object Storage)
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

---

### Examples
> Modifying AWS Credentials Record

$creds = Get-VBRAmazonAccount -AccessKey "ABCDEFGHIGKLMNOP"
Set-VBRAmazonAccount -Account $creds -SecretKey "vmdkfdvdvdvEIE"
This example shows how to modify an AWS credentials record.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $creds variable.
2. Run the Set-VBRAmazonAccount cmdlet. Set the $creds variable as the Account parameter value. Specify the SecretKey parameter value.

---

### Parameters
#### **AccessKey**
Specifies an access key. The cmdlet will use this access key to add AWS credentials records to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Account**
Specifies AWS credentials records that you want to modify.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRAmazonAccount]`|true    |named   |True (ByValue)|

#### **Description**
Specifies a description for AWS credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SecretKey**
Specifies a secret key. The cmdlet will use this secret key to add AWS credentials records to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAmazonAccount [-AccessKey <String>] -Account <VBRAmazonAccount> [-Description <String>] [-SecretKey <String>] [<CommonParameters>]
```

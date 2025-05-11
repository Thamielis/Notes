Set-AWSConnectionInfo
---------------------

### Synopsis
Sets AWS connection info

---

### Description

Sets the Access Key and Secret Access key for Amazon Web Services

---

### Related Links
* [Add-SecureSetting](Add-SecureSetting)

---

### Examples
> EXAMPLE 1

```PowerShell
Set-AWSConnectionInfo
```

---

### Parameters
#### **AwsAccessKeyId**
The Amazon Web Services Access Key

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **AmazonSecretAccessKey**
The Amazon Web Services Secret Access Key

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Set-AWSConnectionInfo [-AwsAccessKeyId] <String> [-AmazonSecretAccessKey] <String> [<CommonParameters>]
```

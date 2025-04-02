Set-VBRS3CompatibleRepositorySecurityOptions
--------------------------------------------

### Synopsis
Modifies settings that Veeam Agent uses to access S3 ?ompatible repositories.

---

### Description

This cmdlet modifies settings that Veeam Agent uses to access S3 compatible repositories.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

---

### Examples
> Example 1. Setting Direct Access to S3 ?ompatible Repositories [Using Bucket Credentials]

$s3repository = Get-VBRObjectStorageRepository -Name "S3 Compatible Repository"
Set-VBRS3CompatibleRepositorySecurityOptions -Repository $s3repository -AccessControlPolicy AllowAll
This example shows how to set Veeam Agent to access S3 compatible repositories directly using credentials for the S3 compatible bucket.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $s3repository variable.
2. Run the Set-VBRS3CompatibleRepositorySecurityOptions cmdlet. Set the $s3repository variable as the Repository parameter value. Set the AllowAll option for the AccessControlPolicy parameter.
> Example 2. Setting Direct Access to S3 Compatible Repositories [Using Service Token]

$s3repository = Get-VBRObjectStorageRepository -Name "S3 Compatible Repository"
Set-VBRS3CompatibleRepositorySecurityOptions -Repository $s3repository -AccessControlPolicy S3CompatibleManaged -IAMEndpoint "iam.wasabisys.com" -STSEndpoint "sts.wasabisys.com"
This example shows how to set Veeam Agent to access S3 compatible repositories directly. The cmdlet will connect to the iam.wasabisys.com  endpoint and will use secure credentials with the sts.wasabisys.com service token.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $s3repository variable.
2. Run the Set-VBRS3CompatibleRepositorySecurityOptions cmdlet. Specify the following settings:
- Set the $s3repository variable as the Repository parameter value.
- Set the S3CompatibleManaged option for the AccessControlPolicy parameter.
- Specify the IAMEndpoint parameter value.
- Specify the STSEndpoint parameter value.
> Example 3. Setting Access Through Gateway Server to S3 Compatible Repositories

$s3repository = Get-VBRObjectStorageRepository -Name "S3 Compatible Repository"
Set-VBRS3CompatibleRepositorySecurityOptions -Repository $s3repository -AccessControlPolicy VBRManaged
This example shows how to set Veeam Agent to access S3 compatible repositories directly using credentials for the S3 compatible bucket.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $s3repository variable.
2. Run the Set-VBRS3CompatibleRepositorySecurityOptions cmdlet. Set the $s3repository variable as the Repository parameter value. Set the VBRManaged option for the AccessControlPolicy parameter.

---

### Parameters
#### **AccessControlPolicy**
Specifies how Veeam Agent accesses S3 compatible repositories:
* AllowAll - use this option if you want Veeam Agent to access S3 compatible directly using credentials for the S3 compatible bucket.
* S3CompatibleManaged - use this option if you want Veeam Agent to access S3 compatible repositories directly using secure credentials with a service token.
Note: use the IAMEndpoint and STSEndpoint parameters to specify these credentials.
* VBRManaged - use this option if you want Veeam Agent to access S3 compatible repositories through gateway servers.
Valid Values:

* AllowAll
* VBRManaged
* S3CompatibleManaged

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRS3CompatibleAccessControlPolicyType]`|false   |named   |False        |

#### **IAMEndpoint**
For the direct secure connection with a service token.
Specifies an endpoint of your S3 compatible repository. The cmdlet will use this host to connect to this repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies an S3 compatible repository. The cmdlet will modify settings that Veeam Agent uses to access this repository.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRAmazonS3CompatibleRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **STSEndpoint**
For the direct secure connection with a service token.
Specifies the security token of your S3 compatible repository. The cmdlet will use this security token to connect to this repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3CompatibleRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRS3CompatibleRepositorySecurityOptions [-AccessControlPolicy {AllowAll | VBRManaged | S3CompatibleManaged}] [-IAMEndpoint <String>] -Repository <VBRAmazonS3CompatibleRepository> [-STSEndpoint <String>] 
```
```PowerShell
[<CommonParameters>]
```

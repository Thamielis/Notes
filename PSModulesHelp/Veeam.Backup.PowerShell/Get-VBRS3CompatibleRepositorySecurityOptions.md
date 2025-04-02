Get-VBRS3CompatibleRepositorySecurityOptions
--------------------------------------------

### Synopsis
Returns settings that Veeam Agent uses to access S3 compatible repositories.

---

### Description

This cmdlet returns settings that Veeam Agent uses to access S3 compatible repositories. These settings contain the following information:
- The repository ID.
- The access control policy that specifies the Veeam Agent job mode:
o AllowAll - defines that Veeam Agent has a direct access to the S3 compatible repository. To authenticate against the repository, Veeam Agent uses credentials for the S3 compatible bucket.
o S3CompatibleManaged - defines that Veeam Agent has a direct access to the S3 compatible repository. To authenticate against the repository, Veeam Agent uses secure credentials with a service token.
o VBRManaged - defines that Veeam Agent accesses S3 compatible repositories through gateway servers.
- An endpoint that Veeam Agent uses to accesses S3 compatible repositories directly using secure credentials.
- A security token that Veeam Agent uses to accesses S3 compatible repositories directly using secure credentials.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

---

### Examples
> Getting Access Settings for S3 ?ompatible Repositories

$s3repository = Get-VBRObjectStorageRepository -Name "Repository 05"
Get-VBRS3CompatibleRepositorySecurityOptions -Repository $s3repository
This example shows how to get settings that Veeam Agent uses to access the Repository 05 S3 compatible repository.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $s3repository variable.
2. Run the Get-VBRS3CompatibleRepositorySecurityOptions cmdlet. Set the $s3repository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies an S3 compatible repository. The cmdlet will return settings that Veeam Agent uses to access S3 compatible repositories directly.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRAmazonS3CompatibleRepository]`|true    |named   |True (ByPropertyName, ByValue)|

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
Get-VBRS3CompatibleRepositorySecurityOptions -Repository <VBRAmazonS3CompatibleRepository> [<CommonParameters>]
```

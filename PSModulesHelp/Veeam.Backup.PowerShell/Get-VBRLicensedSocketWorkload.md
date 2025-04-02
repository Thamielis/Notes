Get-VBRLicensedSocketWorkload
-----------------------------

### Synopsis
Returns details on licensed hosts.

---

### Description

This cmdlet returns the VBRLicensedSocketWorkload object that contains details on licensed hosts for the per-socket license that Veeam Backup & Replication applies to back up these hosts.

---

### Related Links
* [Get-VBRInstalledLicense](Get-VBRInstalledLicense)

---

### Examples
> Getting Details on Licensed Hosts

$license = Get-VBRInstalledLicense
Get-VBRLicensedSocketWorkload -License $license
This example shows how to get details on licensed hosts for the per-socket license that Veeam Backup & Replication applies to back up these hosts.
Perform the following steps:
1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $license variable.
2. Run the Get-VBRLicensedSocketWorkload cmdlet. Set the $license variable as the License parameter value.

---

### Parameters
#### **License**
Specifies a license. The cmdlet will return details on licensed hosts that Veeam Backup & Replication backs up using this license.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRInstalledLicense]`|true    |named   |False        |

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
Get-VBRLicensedSocketWorkload -License <VBRInstalledLicense> [<CommonParameters>]
```

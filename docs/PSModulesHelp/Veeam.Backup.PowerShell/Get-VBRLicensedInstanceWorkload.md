Get-VBRLicensedInstanceWorkload
-------------------------------

### Synopsis
Returns details on protected workloads for the per-instance license.

---

### Description

This cmdlet returns the VBRLicensedInstanceWorkload object that contains details on protected workloads for the per-instance license that Veeam Backup & Replication applies to back up these workloads.
Note: The cmdlet returns information on a number of processed workloads that consume instances from the license scope. Instances are not consumed if a provider obtains a rental license and workloads have been processed for the first time during the current month. These workloads are counted separately and the cmdlet will display them under the following tenant settings:
- NewVMBackupCount
- NewWorkstationBackupCount
- NewServerBackupCount
- NewReplicaCount
Workloads that start to consume instances on the first day of the following month are displayed under the following tenant settings:
- VMBackupCount
- WorkstationBackupCount
- ServerBackupCount
- ReplicaCount
If a tenant obtains a rental license, these workloads do not consume instances from the provider license scope and are displayed under the following tenant settings:
- RentalVMBackupCount
- RentalWorkstationBackupCount
- RentalServerBackupCount
- RentalReplicaCount

---

### Related Links
* [Get-VBRInstalledLicense](Get-VBRInstalledLicense)

---

### Examples
> Getting Details on Protected Workloads

$license = Get-VBRInstalledLicense
Get-VBRLicensedSocketWorkload -License $license
This example shows how to get details on protected workloads for the per-instance license that Veeam Backup & Replication applies to back up these workloads.
Perform the following steps:
1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $license variable.
2. Run the Get-VBRLicensedInstanceWorkload cmdlet. Set the $license variable as the License parameter value.

---

### Parameters
#### **License**
Specifies a license. The cmdlet will return details on protected workloads that Veeam Backup & Replication backs up using this license.

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
Get-VBRLicensedInstanceWorkload -License <VBRInstalledLicense> [<CommonParameters>]
```

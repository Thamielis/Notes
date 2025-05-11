Get-VBRInstanceLicenseSummary
-----------------------------

### Synopsis
Returns details on the per-instance license usage.

---

### Description

This cmdlet returns the VBRInstanceLicenseSummary object that contains details on the per-instance license usage.

---

### Related Links
* [Get-VBRInstalledLicense](Get-VBRInstalledLicense)

---

### Examples
> Getting Details on PerInstance License

$license = Get-VBRInstalledLicense
Get-VBRInstanceLicenseSummary -License $license
LicensedInstancesNumber : 1000
UsedInstancesNumber     : 2
NewInstancesNumber      : 0
RentalInstancesNumber   : 0
Object                  : {Veeam.Backup.PowerShell.Infos.VBRInstanceLicenseSummaryObject}
Workload                : {BackupServer01, SQLServer05}
This example shows how to get details on the per-socket license usage.
Perform the following steps:
1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $license variable.
2. Run the Get-VBRInstanceLicenseSummary cmdlet. Set the $license variable as the License parameter value.
The cmdlet output will contain the following details on the per-instance license usage: LicensedInstancesNumber, UsedInstancesNumber, NewInstancesNumber, RentalInstancesNumber, Object and Workload.

---

### Parameters
#### **License**
Specifies a license. The cmdlet will return details on the per-instance license usage for this license.

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
Get-VBRInstanceLicenseSummary -License <VBRInstalledLicense> [<CommonParameters>]
```

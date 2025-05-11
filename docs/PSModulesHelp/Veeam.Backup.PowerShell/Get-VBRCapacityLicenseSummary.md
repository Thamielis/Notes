Get-VBRCapacityLicenseSummary
-----------------------------

### Synopsis
Returns details on capacity of licenses installed on a backup server.

---

### Description

This cmdlet returns details on capacity of licenses installed on a backup server.

---

### Related Links
* [Get-VBRInstalledLicense](Get-VBRInstalledLicense)

---

### Examples
> Example 1

$lic = Get-VBRInstalledLicense
Get-VBRCapacityLicenseSummary -License $lic
LicensedCapacityTb UsedCapacityTb Object Workload
------------------ -------------- ------ --------
                 0              0 {}     {}
This example shows how to get details on capacity of licenses installed on a backup server.

Perform the following steps:

1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $lic variable.   2. Run the Get-VBRCapacityLicenseSummary cmdlet. Set the $lic variable as the License parameter value.     The cmdlet output will contain the following details on the license capacity: LicensedCapacityTb, UsedCapacityTb, Object, Workload.

---

### Parameters
#### **License**
Specifies a license installed on a backup server. The cmdlet will return details on capacity of this license. Accepts the VBRInstalledLicense object. To get this object, run the Get-VBRInstalledLicense cmdlet.

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
Get-VBRCapacityLicenseSummary -License <VBRInstalledLicense> [<CommonParameters>]
```

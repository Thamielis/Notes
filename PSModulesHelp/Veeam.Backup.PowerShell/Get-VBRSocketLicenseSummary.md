Get-VBRSocketLicenseSummary
---------------------------

### Synopsis
Returns details on the per-socket license usage.

---

### Description

This cmdlet returns the VBRSocketLicenseSummary object that contains details on the per-socket license usage.

---

### Related Links
* [Get-VBRInstalledLicense](Get-VBRInstalledLicense)

---

### Examples
> Getting Details on PerSocket License

$license = Get-VBRInstalledLicense
Get-VBRSocketLicenseSummary -License $license
        LicensedSocketsNumber             UsedSocketsNumber        RemainingSocketsNumber Workload
        ---------------------             -----------------        ---------------------- --------
                           50                             2                            48 {Microsoft Hyper-V}
                           75                            10                            65 {VMware vSphere}
                           30                            25                             5 {Nutanix AHV}
This example shows how to get details on the per-socket license usage.
Perform the following steps:
1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $license variable.
2. Run the Get-VBRSocketLicenseSummary cmdlet. Set the $license variable as the License parameter value.
The cmdlet output will contain the following details on the per-socket license usage:LicensedSocketsNumber, UsedSocketsNumber, RemainingSocketsNumber and Workload.

---

### Parameters
#### **License**
Specifies a license. The cmdlet will return details on the per-socket license usage for this license.

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
Get-VBRSocketLicenseSummary -License <VBRInstalledLicense> [<CommonParameters>]
```

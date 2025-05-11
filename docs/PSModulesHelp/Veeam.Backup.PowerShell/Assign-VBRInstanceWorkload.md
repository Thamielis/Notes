Assign-VBRInstanceWorkload
--------------------------

### Synopsis
Sets the product edition for standalone Veeam Agents.

---

### Description

This cmdlet sets the product edition for standalone Veeam Agents to one of the following:
- Server edition
- Workstation edition

---

### Related Links
* [Get-VBRInstalledLicense](Get-VBRInstalledLicense)

* [Get-VBRLicensedSocketWorkload](Get-VBRLicensedSocketWorkload)

---

### Examples
> Example 1. Setting Server Edition

$license = Get-VBRInstalledLicense
$workload = Get-VBRLicensedInstanceWorkload -License $license
Assign-VBRInstanceWorkload -Workload $workload -LicenseMode Workstation
This example shows how to set the Server edition for a standalone Veeam Agent that is running the Workstation edition.
Perform the following steps:
1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $license variable.
2. Run the Get-VBRLicensedSocketWorkload cmdlet. Set the $license variable as the License parameter value. Save the result to the $workload variable.
3. Run the Assign-VBRInstanceWorkload cmdlet. Set the $workload variable as the Workload parameter value. Set the Server option for the LicenseMode parameter.
> Example 2. Setting Workstation Edition

$license = Get-VBRInstalledLicense
$workload = Get-VBRLicensedInstanceWorkload -License $license
Assign-VBRInstanceWorkload -Workload $workload -LicenseMode Server
This example shows how to set the Workstation edition for a standalone Veeam Agent that is running the Server edition.
Perform the following steps:
1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $license variable.
2. Run the Get-VBRLicensedSocketWorkload cmdlet. Set the $license variable as the License parameter value. Save the result to the $workload variable.
3. Run the Assign-VBRInstanceWorkload cmdlet. Set the $workload variable as the Workload parameter value. Set the Workstation value as the LicenseMode parameter value.

---

### Parameters
#### **LicenseMode**
Specifies a product edition. The cmdlet will set this product edition to protected. You can specify either of the following product editions:
* Server
* Workstation
Valid Values:

* Server
* Workstation

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRAgentLicenseMode]`|true    |named   |False        |

#### **Workload**
Specifies an array of protected workloads. The cmdlet will set the product edition for these workloads.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRLicensedInstanceWorkload[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRLicensedInstanceWorkload[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Assign-VBRInstanceWorkload -LicenseMode {Server | Workstation} -Workload <VBRLicensedInstanceWorkload[]> [<CommonParameters>]
```

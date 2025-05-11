Get-VBRInstalledLicense
-----------------------

### Synopsis
Returns details about licenses installed on a backup server.

---

### Description

This cmdlet returns details about licenses installed on a backup server.
For more information on the license report, see the Viewing License Information section of User Guide for VMware vSphere.

---

### Examples
> Example 1. Getting Details About License

```PowerShell
Get-VBRInstalledLicense
This command returns details about a license installed on a backup server.
```
> Example 2. Getting Details About Licensed CPU Sockets

$license = Get-VBRInstalledLicense
$license.SocketLicenseSummary
LicensedSocketsNumber UsedSocketsNumber RemainingSocketsNumber     Type
--------------------- ----------------- ----------------------     ----
                    3                 2                     15   HyperV
                    2                 1                     20  vSphere
This example shows how to get details about a number of licensed CPU sockets on protected Microsoft Hyper-V hosts and VMware ESXi hosts.
Perform the following steps:
1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $license variable.
2. Get the SocketLicenseSummary property of the $license variable.
> Example 3. Getting Details About Available Licenses

$license =  Get-VBRInstalledLicense
$license.InstanceLicenseSummary
LicensedInstancesNumber : 1000
UsedInstancesNumber     : 2
NewInstancesNumber      : 0
RentalInstancesNumber   : 0
Object                  : {Veeam.Backup.PowerShell.Infos.VBRInstanceLicenseSummaryObject}
Workload                : {srv009, SQLsrv}
This example shows how to get details about a number of available instances.
Perform the following steps:
1. Run the Get-VBRInstalledLicense cmdlet. Save the result to the $license variable.
2. Get the InstanceLicenseSummary property of the $license variable.

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
Get-VBRInstalledLicense [<CommonParameters>]
```

Get-VBRVCDOrgVdcNetworkInfo
---------------------------

### Synopsis
Returns target networks for Cloud Director replica mapping.

---

### Description

This cmdlet returns target networks for Cloud Director replica mapping.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Getting all vCD Replica Mapping Networks

$server = Get-VBRServer -Name vCloud
Get-VBRVCDOrgVdcNetworkInfo -Server $server
This example shows how to get all mapping networks that are available on the vCloud vCD host.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRVCDOrgVdcNetworkInfo cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Getting vCD Replica Mapping Networks by Name

$server = Get-VBRServer -Name vCloud
Get-VBRVCDOrgVdcNetworkInfo -Server $server -Name "Net06", "Net10", "Net21"
This example shows how to get the Net06, Net10, Net21 mapping networks that are available on the vCloud vCD host.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRVCDOrgVdcNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies an array of names for Cloud Director networks.
The cmdlet will return these networks.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies an array of Cloud Director hosts.
The cmdlet will return networks that are available on these Cloud Director hosts.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRVCDOrgVdcNetworkInfo [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```

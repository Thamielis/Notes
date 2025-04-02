Get-VBRHvServerNetworkInfo
--------------------------

### Synopsis
Returns virtual networks for a Hyper-V host.

---

### Description

This cmdlet returns the list of all virtual networks to which a selected Hyper-V host is connected.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Where-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Where-Object)

---

### Examples
> Example 1. Getting all Networks Connected to Specific Hyper-V Host

```PowerShell
Get-VBRHvServerNetworkInfo -Server "srv01.tech.local"
This command shows how to get all networks to which the srv01.tech.local host is connected.
```
> Example 2. Getting Networks Connected to Specific Hyper-V Host Using Host Name

$server = Get-VBRServer -Type HvServer -Name "srv01.tech.local"
Get-VBRHvServerNetworkInfo -Server $server
This command shows how to look for the networks to which the srv01.tech.local host is connected.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value.
> Example 3. Getting Specific Network Connected to Specific Hyper-V Host

$networks = Get-VBRHvServerNetworkInfo -Server "srv01.tech.local"
$targetnetwork = $networks[5]
This example shows how get one network from the list of networks that are connected to the srv01.tech.local host.
Perform the following steps:
1. Run the Get-VBRHvServerNetworkInfo cmdlet. Specify the Server parameter value. Save the result to the $networks variable.
2. The Get-VBRHvServerNetworkInfo cmdlet will return an array of networks. Specify the necessary network of the $networks variable using the square brackets. Save the result to the $targetnetwork variable.

---

### Parameters
#### **Server**
Specifies the Hyper-V host. The cmdlet will return virtual networks connected to this host.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRHvServerNetworkInfo -Server <CHost> [<CommonParameters>]
```

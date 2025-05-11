Get-VBRViServerNetworkInfo
--------------------------

### Synopsis
Returns virtual networks for a VMware host.

---

### Description

This cmdlet returns the list of all virtual networks to which a selected VMware host is connected.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Where-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Where-Object)

---

### Examples
> Example 1. Getting Networks Connected to Specific VMware Host

$server = Get-VBRServer -Type ESXi -Name "srv01.tech.local"
Get-VBRViServerNetworkInfo -Server $server
This example shows how to get the networks to which the srv01.tech.local host is connected.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Getting Networks Connected to Specific VMware Host Using Host Name

```PowerShell
Get-VBRViServerNetworkInfo -Server "srv01.tech.local"
This command shows how to look get the networks to which the srv01.tech.local host is connected.
```
> Example 3. Getting Specific Network Connected to Specific VMware Host

$networks = Get-VBRViServerNetworkInfo -Server "srv01.tech.local"
$targetnetwork = $networks[5]
This example shows how to get one network from the list of networks that are connected to the srv01.tech.local host.
Perform the following steps:
1. Run the Get-VBRViServerNetworkInfo cmdlet. Specify the Server parameter value. Save the result to the $networks variable.
2. The Get-VBRViServerNetworkInfo cmdlet will return an array of networks. Specify the necessary network of the $networks variable using the square brackets. Save the result to the $targetnetwork variable.
> Example 4. Getting Specific Network Connected to Specific VMware Host [Using Pipeline]

Get-VBRViServerNetworkInfo -Server "srv01.tech.local" | Where-Object { $_.NetworkName -eq "NW01" }
This example shows how to get the NW01 network that is connected to the srv01.tech.local host.
Perform the following steps:
1. Run the Get-VBRViServerNetworkInfo cmdlet. Specify the Server parameter value.
2. Pipe the cmdlet output to the Where-Object cmdlet. Specify the following settings:
- Provide the $_. automatic variable.
- Provide the NetworkName property.
- Specify the eq comparison operator value.

---

### Parameters
#### **Server**
Specifies the VMware host. The cmdlet will return virtual networks connected to this host.

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
Get-VBRViServerNetworkInfo -Server <CHost> [<CommonParameters>]
```

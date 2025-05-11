Remove-VBRCloudProvider
-----------------------

### Synopsis
Removes service providers.

---

### Description

This cmdlet removes service provider from Veeam Backup & Replication. When you remove a service provider, you become unable to reach your cloud repository. The data stored on the cloud repository remains. You can access it if you add the service provider to the Veeam backup console again.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

---

### Examples
> Example 1. Removing All Cloud Service Providers [Using Pipeline]

Get-VBRCloudProvider | Remove-VBRCloudProvider
This command removes all cloud service providers added to Veeam Backup & Replication. The service providers are obtained by Get-VBRCloudProvider and piped down.
> Example 2. Removing Cloud Service Provider [Using Variable]

$CloudProvider1 = Get-VBRCloudProvider -Name "104.45.95.227"
Remove-VBRCloudProvider -CloudProvider $CloudProvider1
This example shows how to remove a selected service provider.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $CloudProvider1 variable.
2. Run the Remove-VBRCloudProvider cmdlet. Set the $CloudProvider1 variable as the CloudProvider parameter value.
> Example 3. Removing All Cloud Service Providers [Using Pipeline]

```PowerShell
Get-VBRCloudProvider -Name "104.45.95.227" | Remove-VBRCloudProvider
This command removes the service provider with the 104.45.95.227 IP address. The service provider is obtained by Get-VBRCloudProvider and piped down.
```

---

### Parameters
#### **CloudProvider**
Specifies the array of cloud providers you want to remove. Accepts the VBRCloudProvider[] object. To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRCloudProvider[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudProvider[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCloudProvider -CloudProvider <VBRCloudProvider[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```

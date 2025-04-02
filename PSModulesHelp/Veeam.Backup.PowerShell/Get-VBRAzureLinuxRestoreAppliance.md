Get-VBRAzureLinuxRestoreAppliance
---------------------------------

### Synopsis
Returns helper appliances for restoring Linux VMs to Microsoft Azure.

---

### Description

This cmdlet returns helper appliances for restoring Linux VMs to Microsoft Azure.
NOTE: This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Examples
> Example 1

```PowerShell
Get-VBRAzureLinuxRestoreAppliance
This command returns all helper appliances that will be used to restore Linux VMs.
```
> Example 2

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
Get-VBRAzureLinuxRestoreAppliance -Account $account | Select-Object -First 1
This example shows how to get a helper appliance for the RestoreToAzureRM@Veeam.com Microsoft Azure account.
Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Type and Name parameter values. Save the result to the $account variable.
2. Run the Get-VBRAzureLinuxRestoreAppliance cmdlet. Set the $account variable as the Account parameter value.
3. Pipe the cmdlet output to the Select-Object cmdlet. Specify the First parameter value.

---

### Parameters
#### **Account**
Specifies the Microsoft Azure account.
The cmdlet will return helper appliances associated with this account.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRAzureAccount]`|false   |named   |False        |

#### **Id**
Specifies an array of IDs.
The cmdlet will return helper appliances with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Location**
Specifies the Microsoft Azure account.
The cmdlet will return helper appliances associated with this account.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAzureLocation]`|false   |named   |False        |

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
Get-VBRAzureLinuxRestoreAppliance [-Account <VBRAzureAccount>] [-Location <VBRAzureLocation>] [<CommonParameters>]
```
```PowerShell
Get-VBRAzureLinuxRestoreAppliance [-Id <Guid[]>] [-Location <VBRAzureLocation>] [<CommonParameters>]
```

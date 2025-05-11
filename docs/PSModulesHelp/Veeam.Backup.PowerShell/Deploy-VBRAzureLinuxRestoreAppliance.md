Deploy-VBRAzureLinuxRestoreAppliance
------------------------------------

### Synopsis
Deploys or removes helper appliances for restoring Linux VMs to Microsoft Azure.

---

### Description

This cmdlet deploys or removes helper appliances for restoring Linux VMs to Microsoft Azure.
The cmdlet offers the following possibilities:
- To remove all helper appliances associated with an account, run the 1st parameter set.
- To remove selected helper appliances, run the 2nd parameter set and enumerate only those helper appliances that must remain.
- To deploy a new helper appliance or a number of new helper appliances, run the 2nd parameter set and pass an array of helper appliances you want to deploy. Note that if there are any existing helper appliances already deployed for this account that you want to keep, you must include them in the array.
- To modify settings of an existing helper appliance or helper appliances, run the 2nd parameter set and pass an array of existing helper appliances with different settings.

Run the Get-VBRAzureApplicanceSession cmdlet to get the status of sessions initiated by this cmdlet.

IMPORTANT! Consider the following:
- This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).
- This cmdlet always deploys the helper appliances anew. The array of helper appliances that you pass to this cmdlet must contain all helper appliances that you want to be associated with the account.
- If there are existing helper appliances associated with this account, but which you do not include in the array you pass, the cmdlet will remove them.
- If there are existing helper appliances associated with this account, and you pass them with different settings, the cmdlet will re-deploy them with the new settings.

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$appliancesession = Deploy-VBRAzureLinuxRestoreAppliance -Account $account -RemoveAll:$true
This example shows how to remove all Linux VM restore helper appliances associated with a Microsoft Azure account.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Set the ResourceManager option for the Type parameter. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Deploy-VBRAzureLinuxRestoreAppliance cmdlet. Set the $account variable as the Account parameter value. Set the RemoveAll switch parameter to $true. Save the deployment session to the $appliancesession variable to check its status.
> Example 2

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$appliances = Get-VBRAzureLinuxRestoreAppliance
$currentappliance = $appliances[0]
$newappliance = $appliances[1]
$appliancesession = Deploy-VBRAzureLinuxRestoreAppliance -Account $account -Appliance $currentappliance, $newappliance
This example shows how to deploy an additional Linux VM restore helper appliance for a Microsoft Azure account.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Set the ResourceManager value as the Type parameter value. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Get-VBRAzureLinuxRestoreAppliance cmdlet. Save the array to the $appliances variable.
3. From the $appliances array, get the Linux helper appliance that is currently used. Save it to the $currentappliance variable.
4. From the $appliances array, get the new Linux helper appliance. Save it to the $newappliance variable.
5. Run the Deploy-VBRAzureLinuxRestoreAppliance cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the $appliance and the $newappliance variables as the Appliance parameter value.
- Save the deployment session to the $appliancesession variable to check its status.

---

### Parameters
#### **Account**
Specifies the account.
For removing helper appliances: the cmdlet will remove all helper appliances connected to this account.
For deploying helper appliances: the cmdlet will deploy helper appliances for this account.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRAzureAccount]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Appliance**
Specifies the array of helper appliances you want to deploy.

|Type                               |Required|Position|PipelineInput        |
|-----------------------------------|--------|--------|---------------------|
|`[VBRAzureLinuxRestoreAppliance[]]`|true    |named   |True (ByPropertyName)|

#### **RemoveAll**
Defines that the cmdlet removes all helper appliances associated with the account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Wait**
Indicates that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureAccount

Veeam.Backup.PowerShell.Infos.VBRAzureLinuxRestoreAppliance[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Deploy-VBRAzureLinuxRestoreAppliance -Account <VBRAzureAccount> -Appliance <VBRAzureLinuxRestoreAppliance[]> [-Wait] [<CommonParameters>]
```
```PowerShell
Deploy-VBRAzureLinuxRestoreAppliance -Account <VBRAzureAccount> -RemoveAll [-Wait] [<CommonParameters>]
```

Get-VBRCloudSubUser
-------------------

### Synopsis
Returns cloud subuser accounts.

---

### Description

This cmdlet returns cloud subuser accounts of the following types:
- Simple cloud subtenant accounts
- vCD cloud subtenant accounts
You can get the list of all existing subuser accounts, or narrow down the search results to name, ID or cloud provider. Use an appropriate parameter set for each case.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

---

### Examples
> Example 1. Getting All Cloud Subusers

```PowerShell
Get-VBRCloudSubUser
This command returns all cloud subusers.
```
> Example 2. Getting Cloud Subuser by Name

```PowerShell
Get-VBRCloudSubUser -Name "Subuser 1"
This command looks for a subuser by the subuser name.
```
> Example 3. Getting Cloud Subuser by Cloud Service Provider

$cloudProvider = Get-VBRCloudProvider
Get-VBRCloudSubUser -CloudProvider $cloudprovider
This example shows how to get a subuser by a cloud service provider.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Save the result to the $cloudprovider variable.
2. Run the Get-VBRCloudSubUser cmdlet. Set the $cloudprovider variable as the CloudProvider parameter value.

---

### Parameters
#### **CloudProvider**
Specifies the cloud provider. The cmdlet will return subusers associated with this cloud provider.  Accepts the VBRCloudProvider[] object. To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRCloudProvider[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies an array of subuser ID.  The cmdlet will return subusers with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Mode**
Specifies the cloud subtenant mode. You can select either of the following modes:
* Common
* AgentManagement
The cmdlet will return subusers of the specified mode.
Valid Values:

* Common
* AgentManagement

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRCloudSubUserMode]`|false   |named   |False        |

#### **Name**
Specifies the array of names for the subuser account you want to get or search conditions.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

Veeam.Backup.PowerShell.Infos.VBRCloudProvider[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudSubUser [-CloudProvider <VBRCloudProvider[]>] [-Mode {Common | AgentManagement}] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudSubUser [-Id <Guid[]>] [-Mode {Common | AgentManagement}] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudSubUser [-Mode {Common | AgentManagement}] [-Name <String[]>] [<CommonParameters>]
```

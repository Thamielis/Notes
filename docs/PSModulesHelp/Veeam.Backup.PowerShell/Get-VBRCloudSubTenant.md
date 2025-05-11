Get-VBRCloudSubTenant
---------------------

### Synopsis
Returns cloud subtenant accounts.

---

### Description

This cmdlet returns cloud subtenant accounts of the following types: · Simple cloud subtenant accounts · vCD cloud subtenant accounts

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example 1

```PowerShell
Get-VBRCloudSubTenant -Name "Alpha"
This example shows how to get a cloud subtenant by name.
```
> Example 2

$Alpha = Get-VBRCloudTenant -Name "Alpha"
Get-VBRCloudSubTenant -Tenant $Alpha
This example shows how to get a cloud subtenant by tenant.

1. Run Get-VBRCloudTenant to get the cloud tenant. Save the result to the $Alpha variable.  2. Run Get-VBRCloudSubTenant with the $Alpha variable.

---

### Parameters
#### **Id**
Specifies the array of IDs of the VBRCloudSubTenant objects. The cmdlet will return the subtenants with these IDs. Accepts GUID or string type.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Mode**
Specifies the cloud subtenant mode. You can select either of the following modes: · Common · AgentManagement The cmdlet will return subusers of the specified mode.
Valid Values:

* Common
* AgentManagement

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRCloudSubTenantMode]`|false   |named   |False        |

#### **Name**
Specifies the array of names for the subtenant account you want to get or search conditions.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Tenant**
Specifies the tenant. The cmdlet will return the subtenants associated with this tenant. Accepts VBRCloudTenant object.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

Veeam.Backup.PowerShell.Infos.IVBRCloudTenant[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudSubTenant [-Id <Guid[]>] [-Mode {Common | AgentManagement}] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudSubTenant [-Mode {Common | AgentManagement}] [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudSubTenant [-Mode {Common | AgentManagement}] [-Tenant <IVBRCloudTenant[]>] [<CommonParameters>]
```

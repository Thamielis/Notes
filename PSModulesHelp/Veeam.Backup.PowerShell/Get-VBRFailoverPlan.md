Get-VBRFailoverPlan
-------------------

### Synopsis
Returns existing failover plans or cloud failover plans.

---

### Description

This cmdlet returns existing failover plans or cloud failover plans.

---

### Examples
> Example 1

```PowerShell
Get-VBRFailoverPlan
This command looks for the list of all existing failover plans.
```
> Example 2

```PowerShell
Get-VBRFailoverPlan -Name "MS Exchange Group Failover"
This command looks for failover plan named 'MailServers Failover'.
```
> Example 3

Get-VBRFailoverPlan -Type Cloud
[Cloud] This command gets all cloud failover plans.
> Example 4

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Get-VBRFailoverPlan -Tenant $tenant -Name "MS Exchange Group Failover"
[Cloud provider] This command gets MS Exchange Group Failover failover plan created by the ABC Company tenant.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRFailoverPlan cmdlet. Set the $tenant variable as the Tenant parameter value. Specify the Name parameter value.

---

### Parameters
#### **Id**
Specifies the array of IDs of the VBRFailoverPlan object you want to add to the failover plan.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

#### **Name**
Specifies the array of names of the failover plans you want to get or search conditions.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Tenant**
Specifies the cloud tenant.
The cmdlet will return failover plans created by this tenant.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Type**
Specifies the type of the failover plan:
* Local: non-cloud failover plans.
* Cloud: [for cloud user] cloud failover plans.
* Tenant: [for cloud provider] cloud failover plans created by cloud user.
The cmdlet will return the failover plans of the selected type.
Valid Values:

* Local
* Tenant
* Cloud

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRFailoverPlanType]`|true    |named   |False        |

---

### Inputs
System.String[]

System.Guid[]

Veeam.Backup.PowerShell.Infos.IVBRCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRFailoverPlan [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRFailoverPlan [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRFailoverPlan [-Name <String[]>] -Type {Local | Tenant | Cloud} [<CommonParameters>]
```
```PowerShell
Get-VBRFailoverPlan [-Name <String[]>] -Tenant <IVBRCloudTenant> [<CommonParameters>]
```

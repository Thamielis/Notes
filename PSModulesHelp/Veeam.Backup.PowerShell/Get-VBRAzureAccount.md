Get-VBRAzureAccount
-------------------

### Synopsis
Returns Microsoft Azure accounts added to Veeam Backup & Replication.

---

### Description

This cmdlet returns Microsoft Azure accounts added to Veeam Backup & Replication.
IMPORTANT! This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Examples
> Example 1. Getting All Microsoft Azure Accounts

Get-VBRAzureAccount
This command returns all accounts added to Veeam Backup & Replication.
> Example 2. Getting All Resource Manager Accounts

Get-VBRAzureAccount -Type ResourceManager
This command returns all Resource Manager accounts added to Veeam Backup & Replication.
> Example 3. Getting Classic Account by Name

Get-VBRAzureAccount -Type Classic -Name RestoreToAzure@Veeam.com
This command returns a Classic account named RestoreToAzure@Veeam.com added to Veeam Backup & Replication.

---

### Parameters
#### **Id**
Specifies the array of IDs of the accounts. The cmdlet will return the accounts that match these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the array of names of the accounts. The cmdlet will return the accounts that match these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Type**
Specifies the account model: ResourceManager, Classic.
Valid Values:

* ResourceManager
* Classic

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRAzureModelType]`|false   |named   |False        |

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
Get-VBRAzureAccount [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRAzureAccount [-Name <String[]>] [-Type {ResourceManager | Classic}] [<CommonParameters>]
```

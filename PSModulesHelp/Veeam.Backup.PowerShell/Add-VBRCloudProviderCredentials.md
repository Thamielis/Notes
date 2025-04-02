Add-VBRCloudProviderCredentials
-------------------------------

### Synopsis
Adds cloud provider credentials records to Veeam Backup & Replication.

---

### Description

This cmdlets adds cloud provider credentials records to Veeam Backup & Replication.

---

### Examples
> Example 1. Adding Cloud Provider Credentials

Add-VBRCloudProviderCredentials -Name "Cloud Login" -Password "Cloud password"
This example shows how to add cloud provider credentials records into your Veeam Backup & Replication infrastructure.
> Example 2. Adding Cloud Provider Credentials with Secure String Option

$securepassword = Read-Host -Prompt "Enter password" -AsSecureString
Add-VBRCloudProviderCredentials -Name "Cloud Login" -Password $securepassword
This example shows how to add cloud provider credentials records with the secure string option into Veeam Backup & Replication.

Perform the following steps:
1. Run the Read-Host cmdlet. Specify the Prompt parameter value. Provide the AsSecureString parameter. Save the result to the $securepassword variable.
2. Run the Add-VBRCloudProviderCredentials cmdlet. Specify the Name parameter value. Set the $securepassword variable as the Password parameter value.

---

### Parameters
#### **Description**
Specifies a description for cloud provider credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a login for cloud provider credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies a password for cloud provider credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Add-VBRCloudProviderCredentials [-Description <String>] -Name <String> -Password <String> [<CommonParameters>]
```

Add-VBRAzureADAccount
---------------------

### Synopsis
Adds Azure Entra ID-based storage accounts to Veeam Backup & Replication.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet adds Azure Entra ID-based storage accounts to Veeam Backup & Replication.

---

### Examples
> Example 1. Adding Azure Entra ID-Based Storage Account with Password-Based Authentication

Add-VBRAzureADAccount -ApplicationId "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" -CertificatePath "C:\Users\Administrator\Locked" -StorageAccountName "EntraID" -TenantId "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" -Description "Administrator Entra ID"  -Password "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" -Region Global
This command adds the Azure Entra ID-based storage account to Veeam Backup & Replication. The cmdlet uses a password-based authentication.
> Example 2. Adding Azure Entra ID-Based Storage Account Using Certificate

Add-VBRAzureADAccount -ApplicationId "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" -Description "Administrator Entra ID" -Region Global -SecretKey XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -StorageAccountName "EntraID" -TenantId "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
This command adds the Azure Entra ID-based storage account to Veeam Backup & Replication. The cmdlet uses certificate type of authentication.

---

### Parameters
#### **ApplicationId**
Specifies the ID of Microsoft Entra ID application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **CertificatePath**
For certificate-based authentication. Specifies a path to the folder where the certificate is located. The cmdlet will use it to authenticate against Microsoft Entra.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Description**
Specifies a description of an Azure Entra ID-based storage account. The cmdlet will add this storage account with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
For certificate-based authentication. Specifies a password that the cmdlet will use it to authenticate against Microsoft Entra.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Region**
Specifies the Microsoft Azure region where Azure Entra ID-based storage account is located. You can select the following types of regions:
* Global
* Government
* China
Valid Values:

* Global
* China
* Government

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureBlobRegionType]`|false   |named   |False        |

#### **SecretKey**
For password-based authentication. Specifies an application secret that the cmdlet will use to authenticate against Microsoft Entra.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **StorageAccountName**
Specifies a name of an Azure Entra ID-based storage account. The cmdlet will use it as a friendly name and will add the storage account using this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **TenantId**
For existing account connection type. Specifies an ID of a tenant (directory) where the Microsoft Entra ID application resides.

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
Add-VBRAzureADAccount -ApplicationId <String> -CertificatePath <String> [-Description <String>] [-Password <String>] [-Region {Global | China | Government}] -StorageAccountName <String> -TenantId <String> 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Add-VBRAzureADAccount -ApplicationId <String> [-Description <String>] [-Region {Global | China | Government}] -SecretKey <String> -StorageAccountName <String> -TenantId <String> [<CommonParameters>]
```

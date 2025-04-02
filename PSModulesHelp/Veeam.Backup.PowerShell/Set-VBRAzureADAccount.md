Set-VBRAzureADAccount
---------------------

### Synopsis
Modifies settings of Azure Entra ID-based storage accounts.

---

### Description

This cmdlet modifies settings of Azure Entra ID-based storage accounts.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRAzureADAccount](Get-VBRAzureADAccount)

---

### Examples
> Example 1. Modifying Microsoft Entra ID Application for Azure Entra ID-Based Storage Accounts

$account = Get-VBRAzureADAccount -Name "EntraID"
Set-VBRAzureADAccount -Account $account -ApplicationId "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
This example shows how to modify the ID of Microsoft Entra ID application of  the Azure Entra ID-based storage account.
Perform the following steps:
1. Run the Get-VBRAzureADAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Set-VBRAzureADAccount cmdlet. Set the $account variable as the Account parameter value. Provide the ApplicationId parameter value.
> Example 2. Modifying Application Secret for Azure Entra ID-Based Storage Accounts

$account = Get-VBRAzureADAccount -Name "EntraID"
Set-VBRAzureADAccount -Account $account -SecretKey "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
This example shows how to modify application secret settings of the Azure Entra ID-based storage account.
Perform the following steps:
1. Run the Get-VBRAzureADAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Set-VBRAzureADAccount cmdlet. Set the $account variable as the Account parameter value. Specify the SecretKey parameter value.

---

### Parameters
#### **Account**
Specifies the Azure Entra ID-based storage account which settings you want to modify.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRAzureADAccount]`|true    |named   |False        |

#### **ApplicationId**
Specifies the ID of Microsoft Entra ID application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CertificatePath**
For certificate-based authentication. Specifies a path to the folder where the certificate is located. The cmdlet will use it to authenticate against Microsoft Entra.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Description**
Specifies a description of an Azure Entra ID-based storage account. The cmdlet will modify this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
For certificate-based authentication. Specifies a password that the cmdlet will use it to authenticate against Microsoft Entra.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SecretKey**
For password-based authentication. Specifies an application secret that the cmdlet will use to authenticate against Microsoft Entra.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **StorageAccountName**
Specifies a name of an Azure Entra ID-based storage account. The cmdlet will modify this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TenantId**
For existing account connection type. Specifies an ID of a tenant (directory) where the Microsoft Entra ID application resides.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Set-VBRAzureADAccount -Account <VBRAzureADAccount> [-ApplicationId <String>] [-CertificatePath <String>] [-Description <String>] [-Password <String>] [-StorageAccountName <String>] [-TenantId <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Set-VBRAzureADAccount -Account <VBRAzureADAccount> [-ApplicationId <String>] [-Description <String>] [-SecretKey <String>] [-StorageAccountName <String>] [-TenantId <String>] [<CommonParameters>]
```

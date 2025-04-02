Set-VBRAzureAccount
-------------------

### Synopsis
Modifies Microsoft Azure compute account added to Veeam Backup & Replication.

---

### Description

This cmdlet modifies an existing Microsoft Azure compute account added to the Veeam Backup & Replication managing console.
The cmdlet opens a Microsoft Azure wizard. Follow the steps of the wizard to enter the new settings.
IMPORTANT! This cmdlet does not support Microsoft Azure compute account with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Related Links
* [Get-VBRAzureAccount](Get-VBRAzureAccount)

---

### Examples
> Editing ID of AD Application of Microsoft Azure Compute Account

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
Set-VBRAzureAccount -Account $account -ApplicationId "42f83f64"
This example shows how to edit the ID of the AD application for an existing Microsoft Azure compute account.
Perform the following steps:
1. Run the Get-VBRAzureAccount to get the account. Specify the Type and Name parameter values. Save the result to the $account variable.
2. Run the Set-VBRAzureAccount cmdlet. Set the $account variable as the Account parameter value. Specify the ApplicationId parameter value.

---

### Parameters
#### **Account**
Specifies the Azure account that you wand to edit.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRAzureAccount]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ApplicationId**
Specifies the ID of the AD application. The cmdlet will use this application to connect to Microsoft Azure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **AzureCredentials**
NOTE: This parameter is obsolete and will be deprecated in next version.
Specifies an exiting Azure AD application. Veeam Backup & Replication will use this Azure AD application to connect to Microsoft Azure.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **CertificatePath**
For certificate-based authentication.
Specifies a path to the folder where the certificate is located. The cmdlet will use it to authenticate against Microsoft Azure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Description**
Specifies a description of credentials record for for Microsoft Azure compute account. The cmdlet will apply this description to credentials record.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a name of credentials record for for Microsoft Azure compute account. The cmdlet will add credentials record with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
For certificate-based authentication.
Specifies a password that the cmdlet will use it to authenticate against Microsoft Azure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SecretKey**
For the password-based authentication.
Specifies the application secret that the cmdlet will use to authenticate against Microsoft Azure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TenantId**
For existing account connection type.
Specifies an ID of a tenant (directory) where the AD application resides. The cmdlet will use this tenant ID to connect to the Azure AD application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAzureAccount -Account <VBRAzureAccount> [-ApplicationId <String>] [-AzureCredentials <CCredentials>] [-CertificatePath <String>] [-Description <String>] [-Name <String>] [-Password <String>] [-SecretKey 
```
```PowerShell
<String>] [-TenantId <String>] [<CommonParameters>]
```

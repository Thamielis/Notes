Add-VBRAzureAccount
-------------------

### Synopsis
Adds a Microsoft Azure compute account to Veeam Backup & Replication.

---

### Description

This cmdlet adds a credentials record for Microsoft Azure compute account to Veeam Backup & Replication and imports information about subscriptions and resources associated with the Microsoft Azure compute account.
You can add the following types of the accounts:
- Microsoft Azure account
- Microsoft Azure Stack Hub compute account
The cmdlet will open a Microsoft Azure wizard. Follow the steps of the wizard to add the account.
Consider the following:
- This cmdlet does not create a Microsoft Azure compute account. You must set up the Microsoft Azure account beforehand.
- This cmdlet does not support Microsoft Azure compute accounts with the Azure Service Manager (ASM, also known as a "classic" type).
- Veeam Backup & Replication no longer supports Azure Germany since Microsoft closed Microsoft Cloud Deutschland.

---

### Examples
> Example 1. Adding Microsoft Azure Compute Account

Add-VBRAzureAccount -Name "Azure Compute Administrator" -TenantId "XXXXXXXX" -ApplicationId "42f83f98" -SecretKey "XXXXXXXXXXXXXXXXXXX" -Region Global
This command adds the Microsoft Azure compute account into your Veeam Backup & Replication infrastructure with the following settings:
- The name of the account is Azure Compute Administrator.
- The ID of a tenant (directory) where the AD application resides is XXXXXXXX.
- The ID of the application is 42f83f98.
- The application secret is XXXXXXXXXXXXXXXXXXX.
- The region type is Global.
> Example 2. Adding Microsoft Azure Stack Hub Compute Account

```PowerShell
Add-VBRAzureAccount -ResourceManagerEndpoint "management.local.azurestack.external" -Name "Azure Stack Administrator"
This command adds the Microsoft Azure Stack Hub compute account named Azure Stack Administrator. The account connects to the management.local.veeamstack.external virtual IP address of Azure Resource Manager.
```

---

### Parameters
#### **ApplicationId**
Specifies the ID of the AD application. The cmdlet will use this application to connect to Microsoft Azure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **AzureCredentials**
Note: This parameter is obsolete and will be deprecated in next version.
Specifies an exiting Azure AD application. Veeam Backup & Replication will use this Azure AD application to connect to Microsoft Azure.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **CertificatePath**
For certificate-based authentication.
Specifies a path to the folder where the certificate is located. The cmdlet will use it to authenticate against Azure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Description**
Specifies a description of credentials record for Microsoft Azure compute account. The cmdlet will add credentials record with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a name of credentials record for for Microsoft Azure compute account. The cmdlet will add credentials record with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
For certificate-based authentication. Specifies a password that the cmdlet will use it to authenticate against Azure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Region**
Specifies the region type of the Microsoft Azure account. You can select the following types of regions:
* Global
* Germany
* China
* Government
Valid Values:

* Global
* China
* Government

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRAzureRegionType]`|false   |named   |False        |

#### **ResourceManagerEndpoint**
To connect to Microsoft Azure Stack Hub compute account. Specifies the virtual IP address of Azure Resource Manager. The account will connect to this resource manager.
Note: You must specify the IP address in the following format: management.<region>.<FQDN>.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **SecretKey**
For the password-based authentication. Specifies the application secret that the cmdlet will use to authenticate against Microsoft Azure.

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
This cmdlet does not create Microsoft Azure account. You must set up the Microsoft Azure account beforehand.

---

### Syntax
```PowerShell
Add-VBRAzureAccount [-ApplicationId <String>] [-AzureCredentials <CCredentials>] [-CertificatePath <String>] [-Description <String>] -Name <String> [-Password <String>] [-Region {Global | China | Government}] 
```
```PowerShell
[-SecretKey <String>] [-TenantId <String>] [<CommonParameters>]
```
```PowerShell
Add-VBRAzureAccount [-ApplicationId <String>] [-AzureCredentials <CCredentials>] [-CertificatePath <String>] [-Description <String>] -Name <String> [-Password <String>] -ResourceManagerEndpoint <String> 
```
```PowerShell
[-SecretKey <String>] [-TenantId <String>] [<CommonParameters>]
```

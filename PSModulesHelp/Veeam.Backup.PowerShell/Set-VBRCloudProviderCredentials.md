Set-VBRCloudProviderCredentials
-------------------------------

### Synopsis
Modifies cloud provider credential records.

---

### Description

This cmdlet modifies cloud provider credentials records are added to Veeam Backup & Replication. To modify settings, specify new values for the necessary parameters.  The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCloudProviderCredentials](Get-VBRCloudProviderCredentials)

---

### Examples
> Example - Modifying Login for Cloud Provider Credentials Records

$creds = Get-VBRCloudProviderCredentials -Name "Cloud credentials"
Set-VBRCloudProviderCredentials -Credentials $creds -Name "New Login"
This example shows how to modify a login for cloud provider credentials records.

Perform the following steps:
1. Run the Get-VBRCloudProviderCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
2. Run the Set-VBRCloudProviderCredentials cmdlet. Set the $creds variable as the Credentials parameter value. Specify the Name parameter value.

---

### Parameters
#### **Credentials**
Specifies cloud provider credentials records that you want to modify. Accepts the VBRCloudProviderCredentials object.  To get this object, run the Get-VBRCloudProviderCredentials cmdlet.

|Type                           |Required|Position|PipelineInput |
|-------------------------------|--------|--------|--------------|
|`[VBRCloudProviderCredentials]`|true    |0       |True (ByValue)|

#### **Description**
Specifies the description for the cloud provider credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the login for the cloud provider credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies the password for the cloud provider credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudProviderCredentials

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudProviderCredentials [-Credentials] <VBRCloudProviderCredentials> [-Description <String>] [-Name <String>] [-Password <String>] [<CommonParameters>]
```

Get-VBRCloudProviderCredentials
-------------------------------

### Synopsis
Returns cloud provider credentials records.

---

### Description

This cmdlet returns an array of cloud provider credentials records.

---

### Examples
> Example 1. Getting Cloud Provider Credentials by Tenant Name

```PowerShell
Get-VBRCloudProviderCredentials -Name "Tenant1"
This example shows how to get cloud provider credentials records by the tenant name.
```
> Example 2. Getting Cloud Provider Credentials by ID

```PowerShell
Get-VBRCloudProviderCredentials -ID "bea3b786-75de-4882-a4f7-c2f236eb2874"
This example shows how to get cloud provider credentials records by the credentials records ID.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for cloud provider credentials records. The cmdlet will return credentials records with the specified IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of logins for cloud provider credentials records. The cmdlet will return credentials records with the specified name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRCloudProviderCredentials -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRCloudProviderCredentials [-Name <String[]>] [<CommonParameters>]
```

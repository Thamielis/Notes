Set-AzureADUserEx
-----------------

### Synopsis
Registers new or revokes existing FIDO and NGC keys in Azure Active Directory.

---

### Description

The Set-AzureADUserEx cmdlet uses an undocumented Azure AD Graph API endpoint to modify the normally hidden searchableDeviceKeys attribute of user accounts. This attribute holds different types of key credentials, including the FIDO2 and NGC keys that are used by Windows Hello for Business.

This cmdlet also enables Global Admins to selectively revoke security keys registered by other users. This is a unique feature, as Microsoft only supports self-service FIDO2 security key registration and revocation (at least at the time of publishing this cmdlet).

This cmdlet is not intended to replace the Set-AzureADUser cmdlet from Microsoft's AzureAD module. Authentication fully relies on the official Connect-AzureAD cmdlet.

---

### Related Links
* [Get-AzureADUserEx](Get-AzureADUserEx)

* [Get-ADKeyCredential](Get-ADKeyCredential)

---

### Examples
> Example 1

```PowerShell
PS C:\> Install-Module -Name AzureAD,DSInternals -Force
PS C:\> Connect-AzureAD
PS C:\> $token = [Microsoft.Open.Azure.AD.CommonLibrary.AzureSession]::AccessTokens['AccessToken'].AccessToken
PS C:\> Set-AzureADUserEx -UserPrincipalName 'john@contoso.com' -KeyCredential @() -Token $token
Revokes all FIDO2 security keys and NGC keys (Windows Hello for Business) that were previously registered by the specified user. Typical use case includes stolen devices and other security incidents.
```
> Example 2

```PowerShell
PS C:\> $user = Get-AzureADUserEx -UserPrincipalName 'john@contoso.com' -AccessToken $token 
PS C:\> $newCreds = $user.KeyCredentials | where { $PSItem.FidoKeyMaterial.DisplayName -notlike '*YubiKey*' }
PS C:\> Set-AzureADUserEx -UserPrincipalName 'john@contoso.com' -KeyCredential $newCreds -Token $token
Selectively revokes a specific FIDO2 security key based on its display name. Typical use case is a stolen/lost security key.
```

---

### Parameters
#### **AccessToken**
Specifies the access token retrieved by the Connect-AzureAD cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |False        |Token  |

#### **KeyCredential**
Specifies a list of key credentials (typically FIDO2 and NGC keys) that can be used by the target user for authentication.

|Type               |Required|Position|PipelineInput|Aliases                                  |
|-------------------|--------|--------|-------------|-----------------------------------------|
|`[KeyCredential[]]`|true    |named   |False        |SearchableDeviceKey<br/>KeyCredentialLink|

#### **ObjectId**
Specifies the identity of a user in Azure AD.

|Type    |Required|Position|PipelineInput|Aliases                                  |
|--------|--------|--------|-------------|-----------------------------------------|
|`[Guid]`|true    |named   |False        |Identity<br/>Id<br/>UserId<br/>ObjectGuid|

#### **TenantId**
Specifies the Azure AD tenant to perform the search in. If not specified, the tenant of the authenticated user will be used.

|Type    |Required|Position|PipelineInput|Aliases|
|--------|--------|--------|-------------|-------|
|`[Guid]`|false   |named   |False        |Tenant |

#### **UserPrincipalName**
Specifies the UPN of a user in Azure AD.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|true    |named   |False        |UPN<br/>UserName|

---

### Inputs
None

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
Set-AzureADUserEx -AccessToken <String> -KeyCredential <KeyCredential[]> -ObjectId <Guid> [-TenantId <Guid>] [<CommonParameters>]
```
```PowerShell
Set-AzureADUserEx -AccessToken <String> -KeyCredential <KeyCredential[]> [-TenantId <Guid>] -UserPrincipalName <String> [<CommonParameters>]
```

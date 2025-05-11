Get-DSAzureADGroup
------------------

### Synopsis
Get groups from a Azure AD User PAM provider

---

### Description

Get groups from a Azure AD User PAM provider.
The data returned is the name and sid of each groups. Those values can be added to the JIT settings' authorized groups of the provider.

---

### Related Links
* [Get-DSPamProvider](Get-DSPamProvider)

* [Update-DSPamProvider](Update-DSPamProvider)

---

### Examples
> EXAMPLE

PS C:\> $getResponse = Get-DSPamProvider
        $provider = $getResponse | Where Label -eq 'MyAzureADUserProvider'
        $groupsResponse = Get-DSAzureADGroup -ProviderID $provider.ID
        $desiredGroups = $groupsResponse | Where Name -like group*
        $provider.JitElevationSettings.AuthorizedGroups = $desiredGroups
        Update-DSPamProvider -InputObject $provider
Add all groups whose name starts with 'group' in the JIT settings' authorized groups of the provider 'MyAzureADUserProvider' and save the modification

---

### Parameters
#### **AsJITSettings**
Return the object as the JIT settings value. Useful it is not initialized in the provider.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ProviderID**
PAM Provider to obtain the domains from

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Models.Shared.Pam.Dto.Active_Directory.PamAzureAdGroup, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Models.Shared.Pam.Entities.DvlsPamAzureAdJitElevationSettings, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSAzureADGroup -detailed". For technical information, type "Get-Help Get-DSAzureADGroup -full".

---

### Syntax
```PowerShell
Get-DSAzureADGroup [-ProviderID] <Guid> [-AsJITSettings] [-AsLegacyResponse] [<CommonParameters>]
```

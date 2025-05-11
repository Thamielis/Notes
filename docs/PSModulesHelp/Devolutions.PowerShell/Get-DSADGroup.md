Get-DSADGroup
-------------

### Synopsis
Get groups from a domain user PAM provider

---

### Description

Get groups from a domain user PAM provider.
It returns the groups of the oganizational unit specified by DN. If the DN parameter is not used, it will look at the root. It is not possible to fetch all groups directly. The data returned can be added to the JIT settings' authorized groups of the provider.

---

### Related Links
* [Get-DSPamProvider](Get-DSPamProvider)

* [Update-DSPamProvider](Update-DSPamProvider)

---

### Examples
> EXAMPLE

PS C:\> $getResponse = Get-DSPamProvider
        $provider = $getResponse | Where Label -eq 'MyDomainUserProvider'
        $desiredGroups = Get-DSADGroup -ProviderID $provider.ID -DN 'OU=Test,DC=mydomain,DC=loc'
        $provider.JitElevationSettings.AuthorizedGroups = $desiredGroups
        Update-DSPamProvider -InputObject $provider
Add all groups of the 'Test' organizational unit in the JIT settings' authorized groups of the provider 'MyDomainUserProvider' and save the modification

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

#### **DN**
Distinguished name of the container searched

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

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
* Devolutions.Server.Models.Shared.Pam.Dto.Active_Directory.PamAdDomainGroup[]

* Devolutions.Server.Models.Shared.Pam.Entities.DvlsPamAdJitElevationSettings

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Models.Shared.Pam.Dto.Active_Directory.PamAdDomainGroup, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Models.Shared.Pam.Entities.DvlsPamAdJitElevationSettings, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSADGroup -detailed". For technical information, type "Get-Help Get-DSADGroup -full".

---

### Syntax
```PowerShell
Get-DSADGroup [-ProviderID] <Guid> [[-DN] <String>] [-AsJITSettings] [-AsLegacyResponse] [<CommonParameters>]
```

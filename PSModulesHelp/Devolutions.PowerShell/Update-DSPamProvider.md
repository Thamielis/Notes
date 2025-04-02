Update-DSPamProvider
--------------------

### Synopsis
Update a PAM Provider with given values.

---

### Description

Update a PAM Provider with given parameters. Goes through every parameter and check if key match a key in current Provider data. If so, updates current Provider data and send 'PUT' web request.

---

### Related Links
* [Get-DSADGroup](Get-DSADGroup)

* [Get-DSAzureADGroup](Get-DSAzureADGroup)

* [Get-DSPamProvider](Get-DSPamProvider)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Update-DSProvider -ProviderID '00000000-0000-0000-0000-000000000000' -Name 'MyNewProviderName'
Update the name of the provider whose ID is '00000000-0000-0000-0000-000000000000'
```
> EXAMPLE 2

PS C:\> $getResponse = Get-DSPamProvider
        $provider = $getResponse | Where Label -eq 'MyDomainUserProvider'
        $desiredGroups = Get-DSADGroup -ProviderID $provider.ID -DN 'OU=Test,DC=mydomain,DC=loc'
        $provider.JitElevationSettings.AuthorizedGroups = $desiredGroups
        Update-DSPamProvider -InputObject $provider
Add all groups of the 'Test' organizational unit in the JIT settings' authorized groups of the provider 'MyDomainUserProvider' and save the modification
> EXAMPLE 3

PS C:\> $getResponse = Get-DSPamProvider
        $provider = $getResponse | Where Label -eq 'MyAzureADUserProvider'
        $groupsResponse = Get-DSAzureADGroup -ProviderID $provider.ID
        $desiredGroups = $groupsResponse | Where Name -like group*
        $provider.JitElevationSettings.AuthorizedGroups = $desiredGroups
        Update-DSPamProvider -InputObject $provider
Add all groups whose name starts with 'group' in the JIT settings' authorized groups of the provider 'MyAzureADUserProvider' and save the modification

---

### Parameters
#### **AllowCheckoutOwnerAsApprover**
Ignored

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CheckoutApprovalMode**
New checkout approval mode to assign the provider
Valid Values:

* Default
* None
* Mandatory

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CheckoutApprovalMode]`|false   |named   |false        |

#### **CheckoutReasonMode**
New checkout reason mode to assign the provider
Valid Values:

* Default
* None
* Mandatory
* Optional

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[CheckoutReasonMode]`|false   |named   |false        |

#### **CheckoutTime**
New default checkout time in minutes to assign the provider

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IncludeAdminsAsApprovers**
Ignored

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IncludeManagersAsApprovers**
Ignored

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **InputObject**
Provider object obtained from Get-DSPamProvider

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[PamProvider]`|true    |named   |true (ByValue)|

#### **Name**
New name to assign to the provider

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ProviderID**
Id of the provider to update

|Type    |Required|Position|PipelineInput|Aliases         |
|--------|--------|--------|-------------|----------------|
|`[Guid]`|true    |named   |false        |CandidProviderID|

---

### Inputs
Devolutions.Server.Pam.Dto.PamProvider

PAM provider object obtained from Get-DSPamProvider

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Update-DSPamProvider -detailed". For technical information, type "Get-Help Update-DSPamProvider -full".

---

### Syntax
```PowerShell
Update-DSPamProvider -ProviderID <Guid> [-Name <String>] [-CheckoutApprovalMode <Default | None | Mandatory>] [-CheckoutReasonMode <Default | None | Mandatory | Optional>] [-CheckoutTime <Int32>] [-AllowCheckoutOwnerAsApprover <Int32>] [-IncludeAdminsAsApprovers <Int32>] [-IncludeManagersAsApprovers <Int32>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Update-DSPamProvider -InputObject <PamProvider> [-AsLegacyResponse] [<CommonParameters>]
```

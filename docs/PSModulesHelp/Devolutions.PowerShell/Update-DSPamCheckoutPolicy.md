Update-DSPamCheckoutPolicy
--------------------------

### Synopsis
Update a PAM checkout policy

---

### Description

Update a checkout policy using supplied parameters. Omitted parameters are ignored.

---

### Related Links
* [Get-DSPamCheckoutPolicy](Get-DSPamCheckoutPolicy)

* [New-DSPamCheckoutPolicy](New-DSPamCheckoutPolicy)

* [Remove-DSPamCheckoutPolicy](Remove-DSPamCheckoutPolicy)

---

### Parameters
#### **AllowCheckoutOwnerAsApprover**
Indicate if owner can self-checkout.
Valid Values:

* Default
* Yes
* No

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ApproverOptions]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CheckoutApprovalMode**
Indicate if the checkout must be approved. Approval mode choices: Default, None, Mandatory
Valid Values:

* Default
* None
* Mandatory

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CheckoutApprovalMode]`|false   |named   |false        |

#### **CheckoutReasonMode**
Indicate if a reason must be given for the checkout. Checkout reason mode choices: Default, None, Mandatory, Optional
Valid Values:

* Default
* None
* Mandatory
* Optional

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[CheckoutReasonMode]`|false   |named   |false        |

#### **CheckoutTime**
Default duration assigned to checkout's request. If set at 0, the default value will be used.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IncludeAdminsAsApprovers**
Indicate if administrators can approve checkout.
Valid Values:

* Default
* Yes
* No

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ApproverOptions]`|false   |named   |false        |

#### **IncludeManagersAsApprovers**
Indicate if managers can approve checkout.
Valid Values:

* Default
* Yes
* No

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ApproverOptions]`|false   |named   |false        |

#### **IsDefault**
Set as the default policy. It will affect all policies refering to default values.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Name**
Policy's name. Must be unique. Cannot be null or white spaces only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PolicyID**
ID of the policy to update

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Update-DSPamCheckoutPolicy -detailed". For technical information, type "Get-Help Update-DSPamCheckoutPolicy -full".

---

### Syntax
```PowerShell
Update-DSPamCheckoutPolicy -PolicyID <Guid> [-Name <String>] [-CheckoutApprovalMode <Default | None | Mandatory>] [-CheckoutReasonMode <Default | None | Mandatory | Optional>] [-AllowCheckoutOwnerAsApprover <Default | Yes | No>] [-IncludeAdminsAsApprovers <Default | Yes | No>] [-IncludeManagersAsApprovers <Default | Yes | No>] [-CheckoutTime <Int32>] [-IsDefault <Boolean>] [-AsLegacyResponse] [<CommonParameters>]
```

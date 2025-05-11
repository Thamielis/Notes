Update-DSPamFolder
------------------

### Synopsis
Update a PAM folder with given values.

---

### Description

Update a PAM folder with given parameters. Goes through every parameter and check if key match a key in current folder data. If so, updates current folder data and send 'PUT' web request.

---

### Related Links
* [Get-DSPamFolder](Get-DSPamFolder)

* [New-DSPamFolder](New-DSPamFolder)

* [Remove-DSPamFolder](Remove-DSPamFolder)

---

### Parameters
#### **AllowCheckoutOwnerAsApprover**
Users can approve their own Check-out requests
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

#### **FolderID**
Id of the pam folder to update.

|Type    |Required|Position|PipelineInput|Aliases       |
|--------|--------|--------|-------------|--------------|
|`[Guid]`|true    |named   |false        |CandidFolderID|

#### **IncludeAdminsAsApprovers**
Include administrators when listing approvers
Valid Values:

* Default
* Yes
* No

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ApproverOptions]`|false   |named   |false        |

#### **IncludeManagersAsApprovers**
Include PAM managers when listing approvers
Valid Values:

* Default
* Yes
* No

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ApproverOptions]`|false   |named   |false        |

#### **Name**
New name to assign to the provider

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParentFolderID**
Id of the new folder's parent.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

#### **Security**
Security permissions

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[PamUserPermission[]]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Update-DSPamFolder -detailed". For technical information, type "Get-Help Update-DSPamFolder -full".

---

### Syntax
```PowerShell
Update-DSPamFolder -FolderID <Guid> [-Name <String>] [-ParentFolderID <Guid>] [-CheckoutApprovalMode <Default | None | Mandatory>] [-CheckoutReasonMode <Default | None | Mandatory | Optional>] [-AllowCheckoutOwnerAsApprover <Default | Yes | No>] [-IncludeAdminsAsApprovers <Default | Yes | No>] [-IncludeManagersAsApprovers <Default | Yes | No>] [-CheckoutTime <Int32>] [-Security <PamUserPermission[]>] [-AsLegacyResponse] [<CommonParameters>]
```

Import-DSPamScanResult
----------------------

### Synopsis
Import the accounts of a PAM scan result

---

### Description

Import the accounts of a PAM scan result

---

### Related Links
* [Get-DSPamScanResult](Get-DSPamScanResult)

---

### Examples
> EXAMPLE

PS C:\> $providerID = 'the-desired-pam-provider-ID'
        $folderID = 'the-desired-pam-vault-or-folder-ID'
        $configuration = Get-DSPamScanConfiguration -LiteralName 'ScanA';
        $toImport = Get-DSPamScanResult -InputObject $configuration -Filter '@domain.net' -ExcludedManaged;
        $providerResult = Get-DSPamProvider
        $provider = $providerResult.Data | Where -Property ID -eq $providerID
        $importResult = Import-DSPamScanResult -ScanResult $toImport -Provider $provider -FolderID $folderID
From the 'ScanA' PAM scan's result, import all accounts who have '@domain.net' in their username, hostname, fullname, or description in the PAM folder specified by $folderID.

---

### Parameters
#### **FolderID**
Pam Folder

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |3       |false        |

#### **Provider**
Provider obtained from Get-DSPamProvider

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PamProvider]`|true    |2       |false        |

#### **ResetPasswordOnCheckIn**
Reset password on check in

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ResetPasswordOnImport**
Reset password on import

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScanResult**
Pam accounts revealed by a PAM scan. Must be of the same type.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PSScanResult[]]`|true    |1       |false        |

#### **Unmanaged**
Set accounts to unmanaged

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **UnmanagedAction**
Set accounts to unmanaged. To manually set the password, you must modify directly the scan results. The default action is to set the password manually.
Valid Values:

* SetPasswordManually
* ResetPassword

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[UnmanagedImportAction]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.Import.PamMultipleOperationResult[]

---

### Notes
For more information, type "Get-Help Import-DSPamScanResult -detailed". For technical information, type "Get-Help Import-DSPamScanResult -full".

---

### Syntax
```PowerShell
Import-DSPamScanResult [-ResetPasswordOnImport] [-ResetPasswordOnCheckIn] [-ScanResult] <PSScanResult[]> [-Provider] <PamProvider> [-FolderID] <Guid> [<CommonParameters>]
```
```PowerShell
Import-DSPamScanResult [-UnmanagedAction <SetPasswordManually | ResetPassword>] -Unmanaged [-ScanResult] <PSScanResult[]> [-Provider] <PamProvider> [-FolderID] <Guid> [<CommonParameters>]
```

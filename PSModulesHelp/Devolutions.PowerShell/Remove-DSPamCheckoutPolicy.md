Remove-DSPamCheckoutPolicy
--------------------------

### Synopsis
Delete a PAM checkout policy

---

### Description

Delete a checkout policy if it exists. If not, throws an error indicating that the policy was not found.

---

### Related Links
* [Get-DSPamCheckoutPolicy](Get-DSPamCheckoutPolicy)

* [New-DSPamCheckoutPolicy](New-DSPamCheckoutPolicy)

* [Update-DSPamCheckoutPolicy](Update-DSPamCheckoutPolicy)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $response = Get-DSPamCheckoutPolicy;
        $policy = $reponse | Where Name -eq "Policy A";
        Remove-DSPamCheckoutPolicy -PolicyID $policy.ID
Delete the policy named "Policy A".
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PolicyID**
ID of the policy to delete

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
For more information, type "Get-Help Remove-DSPamCheckoutPolicy -detailed". For technical information, type "Get-Help Remove-DSPamCheckoutPolicy -full".

---

### Syntax
```PowerShell
Remove-DSPamCheckoutPolicy -PolicyID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```

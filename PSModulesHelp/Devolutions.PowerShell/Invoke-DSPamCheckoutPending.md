Invoke-DSPamCheckoutPending
---------------------------

### Synopsis
Approve or deny a pending checkout request.

---

### Description

Change the state of a pending checkout request depending on the -Accept flag parameter.

---

### Related Links
* [Get-DSPamCheckout](Get-DSPamCheckout)

* [Invoke-DSPamCheckin](Invoke-DSPamCheckin)

* [Invoke-DSPamCheckout](Invoke-DSPamCheckout)

* [Get-DSPamPassword](Get-DSPamPassword)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $checkoutResponse = Get-DSPamCheckout -ActiveAndPending;
        $pending = $checkoutResponse | Where Status -eq "Pending";
        Invoke-DSPamCheckoutPending -Checkout $pending[0] -Approve -ApproverMessage "Accepted"
Get all pending checkouts. Select the desired checkout and approve it.
```

---

### Parameters
#### **Approve**
Approve the checkout request

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ApproverMessage**
Test

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Checkout**
Pending pam checkout to accept

|Type               |Required|Position|PipelineInput|Aliases           |
|-------------------|--------|--------|-------------|------------------|
|`[DvlsPamCheckout]`|true    |named   |false        |CredentialCheckout|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Invoke-DSPamCheckoutPending -detailed". For technical information, type "Get-Help Invoke-DSPamCheckoutPending -full".

---

### Syntax
```PowerShell
Invoke-DSPamCheckoutPending -Checkout <DvlsPamCheckout> [-Approve] [-ApproverMessage <String>] [-AsLegacyResponse] [<CommonParameters>]
```

Get-DSPamCheckout
-----------------

### Synopsis
Return the Pam credential password

---

### Description

Return the PAM credential password if it is currently checked out and user has rights.

---

### Related Links
* [Invoke-DSPamCheckin](Invoke-DSPamCheckin)

* [Invoke-DSPamCheckout](Invoke-DSPamCheckout)

* [Invoke-DSPamCheckoutPending](Invoke-DSPamCheckoutPending)

* [Get-DSPamPassword](Get-DSPamPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $checkoutResponse = Get-DSPamCheckout -ActiveAndPending;
        $pending = $checkoutResponse | Where Status -eq "Pending";
        Invoke-DSPamCheckoutPending -Checkout $pending[0] -Approve -ApproverMessage "Accepted"
Get all pending checkouts. Select the desired checkout and approve it.
```
> EXAMPLE 2

```PowerShell
PS C:\> $checkout = Get-DSPamCheckout -CheckoutID "2735a06c-baa0-4ff9-911c-aa1fcc03ea1e";
        Invoke-DSPamCheckin -Checkout $checkout
Get a pam checkout and check in.
```

---

### Parameters
#### **ActiveAndPending**
Get all active and pending checkouts

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CheckoutID**
Pam account's ID

|Type    |Required|Position|PipelineInput|Aliases      |
|--------|--------|--------|-------------|-------------|
|`[Guid]`|true    |named   |false        |PamCheckoutID|

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.DvlsPamCheckout[]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.DvlsPamCheckout, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.DvlsPamCheckout[], RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSPamCheckout -detailed". For technical information, type "Get-Help Get-DSPamCheckout -full".

---

### Syntax
```PowerShell
Get-DSPamCheckout -CheckoutID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSPamCheckout -ActiveAndPending [-AsLegacyResponse] [<CommonParameters>]
```

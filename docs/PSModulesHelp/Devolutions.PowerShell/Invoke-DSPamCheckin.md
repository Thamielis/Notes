Invoke-DSPamCheckin
-------------------

### Synopsis
Check in a currently checked out PAM credential.

---

### Description

Check in a currently checked out PAM credential. To retreive the checkout, as a PamCheckout object, please use Get-DSPamCheckout CMDlet or store the result of Invoke-DSPamCheckout.

---

### Related Links
* [Get-DSPamCheckout](Get-DSPamCheckout)

* [Invoke-DSPamCheckout](Invoke-DSPamCheckout)

* [Invoke-DSPamCheckoutPending](Invoke-DSPamCheckoutPending)

* [Get-DSPamPassword](Get-DSPamPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $Response = Invoke-DSPamCheckout -PamCredentialID '92e1d27f-6e7b-4c62-86da-a04fc22603c2' -Verbose
        $BobPassword = $Response.Password
        $BobCheckoutInfo = $Response.CheckoutInfo
        $BobCheckinResponse = Invoke-DSPamCheckin $BobCheckoutInfo
Check in the pam checkout
```
> EXAMPLE 2

```PowerShell
PS C:\> $checkoutResponse = Get-DSPamCheckout -ActiveAndPending;
        $checkoutResponse | Where Status -eq "Active" | Invoke-DSPamCheckin
Check in all active checkouts.
```

---

### Parameters
#### **Checkout**
Pam checkout to check in.

|Type               |Required|Position|PipelineInput |Aliases    |
|-------------------|--------|--------|--------------|-----------|
|`[DvlsPamCheckout]`|true    |named   |true (ByValue)|PamCheckout|

---

### Inputs
Devolutions.Server.Pam.Dto.DvlsPamCheckout

Pam checkout obtained from Get-DSPamCheckout.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Invoke-DSPamCheckin -detailed". For technical information, type "Get-Help Invoke-DSPamCheckin -full".

---

### Syntax
```PowerShell
Invoke-DSPamCheckin -Checkout <DvlsPamCheckout> [<CommonParameters>]
```

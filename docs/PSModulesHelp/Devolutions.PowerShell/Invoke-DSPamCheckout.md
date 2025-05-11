Invoke-DSPamCheckout
--------------------

### Synopsis
Creates a checkout request.

---

### Description

Creates a checkout request for the provided PAM credential. Also return the password if approval is not required or if approved ID is the same as the asking user's ID.

---

### Related Links
* [Get-DSPamCheckout](Get-DSPamCheckout)

* [Invoke-DSPamCheckin](Invoke-DSPamCheckin)

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
Auto checkout of the pam credential (approval not required)
```
> EXAMPLE 2

```PowerShell
PS C:\> $Response = Invoke-DSPamCheckout -PamCredentialID '2735a06c-baa0-4ff9-911c-aa1fcc03ea1e' -Reason 'Because' -ApproverID '49a60972-b1ff-4be9-ac73-47c6d4a4125d'
        $MauricePassword = $Response.Password
        $MauriceCheckoutInfo = $Response.CheckoutInfo
        $MauriceCheckinResponse = Invoke-DSPamCheckin $MauriceCheckoutInfo
Self checkout of the pam credential (approver is the same person who request the checkout)
```
> EXAMPLE 3

```PowerShell
PS C:\> $Response = Invoke-DSPamCheckout -PamCredentialID '08a521fe-14f7-4ae5-b2b9-d9f6164c15e8' -ApproverID '2364ec1f-a739-450b-afe8-d85b5a3db50e' -Reason 'Because'
        # After approval
        $CheckoutResponse = Get-DSPamCheckout -CheckoutID $Response.ID
        $KellyPassword = Get-DSPamPassword -PamCredentialID $CheckoutResponse.CredentialID
        $KellyCheckoutInfo = $CheckoutResponse.CheckoutInfo
        $KellyCheckinResponse = Invoke-DSPamCheckin $KellyCheckoutInfo
Approved checkout of the pam credential (approval done by the specified approver)
```

---

### Parameters
#### **AccountID**
ID of the pam credential to checkout

|Type    |Required|Position|PipelineInput|Aliases        |
|--------|--------|--------|-------------|---------------|
|`[Guid]`|true    |named   |false        |PamCredentialID|

#### **ApproverID**
Approver's ID. Necessary if approval is mandatory.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Duration**
Duration, in minutes, of the checkout request. By default, it is set to 4 hours (240 minutes).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Reason**
Information on the checkout request to be sent to an administrator for approval.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.DvlsPamCheckout

* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.DvlsPamCheckout, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Invoke-DSPamCheckout -detailed". For technical information, type "Get-Help Invoke-DSPamCheckout -full".

---

### Syntax
```PowerShell
Invoke-DSPamCheckout -AccountID <Guid> [-Reason <String>] [-ApproverID <Guid>] [-Duration <Int32>] [-AsLegacyResponse] [<CommonParameters>]
```

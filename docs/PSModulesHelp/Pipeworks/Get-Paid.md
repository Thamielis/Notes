Get-Paid
--------

### Synopsis
Gets you paid

---

### Description

Handles getting payments or payment confirmation information.

---

### Related Links
* [https://www.youtube.com/watch?v=XPS60qPh3vc](https://www.youtube.com/watch?v=XPS60qPh3vc)

---

### Examples
A Sample Charge with the Stripe API

```PowerShell
Get-Paid -StripeKey sk_test_aElHsSizhc8XC0uESpNC1t64 -Currency usd -Amount 400 -CardNumber 4242424242424242 -ExpirationMonth 12 -ExpirationYear 2014 -CardVerficationCode 123
```

---

### Parameters
#### **Amount**
The charge amount

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|true    |1       |true (ByPropertyName)|

#### **Currency**
The charge currency

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **StripeToken**
The Stripe Token.  This is used to process payments that use the [Stripe Checkout form](https://stripe.com/docs/checkout)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **CardNumber**
The card number

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **ExpirationMonth**
The Expiration Month

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **ExpirationYear**
The Expiration Year

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |5       |true (ByPropertyName)|

#### **StripeKey**
The Stripe Key.  If provided once, it doesn't need to be provided again.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StripeKeySetting**
The Secure setting containing the Stripe Key.  If provided once, it doesn't need to be provided again.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CardSwipeData**
The direct input from a card reader, as text.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |1       |false        |

#### **IPNInfo**
The PayPal Instant Payment Notification Info

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-Paid [-Amount] <Double> [-Currency] <String> [-CardNumber] <String> [-ExpirationMonth] <String> [-ExpirationYear] <String> [-StripeKey <String>] [-StripeKeySetting <String>] [<CommonParameters>]
```
```PowerShell
Get-Paid [-Amount] <Double> [-Currency] <String> [-StripeKey <String>] [-StripeKeySetting <String>] [-CardSwipeData] <SecureString> [<CommonParameters>]
```
```PowerShell
Get-Paid [-Amount] <Double> [-Currency] <String> [-StripeToken] <String> [-StripeKey <String>] [-StripeKeySetting <String>] [<CommonParameters>]
```
```PowerShell
Get-Paid -IPNInfo <String> [<CommonParameters>]
```

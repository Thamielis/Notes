Write-Link
----------

### Synopsis
Writes links to other web content

---

### Description

Writes links to other web content, and makes linking to rich web content easy.

---

### Related Links
* [Out-HTML](Out-HTML)

---

### Examples
> EXAMPLE 1

```PowerShell
Write-Link -Url "start-automating.com"
```
> EXAMPLE 2

```PowerShell
Write-Link -Url "Start-Automating.com" -Caption "Save Time, Save Money, Start Automating"
```
Write links to several subpages

```PowerShell
Write-Link -Url "a","b","c"
```
A link to a twitter page

```PowerShell
Write-Link "@jamesbru"
```
A link to social sites

```PowerShell
Write-Link "google:+1", "twitter:tweet"
```
> EXAMPLE 6

</span>
       <br/>
       <span style='text-align:center'>
       Visit Website
       </span>"

---

### Parameters
#### **Simple**
If set, will output a simple <a href='$url'>$caption</a>.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |6       |true (ByPropertyName)|

#### **Caption**
The caption of the link

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Name   |

#### **Id**
The ID to use for the link

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Url**
The url of the link.

|Type     |Required|Position|PipelineInput                 |Aliases                |
|---------|--------|--------|------------------------------|-----------------------|
|`[Uri[]]`|true    |1       |true (ByValue, ByPropertyName)|Href<br/>Src<br/>Source|

#### **SortedLinkTable**
A table of links

|Type         |Required|Position|PipelineInput        |Aliases            |
|-------------|--------|--------|---------------------|-------------------|
|`[Hashtable]`|true    |named   |true (ByPropertyName)|Links<br/>LinkTable|

#### **Horizontal**
If set, will lay out multiple links horizontally.
By default, multiple links will be displayed line by line

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |3       |true (ByPropertyName)|

#### **HorizontalSeparator**
Will put a horizontalSeparator in between each horizontal link

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **List**
If set, will lay out multiple links in a list
By default, multiple links will be displayed line by line

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Switch]`|false   |5       |true (ByPropertyName)|AsList |

#### **NumberedList**
If set, will lay out multiple links in a numbered list
By default, multiple links will be displayed line by line

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |AsNumberedList|

#### **Button**
IF set, will make each item a jQueryUI button

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Switch]`|false   |named   |false        |AsButton|

#### **Notify**
If provided, will fire a javascript notify event when the link is actived.  Notify events are used to communicate out of the browser.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[String]`|false   |named   |false        |Notification|

#### **CssClass**
The CSS class to use for the link

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Style**
A style attribute table

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **KeepExtension**
If not set, captions taken from the URL will be stripped of any extension

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ItemProp**
The Microdata item property

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[String]`|false   |named   |false        |ItemProperty|

#### **ItemId**
The Microdata item ID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ItemName**
The name of the item

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ItemPrice**
The price of the item

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|true    |named   |true (ByPropertyName)|

#### **Subscribe**
If set, will make a subscription button

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **BillingFrequency**
The billing frequency of a subscription.  By default, monthly.
Valid Values:

* Daily
* Weekly
* Monthly
* Yearly

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BillingPeriodCount**
The billing periods in a subscription.  By default, one.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[UInt32]`|false   |named   |true (ByPropertyName)|BillingPeriod|

#### **Donate**
If set, will make a donation button

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **ItemDescription**
A Description of the item

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Currency**
The currency used to purchase the item

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **GoogleCheckoutMerchantId**
The MerchantId for GoogleCheckout.  By using this parameter, a buy button for Google Checkout will be outputted.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PaypalEmail**
The Email Address for a paypal account.  By using this parameter, a buy button for Paypal will be outputted

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **StripePublishableKey**
The Publishable Key for Stripe

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BuyCodeHandler**
The URL for a buy code handler.  By using this parameter, payment can be accepted via buy codes

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|false   |named   |true (ByPropertyName)|

#### **ToPayPal**
The IPN url for a paypal transcation.  By using this parameter, a buy button for Paypal will be outputted

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PaypalIPN**
The IPN url for a paypal transcation.  By using this parameter, a buy button for Paypal will be outputted

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PaypalCustom**
The custom property for a paypal transcation.  By using this parameter, a buy button for Paypal will be outputted

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AmazonPaymentsAccountId**
An amazon payments account id

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AmazonAccessKey**
An amazon payments access key

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AmazonSecretKey**
An amazon payments secret key

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AmazonReturnUrl**
The amazon return url

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AmazonIpnUrl**
The Amazon IPN url

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AmazonAbandonUrl**
The Amazon transaction abandoned URL

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CollectShippingAddress**
If provided, will collect the shipping address for a purchase on Amazon

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **DigitalKey**
The digital key used to unlock the purchased item

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DigtialUrl**
The digital url the purchased item can be found at

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ToFacebookLogin**
If set, will create a link to a login button on facebook

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ToLiveConnectLogin**
If set, will create a link to a login button with Live Connect

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **LiveConnectClientId**
The live connect client ID.  This is used to generate a login link to a Microsoft Live Connect web app.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ModuleServiceUrl**
The Module Service URL that will handle the facebook login.  This URL must be relative.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FacebookAppId**
The facebook app ID.  This is used to generate a facebook login link.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **FacebookLoginScope**
The login scope requested from Facebook users.  By default, only email is requested

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **LiveConnectScope**
The login scope requested.  By default, email, basic information, and the right to sign in automatically are included.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **UseOAuth**
If provided, will user facebook OAuth, instead of the javascript API, for the actual like button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Write-Link [[-Simple]] [[-Caption] <String[]>] [[-Id] <String[]>] [-Url] <Uri[]> [[-Horizontal]] [[-HorizontalSeparator] <String>] [[-List]] [-NumberedList] [-Button] [-Notify <String>] [-CssClass <String[]>] [-Style <Hashtable>] [-KeepExtension] [-ItemProp <String>] [-ItemId <String>] [<CommonParameters>]
```
```PowerShell
Write-Link [[-Simple]] -SortedLinkTable <Hashtable> [[-Horizontal]] [[-HorizontalSeparator] <String>] [[-List]] [-NumberedList] [-Button] [-Notify <String>] [-CssClass <String[]>] [-Style <Hashtable>] [-KeepExtension] [-ItemProp <String>] [-ItemId <String>] [<CommonParameters>]
```
```PowerShell
Write-Link [[-Simple]] [[-Horizontal]] [[-HorizontalSeparator] <String>] [[-List]] [-NumberedList] [-Button] [-Notify <String>] [-CssClass <String[]>] [-Style <Hashtable>] [-KeepExtension] [-ItemProp <String>] [-ItemId <String>] -ItemName <String> -ItemPrice <Double> [-Subscribe] [-BillingFrequency <String>] [-BillingPeriodCount <UInt32>] [-Donate] [-ItemDescription <String>] [-Currency <String>] [-GoogleCheckoutMerchantId <String>] [-PaypalEmail <String>] [-StripePublishableKey <String>] [-BuyCodeHandler <Uri>] [-ToPayPal <String>] [-PaypalIPN <String>] [-PaypalCustom <String>] [-AmazonPaymentsAccountId <String>] [-AmazonAccessKey <String>] [-AmazonSecretKey <String>] [-AmazonReturnUrl <String>] [-AmazonIpnUrl <String>] [-AmazonAbandonUrl <String>] [-CollectShippingAddress] [-DigitalKey <String>] [-DigtialUrl <String>] [<CommonParameters>]
```
```PowerShell
Write-Link [[-Simple]] [[-Horizontal]] [[-HorizontalSeparator] <String>] [[-List]] [-NumberedList] [-Button] [-Notify <String>] [-CssClass <String[]>] [-Style <Hashtable>] [-KeepExtension] [-ItemProp <String>] [-ItemId <String>] -ToFacebookLogin [-ModuleServiceUrl <String>] -FacebookAppId <String> [-FacebookLoginScope <String[]>] [-UseOAuth] [<CommonParameters>]
```
```PowerShell
Write-Link [[-Simple]] [[-Horizontal]] [[-HorizontalSeparator] <String>] [[-List]] [-NumberedList] [-Button] [-Notify <String>] [-CssClass <String[]>] [-Style <Hashtable>] [-KeepExtension] [-ItemProp <String>] [-ItemId <String>] -ToLiveConnectLogin -LiveConnectClientId <String> [-ModuleServiceUrl <String>] [-LiveConnectScope <String[]>] [-UseOAuth] [<CommonParameters>]
```

Convert-ExchangeRecipient
-------------------------

### Synopsis
Convert msExchRemoteRecipientType, msExchRecipientDisplayType, msExchRecipientTypeDetails to their respective name

---

### Description

Convert msExchRemoteRecipientType, msExchRecipientDisplayType, msExchRecipientTypeDetails to their respective name

---

### Examples
> EXAMPLE 1

```PowerShell
$Users = Get-ADUser -Filter * -Properties Mail, ProxyAddresses, msExchRemoteRecipientType, msExchRecipientDisplayType, msExchRecipientTypeDetails, MailNickName
$UsersModified = foreach ($User in $Users) {
    [PSCUstomObject] @{
        Name                       = $User.Name
        Mail                       = $User.Mail
        MailNickName               = $User.MailNickName
        msExchRemoteRecipientType  = Convert-ExchangeRecipient -msExchRemoteRecipientType $User.msExchRemoteRecipientType
        msExchRecipientDisplayType = Convert-ExchangeRecipient -msExchRecipientDisplayType $User.msExchRecipientDisplayType
        msExchRecipientTypeDetails = Convert-ExchangeRecipient -msExchRecipientTypeDetails $User.msExchRecipientTypeDetails
        ProxyAddresses             = Convert-ExchangeEmail -AddSeparator -RemovePrefix -RemoveDuplicates -Separator ',' -Emails $User.ProxyAddresses
    }
}
$UsersModified | Out-HtmlView -Filtering -ScrollX
```
> EXAMPLE 2

```PowerShell
Convert-ExchangeRecipient -msExchRemoteRecipientType 17
Convert-ExchangeRecipient -msExchRecipientDisplayType 17
Convert-ExchangeRecipient -msExchRecipientTypeDetails 17
```

---

### Parameters
#### **msExchRecipientTypeDetails**

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|false   |named   |false        |RecipientTypeDetails|

#### **msExchRecipientDisplayType**

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |named   |false        |RecipientType|

#### **msExchRemoteRecipientType**

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[String]`|false   |named   |false        |RemoteRecipientType|

#### **All**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
Based on:
- https://granikos.eu/exchange-recipient-type-values/
- https://answers.microsoft.com/en-us/msoffice/forum/all/recipient-type-values/7c2620e5-9870-48ba-b5c2-7772c739c651
- https://www.undocumented-features.com/2020/05/06/every-last-msexchrecipientdisplaytype-and-msexchrecipienttypedetails-value/

---

### Syntax
```PowerShell
Convert-ExchangeRecipient [-msExchRecipientTypeDetails <String>] [-All] [<CommonParameters>]
```
```PowerShell
Convert-ExchangeRecipient [-msExchRecipientDisplayType <String>] [-All] [<CommonParameters>]
```
```PowerShell
Convert-ExchangeRecipient [-msExchRemoteRecipientType <String>] [-All] [<CommonParameters>]
```

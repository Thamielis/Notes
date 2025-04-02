Convert-ExchangeEmail
---------------------

### Synopsis
Converts a list of Exchange email addresses into a readable and exportable format.

---

### Description

This function takes a list of Exchange email addresses and processes them to make them more readable and suitable for export.

---

### Examples
> EXAMPLE 1

```PowerShell
$Emails = @()
$Emails += 'SIP:test@email.com'
$Emails += 'SMTP:elo@maiu.com'
$Emails += 'sip:elo@maiu.com'
$Emails += 'Spo:dfte@sdsd.com'
$Emails += 'SPO:myothertest@sco.com'
Convert-ExchangeEmail -Emails $Emails -RemovePrefix -RemoveDuplicates -AddSeparator

>
```

---

### Parameters
#### **Emails**
List of email addresses in Exchange or Exchange Online format, also known as proxy addresses.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Separator**
The separator to use between each processed email address. Default is ', '.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RemoveDuplicates**
Switch to remove duplicate email addresses from the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemovePrefix**
Switch to remove any prefixes like 'SMTP:', 'SIP:', 'spo:', etc. from the email addresses.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AddSeparator**
Switch to join the processed email addresses using the specified separator.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Convert-ExchangeEmail [[-Emails] <String[]>] [[-Separator] <String>] [-RemoveDuplicates] [-RemovePrefix] [-AddSeparator] [<CommonParameters>]
```

EmailBCC
--------

### Synopsis
Creates an email object for blind carbon copy (BCC) recipients.

---

### Description

This function creates an email object specifically for blind carbon copy (BCC) recipients. It takes an array of email addresses and returns a custom object representing the BCC recipients.

---

### Examples
> EXAMPLE 1

```PowerShell
$BCCRecipients = EmailBCC -Addresses 'bcc1@example.com', 'bcc2@example.com'
Creates an email object with two BCC recipients.
```
> EXAMPLE 2

```PowerShell
$BCCList = 'bcc1@example.com', 'bcc2@example.com'
$BCCRecipients = EmailBCC -Addresses $BCCList
Creates an email object with multiple BCC recipients.
```

---

### Parameters
#### **Addresses**
Specifies an array of email addresses for the BCC recipients.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
EmailBCC [[-Addresses] <String[]>] [<CommonParameters>]
```

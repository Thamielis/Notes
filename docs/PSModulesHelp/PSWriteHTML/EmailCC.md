EmailCC
-------

### Synopsis
Creates an email object for carbon copy (CC) recipients.

---

### Description

This function creates an email object specifically for carbon copy (CC) recipients. It takes an array of email addresses and returns a custom object representing the CC recipients.

---

### Examples
> EXAMPLE 1

```PowerShell
$CCRecipients = EmailCC -Addresses 'cc1@example.com', 'cc2@example.com'
Creates an email object with two CC recipients.
```
> EXAMPLE 2

```PowerShell
$CCList = 'cc1@example.com', 'cc2@example.com'
$CCRecipients = EmailCC -Addresses $CCList
Creates an email object with multiple CC recipients.
```

---

### Parameters
#### **Addresses**
Specifies an array of email addresses for the CC recipients.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
EmailCC [[-Addresses] <String[]>] [<CommonParameters>]
```

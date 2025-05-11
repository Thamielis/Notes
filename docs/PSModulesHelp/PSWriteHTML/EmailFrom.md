EmailFrom
---------

### Synopsis
Creates an email object for the sender address.

---

### Description

This function creates an email object specifically for the sender address. It takes a single email address as input and returns a custom object representing the sender address.

---

### Examples
> EXAMPLE 1

```PowerShell
$Sender = EmailFrom -Address 'sender@example.com'
Creates an email object with the specified sender address.
```

---

### Parameters
#### **Address**
Specifies the email address of the sender.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
EmailFrom [[-Address] <String>] [<CommonParameters>]
```

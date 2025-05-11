EmailTo
-------

### Synopsis
Defines the email addresses to which the email should be sent.

---

### Description

This function sets the email addresses to which the email should be sent.

---

### Examples
> EXAMPLE 1

```PowerShell
EmailTo -Addresses "user1@example.com", "user2@example.com"
Sets the email addresses to which the email should be sent to "user1@example.com" and "user2@example.com".
```

---

### Parameters
#### **Addresses**
Specifies an array of email addresses to which the email should be sent.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
EmailTo [[-Addresses] <String[]>] [<CommonParameters>]
```

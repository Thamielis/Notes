EmailReplyTo
------------

### Synopsis
Defines the email address to which replies should be directed.

---

### Description

This function sets the email address to which replies should be directed when receiving notifications.

---

### Examples
> EXAMPLE 1

```PowerShell
EmailReplyTo -Address "reply@example.com"
Sets the email address to which replies should be directed to "reply@example.com".
```

---

### Parameters
#### **Address**
Specifies the email address to which replies should be directed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
EmailReplyTo [[-Address] <String>] [<CommonParameters>]
```

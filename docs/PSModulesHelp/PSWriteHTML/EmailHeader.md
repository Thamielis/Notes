EmailHeader
-----------

### Synopsis
Creates email headers based on the provided ScriptBlock.

---

### Description

This function creates email headers using the specified ScriptBlock. It allows customization of email headers before sending an email.

---

### Examples
> EXAMPLE 1

```PowerShell
$EmailHeader = {
    'From: sender@example.com'
    'To: recipient@example.com'
    'Subject: Hello World'
}
$Headers = EmailHeader -EmailHeader $EmailHeader
Creates email headers with sender, recipient, and subject information.
```

---

### Parameters
#### **EmailHeader**
Specifies the ScriptBlock containing the email header content.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

---

### Syntax
```PowerShell
EmailHeader [[-EmailHeader] <ScriptBlock>] [<CommonParameters>]
```

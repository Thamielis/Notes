EmailAttachment
---------------

### Synopsis
Creates an email attachment object for header attachments.

---

### Description

This function creates an email attachment object specifically for header attachments. It takes an array of file paths and returns a custom object representing the attachment.

---

### Examples
> EXAMPLE 1

```PowerShell
$Attachment = EmailAttachment -FilePath 'C:\Files\attachment1.txt', 'C:\Files\attachment2.pdf'
Creates an email attachment object with two file paths for header attachments.
```
> EXAMPLE 2

```PowerShell
$Files = 'C:\Files\attachment1.txt', 'C:\Files\attachment2.pdf'
$Attachment = EmailAttachment -FilePath $Files
Creates an email attachment object with multiple file paths for header attachments.
```

---

### Parameters
#### **FilePath**
Specifies an array of file paths for the attachments.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
EmailAttachment [[-FilePath] <String[]>] [<CommonParameters>]
```

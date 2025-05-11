EmailLayout
-----------

### Synopsis
Defines the layout structure for an email content.

---

### Description

This function defines the layout structure for an email content using a ScriptBlock. It generates an HTML table layout for the email content.

---

### Examples
> EXAMPLE 1

```PowerShell
$EmailLayout = {
    'Content goes here'
}
EmailLayout -Layout $EmailLayout
Generates an HTML table layout for the email content with the specified content.
```

---

### Parameters
#### **Layout**
Specifies the ScriptBlock containing the layout structure for the email content.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

---

### Syntax
```PowerShell
EmailLayout [[-Layout] <ScriptBlock>] [<CommonParameters>]
```

New-HTMLStatus
--------------

### Synopsis
Creates a new HTML status section with customizable content.

---

### Description

The New-HTMLStatus function creates an HTML status section with customizable content. It allows you to display status information with flexibility.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLStatus -Content {
    "Status: OK"
}
Creates a new HTML status section displaying "Status: OK".
```
> EXAMPLE 2

```PowerShell
$content = {
    "Status: Error"
}
New-HTMLStatus -Content $content
Creates a new HTML status section displaying "Status: Error".
```

---

### Parameters
#### **Content**
Specifies the content to be displayed within the status section as a ScriptBlock.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

---

### Syntax
```PowerShell
New-HTMLStatus [[-Content] <ScriptBlock>] [<CommonParameters>]
```

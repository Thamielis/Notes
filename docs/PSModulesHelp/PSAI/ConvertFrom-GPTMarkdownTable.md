ConvertFrom-GPTMarkdownTable
----------------------------

### Synopsis
Converts a markdown table to a PowerShell object.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-GPTMarkdownTable -Markdown @'
| Name | Value |
| ---- | ----- |
| foo  | bar   |
| baz  | qux   |
'@
```
> EXAMPLE 2

```PowerShell
ai 'markdown table syntax' | ConvertFrom-GPTMarkdownTable
```

---

### Parameters
#### **markdown**
The markdown table to convert.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

---

### Syntax
```PowerShell
ConvertFrom-GPTMarkdownTable [[-markdown] <Object>] [<CommonParameters>]
```

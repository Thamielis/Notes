Show-TableVisualization
-----------------------

### Synopsis
Displays a table visualization of the input object.

---

### Description

The Show-TableVisualization function displays a table visualization of the input object using Format-Table. It also provides additional information about the table data.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Process | Show-TableVisualization
Displays a table visualization of the processes retrieved by Get-Process.
```
> EXAMPLE 2

```PowerShell
$data = Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object Name, DisplayName, Status
PS C:\> $data | Show-TableVisualization
Displays a table visualization of the selected service data.
```

---

### Parameters
#### **Object**
Specifies the input object to be visualized as a table.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|false   |1       |true (ByValue, ByPropertyName)|

---

### Syntax
```PowerShell
Show-TableVisualization [[-Object] <Object>] [<CommonParameters>]
```

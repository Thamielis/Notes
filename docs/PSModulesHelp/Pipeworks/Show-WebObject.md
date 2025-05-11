Show-WebObject
--------------

### Synopsis
Shows a web object

---

### Description

Shows a web object stored in cloud storage

---

### Related Links
* [Get-AzureTable](Get-AzureTable)

---

### Examples
> EXAMPLE 1

```PowerShell
New-Object PSObject -Property @{
    Content = "# Some Markdown or HTML "            
} |
    Set-AzureTable -TableName MyTable -RowKey Home -PartitionKey Website
Show-WebObject -Table MyTable -Part Website -Row Home
```

---

### Parameters
#### **Table**
The name of the table

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |named   |true (ByPropertyName)|TableName|

#### **Part**
The partition in the table

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|true    |named   |true (ByPropertyName)|PartitionKey|

#### **Row**
The row in the table

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |true (ByPropertyName)|RowKey |

#### **StorageAccount**
The table storage account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageKey**
The table storage key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Show-WebObject -Table <String> -Part <String> -Row <String> [-StorageAccount <String>] [-StorageKey <String>] [<CommonParameters>]
```

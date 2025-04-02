Get-ExcelWorkbookInfo
---------------------

### Synopsis
Retrieve information of an Excel workbook.

---

### Description

The Get-ExcelWorkbookInfo cmdlet retrieves information (LastModifiedBy, LastPrinted, Created, Modified, ...) fron an Excel workbook. These are the same details that are visible in Windows Explorer when right clicking the Excel file, selecting Properties and check the Details tabpage.

---

### Related Links
* [Online Version:](Online Version:)

* [https://github.com/dfinke/ImportExcel](https://github.com/dfinke/ImportExcel)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ExcelWorkbookInfo .\Test.xlsx
CorePropertiesXml : \#document Title : Subject : Author : Konica Minolta User Comments : Keywords : LastModifiedBy : Bond, James (London) GBR LastPrinted : 2017-01-21T12:36:11Z Created : 17/01/2017 13:51:32 Category : Status : ExtendedPropertiesXml : \#document Application : Microsoft Excel HyperlinkBase : AppVersion : 14.0300 Company : Secret Service Manager : Modified : 10/02/2017 12:45:37 CustomPropertiesXml : \#document
```

---

### Parameters
#### **Path**
Specifies the path to the Excel file. This parameter is required.

|Type      |Required|Position|PipelineInput                 |Aliases |
|----------|--------|--------|------------------------------|--------|
|`[String]`|true    |1       |True (ByPropertyName, ByValue)|FullName|

---

### Notes
CHANGELOG 2016/01/07 Added Created by Johan Akerstrom ( https://github.com/CosmosKey (https://github.com/CosmosKey)\)

---

### Syntax
```PowerShell
Get-ExcelWorkbookInfo [-Path] <String> [<CommonParameters>]
```

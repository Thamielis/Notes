Generate-VBRLicenseUsageReport
------------------------------

### Synopsis
Crates reports on license usage.

---

### Description

This cmdlet creates a report on license usage.

---

### Examples
> Example 1. Creating HTML Report

```PowerShell
Generate-VBRLicenseUsageReport -Path "C:\Users\Administrator\VeeamReports\" -Type Html
This command creates the HTML report on license usage.
The report is saved as the report.html file to the C:\Users\Administrator\VeeamReports\ folder.
```
> Example 2. Creating PDF Report

```PowerShell
Generate-VBRLicenseUsageReport -Path "C:\Users\Administrator\VeeamReports\" -Type Pdf
This command creates the PFD report on license usage.
The report is saved as the report.pdf file to the C:\Users\Administrator\VeeamReports\ folder.
```
> Example 3. Creating JSON Report

```PowerShell
Generate-VBRLicenseUsageReport -Path "C:\Users\Administrator\VeeamReports\" -Type Json
This command creates the JSON report on license usage.
The report is saved as the report.json file to the C:\Users\Administrator\VeeamReports\ folder.
```

---

### Parameters
#### **Path**
Specifies a name of file and the path to the folder. The cmdlet will save a report with the specified name to this folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Type**
Specifies a type of the report file. You can generate a report in one of the following file types:
* HTML
* PDF
* JSON
Valid Values:

* Html
* Pdf
* Json

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRLicenseUsageReportType]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Generate-VBRLicenseUsageReport -Path <String> -Type {Html | Pdf | Json} [<CommonParameters>]
```

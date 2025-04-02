ConvertTo-FormattedNumber
-------------------------

### Synopsis
Numerical formatter used in various ways by the DataONTAP module's data formatters.

---

### Description

Numerical formatter used in various ways by the DataONTAP module's data formatters.

This cmdlet is referenced in DataONTAP.Format.ps1xml.  It accepts numerical values and outputs them as defined by other input arguments.

---

### Examples
> Example 1

ConvertTo-FormattedNumber 1024 DataSize "0.0"
Data size

1.0 KB

> Example 2

```PowerShell
ConvertTo-FormattedNumber 1234567 Count "0.00"
Count

1.20M

```
> Example 3

ConvertTo-FormattedNumber 57.523 Percent
Percent

58%

> Example 4

```PowerShell
ConvertTo-FormattedNumber 15000 RPM
RPM.  This is a special case that provides special handling for common disk rotational speeds.

15k

```

---

### Parameters
#### **Value**
The numerical value to be formatted as a string.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[Decimal]`|false   |1       |true (ByValue, ByPropertyName)|

#### **Type**
The type of formatting required.  Supported types are DataSize, Count, Percent, RPM.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **NumberFormatString**
.NET numeric formatting string, i.e. "0.0".  If not supplied, the default is "0".  This affects only the numerical portion of the output string.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |3       |true (ByPropertyName)|Format |

#### **StringValue**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
System.Int64

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
ConvertTo-FormattedNumber [[-Value] <Decimal>] [[-Type] <String>] [[-NumberFormatString] <String>] [<CommonParameters>]
```
```PowerShell
ConvertTo-FormattedNumber [[-Type] <String>] [[-NumberFormatString] <String>] [-StringValue <String>] [<CommonParameters>]
```

Convert-Size
------------

### Synopsis
Converts a value from one size unit to another.

---

### Description

This function converts a value from one size unit (Bytes, KB, MB, GB, TB) to another size unit based on the specified conversion. It provides flexibility to handle different size units and precision of the conversion.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-Size -From 'KB' -To 'MB' -Value 2048
# Converts 2048 Kilobytes to Megabytes.
```
> EXAMPLE 2

Convert-Size -From 'GB' -To 'TB' -Value 2.5 -Precision 2 -Display
# Converts 2.5 Gigabytes to Terabytes with a precision of 2 decimal places and displays the result.
Original - https://techibee.com/powershell/convert-from-any-to-any-bytes-kb-mb-gb-tb-using-powershell/2376

Changelog - Modified 30.03.2018 - przemyslaw.klys at evotec.pl
- Added $Display Switch

---

### Parameters
#### **From**
Specifies the original size unit of the input value.
Valid Values:

* Bytes
* KB
* MB
* GB
* TB

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **To**
Specifies the target size unit to convert the input value to.
Valid Values:

* Bytes
* KB
* MB
* GB
* TB

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Value**
Specifies the numerical value to be converted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|true    |3       |false        |

#### **Precision**
Specifies the number of decimal places to round the converted value to. Default is 4.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **Display**
Indicates whether to display the converted value with the target size unit.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Convert-Size [[-From] <String>] [[-To] <String>] [-Value] <Double> [[-Precision] <Int32>] [-Display] [<CommonParameters>]
```

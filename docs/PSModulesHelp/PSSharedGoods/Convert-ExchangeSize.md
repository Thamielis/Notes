Convert-ExchangeSize
--------------------

### Synopsis
Converts the size of Exchange data to a specified unit of measurement.

---

### Description

This function takes the size of Exchange data and converts it to the specified unit of measurement (Bytes, KB, MB, GB, TB).

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-ExchangeSize -To MB -Size '49 GB (52,613,349,376 bytes)'
# Returns the size converted to MB.
```
> EXAMPLE 2

```PowerShell
Convert-ExchangeSize -To GB -Size '49 GB (52,613,349,376 bytes)' -Precision 2 -Display
# Returns the size converted to GB with 2 decimal places and displays the result.
```

---

### Parameters
#### **To**
The unit of measurement to convert the size to. Default is 'MB'.
Valid Values:

* Bytes
* KB
* MB
* GB
* TB

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Size**
The size of Exchange data to be converted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Precision**
The number of decimal places to round the converted size to. Default is 4.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Display**
Switch to display the converted size with the unit of measurement.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Default**
The default value to return if the size is null or empty. Default is 'N/A'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Syntax
```PowerShell
Convert-ExchangeSize [[-To] <String>] [[-Size] <String>] [[-Precision] <Int32>] [-Display] [[-Default] <String>] [<CommonParameters>]
```

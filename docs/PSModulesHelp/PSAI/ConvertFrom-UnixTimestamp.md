ConvertFrom-UnixTimestamp
-------------------------

### Synopsis
Converts a Unix timestamp to a DateTime object.

---

### Description

The ConvertFrom-UnixTimestamp function takes a Unix timestamp as input and converts it to a DateTime object. 
A Unix timestamp represents the number of seconds that have elapsed since January 1, 1970, 00:00:00 UTC.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-UnixTimestamp -UnixTimestamp 1625097600
This example converts the Unix timestamp 1625097600 to a DateTime object.
```

---

### Parameters
#### **UnixTimestamp**
The Unix timestamp to convert.

|Type     |Required|Position|PipelineInput |
|---------|--------|--------|--------------|
|`[Int32]`|true    |1       |true (ByValue)|

---

### Outputs
* System.DateTime
The function returns a DateTime object representing the converted Unix timestamp.

---

### Syntax
```PowerShell
ConvertFrom-UnixTimestamp [-UnixTimestamp] <Int32> [<CommonParameters>]
```

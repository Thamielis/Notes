Export-LogCsv
-------------

### Synopsis
Export a hashtable of log message objects to a CSV file.

---

### Description

Sort the log message objects by their Timestamp property.
Export the log message objects to a CSV file.
Write the file path to the Information stream.

---

### Parameters
#### **LogFile**
Log file to create

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Cache**
In-process cache to reduce calls to other processes or disk, and store repetitive parameters for better readability of code and logs

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSReference]`|true    |2       |false        |

---

### Inputs
[System.String]$LogFile parameter

---

### Outputs
* None.  The value of $LogFile is written to the Information stream.

---

### Syntax
```PowerShell
Export-LogCsv [[-LogFile] <String>] [-Cache] <PSReference> [<CommonParameters>]
```

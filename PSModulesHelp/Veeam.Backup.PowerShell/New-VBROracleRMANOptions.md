New-VBROracleRMANOptions
------------------------

### Synopsis
Creates the Oracle RMAN backup settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for Oracle RMAN.

This cmdlet creates Oracle RMAN backup settings. You can run this cmdlet to allow Veeam Plug-in to send application backups to the target storage using several parallel data channels.

---

### Examples
> Example - Creating Oracle RMAN Backup Settings for Application Backup Policies for Veeam Plug-in for Oracle RMAN

```PowerShell
New-VBROracleRMANOptions -ParallelChannelsCount 3
This command creates the Oracle RMAN backup settings for application backup policies for Veeam Plug-in for Oracle RMAN. The policy will send application backups to the target storage using 3 parallel data channels.
```

---

### Parameters
#### **ParallelChannelsCount**
Specifies defining the number of data channels that can be assigned.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
New-VBROracleRMANOptions [-ParallelChannelsCount <Int32>] [<CommonParameters>]
```

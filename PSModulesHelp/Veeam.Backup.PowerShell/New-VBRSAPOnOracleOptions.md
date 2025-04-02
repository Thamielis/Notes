New-VBRSAPOnOracleOptions
-------------------------

### Synopsis
Creates the SAP on Oracle backup settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for SAP on Oracle.

This cmdlet creates SAP on Oracle backup settings. You can run this cmdlet to allow Veeam Plug-in to send application backups to the target storage using several parallel data channels.

---

### Examples
> Example - Creating SAP on Oracle Backup Settings for Application Backup Policies for Veeam Plug-in for SAP on Oracle

```PowerShell
New-VBRSAPOnOracleOptions  -ParallelChannelsCount 3
This command creates SAP on Oracle backup settings for application backup policies for Veeam Plug-in for SAP on Oracle. The policy will send application backups to the target storage using 3 parallel data channels.
```

---

### Parameters
#### **ParallelChannelsCount**
Specifies the integer defining the number of data channels that can be assigned. Permitted values: 1 to 32.

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
New-VBRSAPOnOracleOptions [-ParallelChannelsCount <Int32>] [<CommonParameters>]
```

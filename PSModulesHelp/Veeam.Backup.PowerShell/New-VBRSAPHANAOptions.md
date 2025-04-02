New-VBRSAPHANAOptions
---------------------

### Synopsis
Creates the SAP HANA backup settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for SAP HANA.

This cmdlet creates SAP HANA backup settings. You can run this cmdlet to allow Veeam Plug-in to send application backups to the target storage using several parallel data channels.

---

### Examples
> Example - Creating SAP HANA Backup Settings for Application Backup Policies for Veeam Plug-in for Oracle RMAN

```PowerShell
New-VBRSAPHANAOptions -ParallelChannelsCount 3
This command creates SAP HANA backup settings for application backup policies for Veeam Plug-in for Oracle RMAN. The policy will send application backups to the target storage using 3 parallel data channels.
```

---

### Parameters
#### **ParallelChannelsCount**
Specifies the number of data channels that can be assigned. Permitted values: 1 to 32.

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
New-VBRSAPHANAOptions [-ParallelChannelsCount <Int32>] [<CommonParameters>]
```

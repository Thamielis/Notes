Export-VBRLinuxKnownHost
------------------------

### Synopsis
Exports Linux SSH fingerprints to a file.

---

### Description

This cmdlet copies TLS fingerprints of trusted Linux hosts from Veeam Backup & Replication to a file.

---

### Examples
> Exporting Linux SSH Fingerprints

```PowerShell
Export-VBRLinuxKnownHost -Path "C:\fingerprints.xml"
This command exports Linux SSH fingerprints to an XML file.
```

---

### Parameters
#### **Path**
Specifies the path to the file. The cmdlet will export TLS fingerprints to this file.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Export-VBRLinuxKnownHost -Path <String> [<CommonParameters>]
```

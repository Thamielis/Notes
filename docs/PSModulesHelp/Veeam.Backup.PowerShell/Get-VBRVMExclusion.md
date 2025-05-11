Get-VBRVMExclusion
------------------

### Synopsis
Returns a list of global VM exclusions.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet returns a list of global exclusions created for VMs.

---

### Examples
> Getting Exclusion by VM Name

```PowerShell
Get-VBRVMExclusion -Name "ubuntusrv20"
This command returns an exclusion created for the ubuntusrv20 VM.
```

---

### Parameters
#### **Id**
Specifies the ID of an exclusion.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |0       |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of excluded VM names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |0       |True (ByPropertyName, ByValue)|

#### **Note**
Specifies the note added for an exclusion.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

System.String[]

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRVMExclusion [[-Id] <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRVMExclusion [[-Name] <String[]>] [-Note <String>] [<CommonParameters>]
```

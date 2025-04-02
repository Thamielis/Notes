Set-VBRVMExclusion
------------------

### Synopsis
Modifies a global VM exclusion.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet modifies a global VM exclusion.

---

### Related Links
* [Get-VBRVMExclusion](Get-VBRVMExclusion)

---

### Examples
> Adding Notes to Exclusion

$excl = Get-VBRVMExclusion -Name "ubuntusrv20"       
Set-VBRVMExclusion -Exclusion $excl -Note "Protected by another backup server"
This example shows how to add a note to the exclusion for the ubuntusrv20 VM.
Perform the following steps:
1. Run the Get-VBRVMExclusion cmdlet. Specify the Name parameter value. Save the result to the $excl variable.
2. Run the Set-VBRVMExclusion cmdlet. Set the $excl variable as the Exclusion parameter value and also specify the Note parameter value.

---

### Parameters
#### **Exclusion**
Specifies the global exclusion that you want to modify.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRVMExclusion]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Note**
Specifies the note for the exclusion.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRVMExclusion

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRVMExclusion [-Exclusion] <VBRVMExclusion> [-Note <String>] [<CommonParameters>]
```

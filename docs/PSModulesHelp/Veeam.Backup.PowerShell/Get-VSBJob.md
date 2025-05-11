Get-VSBJob
----------

### Synopsis
Returns SureBackup jobs.

---

### Description

This cmdlet returns the list of created SureBackup jobs.

You can get the list of all SureBackup jobs or look for specific jobs directly by name.

Run Get-VSBSession or Get-VSBTaskSession to get the information on SureBackup session or session tasks. Run Get-VBRJob to look for backup, replication or copy jobs.

---

### Examples
> Example 1

```PowerShell
Get-VSBJob
This command looks for the list of all created SureBackup jobs.
```
> Example 2

```PowerShell
Get-VSBJob -Name "SureJob 01", "SureJob 02"
This command looks for the SureBackup jobs named "SureJob 01" and "SureJob 02".
```

---

### Parameters
#### **Name**
Specifies the name of the SureBackup job you want to get, or search conditions. You can specify multiple names separated by commas.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VSBJob [-Name <String[]>] [<CommonParameters>]
```

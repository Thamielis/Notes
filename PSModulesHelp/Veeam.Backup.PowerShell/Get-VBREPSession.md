Get-VBREPSession
----------------

### Synopsis
Returns sessions of backup jobs run by Veeam Agent operating in a standalone mode.

---

### Description

This cmdlet returns sessions of backup jobs run by Veeam Agent operating in a standalone mode.
You can get all jobs sessions or search for instances directly by name. Use an appropriate parameter set for each case.

---

### Examples
> Example 1. Getting All Sessions of Backup Jobs Run by Veeam Agent in Standalone Mode

```PowerShell
Get-VBREPSession
This command returns all sessions of backup jobs run by Veeam Agent operating in a standalone mode.
```
> Example 2. Getting Specific Session of Backup Job Run by Veeam Agent in Standalone Mode

```PowerShell
Get-VBREPSession -Name "Backup Job Mediaserver"
This command gets a specific session of a backup job run by Veeam Agent operating in a standalone mode.
```

---

### Parameters
#### **Name**
Specifies the array of job names. The cmdlet will return jobs with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBREPSession [-Name <String[]>] [<CommonParameters>]
```

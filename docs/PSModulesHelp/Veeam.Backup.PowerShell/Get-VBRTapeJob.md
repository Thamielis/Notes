Get-VBRTapeJob
--------------

### Synopsis
Returns tape jobs.

---

### Description

This cmdlet returns tape jobs created on this Veeam backup server.

You can get backup to tape jobs, file to tape and object to tape jobs.

---

### Examples
> Example - Getting Tape Job by Name

```PowerShell
Get-VBRTapeJob -Name "Daily WebApp Backup"
This command returns the tape job named "Daily WebApp Backup".
```

---

### Parameters
#### **Name**
Specifies the array of tape job names. The cmdlet will return tape jobs with these names.

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
Get-VBRTapeJob [-Name <String[]>] [<CommonParameters>]
```

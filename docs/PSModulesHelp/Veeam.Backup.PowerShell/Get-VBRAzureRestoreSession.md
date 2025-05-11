Get-VBRAzureRestoreSession
--------------------------

### Synopsis
Returns VM backup restore to Microsoft Azure sessions.

---

### Description

This cmdlet returns restore to Microsoft Azure sessions.
You can look for a session to check its status or to pass it to the Stop-VBRVMRestoreToAzure cmdlet to stop the running session.

---

### Examples
> Example 1

```PowerShell
Get-VBRAzureRestoreSession
This command gets all restore to Azure sessions that have been run on this Veeam backup server.
```
> Example 2

$session = Get-VBRAzureRestoreSession | Sort-Object CreationTime -Descending | Select -First 1
This example shows how to get a restore session and check its status.

Perform the following steps:
1. Run the Get-VBRAzureRestoreSession cmdlet.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Specify the CreationTime parameter.
3. Pipe the cmdlet output to the Select cmdlet. Specify the First parameter.

---

### Parameters
#### **Id**
Specifies the ID of the Microsoft Azure session you want to get.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Guid]`|false   |named   |True (ByPropertyName)|

#### **Session**
Specifies the restore to Microsoft Azure session you want to get.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRAzureRestoreSession]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureRestoreSession

System.Guid

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAzureRestoreSession [-Id <Guid>] [<CommonParameters>]
```
```PowerShell
Get-VBRAzureRestoreSession [-Session <VBRAzureRestoreSession>] [<CommonParameters>]
```

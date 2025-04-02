Get-VBRPluginRestoreSession
---------------------------

### Synopsis
Returns active restore sessions of application policies.

---

### Description

This cmdlet returns active restore sessions of application policies.

---

### Examples
> Example 1. Getting all Active Restore Sessions of Application Policies

```PowerShell
Get-VBRPluginRestoreSession
This command returns all active restore sessions of application policies.
```
> Example 2. Getting Active Restore Sessions of Application Policies

```PowerShell
Get-VBRPluginRestoreSession -Id "ebea2113-dacb-4f5f-ac2a-18794fb6d4aa"
This command returns the ebea2113-dacb-4f5f-ac2a-18794fb6d4aa application policy restore session.
```

---

### Parameters
#### **Id**
Specifies the array of restore sessions for application policies IDs. The cmdlet will return the sessions with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

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
Get-VBRPluginRestoreSession [-Id <Guid[]>] [<CommonParameters>]
```

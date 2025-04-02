Get-VBRAzureApplianceSession
----------------------------

### Synopsis
Returns statuses of deployment sessions for helper restore appliance.

---

### Description

This cmdlet returns status of process initiated by the Deploy-VBRAzureLinuxRestoreAppliance cmdlet.

---

### Examples
> Example 1

```PowerShell
Get-VBRAzureApplianceSession
This command returns statuses of all sessions.
```
> Example 2

```PowerShell
Get-VBRAzureApplianceSession -Session $appliancesession
This command returns status of a specific session. In this example, we assume that the user saved the session to a variable when they deployed the appliance. See examples for the Deploy-VBRAzureLinuxRestoreAppliance cmdlet for details.
```

---

### Parameters
#### **Id**
Specifies the ID of the session.
The cmdlet will return the statuses of the  sessions with this ID.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Guid]`|false   |named   |True (ByPropertyName)|

#### **Session**
Specifies the session.
The cmdlet will return the status of this session.

|Type                        |Required|Position|PipelineInput                 |
|----------------------------|--------|--------|------------------------------|
|`[VBRAzureApplianceSession]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureApplianceSession

System.Guid

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAzureApplianceSession [-Id <Guid>] [<CommonParameters>]
```
```PowerShell
Get-VBRAzureApplianceSession [-Session <VBRAzureApplianceSession>] [<CommonParameters>]
```

Update-VBRServerComponent
-------------------------

### Synopsis
Upgrades all components on managed servers.

---

### Description

This cmdlet upgrades all components on managed servers that are added to the backup infrastructure.

---

### Related Links
* [Get-VBRPhysicalHost](Get-VBRPhysicalHost)

---

### Examples
> Example 1. Upgrading all Servers Added to Backup Infrastructure

```PowerShell
Update-VBRServerComponent
This command upgrades all managed servers that are added to the backup infrastructure.
```
> Example 2. Upgrading Servers that Require Update

$servers = Get-VBRPhysicalHost -UpdateRequired
Update-VBRServerComponent -Component $servers
This example shows how to upgrade only those managed servers whose components require update.
Perform the following steps:
1. Run the Get-VBRPhysicalHost cmdlet. Provide the UpdateRequired parameter. Save the result to the $servers variable.
2. Run the Update-VBRServerComponent cmdlet. Set the $servers variable as the Component parameter value.

---

### Parameters
#### **Component**
Specifies an array of managed servers. The cmlet will upgrade all components on these servers.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRPhysicalHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRPhysicalHost[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRSession

---

### Notes

---

### Syntax
```PowerShell
Update-VBRServerComponent [-Component <VBRPhysicalHost[]>] [-RunAsync] [<CommonParameters>]
```

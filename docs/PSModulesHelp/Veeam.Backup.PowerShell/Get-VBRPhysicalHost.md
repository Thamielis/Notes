Get-VBRPhysicalHost
-------------------

### Synopsis
Returns managed servers added to the backup infrastructure.

---

### Description

This cmdlet returns managed servers that are added to the backup infrastructure. The cmdlet will return the following types of managed servers:
- VMware vSphere servers
- Microsoft Hyper-V servers
- Microsoft SMB3 servers
- Microsoft Windows servers
- Azure proxy

---

### Examples
> Example 1. Getting all Managed Servers

```PowerShell
Get-VBRPhysicalHost
This command returns all managed servers added to the backup infrastructure.
```
> Example 2. Getting Managed Servers that Require Upgrade

```PowerShell
Get-VBRPhysicalHost -UpdateRequired
This command returns all managed servers that require an upgrade of the components.
```

---

### Parameters
#### **UpdateRequired**
Defines that the cmdlet will return only the managed servers, which require an upgrade of the components.
If you do not provide this parameter, the cmdlet will return all managed servers added to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRPhysicalHost

---

### Notes

---

### Syntax
```PowerShell
Get-VBRPhysicalHost [-UpdateRequired] [<CommonParameters>]
```

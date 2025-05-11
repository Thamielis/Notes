Get-VBRNetworkTrafficRule
-------------------------

### Synopsis
Returns network traffic rules.

---

### Description

This cmdlet returns an array of network traffic rules.

---

### Examples
> Getting Network Traffic Rule by Name

```PowerShell
Get-VBRNetworkTrafficRule -Name "New rule"
This command gets a network traffic rule by the network traffic rule name.
```

---

### Parameters
#### **Id**
Specifies an array of IDs. The cmdlet will return network traffic rules with the specified IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies an array of names. The cmdlet will return network traffic rules with the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNetworkTrafficRule[]

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNetworkTrafficRule [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRNetworkTrafficRule [-Name <String[]>] [<CommonParameters>]
```

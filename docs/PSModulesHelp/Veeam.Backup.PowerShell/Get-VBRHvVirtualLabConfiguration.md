Get-VBRHvVirtualLabConfiguration
--------------------------------

### Synopsis
Returns virtual labs and their settings.

---

### Description

This cmdlet returns the VBRHvVirtualLabConfiguration object that contains an array of virtual labs and all their settings. You can use this object to modify settings of virtual labs.
Run the Set-VBRHvVirtualLab cmdlet to modify settings of virtual labs.

---

### Examples
> Getting Virtual Lab by Name

```PowerShell
Get-VBRViVirtualLabConfiguration -Name "SQL Virtual Lab"
This command returns the SQL Virtual Lab virtual lab. The cmdlet output will contain settings of the virtual lab.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for a virtual lab. The cmdlet will return an array of virtual labs with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies an array of names for a virtual lab. The cmdlet will return an array of virtual labs with the specified names.

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
Get-VBRHvVirtualLabConfiguration [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRHvVirtualLabConfiguration [-Name <String[]>] [<CommonParameters>]
```

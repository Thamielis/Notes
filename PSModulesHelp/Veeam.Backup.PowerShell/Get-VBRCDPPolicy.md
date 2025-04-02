Get-VBRCDPPolicy
----------------

### Synopsis
Returns CDP policies including Cloud Director CDP policies, CDP policies, cloud CDP policies and so on.

---

### Description

This cmdlet returns CDP policies including Cloud Director CDP policies, CDP policies, cloud CDP policies and so on.

---

### Examples
> Example 1. Getting CDP Policy by Name

```PowerShell
Get-VBRCDPPolicy -Name "VM079"
This command returns the VM079 CDP policy.
```
> Example 2. Getting CDP Policy by ID

```PowerShell
Get-VBRCDPPolicy -Id "13744fce-e8ea-4b77-9092-26e3f09e6a6e"
This command returns the 13744fce-e8ea-4b77-9092-26e3f09e6a6e CDP policy.
```
> Example 3. Getting all CDP Policies

```PowerShell
Get-VBRCDPPolicy
This command returns all CDP policies that are created on the backup server.
```

---

### Parameters
#### **Id**
Specifies an array of IDs of policies.
The cmdlet will return a list of policies with the specified IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names of policies.
The cmdlet will return a list of policies with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCDPPolicy [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCDPPolicy [-Name <String[]>] [<CommonParameters>]
```

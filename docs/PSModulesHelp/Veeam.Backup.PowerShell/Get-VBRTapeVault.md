Get-VBRTapeVault
----------------

### Synopsis
Returns tape vaults.

---

### Description

This cmdlet returns existing tape vaults. You can get the list of all tape vaults or search for instances directly by name or ID.

---

### Examples
> Example 1 Getting All Tape Vaults

```PowerShell
Get-VBRTapeVault
This command looks for a list of all existing vaults.
```
> Example 2 Getting Tape Vault by Name

```PowerShell
Get-VBRTapeVault -Name "Sydney Remote Storage"
This command looks for a vault named 'Sydney Remote Storage'.
```

---

### Parameters
#### **Id**
Specifies the array of vault IDs. The cmdlet will return vaults with these IDs. Accepts Guid or string.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of vault names. The cmdlet will return vaults with these names.

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
Get-VBRTapeVault [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeVault [-Name <String[]>] [<CommonParameters>]
```

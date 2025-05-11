Get-SecureSetting
-----------------

### Synopsis
Gets encrypted settings stored in the registry

---

### Description

Gets secured user settings stored in the registry

---

### Related Links
* [https://www.youtube.com/watch?v=0haXavQU_nY](https://www.youtube.com/watch?v=0haXavQU_nY)

* [Add-SecureSetting](Add-SecureSetting)

* [Remove-SecureSetting](Remove-SecureSetting)

* [ConvertTo-SecureString](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Security/ConvertTo-SecureString)

* [ConvertFrom-SecureString](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Security/ConvertFrom-SecureString)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SecureSetting
```
> EXAMPLE 2

```PowerShell
Get-SecureSetting MySetting
```
> EXAMPLE 3

```PowerShell
Get-SecureSetting MySetting -Decrypt
```
> EXAMPLE 4

```PowerShell
Get-SecureSetting MySetting -ValueOnly
```

---

### Parameters
#### **Name**
The name of the secure setting

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Type**
The type of the secure setting

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Type]`|false   |2       |true (ByPropertyName)|

#### **Decrypted**
If set, will decrypt the setting value

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **ValueOnly**
If set, will decrypt the setting value and return the data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* SecureSetting

---

### Syntax
```PowerShell
Get-SecureSetting [[-Name] <String>] [[-Type] <Type>] [-Decrypted] [-ValueOnly] [<CommonParameters>]
```

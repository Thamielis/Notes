Remove-Blob
-----------

### Synopsis
Removes blobs of cloud data

---

### Description

Removes blobs of cloud data in Azure

---

### Related Links
* [Import-Blob](Import-Blob)

* [Export-Blob](Export-Blob)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-Blob -Container MyContainer -Name MyItem.txt
```
> EXAMPLE 2

```PowerShell
Remove-Blob -Container MyContainer
```

---

### Parameters
#### **Container**
The name of the container

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Name**
The name of the blob

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **StorageAccount**
The storage account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageKey**
The storage key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Remove-Blob [-Container] <String> [-StorageAccount <String>] [-StorageKey <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-Blob [-Container] <String> [-Name] <String> [-StorageAccount <String>] [-StorageKey <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

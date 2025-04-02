Remove-ADDBObject
-----------------

### Synopsis
Physically removes specified object from a ntds.dit file, making it semantically inconsistent. Highly experimental!

---

### Description

{{Fill in the Description}}

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Remove-ADDBObject.md)

---

### Examples
> Example 1

```PowerShell
PS C:\> {{ Add example code here }}
{{ Add example description here }}
```

---

### Parameters
#### **DatabasePath**
Specifies the path to a domain database, for instance, C:\Windows\NTDS\ntds.dit.

|Type      |Required|Position|PipelineInput|Aliases                                                |
|----------|--------|--------|-------------|-------------------------------------------------------|
|`[String]`|true    |named   |False        |Database<br/>DBPath<br/>DatabaseFilePath<br/>DBFilePath|

#### **DistinguishedName**
Specifies the identifier of an object on which to perform this operation.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |True (ByPropertyName)|dn     |

#### **Force**
Forces the cmdlet to remove the specified object from the target database.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LogPath**
Specifies the path to a directory where the transaction log files are located. For instance, C:\Windows\NTDS. The default log directory is the one that contains the database file itself.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|false   |named   |False        |Log<br/>TransactionLogPath|

#### **ObjectGuid**
Specifies the identifier of an object on which to perform this operation.

|Type    |Required|Position|PipelineInput        |Aliases|
|--------|--------|--------|---------------------|-------|
|`[Guid]`|true    |named   |True (ByPropertyName)|Guid   |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
System.String

System.Guid

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
Remove-ADDBObject -DatabasePath <String> -DistinguishedName <String> [-Force] [-LogPath <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-ADDBObject -DatabasePath <String> [-Force] [-LogPath <String>] -ObjectGuid <Guid> [-Confirm] [-WhatIf] [<CommonParameters>]
```

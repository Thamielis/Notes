Format-Dictionary
-----------------

### Synopsis
Sorts dictionary/hashtable keys including nested hashtables and returns ordered dictionary

---

### Description

Sorts dictionary/hashtable keys including nested hashtables and returns ordered dictionary

---

### Examples
> EXAMPLE 1

```PowerShell
$Hashtable = [ordered] @{
    ModuleVersion          = '2.0.X'
    #PreReleaseTag          = 'Preview5'
    CompatiblePSEditions   = @('Desktop', 'Core')
RunMe                  = @{
        Name = 'RunMe'
        Type = 'Script'
        Path = 'RunMe.ps1'
    }
    GUID                   = 'eb76426a-1992-40a5-82cd-6480f883ef4d'
    Author                 = 'Przemyslaw Klys'
    CompanyName            = 'Evotec'
    Copyright              = "(c) 2011 - $((Get-Date).Year) Przemyslaw Klys @ Evotec. All rights reserved."
    Description            = 'Simple project allowing preparing, managing, building and publishing modules to PowerShellGallery'
    PowerShellVersion      = '5.1'
    Tags                   = @('Windows', 'MacOS', 'Linux', 'Build', 'Module')
    IconUri                = 'https://evotec.xyz/wp-content/uploads/2019/02/PSPublishModule.png'
    ProjectUri             = 'https://github.com/EvotecIT/PSPublishModule'
    DotNetFrameworkVersion = '4.5.2'
}
$Hashtable = Format-Dictionary -Hashtable $Hashtable
$Hashtable
```
> EXAMPLE 2

```PowerShell
$Hashtable = Format-Dictionary -Hashtable $Hashtable -ByValue
$Hashtable
```
> EXAMPLE 3

```PowerShell
$Hashtable = Format-Dictionary -Hashtable $Hashtable -ByValue -Descending
$Hashtable
```

---

### Parameters
#### **Hashtable**
Hashtable to sort

|Type           |Required|Position|PipelineInput |Aliases                         |
|---------------|--------|--------|--------------|--------------------------------|
|`[IDictionary]`|true    |1       |true (ByValue)|Dictionary<br/>OrderedDictionary|

#### **Descending**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ByValue**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Format-Dictionary [-Hashtable] <IDictionary> [-Descending] [-ByValue] [<CommonParameters>]
```

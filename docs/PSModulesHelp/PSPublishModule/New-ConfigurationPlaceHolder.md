New-ConfigurationPlaceHolder
----------------------------

### Synopsis
Command helping define custom placeholders replacing content within a script or module during the build process.

---

### Description

Command helping define custom placeholders replacing content within a script or module during the build process.
It modifies only the content of the script or module (PSM1) and does not modify the sources.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ConfigurationPlaceHolder -Find '{CustomName}' -Replace 'SpecialCase'
```
> EXAMPLE 2

```PowerShell
New-ConfigurationPlaceHolder -CustomReplacement @(
    @{ Find = '{CustomName}'; Replace = 'SpecialCase' }
    @{ Find = '{CustomVersion}'; Replace = '1.0.0' }
)
```

---

### Parameters
#### **CustomReplacement**
Hashtable array with custom placeholders to replace. Each hashtable must contain two keys: Find and Replace.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[IDictionary[]]`|true    |named   |false        |

#### **Find**
The string to find in the script or module content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Replace**
The string to replace the Find string in the script or module content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-ConfigurationPlaceHolder -Find <String> -Replace <String> [<CommonParameters>]
```
```PowerShell
New-ConfigurationPlaceHolder -CustomReplacement <IDictionary[]> [<CommonParameters>]
```

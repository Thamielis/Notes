Add-ModuleProperty
------------------

### Synopsis
Return a markdown formatted value for the given property.

---

### Description

Return the value for the given property optionally formatted as a Header.

---

### Related Links
* [New-HelpDoc](New-HelpDoc)

* [Get-HelpModuleData](Get-HelpModuleData)

---

### Examples
> EXAMPLE 1

Get-HelpModuleData build-docs | New-HelpDoc | Add-ModuleProperty -Property Name -H1
Name                           Value
----                           -----
Text                           # build-docs…
PSTypeName                     HelpModuleReadme
HelpModuleData                 @{Name=build-docs; Commands=System.Object[]; Author=System.Object[]; Description=System.Object[]; …

---

### Parameters
#### **HelpDoc**
A HelpDoc object.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |2       |true (ByValue)|

#### **Property**
A top level property from the Help object. Valid values are `'Name'`, `'Author'`, `'Description'`, `'HelpInfoUri'`, `'LicenseUri'`, `'ProjectUri'`, and `'Version'`.
Valid Values:

* Name
* Author
* Description
* HelpInfoUri
* LicenseUri
* ProjectUri
* Version

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **H1**
Format the property value as an H1 header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **H2**
Format the property value as an H2 header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **H3**
Format the property value as an H3 header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
If no Header switch is provided, the default is no formatting.

---

### Syntax
```PowerShell
Add-ModuleProperty [-HelpDoc] <PSObject> [-Property] <String> [<CommonParameters>]
```
```PowerShell
Add-ModuleProperty [-HelpDoc] <PSObject> [-Property] <String> [-H3] [<CommonParameters>]
```
```PowerShell
Add-ModuleProperty [-HelpDoc] <PSObject> [-Property] <String> [-H2] [<CommonParameters>]
```
```PowerShell
Add-ModuleProperty [-HelpDoc] <PSObject> [-Property] <String> [-H1] [<CommonParameters>]
```

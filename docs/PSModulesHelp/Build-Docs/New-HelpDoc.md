New-HelpDoc
-----------

### Synopsis
Returns an empty HelpModuleReadme object.

---

### Description

Returns an empty HelpModuleReadme object that is the object representation of your documentation.

---

### Related Links
* [Get-HelpModuleData](Get-HelpModuleData)

* [Out-HelpDoc](Out-HelpDoc)

---

### Examples
> EXAMPLE 1

Get-HelpModuleData build-docs | New-HelpDoc
Name                           Value
----                           -----
Text
PSTypeName                     HelpModuleReadme
HelpModuleData                 @{Name=build-docs; Commands=System.Object[]; Author=System.Object[]; Description=System.Object[];

---

### Parameters
#### **HelpModuleData**
A HelpModuleData object.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |1       |true (ByValue)|

---

### Outputs
* HelpModuleReadme

---

### Syntax
```PowerShell
New-HelpDoc [-HelpModuleData] <PSObject> [<CommonParameters>]
```

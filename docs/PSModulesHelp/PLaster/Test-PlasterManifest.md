Test-PlasterManifest
--------------------

### Synopsis
Verifies that a plaster manifest file is a valid.

---

### Description

Verifies that a plaster manifest file is a valid. If there are any errors, the details of the errors can be viewed by using the Verbose parameter.

---

### Related Links
* [Online Version:](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/Test-PlasterManifest.md)

* [Invoke-Plaster](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/Invoke-Plaster.md)

* [New-PlasterManifest](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/New-PlasterManifest.md)

---

### Examples
> EXAMPLE 1

```PowerShell
Test-PlasterManifest MyTemplate\plasterManifest.xml
Verifies that the plasterManifest.xml file in the MyTemplate sub-directory is valid.
```
> EXAMPLE 2

```PowerShell
Test-PlasterManifest plasterManifest.xml -Verbose
Verifies that the plasterManifest.xml file in the current directory is valid. If there are any validation errors, using -Verbose will display the details of those errors.
```

---

### Parameters
#### **Path**
Specifies a path to a plasterManifest.xml file.

|Type        |Required|Position|PipelineInput                 |Aliases|
|------------|--------|--------|------------------------------|-------|
|`[String[]]`|false   |0       |True (ByPropertyName, ByValue)|PSPath |

---

### Inputs
System.String

You can pipe the path to a plaster manifest to Test-PlasterManifest.

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

---

### Notes

---

### Syntax
```PowerShell
Test-PlasterManifest [[-Path] <String[]>] [<CommonParameters>]
```

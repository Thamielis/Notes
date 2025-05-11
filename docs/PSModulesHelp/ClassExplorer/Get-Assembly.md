Get-Assembly
------------

### Synopsis
Get assemblies loaded in the AppDomain.

---

### Description

The Get-Assembly cmdlet gets assemblies loaded in the AppDomain.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/ClassExplorer/blob/master/docs/en-US/Get-Assembly.md)

* [Find-Type](Find-Type)

* [Find-Member](Find-Member)

* [Get-Parameter](Get-Parameter)

* [Format-MemberSignature](Format-MemberSignature)

---

### Examples
> EXAMPLE 1

```PowerShell
$results = Get-Assembly
$results.Count

# 52
Get all assemblies loaded into the current AppDomain
```
> EXAMPLE 2

```PowerShell
Get-Assembly *Automation*

#    Directory: C:\Program Files\PowerShell\7-preview

# Version    Name                           PublicKeyToken    Target Culture
# -------    ----                           --------------    ------ -------
# 7.3.0.3    System.Management.Automation   31bf3856ad364e35  MSIL   neutral
Get assemblies that match a wildcard.
```

---

### Parameters
#### **Name**
Specifies the AssemblyName to match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |False        |

---

### Inputs
None

This cmdlet does not accept input from the pipeline.

---

### Outputs
* [Reflection.Assembly](https://learn.microsoft.com/en-us/dotnet/api/System.Reflection.Assembly)

---

### Notes

---

### Syntax
```PowerShell
Get-Assembly [[-Name] <String>] [<CommonParameters>]
```

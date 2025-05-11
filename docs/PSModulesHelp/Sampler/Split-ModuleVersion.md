Split-ModuleVersion
-------------------

### Synopsis
Parse a SemVer2 Version string.

---

### Description

This function parses a SemVer (semver.org) version string into an object
with the following properties:
- Version: The version without tag or metadata, as used by folder versioning in PowerShell modules.
- PreReleaseString: A Publish-Module compliant prerelease tag (see below).
- ModuleVersion: The Version and Prerelease tag compliant with Publish-Module.

For instance, this is a valid SemVer: `1.15.0-pr0224-0022+Sha.47ae45eb2cfed02b249f239a7c55e5c71b26ab76.Date.2020-01-07`
The Metadata is stripped: `1.15.0-pr0224-0022`
The Version is `1.15.0`.
The prerelease tag is `-pr0224-0022`
However, Publish-Module (or NuGet/PSGallery) does not support such pre-release,
so this function only keep the first part `-pr0224`

---

### Examples
> EXAMPLE 1

```PowerShell
Split-ModuleVersion -ModuleVersion '1.15.0-pr0224-0022+Sha.47ae45eb2cfed02b249f239a7c55e5c71b26ab76.Date.2020-01-07'
# Version PreReleaseString ModuleVersion
# ------- ---------------- -------------
# 1.15.0  pr0224           1.15.0-pr0224
```

---

### Parameters
#### **ModuleVersion**
Full SemVer version string with (optional) metadata and prerelease tag to be parsed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Outputs
* [Management.Automation.PSCustomObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSCustomObject)

---

### Syntax
```PowerShell
Split-ModuleVersion [[-ModuleVersion] <String>] [<CommonParameters>]
```

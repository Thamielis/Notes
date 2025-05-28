Get-PythonPackagePreReleaseLabelFromSemVer
------------------------------------------

### Synopsis
Gets the Python package pre-release label from a semantic versioning (SemVer) string.

---

### Description

This function takes a SemVer pre-release label and returns the corresponding PEP440-compliant Python package pre-release label.
It handles the following cases:
- Stable versions (no pre-release label)
- Release candidates ('rc')
- Alpha and Beta versions ('a', 'b')
- Other versions ('a')

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PythonPackagePreReleaseLabelFromSemVer -PreReleaseLabel "rc"
rc
This command returns 'rc' as the Python package pre-release label for a release candidate version.
```
> EXAMPLE 2

```PowerShell
Get-PythonPackagePreReleaseLabelFromSemVer -PreReleaseLabel "beta"
beta
This command returns 'b' as the Python package pre-release label for a beta version.
```

---

### Parameters
#### **PreReleaseLabel**
The pre-release label from a SemVer string. This parameter is mandatory but can be an empty string (i.e. signifying a non-prerelase version).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-PythonPackagePreReleaseLabelFromSemVer [-PreReleaseLabel] <String> [<CommonParameters>]
```

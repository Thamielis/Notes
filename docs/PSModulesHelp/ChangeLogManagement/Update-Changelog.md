Update-Changelog
----------------

### Synopsis
Takes all unreleased changes listed in changelog, adds them to a new version,
and makes a new, blank Unreleased section.

---

### Description

This cmdlet automates the updating of changelogs in Keep a Changelog 1.0.0 format at release time. It
takes all changes in the Unreleased section, adds them to a new section with a version number you specify,
then makes a new, blank Unreleased section.

---

### Related Links
* [https://github.com/natescherer/ChangelogManagement](https://github.com/natescherer/ChangelogManagement)

---

### Examples
> EXAMPLE 1

Update-Changelog -ReleaseVersion 1.1.1 -LinkMode Automatic -LinkPattern @{FirstRelease="https://github.com/testuser/testrepo/tree/v{CUR}";NormalRelease="https://github.com/testuser/testrepo/compare/v{PREV}..v{CUR}";Unreleased="https://github.com/testuser/testrepo/compare/v{CUR}..HEAD"}
Does not generate output, but:
1. Takes all Unreleased changes in .\CHANGELOG.md and adds them to a new release tagged with ReleaseVersion and today's date.
2. Updates links according to LinkPattern.
3. Creates a new, blank Unreleased section

---

### Parameters
#### **ReleaseVersion**
Version number for the new release

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Path**
The path to the source changelog file; defaults to .\CHANGELOG.md

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **OutputPath**
The path to the output changelog file; defaults to the source file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **LinkMode**
Mode used for adding links at the bottom of the Changelog for new versions. Can either be Automatic
(adding based on pattern provided via -LinkPattern), Manual (adding placeholders which
will need manually updated), None (not adding links), GitHub (adding based on GitHub Actions context),
or AzureDevOps (adding based on Azure Pipelines environment variables).
GITHUB ACTIONS NOTE: You must be running in a Github Actions workflow to use GitHub option. 
AZURE DEVOPS NOTE: You must be running in an Azure Pipelines workflow to use AzureDevOps option.  
Additionally, your default branch must be 'main', if it is not, you should use the Automatic option with
a custom pattern for your default branch.
Valid Values:

* Automatic
* Manual
* None
* GitHub
* AzureDevOps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **LinkPattern**
Pattern used for adding links at the bottom of the Changelog when -LinkMode is set to Automatic. This
is a hashtable that defines the format for the three possible types of links needed: FirstRelease, NormalRelease,
and Unreleased. The current version in the patterns should be replaced with {CUR} and the previous
version with {PREV}. See examples for details on format of hashtable.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |5       |false        |

---

### Inputs
This cmdlet does not accept pipeline input.

---

### Outputs
* This cmdlet does not generate output except in the event of an error or notice.

---

### Syntax
```PowerShell
Update-Changelog [-ReleaseVersion] <String> [[-Path] <String>] [[-OutputPath] <String>] [-LinkMode] <String> [[-LinkPattern] <Hashtable>] [<CommonParameters>]
```

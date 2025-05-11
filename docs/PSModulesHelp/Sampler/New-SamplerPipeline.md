New-SamplerPipeline
-------------------

### Synopsis
Create a Sampler scaffolding so you can add samples & build pipeline.

---

### Description

New-SamplerPipeline helps you bootstrap your project pipeline, whether it's for a Chocolatey
package, Azure Policy Guest Configuration packages or just a pipeline for a CI process.

---

### Examples
> EXAMPLE 1

```PowerShell
New-SamplerPipeline -DestinationPath . -Pipeline Build -ProjectName MyBuild -License 'true' -LicenseType MIT -SourceDirectory Source  -MainGitBranch main -ModuleDescription 'some desc' -CustomRepo PSGallery -Features All
```

---

### Parameters
#### **DestinationPath**
Destination of your project's root folder, defaults to the current directory ".".
We assume that your current location is the module folder, and within this folder we
will find the source folder, the tests folder and other supporting files such as build.ps1, the entry point.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |Path   |

#### **Pipeline**
Type of Pipeline you would like to create at the destination folder. You can create a base pipeline using th
value `Build` that will include the bootstrap and resolve dependency process, but you will need to edit
the `Build.Yaml` to call the tasks you desire.
You can also create a Chocolatey pipeline, preconfigured to build Chocolatey packages, or call a Sampler pipeline.
Valid Values:

* Build
* ChocolateyPipeline
* Sampler

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
Other parameters will be displayed based on the Template used for the pipeline.
See Add-Sample to add elements such as functions (private or public), tests, DSC Resources to your project.

---

### Syntax
```PowerShell
New-SamplerPipeline [-DestinationPath] <String> [-Pipeline] <String> [<CommonParameters>]
```

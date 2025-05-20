---
created: 2025-05-20T20:48:29 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/@cjkuech/private-powershell-modules-76f51a1bf893
author: 
---

# Private PowerShell Modules | by Christopher Kuech | in ITNEXT - Freedium

---
_Part 4 of_ _[Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)_

PowerShell modules (if designed correctly) are completely modular and portable — the ideal solution for packaging DevOps microframeworks. While you _could_ try to use a private PowerShell Gallery instance or [Azure Artifacts](https://github.com/PowerShell/PowerShellGet/issues/492) to host your module, by far the simplest and easiest way to develop and release your module for private consumption is to store them in `git` and copy the files at deployment time.

This guide will show you how to build a PowerShell module, reference it in your other projects, and deploy it privately.

![None](https://miro.medium.com/v2/resize:fit:700/0*pGWgRpalBr_v2ZtI)

Modular, self-contained, portable code is best code

### Create a PowerShell Module

#### Create a folder and cd into the folder

```
PS /projects&gt; mkdir MyModule
PS /projects&gt; cd MyModule
PS /projects/MyModule&gt;
```

#### Add the required files

We will add the following files:

-   `MyModule.psd1`, the Module Manifest.
-   `MyModule.psm1`, the script containing all our exported variables, functions, aliases, etc.
-   `MyModule.tests.ps1`, our [Pester](https://github.com/pester/Pester) unit tests.
-   `README.md`, our documentation for the module. This documentation is for our teammates _developing_ the module. People _using_ the module will refer instead to the [comment-based help](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help) embedded in our module.
-   `.gitignore`, to tell `git` not to track our `.vscode` folder, as VS Code may put workstation-specific settings in the folder without your knowledge.

```
PS /projects/MyModule&gt; New-ModuleManifest ./MyModule.psd1
PS /projects/MyModule&gt; "" &gt; ./MyModule.psm1
PS /projects/MyModule&gt; "" &gt; ./MyModule.tests.ps1
PS /projects/MyModule&gt; "" &gt; ./README.md
PS /projects/MyModule&gt; ".vscode" &gt; ./.gitignore
```

#### Add content to the files

Add the associated content to each file.

For the Module Manifest,

-   Set `RootModule` to `'MyModule.psm1'`
-   Set `FunctionsToExport`, `CmdletsToExport`, `VariablesToExport`, and `AliasesToExport` with the names of the items you are exporting from your module
-   Set `ScriptsToProcess` to a script containing `class` and `enum` definitions (if you have any)
-   Set `CompatiblePSEditions` to restrict supported [editions](https://docs.microsoft.com/en-us/windows-server/get-started/powershell-on-nano-server) if your module has PowerShell version constraints
-   Set `RequiredModules` if your module has required dependencies.
-   See the [official guide](http://xn--%20https-mr3d//docs.microsoft.com/en-us/powershell/developer/module/how-to-write-a-powershell-module-manifest) for more information on configuring your Module Manifest.

### Referencing the module

#### Reference by Name

You will always want to reference the module by its name and not its path to avoid unnecessarily coupling the module to its path on disk.

#### Telling `Import-Module` how to find your Module

PowerShell uses the `PSModulePath` environment variable to determine what folders to look for the module in, so we will have to modify this environment variable. If you use Windows, `PSModulePath` contains a `;`\-delimited list of paths; if you use \*NIX, `PSModulePath` contains a `:`\-delimited list of paths. In this guide, we'll use \*NIX delimiters.

To add a path `$Path` to our `PSModulePath`, we can append `":$Path"` to the `PSModulePath` string; whenever you start developing a project that requires the module at `$Path`, run `$env:PSModulePath += ":$Path"` in your PowerShell session. You can ensure VS Code uses the correct path by [starting VS Code from the command line](https://code.visualstudio.com/docs/editor/command-line) in the same session after modifying the environment variable. Note that we could have modified our environment variables globally, but it's bad practice to make global workstation changes for developing isolated projects.

### Deploying the Module

#### In General

Deploying the module is as easy as copying the folder into one of the target machine's module folders.

#### Docker

You can just as easily implement this in a Dockerfile.

#### Installing Dependencies

If you specify your dependencies in`RequiredModules` within your Module Manifests, you can use this snippet to install all your dependencies.

### Next Steps

#### Learn more about scaling your PowerShell

This article is part of [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) series of articles on managing PowerShell codebases at scale. Read the [rest of the series](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) to learn more about designing and writing less code for large DevOps codebases.

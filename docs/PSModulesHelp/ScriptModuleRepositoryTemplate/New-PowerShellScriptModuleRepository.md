New-PowerShellScriptModuleRepository
------------------------------------

### Synopsis
Creates a new PowerShell script module repository directory with boilerplate files and CI/CD workflows already defined.

---

### Description

This function creates a new PowerShell script module repository with boilerplate files and CI/CD workflows already defined. This allows you to create new PowerShell script modules quickly and easily.

Once the directory is created, you can run `git init` in it to initialize it as a git repository, and then push it to your own git server.

You will then need to follow the instructions in the ReadMe.md file to finish setting up the repository.

---

### Related Links
* [https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate](https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate)

---

### Examples
> EXAMPLE 1

```PowerShell
New-PowerShellScriptModuleRepository -RepositoryDirectoryPath 'C:\MyNewModule' -ModuleName 'MyNewModule' -OrganizationName 'My Name'
Creates a new module repository at 'C:\MyNewModule' with the module name 'MyNewModule' and the organization name 'My Name'.
```

---

### Parameters
#### **RepositoryDirectoryPath**
The path to the new directory that should be created for the module repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ModuleName**
The name of the module to create.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **OrganizationName**
The name of the individual or organization that owns the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Inputs
None. You cannot pipe objects to New-PowerShellScriptModuleRepository.

---

### Outputs
* None. New-PowerShellScriptModuleRepository does not return any output.
It creates a new directory with the module repository files.

---

### Syntax
```PowerShell
New-PowerShellScriptModuleRepository [-RepositoryDirectoryPath] <String> [-ModuleName] <String> [-OrganizationName] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

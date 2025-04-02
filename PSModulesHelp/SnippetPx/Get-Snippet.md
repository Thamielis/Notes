Get-Snippet
-----------

### Synopsis
Gets the snippets that are available on the local computer.

---

### Description

The Get-Snippet cmdlet gets the snippets that are available on the local computer.

By default, Get-Snippet returns all snippets that are available on the local computer. To return a filtered list of snippets, you can use the Name parameter to specify the name of the snippets you want to see.

---

### Related Links
* [Invoke-Snippet](Invoke-Snippet)

---

### Examples
> Example 1

```PowerShell
PS C:\> Get-Snippet
This command gets all snippets that are available on the local system, and outputs them in the order in which they are discovered.
```
> Example 2

```PowerShell
PS C:\> Get-Snippet -Name Module.Initialize -ModuleName SnippetPx
This command gets the Module.Initialize snippet from the SnippetPx module.
```
> Example 3

```PowerShell
PS C:\> Get-Snippet -Name ProxyFunction*
This command gets all snippets on the local system whose name starts with "ProxyFunction".
```
> Example 4

```PowerShell
PS C:\> Get-Snippet -ModuleName SnippetPx
This command gets all snippets that are included in the SnippetPx module.
```

---

### Parameters
#### **Name**
The name of the snippet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |0       |false        |

#### **ModuleName**
The name of the module where the snippet is located.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **NoHelp**
Skips the lookup of Snippet help information when the snippet is retrieved. Use this parameter when you are retrieving a snippet that you need to invoke many times and you want to cache the object for faster performance during invocation of the snippet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend
* Break

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

---

### Inputs
None

---

### Outputs
* SnippetPx.Snippet

---

### Notes
When retrieving snippets, it is best to provide a module name in the ModuleName parameter whenever possible. This will result in the fastest possible performance. You can further improve performance by using the NoHelp switch parameter to skip the lookup of the snippet help information.

When you use wildcards in the Name or ModuleName parameters, when no ModuleName parameter is provided, or when no parameters are provided, the Get-Snippet command looks for matching snippets in the following folders in the order in which they are listed:

- the current user snippets folder (Documents\WindowsPowerShell\snippets);

- the all users snippets folder (Program Files\WindowsPowerShell\snippets);

- the snippets folder in the module that is currently loading (if a module is loading);

- the snippets folder in the module where the cmdlet was invoked (if it was invoked from a module);

- the snippets folder in the SnippetPx module (SnippetPx\snippets);

- the snippets folder in all other loaded modules;

- the snippets folder in all unloaded modules, in the order in which they are discovered according to the PSModulePath environment variable;

To guarantee uniqueness of snippets across modules, snippets specific to a module should use a snippet name prefixed with the module name. For example, a snippet to provision AD users in an ActiveDirectory module could use the filename ActiveDirectory.User.Provision.ps1.

Using spaces in snippet filenames is supported, but discouraged.

---

### Syntax
```PowerShell
Get-Snippet [[-Name] <String[]>] [[-ModuleName] <String>] [-NoHelp <SwitchParameter>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [<CommonParameters>]
```

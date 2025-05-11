Invoke-Snippet
--------------

### Synopsis
Invokes the specified snippet on the local computer.

---

### Description

The Invoke-Snippet cmdlet invokes the specified snippet on the local computer.

By default, Invoke-Snippet invokes the specified snippet in the current scope. Use the ChildScope parameter to invoke a snippet in a nested, child scope. To specify the parameters for the snippet, pass a hashtable into the Parameters parameter of the Invoke-Snippet cmdlet. This hashtable will be splatted into the snippet as it is invoked.

---

### Related Links
* [Get-Snippet](Get-Snippet)

---

### Examples
> Example 1

```PowerShell
PS C:\> Invoke-Snippet -Name Module.Initialize -ModuleName SnippetPx
This command invokes the Module.Initialize snippet from the SnippetPx module in the current scope. The Module.Initialize snippet will invoke several commands that are very useful and highly recommended when creating script modules.
```
> Example 2

```PowerShell
PS C:\> Invoke-Snippet -Name ScriptFile.Import -Parameter @{Path='C:\FilesToImport'}
This command invokes the ScriptFile.Import snippet in the current scope. The ScriptFile.Import snippet will import all files with the extension .ps1 that are found in the C:\FilesToImport folder into the current PowerShell session.
```
> Example 3

```PowerShell
PS C:\> $snippet - Get-Snippet -Name Module.Initialize -ModuleName SnippetPx -NoHelp
PS C:\> Invoke-Snippet -InputObject $snippet
This command caches the Module.Initialize snippet from the SnippetPx module, and then invokes it from the cached object in the current scope. The Module.Initialize snippet will invoke several commands that are very useful and highly recommended when creating script modules.
```

---

### Parameters
#### **Name**
The name of the snippet to invoke.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |0       |true (ByValue, ByPropertyName)|

#### **Parameters**
A hashtable of parameters that will be splatted into the snippet as it is invoked.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |1       |true (ByPropertyName)|

#### **ChildScope**
Invokes the snippet in a nested, child scope. By default snippets are invoked in the current scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InputObject**
The snippet you want to invoke.

|Type       |Required|Position|PipelineInput |Aliases|
|-----------|--------|--------|--------------|-------|
|`[Snippet]`|true    |0       |true (ByValue)|Snippet|

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

#### **ModuleName**
The name of the module where the snippet is located.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

---

### Inputs
System.String,SnippetPx.Snippet

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
When invoking snippets, it is best to provide a module name in the ModuleName parameter whenever possible. This will result in the fastest possible performance.

When no ModuleName parameter is provided, the Invoke-Snippet command looks for a matching snippet in the following folders in the order in which they are listed:

- the current user snippets folder (Documents\WindowsPowerShell\snippets);

- the all users snippets folder (Program Files\WindowsPowerShell\snippets);

- the snippets folder in the module that is currently loading (if a module is loading);

- the snippets folder in the module where the cmdlet was invoked (if it was invoked from a module);

- the snippets folder in the SnippetPx module (SnippetPx\snippets);

- the snippets folder in all other loaded modules;

- the snippets folder in all unloaded modules, in the order in which they are discovered according to the PSModulePath environment variable;

When invoking a snippet without the ModuleName parameter, if multiple snippets with the same name exist in more than one loaded module, or if multiple snippets with the same name exist in more than one unloaded module that is in the same PSModulePath parent folder, the snippet name will be considered as ambiguous and an exception will be thrown. To guarantee you invoke the right snippet, include the ModuleName parameter in your Invoke-Snippet command.

Using spaces in snippet filenames is supported, but discouraged.

Not all snippets are appropriate for all situations. When in doubt, consult the documentation for the snippet to ensure it is appropriate for your use case.

---

### Syntax
```PowerShell
Invoke-Snippet [-InputObject] <Snippet> [[-Parameters] <Hashtable>] [-ChildScope <SwitchParameter>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [<CommonParameters>]
```
```PowerShell
Invoke-Snippet [-Name] <String> [[-Parameters] <Hashtable>] [-ModuleName <String>] [-ChildScope <SwitchParameter>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [<CommonParameters>]
```

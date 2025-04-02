Publish-ModuleDocumentationTree
-------------------------------

### Synopsis
Generates HTML documentation for PowerShell modules using the DocTreeGenerator engine.

---

### Description

This is a wrapper around Convert-HelpToHtmlTree that provides more flexibility.
Convert-HelpToHtmlTree requires all the modules you are documenting to be siblings
in a file tree, but Publish-ModuleDocumentationTree lets you specify modules
from different areas of your source tree.
The modules are copied (according to their manifests) to a temporary directory
in the appropriate structure, then Convert-HelpToHtmlTree is invoked.
Specify the modules and other parameters in a configuration file,
which you pass to this cmdlet.

A sample configuration file (module-doc.conf.SAMPLE) comes with this module.

---

### Related Links
* [Convert-HelpToHtmlTree](Convert-HelpToHtmlTree)

* [about_Comment_Based_Help](about_Comment_Based_Help)

* [[About Help Topics] (http://technet.microsoft.com/en-us/library/dd347616.aspx)]([About Help Topics] (http://technet.microsoft.com/en-us/library/dd347616.aspx))

* [[Cmdlet Help Topics] (http://technet.microsoft.com/en-us/library/dd347701.aspx)]([Cmdlet Help Topics] (http://technet.microsoft.com/en-us/library/dd347701.aspx))

* [[How To Document Your PowerShell Library with Convert-HelpToHtmlTree](https://www.simple-talk.com/sysadmin/powershell/how-to-document-your-powershell-library/)]([How To Document Your PowerShell Library with Convert-HelpToHtmlTree](https://www.simple-talk.com/sysadmin/powershell/how-to-document-your-powershell-library/))

* [[Documenting Your PowerShell Binary Cmdlets](https://www.simple-talk.com/dotnet/software-tools/documenting-your-powershell-binary-cmdlets/)]([Documenting Your PowerShell Binary Cmdlets](https://www.simple-talk.com/dotnet/software-tools/documenting-your-powershell-binary-cmdlets/))

* [[Unified Approach to Generating Documentation for PowerShell Cmdlets](https://www.simple-talk.com/sysadmin/powershell/unified-approach-to-generating-documentation-for-powershell-cmdlets/)]([Unified Approach to Generating Documentation for PowerShell Cmdlets](https://www.simple-talk.com/sysadmin/powershell/unified-approach-to-generating-documentation-for-powershell-cmdlets/))

---

### Parameters
#### **ConfigFilePath**
Full path of configuration file; if not supplied, uses module-doc.conf
in the current directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None. You cannot pipe objects to Publish-ModuleDocumentationTree.

---

### Outputs
* None. Publish-ModuleDocumentationTree does not generate any output.

---

### Syntax
```PowerShell
Publish-ModuleDocumentationTree [[-ConfigFilePath] <String>] [<CommonParameters>]
```

Convert-HelpToHtmlTree
----------------------

### Synopsis
Generates API documentation in HTML format for one or more PowerShell namespaces.

---

### Description

Convert-HelpToHtmlTree generates a complete API in HTML format (similar to Sandcastle for .NET or javadoc for Java) for your PowerShell libraries. As with an API documentation generator for any language, the output you get is only as good as the input you provide. But Convert-HelpToHtmlTree needs little additional information than good coding practice already dictates. If you have designed your modules to display proper help when you invoke the standard Get-Help cmdlet you have already done most everything you need to use Convert-HelpToHtmlTree. If you run Convert-HelpToHtmlTree with totally undecorated source files it will generate the full API tree, but instead of detailed descriptions of each function in your library you will get only a concise syntax diagram--just as Get-Help would do. With Convert-HelpToHtmlTree, you will also get a slew of warning messages telling you what key pieces of documentation you are missing.

Convert-HelpToHtmlTree supports PowerShell scripted modules (those written in PowerShell) as well as PowerShell binary modules (those written in C#).

To get started with decorating your scripted modules properly for Get-Help and Convert-HelpToHtmlTree, start with the PowerShell help topic "about_Comment_Based_Help".  Scroll down to the "Syntax for Comment-Based Help in Functions" section.  Note that the page also talks about adding help for the script itself; that applies only to main scripts (ps1 files) not to modules (psm1 files). Convert-HelpToHtmlTree works only with modules, not with scripts. Best practices dictate that for any substantive code, you will want to use modules in any case. And be sure to use Export-ModuleMember to explicitly specify which functions are public functions within your module; omitting it makes *all* your functions public by default.

To get started with decorating your binary modules, you need to do an additional step of preparing a help file for PowerShell to consume. If you use the open-source XmlDoc2CmdletDoc utility, the process is very easy: you decorate your C# code like your PowerShell code, then run one command and you're done. (There are a variety of other tools out there that are much more manual in terms of hand-crafting a MAML file.) See my reference and tutorial on XmlDoc2CmdletDoc at https://www.simple-talk.com/dotnet/software-tools/documenting-your-powershell-binary-cmdlets/.

You specify (via the Namespaces parameter) which PowerShell modules to document. The modules must be installed as user modules (i.e. in C:\Users\username\Documents\WindowsPowerShell\Modules) rather than system modules (i.e. C:\Windows\System32\WindowsPowerShell\v1.0\Modules).  See "Storing Modules on Disk" at http://msdn.microsoft.com/en-us/library/dd878324%28v=vs.85%29.aspx as well as "Installing Modules" in my Simple-Talk.com article at http://www.simple-talk.com/dotnet/.net-tools/further-down-the-rabbit-hole-powershell-modules-and-encapsulation/#seventh.

See my article "How To Document Your PowerShell Library" at https://www.simple-talk.com/sysadmin/powershell/how-to-document-your-powershell-library/ for a walk-through of using Convert-HelpToHtmlTree.

For simplicity, the discussion below focuses on cmdlets written in PowerShell, but the concepts map directly to doc-comments in your C# code as well.

==== File Organization ====

Convert-HelpToHtmlTree needs some additional doc-comments to generate a cohesive API for you.
  (1) Each module (x.psm1 or x.dll) must have an associated manifest (x.psd1) in the same directory and the manifest must include a Description property.
  (2) Each module must have an associated overview (module_overview.html) in the same directory. This is a standard HTML file, i.e., it must have an <html> element containing a <body> element containing some container element. The contents of the <body> element are extracted verbatim as the introductory text of the index.html page for each module.
  (3) Each namespace must also include an associated overview (namespace_overview.html).  This is a standard HTML file, i.e., it must have an <html> element containing a <body> element containing some container element.  The contents of the <body> element are extracted verbatim as the introductory text of each namespace in the master index.html page.

Note that I use the term "namespace" here informally because (as of v3) PowerShell does not yet have the notion of namespaces.  Convert-HelpToHtmlTree, however, requires you to structure your modules grouped in namespaces as shown in the sample input tree below.  Thus, if you have a module MyStuff.psm1, normal PowerShell conventions require you to store this in a path like this:

	...\WindowsPowerShell\Modules\MyStuff\MyStuff.psm1

...but Convert-HelpToHtmlTree requires you to include one more level for namespace, so the module must be stored in a path like this:

	...\WindowsPowerShell\Modules\MyNamespace\MyStuff\MyStuff.psm1

This allows you to organize your modules into more than one logical group if desired. In my own PowerShell library, for example, I have FileTools, SqlTools, and SvnTools modules (among others) all under the CleanCode namespace. But you may, however, include multiple namespaces.

Here's a sample input tree illustrating this:
	==========================================
	WindowsPowerShell\Modules
	+---namespace1
		+---namespace_overview.html
		+---moduleA
			+---module_overview.html
			+---moduleA.psm1
			+---moduleA.psd1
		+---moduleB
			+---module_overview.html
			+---moduleB.psm1
			+---moduleB.psd1
		etc...
	+---namespace2
		+---namespace_overview.html
		+---moduleX
			+---module_overview.html
			+---moduleX.psm1
			+---moduleX.psd1
		+---moduleY
			+---module_overview.html
			+---moduleY.psm1
			+---moduleY.psd1
		etc...
	==========================================

The output structure mirrors the input structure; the above input might generate the output tree shown below. There is a single master index page documenting all namespaces.
	==========================================
	$TargetDir
	+---contents.html
	+---index.html
	+---namespace1
		+---moduleA
			+---index.html
			+---Function1.html
			+---Function2.html
			+---Function3.html
			+---Function4.html
			etc...
		+---moduleB
			+---index.html
			+---Function1.html
			+---Function2.html
			etc...
	+---namespace2
		+---moduleX
			+---index.html
			+---Function1.html
			etc...
		+---moduleY
			+---index.html
			+---Function1.html
			+---Function2.html
			etc...
	etc...
	==========================================

Convert-HelpToHtmlTree reports its progress as it runs, indicating each module and each function it is documenting. Any detected problems are comingled in this output report. Here is a portion of a run on my CleanCode library (with selected parts removed to force problems to be reported): 
	==========================================
	Module: Assertion
		Command: Assert-Expression
		Command: Get-AssertCounts
		Command: Set-AbortOnError
		Command: Set-MaxExpressionDisplayLength
	Module: DocTreeGenerator
		Command: Convert-HelpToHtmlTree
	** Missing summary (from module_overview.html)
	** Missing description (from manifest)
	Module: EnhancedChildItem
		Command: Get-EnhancedChildItem
	** Missing summary (from module_overview.html)
	Module: Miscellaneous
	** No objects found
	Module: FileTools
		Command: Get-IniFile
	etc...
	==========================================

At the end of the run it also reports the number of namespaces, modules, functions, and total files processed.

==== Documentation Template ====

Take a look at the default template (see TemplateName parameter) and you will find it sprinkled with place holders that are automatically filled in at runtime (surrounded by braces): title, subtitle, breadcrumbs, preamble, body, postscript, copyright, and revdate.  Also, there are module-specific place holders of the form {module.propertyname} where "propertyname" may be any of the standard properties of a module -- use this to see the list of properties:
	Get-Module | Get-Member

You will also see conditional section definitions of the form 
	{ifdef pagetype}
	. . .
	{endif pagetype}
...where "pagetype" may be any of the four types of pages created: 
+ the single master page (pagetype="master"),
+ the single contents page ("contents"),
+ the module index pages, one per module ("module"), and
+ the function pages, one per exported function ("function").

The content of these conditional sections (which may be any HTML) is included only on the pages of the corresponding type, while the other conditional sections are suppressed.  Note that the module-specific place holders discussed earlier (e.g. {module.xyz}) may be used in module pages or function pages only.

==== Output Enhancements: Live links ====

Unlike the MSDN pages for the standard PowerShell library, output generated by Convert-HelpToHtmlTree  makes live links in your references (.LINK) documentation section.  There are seven classes of input you can specify, shown below.  In order, they are MSDN-defined (built-in) cmdlet, MSDN-defined (built-in) topic, custom function in the same module, custom function in a different local module, plain text, explicit link with a label, and explicit link without a label.

	Get-ChildItem
	about_Aliases
	New-CustomFunctionInSameModule
	New-CustomFunctionInOtherModule
	some plain text here
	[other important stuff] (http://foobar.com)
	http://alpha/beta/

This output is generated from the above input:

	<ul>
	<li><a href='http://technet.microsoft.com/en-us/library/dd347686.aspx'>Get-ChildItem</a></li>
	<li><a href='http://technet.microsoft.com/en-us/library/dd347645.aspx'>about_Aliases</a></li>
	<li><a href='New-CustomFunctionInSameModule.html'>New-CustomFunctionInSameModule</a></li>
	<li><a href='../../namespace/module/New-CustomFunctionInOtherModule.html'>New-CustomFunctionInOtherModule</a></li>
	<li>some plain text here</li>
	<li><a href='http://foobar.com'>other important stuff</a></li>
	<li><a href='http://alpha/beta/'>http://alpha/beta/</a></li>
	</ul>

The MSDN references are retrieved automatically from two fixed MSDN reference pages (one for cmdlets and one for "about" topics).  If those fixed references ever change URLs, that will break the generator; update those URLs in the Get-CmdletDocLinks function to mend it.
Note that if you get just plain text with no hyperlink for any of the first four classes of input, chances are you have a typo, because the function or topic could not be found.

==== Output Enhancements: Formatting ====

Convert-HelpToHtmlTree also adds some simple CSS styling to the generated web pages, making the generated web pages much more user-friendly than the plain mono-spaced text output of Get-Help viewed in a PowerShell window. Viewing help from within Show-Command is only minimally better than Get-Help, adding some bold markup. Convert-HelpToHtmlTree, on the other hand:
+ Adds section headings to each of the main sections within help.
+ Outputs most text in proportional font, automatically flowing lines and wrapping at your browser width.
+ Outputs portions of text you designate in a fixed-width font; simply start a line with 4 spaces for this (useful typically for code samples).
+ Recognizes simple lists; any line beginning with an asterisk, plus, or minus will force a line break.
+ Recognizes simple headers; any line beginning or ending with a run of 4 of any of these characters (=_+*#~-) will be emboldened and force a line break.
+ Stylizes the syntax section with bold and italics for easier visual recognition.
+ Highlights initial code sample in each example.

On that last point, the code sample is by convention just the first line of text in your example block, ending with a carriage return. But what if your example cmdlet takes six arguments and you have a really long line?  You could break that up into smaller lines with PowerShell's line continuation character, the backtick.  Convention, though (as defined by how the .NET cmdlets do it), is to always put a single example command on one line, and let the window width determine where the line wraps.  DocTreeGenerator, however, provides the flexibility to handle multiple lines if you really want to break a line with backticks. Actually, it just coincidentally supports backticks; support for a multiple-line example was added to accommodate two other use cases: pipes in your example and multiple commands in your example. That is, one could argue that it is easier to digest this:
	Get-Something -a 1 -b 2 -c 3 |
	Get-Something Else |
	Get-MoreStuff

than this:
	Get-Something -a 1 -b 2 -c 3 | Get-Something Else | Get-MoreStuff

The trick to get the HTML to have those line breaks is simply to add one to three leading spaces to the lines after the first line (if you go to four spaces, then it becomes a pre-formatted block).

And similarly, you might prefer this:
	PS> Get-Something -a 1 -b 2 -c 3
	PS> Get-Something Else

instead of this:
	PS> Get-Something -a 1 -b 2 -c 3; Get-Something Else

If you use the canonical "PS>" prompt in your example, you do not need the leading spaces; it recognizes the prompt.

---

### Related Links
* [Publish-ModuleDocumentationTree](Publish-ModuleDocumentationTree)

* [about_Comment_Based_Help](about_Comment_Based_Help)

* [[About Help Topics] (http://technet.microsoft.com/en-us/library/dd347616.aspx)]([About Help Topics] (http://technet.microsoft.com/en-us/library/dd347616.aspx))

* [[Cmdlet Help Topics] (http://technet.microsoft.com/en-us/library/dd347701.aspx)]([Cmdlet Help Topics] (http://technet.microsoft.com/en-us/library/dd347701.aspx))

* [[How To Document Your PowerShell Library with Convert-HelpToHtmlTree](https://www.simple-talk.com/sysadmin/powershell/how-to-document-your-powershell-library/)]([How To Document Your PowerShell Library with Convert-HelpToHtmlTree](https://www.simple-talk.com/sysadmin/powershell/how-to-document-your-powershell-library/))

* [[Documenting Your PowerShell Binary Cmdlets](https://www.simple-talk.com/dotnet/software-tools/documenting-your-powershell-binary-cmdlets/)]([Documenting Your PowerShell Binary Cmdlets](https://www.simple-talk.com/dotnet/software-tools/documenting-your-powershell-binary-cmdlets/))

* [[Unified Approach to Generating Documentation for PowerShell Cmdlets](https://www.simple-talk.com/sysadmin/powershell/unified-approach-to-generating-documentation-for-powershell-cmdlets/)]([Unified Approach to Generating Documentation for PowerShell Cmdlets](https://www.simple-talk.com/sysadmin/powershell/unified-approach-to-generating-documentation-for-powershell-cmdlets/))

---

### Examples
> EXAMPLE 1

Convert-HelpToHtmlTree -Namespaces "MyPsEnhancements" -TargetDir "API"
Generates documentation for the modules under
...\My Documents\WindowsPowerShell\Modules\MyPsEnhancements to the relative path "API"
using the default template, omitting replacement values for DocTitle, Copyright, or RevisionDate.
> EXAMPLE 2

```PowerShell
Convert-HelpToHtmlTree -Namespaces "Html","Files" -TemplateName "C:\myfiles\psdoc_template.html" -TargetDir "c:\temp\psdoc_tmp" -DocTitle 'PowerShell Libraries v1.5.1 API' -Copyright '2011' -RevisionDate '2011.12.13'
This uses ...\My Documents\WindowsPowerShell\Modules\Html and
...\My Documents\WindowsPowerShell\Modules\Files as source namespaces and
generates output into c:\temp\psdoc_tmp.  The pages use the specified template
rather than the default template.  Values are given for the document title/home
page header, the copyright date and the revision date.
```
> EXAMPLE 3

```PowerShell
Convert-HelpToHtmlTree * API
Scans all namespace-aware directories under ...\WindowsPowerShell\Modules
and generates documentation for them in a local subdirectory called API.
```

---

### Parameters
#### **Namespaces**
One or more names of top-level directories under your user-level
module repository (...Documents\WindowsPowerShell\Modules) to document.
Wilcards are permitted.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **TargetDir**
Directory name to store the generated HTML documentation set.
If not supplied, the current directory is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **SourceDir**
Directory name where the specified namespaces are rooted.
Defaults to the user-specific PowerShell default module location if not specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **TemplateName**
Name of your custom template file to use to generate each HTML file.
If not supplied, the default template (psdoc_template.html) is used;
it is stored in the same directory as this module file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **DocTitle**
The value of DocTitle fills in the TITLE place holder on the overview page
and the SUBTITLE place holder on all subordinate pages.
The current namespace is affixed to the beginning, e.g.
with a namespace of "Abc" and a DocTitle of "Libraries v1.0", the 
value that is substituted in the template is "Abc Libraries v1.0".
If not supplied, the value would be the more generic "Abc Namespace".
Using the default template, DocTitle appears in the web page title 
and in the main heading for the home (overview) page.
It is also used on top of the heading of each subordinate page 
in a smaller font to provide context.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Copyright**
The value of Copyright fills in the COPYRIGHT place holder on each page.
Using the default template, Copyright appears at the bottom of each page.
If you do not intend to supply this value edit the default template
to remove the rest of the copyright phrase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **RevisionDate**
The value of RevisionDate fills in the REVDATE place holder on each page.
Using the default template, RevisionDate appears at the bottom of each page.
If you do not intend to supply this value edit the default template
to remove the rest of the revision date phrase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **EnableExit**
Causes Convert-HelpToHtmlTree to exit with an exit code equal to the number of errors detected.
Use this to "fail" a build when there are documentation errors.
Note that this switch causes the invoking shell to exit upon completion of the cmdlet as well!
Thus, typically you do *not* want to use this switch interactively.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
None. You cannot pipe objects to Convert-HelpToHtmlTree.

---

### Outputs
* None. Convert-HelpToHtmlTree does not generate any output.

---

### Syntax
```PowerShell
Convert-HelpToHtmlTree [-Namespaces] <String[]> [[-TargetDir] <String>] [[-SourceDir] <String>] [[-TemplateName] <String>] [[-DocTitle] <String>] [[-Copyright] <String>] [[-RevisionDate] <String>] [-EnableExit] [-WhatIf] [-Confirm] [<CommonParameters>]
```

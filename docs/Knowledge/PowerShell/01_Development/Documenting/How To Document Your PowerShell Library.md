PowerShell provides comment-based help for functions and scripts with Get-Help, but when you want to document modules or generate a complete indexed API in HTML format, just as you can with Sandcastle for .NET or javadoc for Java, then stronger magic is required. Michael Sorens shows you how it is done, with source code.

## Contents

-   [How to Document Your PowerShell Library][1]
    -   [Test Driving the Generator][2]
    -   [Controlling Output with the Page Template][3]
        -   [Global Properties][4]
        -   [Module Properties][5]
        -   [Conditional Properties][6]
    -   [Specifying Links][7]
    -   [Other Structural Considerations][8]
    -   [Other Stylistic Considerations][9]
    -   [Now Just Add Water][10]
    -   [Conclusion][11]

I am passionate about documentation. When you write library code-code for you or others to consume in other projects-it is almost useless without proper documentation. Most modern languages provide some level of support to assist in creating your documentation, where you instrument your code with documentation comments (_doc-comments_ for short) that may then be automatically extracted and formatted to generate some documentation. But documenting individual methods or classes or files is _not_ the same as documenting an API. Java has [javadoc][12] and C# has [Sandcastle][13], both of which generate a complete, cross-linked API documentation set. On the other hand, languages like Perl with [perldoc][14] and PowerShell with [Get-Help][15], generate only isolated module documentation, which I found rather unsatisfactory. So over the years I created an API-level documentation generator for Perl, later for T-SQL, and most recently for PowerShell. (Note that the Perl version [Pod2HtmlTree][16] is Perl-specific while the T-SQL one uses my generic XML conversion tool [XmlTransform][17] configured to handle SQL documentation, described in [Add Custom XML Documentation Capability To Your SQL Code][18].) The PowerShell generator (written in PowerShell, of course!) is a function in my [DocTreeGenerator][19] module called **Convert-HelpToHtmlTree**. (You can find my entire API bookshelf [here][20] and download libraries [here][21].)

This article discusses how to generate a complete API for a PowerShell library. Once you have instrumented your modules with doc-comments to satisfy **Get-Help**, you need surprisingly little extra work to supply to **Convert-HelpToHtmlTree**. But let’s start with the assumption, hardly realistic, I’m sure, that you do not have _any_ doc-comments in your code and see what you can already do.

## Test Driving the Generator

To help you visualize what **Convert****\-HelpToHtmlTree** does, consider this simple example. Assume you have just one module, MathStuff.psm1 containing two functions:

<table><tbody><tr><td data-settings="hide"></td><td><div><p><span>function</span><span> </span><span>Get-Max</span><span>(</span><span>$itemList</span><span>)</span></p><p><span>{</span></p><p><span>&nbsp;&nbsp; </span><span>(</span><span>$itemList</span><span> </span><span>|</span><span> </span><span>measure-object</span><span> </span><span>-Maximum</span><span>)</span><span>.</span><span>Maximum</span></p><p><span>}</span></p><p><span>function</span><span> </span><span>Get-Min</span><span>(</span><span>$itemList</span><span>)</span></p><p><span>{</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span>(</span><span>$itemList</span><span> </span><span>|</span><span> </span><span>measure-object</span><span> </span><span>-Minimum</span><span>)</span><span>.</span><span>Minimum</span></p><p><span>}</span></p><p><span>Export-ModuleMember</span><span> </span><span>Get-Max</span></p><p><span>Export-ModuleMember</span><span> </span><span>Get-Min</span></p></div></td></tr></tbody></table>

Notice that there is as yet no documentation-comments in the code to document these functions. Yet PowerShell’s standard help cmdlet, **Get-Help****,** can still give you some information:

<table><tbody><tr><td data-settings="hide"><div><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p><p>25</p><p>26</p><p>27</p><p>28</p><p>29</p></div></td><td><div><p><span>[</span>373<span>]</span><span>:</span><span> </span><span>Get-Help</span><span> </span><span>Get-Max</span><span> </span><span>-full</span></p><p><span>NAME</span></p><p><span>&nbsp;&nbsp;</span><span>Get-Max</span></p><p><span>SYNTAX</span></p><p><span>&nbsp;&nbsp;</span><span>Get-Max</span><span> </span><span>[</span><span>[</span><span>-itemList</span><span>]</span><span> </span><span>&lt;</span><span>Object</span><span>&gt;</span><span>]</span></p><p><span>PARAMETERS</span></p><p><span>&nbsp;&nbsp;</span><span>-itemList</span><span> </span><span>&lt;</span><span>Object</span><span>&gt;</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Required</span><span>?</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>false</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Position</span><span>?</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>0</p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Accept </span><span>pipeline </span><span>input</span><span>?</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>false</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Parameter </span><span>set</span><span> </span><span>name</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>(</span><span>All</span><span>)</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>None</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Dynamic</span><span>?</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>false</span></p><p><span>INPUTS</span></p><p><span>&nbsp;&nbsp;</span><span>None</span></p><p><span>OUTPUTS</span></p><p><span>&nbsp;&nbsp;</span><span>System</span><span>.</span><span>Object</span></p><p><span>ALIASES</span></p><p><span>&nbsp;&nbsp;</span><span>None</span></p><p><span>REMARKS</span></p><p><span>&nbsp;&nbsp;</span><span>None</span></p></div></td></tr></tbody></table>

Similarly, **Convert-HelpToHtmlTree** can give you all the same basic information about the individual method-but it also builds an entire web framework around the namespace and module that contains it. Here is a snapshot of the input directory tree. By PowerShell convention, store your user modules under WindowsPowerShell\\Modules in your user directory. Under that path follows the namespace for this example, DemoModules. There are two module directories, **MathStuff** and **StringUtilities**; the former defines the two functions shown earlier, while the latter is empty.

<table><tbody><tr><td data-settings="hide"></td><td><div><p><span>[</span>356<span>]</span><span>:</span><span> </span><span>ls</span><span> </span><span>.</span><span>\</span><span>DemoModules</span><span> </span><span>-Recurse</span><span> </span><span>|</span><span> </span><span>%</span><span> </span><span>{</span><span> </span><span>$_</span><span>.</span><span>FullName</span><span> </span><span>}</span></p><p><span>WindowsPowerShell</span><span>\</span><span>Modules</span><span>\</span><span>DemoModules</span><span>\</span><span>MathStuff</span></p><p><span>WindowsPowerShell</span><span>\</span><span>Modules</span><span>\</span><span>DemoModules</span><span>\</span><span>StringUtilities</span></p><p><span>WindowsPowerShell</span><span>\</span><span>Modules</span><span>\</span><span>DemoModules</span><span>\</span><span>MathStuff</span><span>\</span><span>MathStuff</span><span>.</span><span>psm1</span></p></div></td></tr></tbody></table>

Now execute **Convert-HelpToHtmlTree** with minimal arguments: the namespace to document and where to put it. **Convert-HelpToHtmlTree** needs more infrastructure to give you more useful output; it lets you know what you need to provide and where it goes:

<table><tbody><tr><td data-settings="hide"></td><td><div><p><span>Convert-HelpToHtmlTree</span><span> </span><span>-Namespaces</span><span> </span><span>DemoModules</span><span> </span><span>-TargetDir</span><span> </span><span>MyApi</span></p><p><span>Target </span><span>dir</span><span>:</span><span> </span><span>MyApi</span></p><p><span>Namespace</span><span>:</span><span> </span><span>DemoModules</span></p><p><span>&nbsp;&nbsp; </span><span>Module</span><span>:</span><span> </span><span>MathStuff</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Command</span><span>:</span><span> </span><span>Get-Max</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Command</span><span>:</span><span> </span><span>Get-Min</span></p><p><span>*</span><span>*</span><span> </span><span>Missing </span><span>summary</span><span> </span><span>(</span><span>from </span><span>DemoModules</span><span>\</span><span>MathStuff</span><span>\</span><span>module_overview</span><span>.</span><span>html</span><span>)</span></p><p><span>*</span><span>*</span><span> </span><span>Missing </span><span>description</span><span> </span><span>(</span><span>from </span><span>DemoModules</span><span>\</span><span>MathStuff</span><span>\</span><span>MathStuff</span><span>.</span><span>psd1</span><span>)</span></p><p><span>&nbsp;&nbsp; </span><span>Module</span><span>:</span><span> </span><span>StringUtilities</span></p><p><span>*</span><span>*</span><span> </span><span>No </span><span>objects </span><span>found</span></p><p><span>Generating </span><span>home </span><span>page</span><span>.</span><span>.</span><span>.</span></p><p><span>*</span><span>*</span><span> </span><span>Missing </span><span>summary</span><span> </span><span>(</span><span>from </span><span>DemoModules</span><span>\</span><span>namespace_overview</span><span>.</span><span>html</span><span>)</span></p><p><span>Generating </span><span>contents </span><span>page</span><span>.</span><span>.</span><span>.</span></p><p><span>Done</span><span>:</span><span> </span>1<span> </span><span>namespace</span><span>(</span><span>s</span><span>)</span><span>,</span><span> </span>2<span> </span><span>module</span><span>(</span><span>s</span><span>)</span><span>,</span><span> </span>2<span> </span><span>function</span><span>(</span><span>s</span><span>)</span><span>,</span><span> </span>5<span> </span><span>file</span><span>(</span><span>s</span><span>)</span><span> </span><span>processed</span><span>.</span></p></div></td></tr></tbody></table>

Here is the generated output tree:

<table><tbody><tr><td data-settings="hide"></td><td><div><p><span>[</span>353<span>]</span><span>:</span><span> </span><span>ls</span><span> </span><span>.</span><span>\</span><span>MyApi</span><span> </span><span>-Recurse</span><span> </span><span>|</span><span> </span><span>%</span><span> </span><span>{</span><span> </span><span>$_</span><span>.</span><span>FullName</span><span> </span><span>}</span></p><p><span>MyApi</span><span>\</span><span>DemoModules</span></p><p><span>MyApi</span><span>\</span><span>contents</span><span>.</span><span>html</span></p><p><span>MyApi</span><span>\</span><span>index</span><span>.</span><span>html</span></p><p><span>MyApi</span><span>\</span><span>DemoModules</span><span>\</span><span>MathStuff</span></p><p><span>MyApi</span><span>\</span><span>DemoModules</span><span>\</span><span>MathStuff</span><span>\</span><span>Get-Max</span><span>.</span><span>html</span></p><p><span>MyApi</span><span>\</span><span>DemoModules</span><span>\</span><span>MathStuff</span><span>\</span><span>Get-Min</span><span>.</span><span>html</span></p><p><span>MyApi</span><span>\</span><span>DemoModules</span><span>\</span><span>MathStuff</span><span>\</span><span>index</span><span>.</span><span>html</span></p></div></td></tr></tbody></table>

As is typical for a website, index.html is the entry point, displaying the **namespace contents**: a list of all contained modules with a brief description and a link to each module’s documentation (see Figure 1). In this case there is just one module, MathStuff, because StringUtilities mentioned above was empty.

![1826-initial_web_home-69ae35e6-0a1b-48df][fig1]

Figure 1 Sample namespaces page: itemizes the modules for each namespace you have specified to document. (This is your top-level, home, or entry page.)

If you traverse the link to MathStuff, you get the **module contents**: a list of all contained functions, and filters with a brief description and a link to each one’s documentation (see Figure 2). Notice in each of these figures, by the way, that you have the same warning messages inline as you did at the command prompt; here you get to see them in context. Figure 2 shows one of the few instances where **Convert-HelpToHtmlTree** fills in a slot where information is not available instead of giving a warning-in the table of methods it lists the syntax of a method in the absence of a textual description.

![1826-initial_web_group-ceca7164-611e-4a0][fig2]

Figure 2 Sample module page: itemizes the functions, filters, and aliases for the current module.

If you traverse the link to an individual function, you get the spruced-up output of **Get-Help** for that function(see Figure 3). This is exactly the same output that you get from **Get-Help**, but with these enhancements:

-   It adds section headings to each of the main sections.
-   It outputs most text in a proportional font.
-   It outputs portions of text you designate (via leading white space on a line) in a fixed-width font.
-   It preserves your line breaks, so if you want text to flow and wrap automatically at the window edge you must put it all in a single paragraph in your source file.
-   It highlights the initial code sample in each example. (Note that, just like **Get-Help**, ONLY the first line immediately following the .EXAMPLE directive is treated as the code sample, so resist the urge to put line breaks in your sample!)
-   Items designated as links are turned into active hyperlinks; these may be in any of seven different formats explained later.

![1826-initial_web_method-dd51125c-6d5e-47][fig3]

Figure 3 Sample function page: provides help text for the current function or filter. This is a stylized version of the output of Get-Help.

Finally, in the root folder of the output tree is contents.html, a table of contents, or index, if you will of everything (Figure 4).

![1826-initial_web_contents-46408bcf-0562-][fig4]

Figure 4 Sample master index/contents page: an index of all documented objects; this page is accessible via a hyperlink on the top-level namespaces page.

## Controlling Output with the Page Template

Figures 1 through 4 show the four page-types that **Convert-****HelpToHtmlTree** can generate. All four of these are derived from a single HTML template file. Take a look at the default template (psdoc\_template.html) and you will find it sprinkled with place-holders for different properties. In the previous figures you will see some remnants where some place-holders have _not_ been supplied, e.g. the empty copyright and revision dates at the bottom of each page.

Here is the content of the **<body>** element of the template (the **<head>** element has been omitted for brevity). I have distinguished the global properties, module properties, and conditional properties with different colors for clarity. The following sections describe each of these three property types in detail.

<table><tbody><tr><td data-settings="hide"><div><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p><p>25</p><p>26</p><p>27</p><p>28</p><p>29</p><p>30</p><p>31</p><p>32</p></div></td><td><div><p><span>&lt;body&gt;</span></p><p><span></span><span>&lt;p </span><span>class</span><span>=</span><span>"subtitle"</span><span>&gt;</span><span>{subtitle}{breadcrumbs}</span><span>&lt;/p&gt;</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;h1&gt;</span><span>{title}</span><span>&lt;/h1&gt;</span></p><p><span>&nbsp;&nbsp;{preamble}</span></p><p><span>&nbsp;&nbsp;{ifdef home}</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;div&gt;</span></p><p><span>&nbsp;&nbsp;This is the home page.</span></p><p><span>&nbsp;&nbsp;See also: </span><span>&lt;a </span><span>href</span><span>=</span><span>"contents.html"</span><span>&gt;</span><span>Alphabetical Index</span><span>&lt;/a&gt;</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;/div&gt;</span></p><p><span>&nbsp;&nbsp;{endif home}</span></p><p><span>&nbsp;&nbsp;{ifdef contents}</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;strong&gt;</span><span>An alphabetical index to all namespaces, modules, and functions.</span><span>&lt;/strong&gt;</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;a </span><span>href</span><span>=</span><span>"index.html"</span><span>&gt;</span><span>PowerShell API Home</span><span>&lt;/a&gt;</span></p><p><span>&nbsp;&nbsp;{endif contents}</span></p><p><span>&nbsp;&nbsp;{body}</span></p><p><span>&nbsp;&nbsp;{postscript}</span></p><p><span>&nbsp;&nbsp;{ifdef module}</span></p><p><span>&nbsp;&nbsp;This text appears only on the module index pages...</span></p><p><span>&nbsp;&nbsp;You may interpolate any standard module properties here, e.g.</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;ul&gt;</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;li&gt;</span><span>GUID = {module.guid}</span><span>&lt;/li&gt;</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;li&gt;</span><span>Version = {module.version}</span><span>&lt;/li&gt;</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;/ul&gt;</span></p><p><span>&nbsp;&nbsp;{endif module}</span></p><p><span>&nbsp;&nbsp;{ifdef function}</span></p><p><span>&nbsp;&nbsp;This text appears only on the function pages...</span></p><p><span>&nbsp;&nbsp;You may interpolate any standard properties of the parent module here, e.g.</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;br&gt;</span></p><p><span>&nbsp;&nbsp;Version is {module.version}</span></p><p><span>&nbsp;&nbsp;{endif function}</span></p><p><span>&nbsp;&nbsp;</span><span>&lt;p&gt;</span><span>Copyright &amp;copy; {copyright}, Revised {revdate}</span><span>&lt;/p&gt;</span></p><p><span>&lt;/body&gt;</span></p></div></td></tr></tbody></table>

### Global Properties

Global properties are distinguished by having a single word in brackets for the place holder.

<table><tbody><tr><td>Place Holder</td><td>Source</td><td>Applies to PageType</td></tr><tr><td><strong>{title}</strong></td><td>current namespace + <strong>DocTitle</strong> parameter</td><td>master, contents</td></tr><tr><td><strong>{subtitle}</strong></td><td>current namespace + <strong>DocTitle</strong> parameter</td><td>module, function</td></tr><tr><td><strong>{breadcrumbs}</strong></td><td>generated relative paths</td><td>module, function</td></tr><tr><td><strong>{preamble}</strong></td><td>manifest.Description property + module_overview.html &lt;body&gt; contents</td><td>module</td></tr><tr><td rowspan="4"><strong>{body}</strong></td><td>contents of Get-Help</td><td>function</td></tr><tr><td>LIST(function name + Get-Help.Synopsis property)</td><td>module</td></tr><tr><td>LIST(Namespace_overview.html &lt;body&gt; contents<br>&nbsp;&nbsp;&nbsp;+ <em>LIST</em>(module name + manifest.Description property))</td><td>master</td></tr><tr><td>generated index</td><td>contents</td></tr><tr><td><strong>{postscript}</strong></td><td>&nbsp;</td><td><em>-not currently used-</em></td></tr><tr><td><strong>{copyright}</strong></td><td><strong>Copyright</strong> parameter</td><td><em>-ALL-</em></td></tr><tr><td><strong>{revdate}</strong></td><td><strong>RevisionDate</strong> parameter</td><td><em>-ALL-</em></td></tr></tbody></table>

### Module Properties

Module-specific properties are distinguished by the form **{****module****_._**_property_**}** where **_property_** may be any of the standard properties of a module. You can see what these are with this command:

<table><tbody><tr><td data-settings="hide"></td><td><div><p><span>Get-Module</span><span> </span><span>|</span><span> </span><span>Get-Member</span><span> </span><span>-MemberType</span><span> </span><span>Properties</span></p></div></td></tr></tbody></table>

As an example, Figure 2 shows that the template uses the **module.guid** and **module.version** properties used.

### Conditional Properties

Finally, you will also see conditional properties in the template of the form:

<table><tbody><tr><td data-settings="hide"></td><td><div><p><span>{</span><span>ifdef </span><span>pagetype</span><span>}</span></p><p><span>.</span><span> </span><span>.</span><span> </span><span>.</span></p><p><span>{</span><span>endif </span><span>pagetype</span><span>}</span></p></div></td></tr></tbody></table>

…where **_pagetype_** may be any of the four types of pages created:

-   the single master page (pagetype=**master**),
-   the single master index/contents page (pagetype=**contents**),
-   the module index pages, one per module (pagetype=**module**), and
-   the function pages, one per exported function (pagetype=**function**).

The content of these conditional sections (which may be any valid HTML) is included only on the pages of the corresponding type, while the other conditional sections are suppressed. Note that the module-specific place-holders discussed earlier (e.g. {**module**._property_}) may be used in both module pages and function pages, but not in the master or contents page.

## Specifying Links

Unlike the MSDN pages for the standard PowerShell library, output generated here creates _live_ links in your references (.LINK) documentation section. There are seven input variations permitted:

<table><tbody><tr><td>Item</td><td><strong>MSDN-defined (built-in) cmdlet</strong></td></tr><tr><td>Sample Input</td><td>Get-ChildItem</td></tr><tr><td>Sample Output</td><td>&lt;a href=’http://technet.microsoft.com/en-us/library/dd347686.aspx’&gt;Get-ChildItem&lt;/a&gt;</td></tr></tbody></table>

<table><tbody><tr><td>Item</td><td><strong>MSDN-defined (built-in) topic</strong></td></tr><tr><td>Sample Input</td><td>about_Aliases</td></tr><tr><td>Sample Output</td><td>&lt;a href=’http://technet.microsoft.com/en-us/library/dd347645.aspx’&gt;about_Aliases&lt;/a&gt;</td></tr></tbody></table>

<table><tbody><tr><td>Item</td><td><strong>Custom function in the same module</strong></td></tr><tr><td>Sample Input</td><td>New-CustomFunction</td></tr><tr><td>Sample Output</td><td>&lt;a href=’New-CustomFunction.html’&gt;New-CustomFunction&lt;/a&gt;</td></tr></tbody></table>

<table><tbody><tr><td>Item</td><td><strong>Custom function in a different local module</strong></td></tr><tr><td>Sample Input</td><td>New-FunctionInOtherModule</td></tr><tr><td>Sample Output</td><td>&lt;a href=’../../DemoModules/MathStuff/New-FunctionInOtherModule.html’&gt;New-FunctionInOtherModule&lt;/a&gt;</td></tr></tbody></table>

<table><tbody><tr><td>Item</td><td><strong>Plain text </strong><em>(for cases where you have no web resource to link to)</em></td></tr><tr><td>Sample Input</td><td>Butterflies and Dinosaurs–the missing link?</td></tr><tr><td>Sample Output</td><td>Butterflies and Dinosaurs–the missing link?</td></tr></tbody></table>

<table><tbody><tr><td>Item</td><td><strong>Explicit link with a label</strong></td></tr><tr><td>Sample Input</td><td>[other important stuff] (http://foobar.com)</td></tr><tr><td>Sample Output</td><td>&lt;a href=’http://foobar.com’&gt;other important stuff&lt;/a&gt;</td></tr></tbody></table>

<table><tbody><tr><td>Item</td><td><strong>Explicit link without a label</strong></td></tr><tr><td>Sample Input</td><td>http://alpha/beta/</td></tr><tr><td>Sample Output</td><td>&lt;a href=’http://alpha/beta/’&gt;http://alpha/beta/&lt;/a&gt;&lt;/</td></tr></tbody></table>

The MSDN references are automatically constructed by referencing two fixed MSDN reference pages, one for cmdlets and one for topics. If those fixed references ever change URLs, that will break the generator; you will need to update those URLs in the internal **Get-CmdletDocLinks** function to mend it. The input format for these was designed keeping in mind that while **Convert-HelpToHtmlTree** converts these to links, **Get-Help** does not-it will display the original, raw text.

## Other Structural Considerations

Besides the standard documentation comments that **Get-Help** would use to display your modules, **Convert-HelpToHtmlTree** needs some additional doc-comments to generate a cohesive API for you.

1.  Each _module_ (x.psm1) must have an associated manifest (x.psd1) in the same directory and the manifest must include a **Description** property.
2.  Each _module_ must have an associated overview (module\_overview.html) in the same directory. This is a standard HTML file. The contents of the **<body>** element are extracted verbatim as the introductory text of the index.html page for each module.
3.  Each _namespace_ must also include an associated overview (namespace\_overview.html). This is a standard HTML file. The contents of the **<body>** element are extracted verbatim as the introductory text of each namespace in the master index.html page.

By reviewing the error messages in the very beginning of the article as well as the table of global properties early on, you should now see how these pieces fit together.

Note that I use the term _namespace_ here informally because (as of v3) PowerShell does not currently have the notion of namespaces. **Convert-HelpToHtmlTree**, however, _requires_ you to structure your modules grouped in namespaces. Thus, if you have a module MyStuff.psm1, normal PowerShell conventions require you to store this in a path like this:

…\\WindowsPowerShell\\Modules\\**MyStuff\\MyStuff.psm1**

…but **Convert-HelpToHtmlTree** requires you to include one more level for namespace, so the module must be stored in a path like this:

…\\WindowsPowerShell\\Modules\\**MyNamespace\\MyStuff\\MyStuff.psm1**

This allows you to organize your modules into more than one logical group if desired. In my own PowerShell library, for example, I have FileTools, SqlTools, and SvnTools modules (among others) all under the CleanCode namespace. But you may, however, include multiple namespaces. Here’s a sample input tree illustrating this:

<table><tbody><tr><td data-settings="hide"><div><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p></div></td><td><div><p><span>WindowsPowerShell</span><span>\</span><span>Modules</span></p><p><span>+</span><span>--</span><span>-namespace1</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-namespace_overview</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-moduleA</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-module_overview</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleA</span><span>.</span><span>psm1</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleA</span><span>.</span><span>psd1</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleB</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-module_overview</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleB</span><span>.</span><span>psm1</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleB</span><span>.</span><span>psd1</span></p><p><span>&nbsp;&nbsp;</span><span>etc</span><span>.</span><span>.</span><span>.</span></p><p><span>+</span><span>--</span><span>-namespace2</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-namespace_overview</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-moduleX</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-module_overview</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleX</span><span>.</span><span>psm1</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleX</span><span>.</span><span>psd1</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-moduleY</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-module_overview</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleY</span><span>.</span><span>psm1</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-moduleY</span><span>.</span><span>psd1</span></p><p><span>&nbsp;&nbsp;</span><span>etc</span><span>.</span><span>.</span><span>.</span></p></div></td></tr></tbody></table>

The output structure mirrors the input structure; the above input might generate the output tree shown below. There is a single master index page documenting all namespaces.

<table><tbody><tr><td data-settings="hide"><div><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p><p>25</p><p>26</p><p>27</p></div></td><td><div><p><span>$TargetDir</span></p><p><span>+</span><span>--</span><span>-contents</span><span>.</span><span>html</span></p><p><span>+</span><span>--</span><span>-index</span><span>.</span><span>html</span></p><p><span>+</span><span>--</span><span>-namespace1</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-moduleA</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-index</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function1</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function2</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function3</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function4</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>etc</span><span>.</span><span>.</span><span>.</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-moduleB</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-index</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function1</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function2</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>etc</span><span>.</span><span>.</span><span>.</span></p><p><span>+</span><span>--</span><span>-namespace2</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-moduleX</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-index</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function1</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>etc</span><span>.</span><span>.</span><span>.</span></p><p><span>&nbsp;&nbsp;</span><span>+</span><span>--</span><span>-moduleY</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-index</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function1</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>+</span><span>--</span><span>-Function2</span><span>.</span><span>html</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp; </span><span>etc</span><span>.</span><span>.</span><span>.</span></p><p><span>etc</span><span>.</span><span>.</span><span>.</span></p></div></td></tr></tbody></table>

## Other Stylistic Considerations

You have seen how to customize the generated output with the template file and how to format items in your .LINKS section. There are just a few more considerations to be mindful of as you write your documentation comments for your modules, touched on earlier:

-   Body text, by default, is output with a proportional font (your standard browser font) and flows/wraps automatically at the window edge based on your paragraph boundaries-that is, where you have hard (explicit) carriage returns.
-   By inference, if you want to output a list of items, you do not need to do anything special. Just type in the list with carriage returns and the output will mirror the input. It will still be in the standard browser font.
-   If you want to include a code sample in a fixed-width font, or even if you just want to output a list of items in a fixed-width font, simply have leading whitespace on each line.
-   The first line-and only the first line-following an .EXAMPLE section is special to **Get-Help**: it is considered your code sample. Thus, you really want to keep your code sample all on one line, no matter how long and ugly it gets. **Convert-HelpToHtmlTree** also considers the same first line a code sample and highlights it. So resist the urge to put line breaks in your sample!

## Now Just Add Water…

With the preliminaries out of the way, you are ready to put the generator to work. There are just a few parameters to specify on the command line. Here is essentially the script I use to generate the API for my own [CleanCode PowerShell library][22]:

<table><tbody><tr><td data-settings="hide"></td><td><div><p><span>Import-Module</span><span> </span><span>DocTreeGenerator</span></p><p><span>$scriptDir</span><span> </span><span>=</span><span> </span><span>Split-Path</span><span> </span><span>$script</span><span>:</span><span>MyInvocation</span><span>.</span><span>MyCommand</span><span>.</span><span>Path</span></p><p><span>Convert-HelpToHtmlTree</span><span> </span><span>`</span></p><p><span>&nbsp;&nbsp; </span><span>-Namespaces</span><span> </span><span>CleanCode</span><span> </span><span>`</span></p><p><span>&nbsp;&nbsp; </span><span>-TemplateName</span><span> </span><span>(</span><span>Join-Path</span><span> </span><span>$scriptDir</span><span> </span><span>psdoc_template</span><span>.</span><span>html</span><span>)</span><span> </span><span>`</span></p><p><span>&nbsp;&nbsp; </span><span>-DocTitle</span><span> </span><span>'PowerShell Libraries v1.2.01 API'</span><span> </span><span>`</span></p><p><span>&nbsp;&nbsp; </span><span>-Copyright</span><span> </span><span>'2012'</span><span> </span><span>`</span></p><p><span>&nbsp;&nbsp; </span><span>-RevisionDate</span><span> </span><span>'2012.12.10'</span><span> </span><span>`</span></p><p><span>&nbsp;&nbsp; </span><span>-TargetDir</span><span> </span><span>c</span><span>:</span><span>\</span><span>usr</span><span>\</span><span>tmp</span><span>\</span><span>psdoc_tmp</span></p></div></td></tr></tbody></table>

This short script uses a custom template file located in the same directory as the above script. (If you omit specifying a template it uses the default template supplied. That template includes the CSS rules embedded in the template just to keep it all to a single file; in practice you should generally move the CSS rules to a separate file.)

Figure 5 shows you the [API home page][23] for my PowerShell libraries.

![1826-cleancode_web_home-5cafa97c-4294-45][fig5]

Figure 5 Actual API home page for my CleanCode library of PowerShell functions.

And Figure 6 shows a portion of its associated [master index][24]. From either of those you can browse through the remainder of the documentation set.

![1826-cleancode_web_contents-2e01d05e-3f5][fig6]

Figure 6 Portion of the index (or table of contents) of the CleanCode library, indexing namespaces, modules, functions, and filters.

![1826-side%20by%20side%201-d28aaeb5-2091-][fig7]

Figure 7 Side by side comparison of the stylized web page output of Convert-HelpToHtmlTree (left) and Get-Help (right). Note the section headers standout for easy scanning. The description shows both normal, wrapped text as well as an example of preformatted text.

## Conclusion

Some IDEs provide great support for adding doc-comments. Visual Studio, for example, with the GhostDoc add-on almost writes the doc-comments for you. Alas, PowerShell does not yet have such a “ghost writer” available. To do it yourself, start with [about\_Comment\_Based\_Help][25] (which you can also access from the PowerShell prompt by feeding that to [Get-Help][26]!). Scroll down to the **Syntax for Comment-Based Help in** **Function****s** section. Note that the page also talks about adding help for the script itself; that applies only to script files (**ps1** files); it does _not_ apply to modules (**psm1** files). What you will see here is that you must add a special comment section that looks like this for each function (those that may appear more than once are shown repeated here):

<table><tbody><tr><td data-settings="hide"></td><td><div><p><span>&lt;#</span></p><p><span>.SYNOPSIS</span></p><p><span>.DESCRIPTION</span></p><p><span>.PARAMETER x</span></p><p><span>.PARAMETER y</span></p><p><span>.INPUTS</span></p><p><span>.OUTPUTS</span></p><p><span>.EXAMPLE</span></p><p><span>.EXAMPLE</span></p><p><span>.EXAMPLE</span></p><p><span>.EXAMPLE</span></p><p><span>.LINK</span></p><p><span>.LINK</span></p><p><span>.NOTES</span></p><p><span>#&gt;</span></p></div></td></tr></tbody></table>

After each keyword directive, you can have as much freeform text as you need. You will find all the keywords described in the subsequent section of **about\_Comment\_Based\_Help** entitled **Comment-Based Help Keywords**.

Now go forth and document!

**Update – April 2016**  
Since this article, I’ve created a wallchart putting both XmlDoc2Cmdlet and DocTreeGenerator in context, showing you how to do a complete documentation solution for your PowerShell work in both C# and PowerShell. [Click here for more details][27]. [![2407-1-5728ddc3-433a-4b82-a6dc-84f5f450b][fig8]][28]

[fig1]: How%20To%20Document%20Your%20PowerShell%20Library%20-%20Simple%20Talk/1826-initial_web_home-69ae35e6-0a1b-48df-b665-d5835e301230.png
[fig2]: How%20To%20Document%20Your%20PowerShell%20Library%20-%20Simple%20Talk/1826-initial_web_group-ceca7164-611e-4a0b-9751-bf3a4ce86220.png
[fig3]: How%20To%20Document%20Your%20PowerShell%20Library%20-%20Simple%20Talk/1826-initial_web_method-dd51125c-6d5e-473f-8d67-88b626b01f09.png
[fig4]: How%20To%20Document%20Your%20PowerShell%20Library%20-%20Simple%20Talk/1826-initial_web_contents-46408bcf-0562-43c4-acf2-69f3d0a98c7c.png
[fig5]: How%20To%20Document%20Your%20PowerShell%20Library%20-%20Simple%20Talk/1826-cleancode_web_home-5cafa97c-4294-4594-9e3e-53462e26416e.jpg
[fig6]: How%20To%20Document%20Your%20PowerShell%20Library%20-%20Simple%20Talk/1826-cleancode_web_contents-2e01d05e-3f53-4cab-84dd-31e125b499fa.jpg
[fig7]: How%20To%20Document%20Your%20PowerShell%20Library%20-%20Simple%20Talk/1826-side%2520by%2520side%25201-d28aaeb5-2091-4784-872b-3b9f95b4f328.jpg
[fig8]: How%20To%20Document%20Your%20PowerShell%20Library%20-%20Simple%20Talk/2407-1-5728ddc3-433a-4b82-a6dc-84f5f450b519.png

[1]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#one
[2]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#two
[3]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#three
[4]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#four
[5]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#five
[6]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#six
[7]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#seven
[8]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#eight
[9]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#nine
[10]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#ten
[11]: https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-document-your-powershell-library/#eleven
[12]: http://www.oracle.com/technetwork/java/javase/documentation/index-jsp-135444.html
[13]: http://shfb.codeplex.com/
[14]: http://perldoc.perl.org/perldoc.html
[15]: http://technet.microsoft.com/library/hh849696.aspx
[16]: http://cleancode.sourceforge.net/wwwdoc/software/Pod2HtmlTree.html
[17]: http://cleancode.sourceforge.net/wwwdoc/software/XmlTransform.html
[18]: http://www.devx.com/dbzone/Article/36646
[19]: https://github.com/msorens/DocTreeGenerator
[20]: http://cleancode.sourceforge.net/wwwdoc/APIbookshelf.html
[21]: http://cleancode.sourceforge.net/wwwdoc/download.html
[22]: https://github.com/msorens/DocTreeGenerator
[23]: http://cleancode.sourceforge.net/api/powershell/
[24]: http://cleancode.sourceforge.net/api/powershell/contents.html
[25]: http://technet.microsoft.com/en-us/library/dd819489.aspx
[26]: http://technet.microsoft.com/en-us/library/dd347639.aspx
[27]: https://www.simple-talk.com/sysadmin/powershell/unified-approach-to-generating-documentation-for-powershell-cmdlets/
[28]: https://www.simple-talk.com/sysadmin/powershell/unified-approach-to-generating-documentation-for-powershell-cmdlets/
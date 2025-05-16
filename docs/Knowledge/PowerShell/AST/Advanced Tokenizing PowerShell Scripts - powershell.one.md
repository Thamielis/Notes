https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer

> The advanced PowerShell Parser turns PowerShell code into detailed tokens. Use them to auto-document, analyze or just find your scripts. You can also perfect...

# Advanced Tokenizing PowerShell Scripts - powershell.one
The advanced **PowerShell Parser** turns **PowerShell** code into detailed tokens. Use them to auto-document, analyze or just find your scripts. You can also perfectly colorize your code.

When **PowerShell** surfaced in version 1, it came with a basic [**PSParser**](https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer) that can turn **PowerShell Code** into tokens. It soon turned out that **PSParser** has a few blind spots and cannot deal with *nested tokens*.

So in **PowerShell 3**, a new and more powerful **Parser** was introduced that breaks up **PowerShell Code** in a much more detailed range of token. In this article we examine the new **Parser**, and you get a ready-to-use function to parse your scripts: `Get-PSOneToken`.

Please make sure you have installed the latest version of the module **PSOneTools**, or else copy and paste the source codes of this article.

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock2"><i></i></a><code id="codeblock2"><span>Install-Module</span><span> </span><span>-Name</span><span> </span><span>PSOneTools</span><span> </span><span>-Scope</span><span> </span><span>CurrentUser</span><span> </span><span>-Force</span><span>
</span></code>
```

## Overview

The **PSParser** we [already covered](https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer) knows 20 different token types. The new **Parser** we are covering today knows 150 different token kinds, each of which can be decorated with 26 token flags. This provides a very detailed picture, especially when it comes to *nested* token.

### Nested Token

**PowerShell** can embed variables and expressions in **Expandable Strings** (double-quoted strings), so when you take a look at these lines, how many token do you see?

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock4"><i></i></a><code id="codeblock4"><span>"Hello </span><span>$</span><span>env</span><span>:</span><span>username</span><span>"</span><span>
</span><span>"PowerShell Version: </span><span>$(</span><span>$host</span><span>.</span><span>Version</span><span>)</span><span>"
</span></code>
```

**PSParser** would see just one string token per line, plus one token for the *NewLine*:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock6"><i></i></a><code id="codeblock6"><span>$code</span><span> </span><span>=</span><span> </span><span>'"Hello $env:username"
"PowerShell Version: $($host.Version)"
'</span><span>

</span><span>Test-PSOneScript</span><span> </span><span>-Code</span><span> </span><span>$code</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Tokens</span><span>
</span></code>
```

All *nested* token are invisible to **PSParser**.

## Using the New Parser

Because of these limitations, I added a new function to the module **PSOneTools** that uses the new **Parser** instead of the old **PSParser**: `Get-PSOneToken`. Make sure you are using the latest version of the module **PSOneTools**, or copy and run the source code below.

### Support For Nested Token

The new parser supports nested tokens:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock8"><i></i></a><code id="codeblock8"><span>PS</span><span>&gt;</span><span> </span><span># get tokens for code:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>$result</span><span> </span><span>=</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'"Hello $env:username"'</span><span>

</span><span>PS</span><span>&gt;</span><span> </span><span># emit tokens:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Tokens</span><span>

</span><span>NestedTokens</span><span> </span><span>:</span><span> </span><span>{</span><span>username</span><span>}</span><span>
</span><span>Value</span><span>        </span><span>:</span><span> </span><span>Hello</span><span> </span><span>$</span><span>env</span><span>:</span><span>username</span><span>
</span><span>Text</span><span>         </span><span>:</span><span> </span><span>"Hello </span><span>$</span><span>env</span><span>:</span><span>username</span><span>"</span><span>
</span><span>TokenFlags</span><span>   </span><span>:</span><span> </span><span>ParseModeInvariant</span><span>
</span><span>Kind</span><span>         </span><span>:</span><span> </span><span>StringExpandable</span><span>
</span><span>HasError</span><span>     </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>       </span><span>:</span><span> </span><span>"Hello </span><span>$</span><span>env</span><span>:</span><span>username</span><span>"</span><span>

</span><span>Text</span><span>       </span><span>:</span><span> 
</span><span>TokenFlags</span><span> </span><span>:</span><span> </span><span>ParseModeInvariant</span><span>
</span><span>Kind</span><span>       </span><span>:</span><span> </span><span>EndOfInput</span><span>
</span><span>HasError</span><span>   </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>     </span><span>:</span><span> 

</span><span>PS</span><span>&gt;</span><span> </span><span># tokens of type "StringExpandable" have a "NestedTokens" property:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Tokens</span><span>[</span><span>0</span><span>]</span><span>.</span><span>NestedTokens</span><span>

</span><span>Name</span><span>         </span><span>:</span><span> </span><span>username</span><span>
</span><span>VariablePath</span><span> </span><span>:</span><span> </span><span>env:username</span><span>
</span><span>Text</span><span>         </span><span>:</span><span> </span><span>$</span><span>env</span><span>:</span><span>username</span><span>
</span><span>TokenFlags</span><span>   </span><span>:</span><span> </span><span>None</span><span>
</span><span>Kind</span><span>         </span><span>:</span><span> </span><span>Variable</span><span>
</span><span>HasError</span><span>     </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>       </span><span>:</span><span> </span><span>$</span><span>env</span><span>:</span><span>username</span><span>
</span></code>
```

### Support For Syntax Errors

`Get-PSOneToken` and the new **Parser** also return potential syntax errors, just like `Test-PSOneScript` and the **PSParser**, but there are way more details:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock10"><i></i></a><code id="codeblock10"><span>PS</span><span>&gt;</span><span> </span><span># using the new Parser with syntax error in code:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>$result</span><span> </span><span>=</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'"Hello'</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Errors</span><span>

</span><span>Message</span><span>             </span><span>:</span><span> </span><span>The</span><span> </span><span>string</span><span> </span><span>is</span><span> </span><span>missing</span><span> </span><span>the</span><span> </span><span>terminator:</span><span> </span><span>".
IncompleteInput     : True
ErrorId             : TerminatorExpectedAtEndOfString
File                : 
StartScriptPosition : System.Management.Automation.Language.InternalScriptPosition
EndScriptPosition   : System.Management.Automation.Language.InternalScriptPosition
StartLineNumber     : 1
StartColumnNumber   : 1
EndLineNumber       : 1
EndColumnNumber     : 7
Text                : "</span><span>Hello</span><span>
</span><span>StartOffset</span><span>         </span><span>:</span><span> </span><span>0</span><span>
</span><span>EndOffset</span><span>           </span><span>:</span><span> </span><span>6</span><span>

</span><span>PS</span><span>&gt;</span><span> </span><span># using the old PSParser with syntax error in code:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>$result</span><span> </span><span>=</span><span> </span><span>Test-PSOneScript</span><span> </span><span>-Code</span><span> </span><span>'"Hello'</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Errors</span><span>

</span><span>Message</span><span>     </span><span>:</span><span> </span><span>The</span><span> </span><span>string</span><span> </span><span>is</span><span> </span><span>missing</span><span> </span><span>the</span><span> </span><span>terminator:</span><span> </span><span>".
Content     : "</span><span>Hello</span><span>
</span><span>Type</span><span>        </span><span>:</span><span> </span><span>Position</span><span>
</span><span>Start</span><span>       </span><span>:</span><span> </span><span>0</span><span>
</span><span>Length</span><span>      </span><span>:</span><span> </span><span>6</span><span>
</span><span>StartLine</span><span>   </span><span>:</span><span> </span><span>1</span><span>
</span><span>StartColumn</span><span> </span><span>:</span><span> </span><span>1</span><span>
</span><span>EndLine</span><span>     </span><span>:</span><span> </span><span>1</span><span>
</span><span>EndColumn</span><span>   </span><span>:</span><span> </span><span>7</span><span>
</span></code>
```

## Finding All Variables in Code

Let’s start with retrieving all variables from a script. The improved detail provided by **Parser** over **PSParser** is great but also challenging because you first need to know the **Kind** of token and (optionally) its **TokenFlags**.

### Investigating Tokens

To find out **Kind** and **TokenFlags** of what you are after, begin with submitting sample code that contains the expression:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock12"><i></i></a><code id="codeblock12"><span>PS</span><span>&gt;</span><span> </span><span>(</span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'$a = 10'</span><span>)</span><span>.</span><span>Tokens</span><span>

</span><span>Name</span><span>         </span><span>:</span><span> </span><span>a</span><span>
</span><span>VariablePath</span><span> </span><span>:</span><span> </span><span>a</span><span>
</span><span>Text</span><span>         </span><span>:</span><span> </span><span>$a</span><span>
</span><span>TokenFlags</span><span>   </span><span>:</span><span> </span><span>None</span><span>
</span><span>Kind</span><span>         </span><span>:</span><span> </span><span>Variable</span><span>
</span><span>HasError</span><span>     </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>       </span><span>:</span><span> </span><span>$a</span><span>

</span><span>Text</span><span>       </span><span>:</span><span> </span><span>=</span><span>
</span><span>TokenFlags</span><span> </span><span>:</span><span> </span><span>AssignmentOperator</span><span>
</span><span>Kind</span><span>       </span><span>:</span><span> </span><span>Equals</span><span>
</span><span>HasError</span><span>   </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>     </span><span>:</span><span> </span><span>=</span><span>

</span><span>...</span><span>
</span></code>
```

As you see, the variable in your sample code is represented by a token of kind **Variable** with no special **TokenFlags**.

### Retrieving Token of Type “Variable”

Once you know the **Kind** of token you are after, ask `Get-PSOneToken` to return just the token of that kind:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock14"><i></i></a><code id="codeblock14"><span>PS</span><span>&gt;</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'$a = 12'</span><span> </span><span>-TokenKind</span><span> </span><span>Variable</span><span>

</span><span>Name</span><span>         </span><span>:</span><span> </span><span>a</span><span>
</span><span>VariablePath</span><span> </span><span>:</span><span> </span><span>a</span><span>
</span><span>Text</span><span>         </span><span>:</span><span> </span><span>$a</span><span>
</span><span>TokenFlags</span><span>   </span><span>:</span><span> </span><span>None</span><span>
</span><span>Kind</span><span>         </span><span>:</span><span> </span><span>Variable</span><span>
</span><span>HasError</span><span>     </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>       </span><span>:</span><span> </span><span>$a</span><span>
</span></code>
```

## Why Finding Tokens Rocks…

As you’ll soon discover, **\-TokenKind** sports full intellisense, and also accepts multiple kinds. This line would find all tokens that either start a **PowerShell Class**, **PowerShell Workflow**, or **PowerShell Function**:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock16"><i></i></a><code id="codeblock16"><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'class test {}; workflow simple {}; function abc {}'</span><span> </span><span>-TokenKind</span><span> </span><span>Command</span><span>,</span><span> </span><span>Class</span><span>,</span><span> </span><span>Workflow</span><span>,</span><span> </span><span>function</span><span>
</span></code>
```

If you’re scratching your head why finding such token could be useful, here is a clap on your front head: for example to identify scripts that define such things! Or to *tag* your scripts in some sort of inventory.

### Finding Scripts that Define Classes or Workflows

`Get-PSOneToken` is fully pipeline-aware, so you can easily use it as a filter and find scripts that contain a given token. This example lists all scripts that define **PowerShell Classes** or **PowerShell Workflows** in your user profile (if any):

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock18"><i></i></a><code id="codeblock18"><span># finding all scripts that define classes or workflows:</span><span>
</span><span>Get-ChildItem</span><span> </span><span>-Path</span><span> </span><span>$home</span><span> </span><span>-Include</span><span> </span><span>*.</span><span>ps1</span><span>,</span><span> </span><span>*.</span><span>psm1</span><span> </span><span>-Recurse</span><span> </span><span>-ErrorAction</span><span> </span><span>SilentlyContinue</span><span> </span><span>|</span><span>
    </span><span>Where-Object</span><span> </span><span>{</span><span>
        </span><span># if there is at least one of the requested token in the</span><span>
        </span><span># script, let it pass:</span><span>
        </span><span>$_</span><span> </span><span>|</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-TokenKind</span><span> </span><span>Class</span><span>,</span><span> </span><span>Workflow</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-First</span><span> </span><span>1</span><span> 
    </span><span>}</span><span>
</span></code>
```

### Finding Operators

When you look at the variety of values you can specify for **\-TokenKind**, you can easily find exactly the token you are after, for example an assignment operator:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock20"><i></i></a><code id="codeblock20"><span>PS</span><span>&gt;</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'$a = 100; if ($a -eq 100) { 100 }'</span><span> </span><span>-TokenKind</span><span> </span><span>Equals</span><span>

</span><span>Text</span><span>       </span><span>:</span><span> </span><span>=</span><span>
</span><span>TokenFlags</span><span> </span><span>:</span><span> </span><span>AssignmentOperator</span><span>
</span><span>Kind</span><span>       </span><span>:</span><span> </span><span>Equals</span><span>
</span><span>HasError</span><span>   </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>     </span><span>:</span><span> </span><span>=</span><span>
</span></code>
```

If you wanted to find the **\-eq** comparison operator, you’d have to use the kind **Ieq** instead of **Equals**:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock22"><i></i></a><code id="codeblock22"><span>PS</span><span>&gt;</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'$a = 100; if ($a -eq 100) { 100 }'</span><span> </span><span>-TokenKind</span><span> </span><span>Ieq</span><span>

</span><span>Text</span><span>       </span><span>:</span><span> </span><span>-eq</span><span>
</span><span>TokenFlags</span><span> </span><span>:</span><span> </span><span>BinaryPrecedenceComparison</span><span>,</span><span> </span><span>BinaryOperator</span><span>
</span><span>Kind</span><span>       </span><span>:</span><span> </span><span>Ieq</span><span>
</span><span>HasError</span><span>   </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>     </span><span>:</span><span> </span><span>-eq</span><span>
</span></code>
```

> The **Parser** is always looking for the *real* operator. There operator *\-Eq* in reality is just an alias for *\-Ieq*, the *case-insensitive* equality operator.

### Retrieving Token Groups: TokenFlags

What if you wanted to list *all* operators? That’s when **TokenFlags** are helpful because they *group* similar token **Kinds**. Have a look:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock24"><i></i></a><code id="codeblock24"><span>PS</span><span>&gt;</span><span> </span><span>(</span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'$a = 100; $a -eq 100; $a -gt 100'</span><span>)</span><span>.</span><span>Tokens</span><span> </span><span>|</span><span> 
        </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Text</span><span>,</span><span> </span><span>TokenFlags</span><span>

</span><span>Text</span><span>                                 </span><span>TokenFlags</span><span>
</span><span>----</span><span>                                 </span><span>----------</span><span>
</span><span>$a</span><span>                                         </span><span>None</span><span>
</span><span>=</span><span>                            </span><span>AssignmentOperator</span><span>
</span><span>100</span><span>                                        </span><span>None</span><span>
</span><span>;</span><span>                            </span><span>ParseModeInvariant</span><span>
</span><span>$a</span><span>                                         </span><span>None</span><span>
</span><span>-eq</span><span>  </span><span>BinaryPrecedenceComparison</span><span>,</span><span> </span><span>BinaryOperator</span><span>
</span><span>100</span><span>                                        </span><span>None</span><span>
</span><span>;</span><span>                            </span><span>ParseModeInvariant</span><span>
</span><span>$a</span><span>                                         </span><span>None</span><span>
</span><span>-gt</span><span>  </span><span>BinaryPrecedenceComparison</span><span>,</span><span> </span><span>BinaryOperator</span><span>
</span><span>100</span><span>                                        </span><span>None</span><span>
                             </span><span>ParseModeInvariant</span><span>
</span></code>
```

All comparison operators share the **TokenFlag** *BinaryOperator*, so to get all comparison operators from your code, request this **TokenKind**:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock26"><i></i></a><code id="codeblock26"><span>PS</span><span>&gt;</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'$a = 100; $a -eq 100; $a -gt 100'</span><span> </span><span>-TokenFlag</span><span> </span><span>BinaryOperator</span><span>

</span><span>Text</span><span>       </span><span>:</span><span> </span><span>-eq</span><span>
</span><span>TokenFlags</span><span> </span><span>:</span><span> </span><span>BinaryPrecedenceComparison</span><span>,</span><span> </span><span>BinaryOperator</span><span>
</span><span>Kind</span><span>       </span><span>:</span><span> </span><span>Ieq</span><span>
</span><span>HasError</span><span>   </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>     </span><span>:</span><span> </span><span>-eq</span><span>

</span><span>Text</span><span>       </span><span>:</span><span> </span><span>-gt</span><span>
</span><span>TokenFlags</span><span> </span><span>:</span><span> </span><span>BinaryPrecedenceComparison</span><span>,</span><span> </span><span>BinaryOperator</span><span>
</span><span>Kind</span><span>       </span><span>:</span><span> </span><span>Igt</span><span>
</span><span>HasError</span><span>   </span><span>:</span><span> </span><span>False</span><span>
</span><span>Extent</span><span>     </span><span>:</span><span> </span><span>-gt</span><span>
</span></code>
```

If you wanted to get a list of all binary operators used by a script, it’s almost trivial now:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock28"><i></i></a><code id="codeblock28"><span># replace with path to your file</span><span>
</span><span>$Path</span><span> </span><span>=</span><span> </span><span>"C:\...\file.ps1"</span><span>

</span><span>Get-PSOneToken</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span> </span><span>-TokenFlag</span><span> </span><span>BinaryOperator</span><span> </span><span>|</span><span>
</span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Text</span><span> </span><span>|</span><span>
</span><span>Sort-Object</span><span> </span><span>-Unique</span><span>
</span></code>
```

## Nested Token Support

`Get-PSOneToken` uses the new **Parser** so nested token inside **ExpandableString** tokens are no longer a blind spot. To *unwrap* them from the top-level tokens, they just need to be unwrapped recursively. This is done by `Expand-PSOneToken`:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock30"><i></i></a><code id="codeblock30"><span>PS</span><span>&gt;</span><span> </span><span># by default, nested tokens are not returned:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'"Hello $host"'</span><span> </span><span>-TokenKind</span><span> </span><span>StringExpandable</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Text</span><span>

</span><span>"Hello </span><span>$host</span><span>"</span><span>

</span><span>PS</span><span>&gt;</span><span> </span><span># nested tokens can be unwrapped though:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'"Hello $host"'</span><span> </span><span>-TokenKind</span><span> </span><span>StringExpandable</span><span> </span><span>|</span><span> </span><span>Expand-PSOneToken</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Text</span><span>

</span><span>"Hello </span><span>$host</span><span>"</span><span>
</span><span>$host</span><span>
</span></code>
```

This functionality is already built into `Get-PSOneToken` when you specify the parameter **\-IncludeNestedToken**:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock32"><i></i></a><code id="codeblock32"><span>PS</span><span>&gt;</span><span> </span><span># get top-level token only:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>(</span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'"Hello $host"'</span><span>)</span><span>.</span><span>Tokens</span><span>.</span><span>Text</span><span>

</span><span>"Hello </span><span>$host</span><span>"</span><span>

</span><span>PS</span><span>&gt;</span><span> </span><span># include nested tokens by specifying -IncludeNestedToken:</span><span>
</span><span>PS</span><span>&gt;</span><span> </span><span>(</span><span>Get-PSOneToken</span><span> </span><span>-Code</span><span> </span><span>'"Hello $host"'</span><span> </span><span>-IncludeNestedToken</span><span>)</span><span>.</span><span>Tokens</span><span>.</span><span>Text</span><span>

</span><span>"Hello </span><span>$host</span><span>"</span><span>
</span><span>$host</span><span>
</span></code>
```

Now you won’t miss anything. This gets you a list of all variables, including **$secret** used in nested expressions inside expandable strings:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock34"><i></i></a><code id="codeblock34"><span>$code</span><span> </span><span>=</span><span> </span><span>{</span><span>
  </span><span>$a</span><span> </span><span>=</span><span> </span><span>1</span><span>
  </span><span>$b</span><span> </span><span>=</span><span> </span><span>2</span><span>
  </span><span>"This is also used: </span><span>$(</span><span>$secret</span><span> </span><span>=</span><span> </span><span>100</span><span>;</span><span> </span><span>$secret</span><span>)</span><span>"</span><span>
</span><span>}</span><span>

</span><span>Get-PSOneToken</span><span> </span><span>-ScriptBlock</span><span> </span><span>$code</span><span> </span><span>-TokenKind</span><span> </span><span>Variable</span><span> </span><span>-IncludeNestedToken</span><span> </span><span>|</span><span>
  </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Text</span><span> </span><span>|</span><span>
  </span><span>Sort-Object</span><span> </span><span>-Unique</span><span>
</span></code>
```

## Auto-Documenting Script Files

Thanks to `Get-PSOneToken`, it is now trivial to analyze script files and retrieve all kinds of lists and statistics.

### Creating List of Used Variables

Take a look at the simple code to get a list of all variables used in a script, for example to create some automated documentation:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock36"><i></i></a><code id="codeblock36"><span># replace with path to your file</span><span>
</span><span>$Path</span><span> </span><span>=</span><span> </span><span>"C:\...\file.ps1"</span><span>

</span><span>Get-PSOneToken</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span> </span><span>-TokenKind</span><span> </span><span>Variable</span><span> </span><span>-IncludeNestedToken</span><span> </span><span>|</span><span>
</span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Text</span><span> </span><span>|</span><span>
</span><span>Sort-Object</span><span> </span><span>-Unique</span><span>
</span></code>
```

Unlike using the old **PSParser**, the code now also picks up variables that hide inside nested token.

### Creating a List of Used Commands

Likewise, if you’d like to get a **list of commands** used by the script, filter for the appropriate token type. Commands are represented by token of kind **Generic** *and* contain a **TokenFlag** of type **CommandName**:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock38"><i></i></a><code id="codeblock38"><span># replace with path to your file</span><span>
</span><span>$Path</span><span> </span><span>=</span><span> </span><span>"C:\...\file.ps1"</span><span>

</span><span>Get-PSOneToken</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span> </span><span>-TokenKind</span><span> </span><span>Generic</span><span> </span><span>-TokenFlag</span><span> </span><span>CommandName</span><span> </span><span>-IncludeNestedToken</span><span> </span><span>|</span><span>
</span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Text</span><span> </span><span>|</span><span>
</span><span>Sort-Object</span><span> </span><span>-Unique</span><span>
</span></code>
```

You can even analyze the frequency of **how often commands were used**. This gets you the 10 most-often used commands:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock40"><i></i></a><code id="codeblock40"><span># replace with path to your file</span><span>
</span><span>$Path</span><span> </span><span>=</span><span> </span><span>"C:\...\file.ps1"</span><span>

</span><span>Get-PSOneToken</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span> </span><span>-TokenKind</span><span> </span><span>Generic</span><span> </span><span>-TokenFlag</span><span> </span><span>CommandName</span><span> </span><span>-IncludeNestedToken</span><span> </span><span>|</span><span>
</span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Text</span><span> </span><span>|</span><span>
</span><span>Group-Object</span><span> </span><span>-NoElement</span><span> </span><span>|</span><span>
</span><span>Sort-Object</span><span> </span><span>-Property</span><span> </span><span>Count</span><span> </span><span>-Descending</span><span> </span><span>|</span><span>
</span><span>Select-Object</span><span> </span><span>-First</span><span> </span><span>10</span><span>
</span></code>
```

## Get-PSOneToken

The bulk of work is done by `Get-PSOneToken`. The easiest way is to download and install the command via the **PowerShell Gallery** and `Install-Module`:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock42"><i></i></a><code id="codeblock42"><span>Install-Module</span><span> </span><span>-Name</span><span> </span><span>PSOneTools</span><span> </span><span>-Scope</span><span> </span><span>CurrentUser</span><span> </span><span>-Force</span><span>
</span></code>
```

I added this to version 1.4 of the module, so if you have installed the module previously, make sure you install the latest version or update it via `Update-Module`.

### Implementation

Here is the source code:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock44"><i></i></a><code id="codeblock44"><span>function</span><span> </span><span>Get-PSOneToken</span><span>
</span><span>{</span><span>
  </span><span>&lt;#
      </span><span>.SYNOPSIS</span><span>
      Parses a PowerShell Script (*.ps1, *.psm1, *.psd1) and returns the token

      </span><span>.DESCRIPTION</span><span>
      Invokes the advanced PowerShell Parser and returns tokens and syntax errors

      </span><span>.EXAMPLE</span><span>
      Get-PSOneToken -Path c:\test.ps1
      Parses the content of c:\test.ps1 and returns tokens and syntax errors

      </span><span>.EXAMPLE</span><span>
      Get-ChildItem -Path $home -Recurse -Include *.ps1,*.psm1,*.psd1 -File |
      Get-PSOneToken |
      Out-GridView

      parses all PowerShell files found anywhere in your user profile

      </span><span>.EXAMPLE</span><span>
      Get-ChildItem -Path $home -Recurse -Include *.ps1,*.psm1,*.psd1 -File |
      Get-PSOneToken |
      Where-Object Errors

      parses all PowerShell files found anywhere in your user profile
      and returns only those files that contain syntax errors

      </span><span>.LINK</span><span>
      https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
      https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Get-PSOneToken.ps1
  #&gt;</span><span>

  </span><span>[</span><span>CmdletBinding</span><span>(</span><span>DefaultParameterSetName</span><span>=</span><span>'Path'</span><span>)]</span><span>
  </span><span>param</span><span>
  </span><span>(</span><span>
    </span><span># Path to PowerShell script file</span><span>
    </span><span># can be a string or any object that has a "Path" </span><span>
    </span><span># or "FullName" property:</span><span>
    </span><span>[</span><span>String</span><span>]</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ValueFromPipeline</span><span>,</span><span>ParameterSetName</span><span>=</span><span>'Path'</span><span>)]</span><span>
    </span><span>[</span><span>Alias</span><span>(</span><span>'FullName'</span><span>)]</span><span>
    </span><span>$Path</span><span>,</span><span>
    
    </span><span># PowerShell Code as ScriptBlock</span><span>
    </span><span>[</span><span>ScriptBlock</span><span>]</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ValueFromPipeline</span><span>,</span><span>ParameterSetName</span><span>=</span><span>'ScriptBlock'</span><span>)]</span><span>
    </span><span>$ScriptBlock</span><span>,</span><span>
    
    
    </span><span># PowerShell Code as String</span><span>
    </span><span>[</span><span>String</span><span>]</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span> </span><span>ValueFromPipeline</span><span>,</span><span>ParameterSetName</span><span>=</span><span>'Code'</span><span>)]</span><span>
    </span><span>$Code</span><span>,</span><span>
    
    </span><span># the kind of token requested. If neither TokenKind nor TokenFlag is requested, </span><span>
    </span><span># a full tokenization occurs</span><span>
    </span><span>[</span><span>System.Management.Automation.Language.</span><span>TokenKind</span><span>[]]</span><span>
    </span><span>$TokenKind</span><span> </span><span>=</span><span> </span><span>$null</span><span>,</span><span>

    </span><span># the kind of token requested. If neither TokenKind nor TokenFlag is requested, </span><span>
    </span><span># a full tokenization occurs</span><span>
    </span><span>[</span><span>System.Management.Automation.Language.</span><span>TokenFlags</span><span>[]]</span><span>
    </span><span>$TokenFlag</span><span> </span><span>=</span><span> </span><span>$null</span><span>,</span><span>

    </span><span># include nested token that are contained inside </span><span>
    </span><span># ExpandableString tokens</span><span>
    </span><span>[</span><span>Switch</span><span>]</span><span>
    </span><span>$IncludeNestedToken</span><span>

  </span><span>)</span><span>
  
  </span><span>begin</span><span>
  </span><span>{</span><span>
    </span><span># create variables to receive tokens and syntax errors:</span><span>
    </span><span>$errors</span><span> </span><span>=</span><span> 
    </span><span>$tokens</span><span> </span><span>=</span><span> </span><span>$null</span><span>

    </span><span># return tokens only?</span><span>
    </span><span># when the user submits either one of these parameters, the return value should</span><span>
    </span><span># be tokens of these kinds:</span><span>
    </span><span>$returnTokens</span><span> </span><span>=</span><span> </span><span>(</span><span>$PSBoundParameters</span><span>.</span><span>ContainsKey</span><span>(</span><span>'TokenKind'</span><span>))</span><span> </span><span>-or</span><span> 
    </span><span>(</span><span>$PSBoundParameters</span><span>.</span><span>ContainsKey</span><span>(</span><span>'TokenFlag'</span><span>))</span><span>
  </span><span>}</span><span>
  </span><span>process</span><span>
  </span><span>{</span><span>
    </span><span># if a scriptblock was submitted, convert it to string</span><span>
    </span><span>if</span><span> </span><span>(</span><span>$PSCmdlet</span><span>.</span><span>ParameterSetName</span><span> </span><span>-eq</span><span> </span><span>'ScriptBlock'</span><span>)</span><span>
    </span><span>{</span><span>
      </span><span>$Code</span><span> </span><span>=</span><span> </span><span>$ScriptBlock</span><span>.</span><span>ToString</span><span>()</span><span>
    </span><span>}</span><span>

    </span><span># if a path was submitted, read code from file,</span><span>
    </span><span>if</span><span> </span><span>(</span><span>$PSCmdlet</span><span>.</span><span>ParameterSetName</span><span> </span><span>-eq</span><span> </span><span>'Path'</span><span>)</span><span>
    </span><span>{</span><span>
      </span><span>$code</span><span> </span><span>=</span><span> </span><span>Get-Content</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span> </span><span>-Raw</span><span> </span><span>-Encoding</span><span> </span><span>Default</span><span>
      </span><span>$name</span><span> </span><span>=</span><span> </span><span>Split-Path</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span> </span><span>-Leaf</span><span>
      </span><span>$filepath</span><span> </span><span>=</span><span> </span><span>$Path</span><span>

      </span><span># parse the file:</span><span>
      </span><span>$ast</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseFile</span><span>(</span><span>
        </span><span>$Path</span><span>,</span><span> 
        </span><span>[</span><span>ref</span><span>]</span><span> </span><span>$tokens</span><span>,</span><span> 
      </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>
    </span><span>}</span><span>
    </span><span>else</span><span>
    </span><span>{</span><span>
      </span><span># else the code is already present in $Code</span><span>
      </span><span>$name</span><span> </span><span>=</span><span> </span><span>$Code</span><span>
      </span><span>$filepath</span><span> </span><span>=</span><span> </span><span>''</span><span>

      </span><span># parse the string code:</span><span>
      </span><span>$ast</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseInput</span><span>(</span><span>
        </span><span>$Code</span><span>,</span><span> 
        </span><span>[</span><span>ref</span><span>]</span><span> </span><span>$tokens</span><span>,</span><span> 
      </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>
    </span><span>}</span><span>

    </span><span>if</span><span> </span><span>(</span><span>$IncludeNestedToken</span><span>)</span><span>
    </span><span>{</span><span>
      </span><span># "unwrap" nested token</span><span>
      </span><span>$tokens</span><span> </span><span>=</span><span> </span><span>$tokens</span><span> </span><span>|</span><span> </span><span>Expand-PSOneToken</span><span>
    </span><span>}</span><span>

    </span><span>if</span><span> </span><span>(</span><span>$returnTokens</span><span>)</span><span>
    </span><span>{</span><span>
      </span><span># filter token and use fast scriptblock filtering instead of Where-Object:</span><span>
      </span><span>$tokens</span><span> </span><span>|</span><span>
      </span><span>&amp;</span><span> </span><span>{</span><span> </span><span>process</span><span> </span><span>{</span><span> </span><span>if</span><span> </span><span>(</span><span>$TokenKind</span><span> </span><span>-eq</span><span> </span><span>$null</span><span> </span><span>-or</span><span> 
          </span><span>$TokenKind</span><span> </span><span>-contains</span><span> </span><span>$_</span><span>.</span><span>Kind</span><span>)</span><span> 
          </span><span>{</span><span> </span><span>$_</span><span> </span><span>}</span><span>
      </span><span>}}</span><span> </span><span>|</span><span>
      </span><span>&amp;</span><span> </span><span>{</span><span> </span><span>process</span><span> </span><span>{</span><span>
          </span><span>$token</span><span> </span><span>=</span><span> </span><span>$_</span><span>
          </span><span>if</span><span> </span><span>(</span><span>$TokenFlag</span><span> </span><span>-eq</span><span> </span><span>$null</span><span>)</span><span> </span><span>{</span><span> </span><span>$token</span><span> </span><span>}</span><span>
          </span><span>else</span><span> </span><span>{</span><span>
            </span><span>$TokenFlag</span><span> </span><span>|</span><span> 
            </span><span>Foreach-Object</span><span> </span><span>{</span><span> 
              </span><span>if</span><span> </span><span>(</span><span>$token</span><span>.</span><span>TokenFlags</span><span>.</span><span>HasFlag</span><span>(</span><span>$_</span><span>))</span><span> 
            </span><span>{</span><span> </span><span>$token</span><span> </span><span>}</span><span> </span><span>}</span><span> </span><span>|</span><span> 
            </span><span>Select-Object</span><span> </span><span>-First</span><span> </span><span>1</span><span>
          </span><span>}</span><span>
        </span><span>}</span><span>
      </span><span>}</span><span>
            
    </span><span>}</span><span>
    </span><span>else</span><span>
    </span><span>{</span><span>
      </span><span># return the results as a custom object</span><span>
      </span><span>[</span><span>PSCustomObject</span><span>]@{</span><span>
        </span><span>Name</span><span> </span><span>=</span><span> </span><span>$name</span><span>
        </span><span>Path</span><span> </span><span>=</span><span> </span><span>$filepath</span><span>
        </span><span>Tokens</span><span> </span><span>=</span><span> </span><span>$tokens</span><span>
        </span><span>#</span><span> </span><span>"move"</span><span> </span><span>nested</span><span> </span><span>"Extent"</span><span> </span><span>up</span><span> </span><span>one</span><span> </span><span>level</span><span> 
        </span><span>#</span><span> </span><span>so</span><span> </span><span>all</span><span> </span><span>important</span><span> </span><span>properties</span><span> </span><span>are</span><span> </span><span>shown</span><span> </span><span>immediately</span><span>
        </span><span>Errors</span><span> </span><span>=</span><span> </span><span>$errors</span><span> </span><span>|</span><span> 
        </span><span>Select</span><span>-</span><span>Object</span><span> </span><span>-</span><span>Property</span><span> </span><span>Message</span><span>,</span><span> 
        </span><span>IncompleteInput</span><span>,</span><span> 
        </span><span>ErrorId</span><span> </span><span>-</span><span>ExpandProperty</span><span> </span><span>Extent</span><span>
        </span><span>Ast</span><span> </span><span>=</span><span> </span><span>$ast</span><span>
      </span><span>}</span><span>
    </span><span>}</span><span>  
  </span><span>}</span><span>
</span><span>}</span><span>
</span></code>
```

### Tokenizing PowerShell Code

The tokenization is done by **Parser** which works very similar to the old **PSParser** [discussed here](https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer):

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock46"><i></i></a><code id="codeblock46"><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseFile</span><span>(</span><span>$Path</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span> </span><span>$tokens</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>

</span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseInput</span><span>(</span><span>$Code</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span> </span><span>$tokens</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>
</span></code>
```

Unlike **PSParser**, it supports parsing string input as well as reading input from file. It returns the **Abstract Syntax Tree** which we discuss in the next part, plus returns tokens and syntax errors by reference.

## Expand-PSOneToken

This function takes care of recursively expanding nested token and is also part of the module **PSOneTools**, so when you installed it above, you already have this command.

### Implementation

Most of the hard work is done by **PowerShell**, and `Expand-PSOneToken` utilizes the power of the **PowerShell Parameter Binder**:

```
<a type="btn" tooltip="Click to Copy Code to Clipboard" flow="left" data-clipboard-target="#codeblock48"><i></i></a><code id="codeblock48"><span>function</span><span> </span><span>Expand-PSOneToken</span><span>
</span><span>{</span><span>
  </span><span>&lt;#
      </span><span>.SYNOPSIS</span><span>
      Expands all nested token from a token of type "StringExpandable"

      </span><span>.DESCRIPTION</span><span>
      Recursively emits all tokens embedded in a token of type "StringExpandable"
      The original token is also emitted.

      </span><span>.EXAMPLE</span><span>
      Get-PSOneToken -Code '"Hello $host"' -TokenKind StringExpandable | Expand-PSOneToken 
      Emits all tokens, including the embedded (nested) tokens
      </span><span>.LINK</span><span>
      https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
      https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Expand-PSOneToken.ps1
  #&gt;</span><span>

  </span><span># use the most specific parameter as default:</span><span>
  </span><span>[</span><span>CmdletBinding</span><span>(</span><span>DefaultParameterSetName</span><span>=</span><span>'ExpandableString'</span><span>)]</span><span>
  </span><span>param</span><span>
  </span><span>(</span><span>
    </span><span># binds a token of type "StringExpandableToken"</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ParameterSetName</span><span>=</span><span>'ExpandableString'</span><span>,</span><span>
    </span><span>Position</span><span>=</span><span>0</span><span>,</span><span>ValueFromPipeline</span><span>)]</span><span>
    </span><span>[</span><span>Management.Automation.Language.</span><span>StringExpandableToken</span><span>]</span><span>
    </span><span>$StringExpandable</span><span>,</span><span>

    </span><span># binds all tokens</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ParameterSetName</span><span>=</span><span>'Token'</span><span>,</span><span>
    </span><span>Position</span><span>=</span><span>0</span><span>,</span><span>ValueFromPipeline</span><span>)]</span><span>
    </span><span>[</span><span>Management.Automation.Language.</span><span>Token</span><span>]</span><span>
    </span><span>$Token</span><span>
  </span><span>)</span><span>

  </span><span>process</span><span>
  </span><span>{</span><span>
    </span><span>switch</span><span>(</span><span>$PSCmdlet</span><span>.</span><span>ParameterSetName</span><span>)</span><span>
    </span><span>{</span><span>
      </span><span># recursively expand token of type "StringExpandable"</span><span>
      </span><span>'ExpandableString'</span><span>  </span><span>{</span><span> 
        </span><span>$StringExpandable</span><span> 
        </span><span>$StringExpandable</span><span>.</span><span>NestedTokens</span><span> </span><span>|</span><span> 
          </span><span>Where-Object</span><span> </span><span>{</span><span> </span><span>$_</span><span> </span><span>}</span><span> </span><span>|</span><span> 
          </span><span>Expand-PSOneToken</span><span>
      </span><span>}</span><span>
      </span><span># return regular token as-is:</span><span>
      </span><span>'Token'</span><span>             </span><span>{</span><span> </span><span>$Token</span><span> </span><span>}</span><span>
      </span><span># should never occur:</span><span>
      </span><span>default</span><span>             </span><span>{</span><span> </span><span>Write-Warning</span><span> </span><span>$_</span><span> </span><span>}</span><span>
    </span><span>}</span><span>
  </span><span>}</span><span>
</span><span>}</span><span>
</span></code>
```

The function uses two **ParameterSets**, one for token of type **StringExpandableToken**, and one for the more generic type **Token**. When tokens are piped into the function, the **Parameter Binder** automatically picks the most appropriate parameter set.

If a **StringExpandableToken** is piped into `Expand-PSOneToken`, the token is emitted, and then the property **NestedToken** with the nested tokens is piped into `Expand-PSOneToken` again. That takes care of all recursively nested tokens.

Be aware that **NestedToken** can be empty. To not continue recursion on empty nested tokens, the code runs **NestedToken** through `Where-Object` and uses the object as clause. If it is **$null**, it gets filtered out.

If a regular **Token** is piped into `Expand-PSOneToken`, it simply gets emitted with no recursivity.

## What’s Next

The new **Parser** provides much richer detail than the old **PSParser** but is still token-based. It is the **Abstract Syntax Tree** (AST) that takes individual tokens and forms higher structures from it. With the help of the **AST**, you can finally find more sophisticated information such as *assignments*, *function definitions*, and much more. That is what we’ll be looking at in the next part

Meanwhile, if you enjoyed the reading then you may want to look at [PowerShell Conference EU](https://powershell.one/powershell-internals/parsing-and-tokenization/psconf.eu) - a place where you find yourself in excellent company! Each year, this conference becomes a busy and friendly meeting point for **Advanced PowerShellers** from more than 35 countries. That’s where things like what you just read about, and the latest & greatest **PowerShell** tricks and gossip are shared. It’s also a perfect place for networking, making new friends that share your very special passion about scripting and **PowerShell**.

Both **Call for Papers** and **Delegate Registration** are open!

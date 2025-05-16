https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree

> The Abstract Syntax Tree (AST) groups tokens into meaningful structures and is the most sophisticated way of analyzing PowerShell code.

# Abstract Syntax Tree - powershell.one
The **PowerShell** parser turns individual characters into meaningful keywords and distinguishes for example *commands*, *parameters*, and *variables*. This is called **tokenization** and was [previously](https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer) covered. These tokens are used for example by editors to colorize the code and show variables in a different color than commands.

## Overview

The parser doesn’t stop there. In order for **PowerShell** to execute code, it needs to know how individual tokens form structures that can be executed. The parser takes the tokens and builds an *Abstract Syntax Tree* (AST) which essentially *groups* tokens into meaningful structures.

### Example: Discovering Commands

For example, a *command* token is grouped together with *parameter* and *argument* tokens to resemble a *command AST* that represents a complete command structure. Only then can **PowerShell** take that information and actually execute the command.

> *Abstract Syntax Tree* is called *tree* because it works like a hierarchical tree: **PowerShell** starts with the first token and then takes the **PowerShell** language definition (*syntax*) to see what the next possible tokens could be. This way, the parser works its way through the code. Either, **PowerShell** succeeds and creates a valid structure of your code, or it encounters *Syntax Errors* and raises an error.
> 
> For example, if a *string* token is followed by a *number* token, this is syntactically not possible, and the parser emits an error:
> 
> ```
> <span># this is a syntax error:</span><span>
> </span><span>"Hello"</span><span> </span><span>10</span><span>
> </span>
> ```
> 
> According to the **PowerShell** language definition, a *string* token can only be followed by an *operator* token which is why this line is syntactically correct, and when you execute it, **PowerShell** knows what to do and emits an excited greeting:
> 
> ```
> <span># this is syntactically correct:</span><span>
> </span><span>"Hello"</span><span> </span><span>*</span><span> </span><span>10</span><span>
> </span>
> ```

## Accessing the AST

Beginning in **PowerShell** 3, the *Abstract Syntax Tree* is exposed to you, so you, too, can now analyze **PowerShell** code and learn about its internal structure.

There are two primary ways to access the AST:

-   **ScriptBlock:** a *scriptblock* is a valid chunk of **PowerShell** code, so it has already been processed by the parser, and the parser has guaranteed that there are no syntax errors in the code. Each *scriptblock* has a property called *AST* that exposes the *Abstract Syntax Tree* of the code contained in the *scriptblock*.
-   **Parser:** you can ask the **PowerShell** parser to parse arbitrary code and return tokens and *AST*. You are basically mimicking what **PowerShell** does when you enter and execute code. Because the parser processes raw text, it is *not* guaranteed that the code is syntactically correct. That’s why the parser is also returning any syntax errors it found.

### Exposing Parsed ScriptBlock Content

When you assign code to a scriptblock, you invoke the **PowerShell** parser *implicitly*. You can’t avoid this. During the assignment process, **PowerShell** invokes the parser to test whether the text is valid **PowerShell** code, and only then does the assignment succeed:

```
<span># you cannot assign invalid code to a scriptblock:</span><span>
</span><span>$code</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>"Hello"</span><span> </span><span>10</span><span> </span><span>}</span><span>
</span>
```

**PowerShell** refuses to execute the code and instead emits an exception explaining the syntax error (*Unexpected Token*):

```
At line:2 char:22
+ $code = { "Hello" 10 }
+                      ~~
Unexpected token '10' in expression or statement.
    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException
    + FullyQualifiedErrorId : UnexpectedToken
```

> **PowerShell** refuses to run any script that contains syntax errors, so if the line above is found *anywhere* in a script, the entire script will break.
> 
> If people are telling you that **PowerShell** is executing scripts line-by-line from top to bottom, that’s really a simplification. In reality, **PowerShell** is feeding the entire code into the parser first.
> 
> If a syntax error is encountered, **PowerShell** stops and won’t execute *anything* which is good because executing a syntactically incorrect script would yield unpredictable results.
> 
> If the code *is* syntactically correct, next **PowerShell** takes the generated *Abstract Syntax Tree* and starts executing the structures inside of it.
> 
> This *typically* happens line-by-line and from top to bottom, but that’s *not* a requirement. For example, the statement **trap** is always executed first, regardless of where in your code it is located, and commands can span across multiple lines or can be nested inside of expandable strings.

You can assign syntactically correct code to a scriptblock:

```
<span># once code is successfully assigned to a scriptblock,</span><span>
</span><span># it is fully parsed and ready to be executed:</span><span>
</span><span>$code</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>"Hello"</span><span> </span><span>*</span><span> </span><span>10</span><span> </span><span>}</span><span>
</span>
```

The scriptblock now contains fully parsed **PowerShell** code that is ready to be invoked:

#### Looking at the AST

Likewise, you can look at the *Abstract Syntax Tree* (AST) that was built by the parser:

```
Attributes         : {}
UsingStatements    : {}
ParamBlock         : 
BeginBlock         : 
ProcessBlock       : 
EndBlock           : "Hello" * 10
DynamicParamBlock  : 
ScriptRequirements : 
Extent             : { "Hello" * 10 }
Parent             : { "Hello" * 10 }
```

I’ll explain in a [second](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#understanding-the-ast) what you actually see here, and what you can do with this. Let’s first continue to look at the role of the parser, and what you can do with it.

#### Testing Valid Code

Since a scriptblock can contain only *valid* code, the scriptblock does not need a property that exposes syntax errors. However, you can get to the syntax errors during implicit parsing. Just catch any exception raised by the parser. This can be used to create a simple test function that identifies syntax errors in **PowerShell** code:

```
<span>function</span><span> </span><span>Test-PowerShellCode</span><span>
</span><span>{</span><span>
    </span><span>param</span><span>
    </span><span>(</span><span>
        </span><span>[</span><span>string</span><span>]</span><span>
        </span><span>$Code</span><span>
    </span><span>)</span><span>

    </span><span>try</span><span>
    </span><span>{</span><span>
        </span><span># try and convert string to scriptblock:</span><span>
        </span><span>$null</span><span> </span><span>=</span><span> </span><span>[</span><span>ScriptBlock</span><span>]::</span><span>Create</span><span>(</span><span>$Code</span><span>)</span><span>
    </span><span>}</span><span>
    </span><span>catch</span><span>
    </span><span>{</span><span>
        </span><span># the parser is invoked implicitly and returns</span><span>
        </span><span># syntax errors as exceptions:</span><span>
        </span><span>$_</span><span>.</span><span>Exception</span><span>.</span><span>InnerException</span><span>.</span><span>Errors</span><span>
    </span><span>}</span><span>
</span><span>}</span><span>
</span>
```

When you call the function with valid code, it returns nothing. When there are syntax errors, the exception returns detailed information about the syntax error(s):

```
<span>Test-PowerShellCode</span><span> </span><span>-Code</span><span> </span><span>'"Hello" 10'</span><span>
</span>
```

```
Extent ErrorId         Message                                           IncompleteInput
------ -------         -------                                           ---------------
10     UnexpectedToken Unexpected token '10' in expression or statement.           False
```

#### Adding Pipeline Support

By adding [pipeline support](https://powershell.one/powershell-internals/attributes/parameters#controlling-pipeline-support), this simple function can search and identify errors in hundreds of scripts:

```
<span>function</span><span> </span><span>Test-PowerShellScript</span><span>
</span><span>{</span><span>
    </span><span>param</span><span>
    </span><span>(</span><span>
        </span><span># accept script path via pipeline</span><span>
        </span><span># accept strings, and accept objects with a property "FullName"</span><span>
        </span><span># (results from Get-ChildItem)</span><span>
        </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ValueFromPipeline</span><span>,</span><span>ValueFromPipelineByPropertyName</span><span>)]</span><span>
        </span><span>[</span><span>Alias</span><span>(</span><span>'FullName'</span><span>)]</span><span>
        </span><span>[</span><span>string</span><span>]</span><span>
        </span><span>$Path</span><span>
    </span><span>)</span><span>

    </span><span># repeat this for all pipeline input:</span><span>
    </span><span>process</span><span>
    </span><span>{</span><span>
        </span><span># read script content:</span><span>
        </span><span>$content</span><span> </span><span>=</span><span> </span><span>Get-Content</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span> </span><span>-Raw</span><span> </span><span>-Encoding</span><span> </span><span>Default</span><span>
        </span><span># get syntax errors:</span><span>
        </span><span>$syntaxErrors</span><span> </span><span>=</span><span> </span><span>Test-PowerShellCode</span><span> </span><span>-Code</span><span> </span><span>$content</span><span>
        </span><span># parse for syntax errors and return results:</span><span>
        </span><span>[</span><span>PSCustomObject</span><span>]@{</span><span>
            </span><span>#</span><span> </span><span>return</span><span> </span><span>file</span><span> </span><span>name</span><span>
            </span><span>Name</span><span> </span><span>=</span><span> </span><span>Split</span><span>-</span><span>Path</span><span> </span><span>-</span><span>Path</span><span> </span><span>$Path</span><span> </span><span>-</span><span>Leaf</span><span>
            </span><span>#</span><span> </span><span>return</span><span> </span><span>$false</span><span> </span><span>if</span><span> </span><span>$syntaxErrors</span><span> </span><span>is</span><span> </span><span>$null</span><span>
            </span><span>HasErrors</span><span> </span><span>=</span><span> </span><span>[</span><span>bool</span><span>](</span><span>$syntaxErrors</span><span>)</span><span>
            </span><span>#</span><span> </span><span>return</span><span> </span><span>syntax</span><span> </span><span>errors</span><span>
            </span><span>Errors</span><span> </span><span>=</span><span> </span><span>$syntaxErrors</span><span>
            </span><span>#</span><span> </span><span>return</span><span> </span><span>full</span><span> </span><span>path</span><span>
            </span><span>Path</span><span> </span><span>=</span><span> </span><span>$Path</span><span>
        </span><span>}</span><span>
    </span><span>}</span><span>
</span><span>}</span><span>
</span>
```

And this is how you could bulk-check your entire script repository for faulty scripts:

```
<span>Get-ChildItem</span><span> </span><span>-Path</span><span> </span><span>$home</span><span> </span><span>-Recurse</span><span> </span><span>-File</span><span> </span><span>-Filter</span><span> </span><span>*.</span><span>ps1</span><span> </span><span>-Include</span><span> </span><span>*.</span><span>ps1</span><span> </span><span>|</span><span>
  </span><span>Test-PowerShellScript</span><span> </span><span>|</span><span>
  </span><span>Where-Object</span><span> </span><span>HasErrors</span><span> </span><span>|</span><span>
  </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Name</span><span>,</span><span> </span><span>Path</span><span> </span><span>-ExpandProperty</span><span> </span><span>Errors</span><span> </span><span>|</span><span>
  </span><span>Out-GridView</span><span> </span><span>-Title</span><span> </span><span>'Bad Scripts'</span><span>
</span>
```

There are three interesting learning points you can take out of this example:

-   Note how the code uses `Select-Object`both with `-Property` and `-ExpandProperty`: the output shows the properties *Name* and *Path* **plus** unwraps the objects found in the property *Errors*, so you immediately see all the detailed information about the syntax errors. You *may* use both parameters in combination as long as there is no naming conflict, i.e. as long as the child objects unwrapped by `-ExpandProperty` don’t conflict with the properties listed in `-Property`.
    
-   Note also how `Get-ChildItem` is using both `-Filter` and `-Include`. The parameter `-Filter` is a fast but unspecific provider-level filter whereas `-Include` is a slow but precise **PowerShell** filter that processes the results delivered by the provider. If you used only `-Include`, the code would take longer to run. If you used only `-Filter`, the results *could* contain more than just *.ps1* scripts (in **Windows PowerShell** at least. This bug has been fixed in **PowerShell** 7 meanwhile):
    
    ```
    <span>Get-ChildItem</span><span> </span><span>-Path</span><span> </span><span>$</span><span>env</span><span>:</span><span>windir</span><span> </span><span>-Recurse</span><span> </span><span>-Filter</span><span> </span><span>*.</span><span>ps1</span><span> </span><span>-ErrorAction</span><span> </span><span>Ignore</span><span> </span><span>|</span><span>
      </span><span>Group-Object</span><span> </span><span>-Property</span><span> </span><span>Extension</span><span> </span><span>-NoElement</span><span>
    </span>
    ```
    
    ```
    Count Name   
    ----- ----   
      715 .ps1   
      539 .ps1xml
    ```
    
-   Note how I implemented a *new* function `Test-PowerShellScript` that internally calls the *existing* function `Test-PowerShellCode`. So why not adding pipeline and file support to `Test-PowerShellCode` directly? Always make sure your functions stay simple and modular. The two separate functions are much easier to understand individually, and each of them has a clear focus, naming, and mission.
    
    `Test-PowerShellScript` focuses entirely on pipeline-support for *script files*, so if that’s something you are interested, simply navigate to the [appropriate](https://powershell.one/powershell-internals/attributes/parameters#controlling-pipeline-support) article. That’s so much easier than fiddling with pages and pages of monstrous catch-all functions or scripts that try and be a swiss army knive for just about everything imaginable.
    

#### Use Case: Identifying Missing Types

Typically, there should never *be* syntax errors in **PowerShell** scripts because they are really something that should have been taken care of and sorted out before saving the script, so why bother?

Syntax errors aren’t just missing quotes or other obvious **PowerShell** dyslexia. For example, **PowerShell** considers it a *syntax error* when a data type is unknown (indicating that there may be something missing).

To find all missing types in your scripts, try this:

```
<span>Get-ChildItem</span><span> </span><span>-Path</span><span> </span><span>$home</span><span> </span><span>-Recurse</span><span> </span><span>-File</span><span> </span><span>-Filter</span><span> </span><span>*.</span><span>ps1</span><span> </span><span>-Include</span><span> </span><span>*.</span><span>ps1</span><span> </span><span>|</span><span>
  </span><span>Test-PowerShellScript</span><span> </span><span>|</span><span>
  </span><span>Where-Object</span><span> </span><span>HasErrors</span><span> </span><span>|</span><span>
  </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Name</span><span>,</span><span> </span><span>Path</span><span> </span><span>-ExpandProperty</span><span> </span><span>Errors</span><span> </span><span>|</span><span>
  </span><span>Where-Object</span><span> </span><span>ErrorId</span><span> </span><span>-eq</span><span> </span><span>TypeNotFound</span><span> </span><span>|</span><span>
  </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Extent</span><span>,</span><span> </span><span>Path</span><span> </span><span>|</span><span>
  </span><span>Out-GridView</span><span> </span><span>-Title</span><span> </span><span>'Missing Data Types'</span><span>
</span>
```

> Missing types are just a *hint* that something may be missing. Often, a script uses `Add-Type` to dynamically load or define .NET assemblies. Of course you won’t see *any* results if your scripts don’t use unknown data types.

#### Use Case: Detect Incompatible PowerShell Code

**PowerShell** 7 introduced a couple of new operators such as the ternary operator (**?**). When you use it in a script, the code becomes incompatible with **Windows PowerShell** and won’t run there anymore.

Keep in mind: `Test-PowerShellCode` is using the parser of the **PowerShell** version you are running it in. So you can use it to identify code that isn’t compatible with this version.

The line below returns a syntax error when you run the command in **Windows PowerShell**, and returns nothing when you run it in **PowerShell 7**:

```
<span>Test-PowerShellCode</span><span> </span><span>-Code</span><span> </span><span>'$true ? "TRUE" : "FALSE"'</span><span>
</span>
```

**Windows PowerShell** returns an error because **?** is a new operator that wasn’t part of the original **Windows PowerShell** language definition:

```
Extent ErrorId         Message                                          IncompleteInput
 ------ -------         -------                                          ---------------
?      UnexpectedToken Unexpected token '?' in expression or statement.           False
```

So you can use the *ErrorId* **UnexpectedToken** to identify code that either is *incompatible* with your current **PowerShell** version or was written by a complete **PowerShell** analphabet:

```
<span>Get-ChildItem</span><span> </span><span>-Path</span><span> </span><span>$home</span><span> </span><span>-Recurse</span><span> </span><span>-File</span><span> </span><span>-Filter</span><span> </span><span>*.</span><span>ps1</span><span> </span><span>-Include</span><span> </span><span>*.</span><span>ps1</span><span> </span><span>|</span><span>
  </span><span>Test-PowerShellScript</span><span> </span><span>|</span><span>
  </span><span>Where-Object</span><span> </span><span>HasErrors</span><span> </span><span>|</span><span>
  </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Name</span><span>,</span><span> </span><span>Path</span><span> </span><span>-ExpandProperty</span><span> </span><span>Errors</span><span> </span><span>|</span><span>
  </span><span>Where-Object</span><span> </span><span>ErrorId</span><span> </span><span>-eq</span><span> </span><span>UnexpectedToken</span><span> </span><span>|</span><span>
  </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Extent</span><span>,</span><span> </span><span>Path</span><span> </span><span>|</span><span>
  </span><span>Out-GridView</span><span> </span><span>-Title</span><span> </span><span>'Potentially Incompatible Code'</span><span> </span><span>-Passthru</span><span> </span><span>|</span><span>
  </span><span>Foreach-Object</span><span> </span><span>{</span><span> </span><span>notepad</span><span> </span><span>$_</span><span>.</span><span>Path</span><span> </span><span>}</span><span>
</span>
```

The code opens a gridview with all of the instances of unexpected tokens. Select the scripts you want to investigate (hold `Ctrl` to select multiple) to open them in *notepad*.

> If you get *no* results, obviously *no* gridview opens. You know then that there were simply no scripts with unexpected tokens.

### Invoking Parser Directly

The **PowerShell** parser is publicly accessible via its API (*Application Programming Interface*) so you can send arbitrary code to the parser and have it return tokens, encountered syntax errors, and the AST (*Abstract Syntax Tree*):

```
<span># code to parse. Can be one line or pages of code read from a file</span><span>
</span><span># via Get-Content -Raw -Path c:\somepath\somefile.ps1 -Encoding Default</span><span>
</span><span>$code</span><span> </span><span>=</span><span> </span><span>' "Hello" * 10 '</span><span>

</span><span># these variables must exist and will be filled by reference later:</span><span>
</span><span>$tokens</span><span> </span><span>=</span><span> </span><span>$errors</span><span> </span><span>=</span><span> </span><span>$null</span><span>

</span><span># send code to parser:</span><span>
</span><span>$ast</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseInput</span><span>(</span><span>$code</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$tokens</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>

</span><span># parser returns the AST and fills the variables $tokens and $errors</span><span>
</span><span># $tokens is an array with all tokens, and $errors is an array with all syntax errors</span><span>

</span><span># opens a gridview with details about all identified token:</span><span>
</span><span>$tokens</span><span>  </span><span>|</span><span> </span><span>Out-GridView</span><span> </span><span>-Title</span><span> </span><span>'Token'</span><span>

</span><span># this will do nothing since there are no syntax errors in the sample code.</span><span>
</span><span># play with $code to see how syntax errors surface:</span><span>
</span><span>$errors</span><span> </span><span>|</span><span> </span><span>Out-GridView</span><span> </span><span>-Title</span><span> </span><span>'Syntax Errors'</span><span>

</span><span># $ast returns the abstract syntax tree:</span><span>
</span><span>$ast</span><span>
</span>
```

> Since the parser takes *any* text, including code with syntax errors, it returns all encountered syntax errors. That’s different from calling the parser *implicitly* where syntax errors would automatically throw exceptions.

We have looked at token [previously](https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer), and the syntax errors surfacing in `$errors` are identical to the ones you received [above](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#testing-valid-code). The AST surfacing in `$ast` is almost identical to the one you received [earlier](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#looking-at-the-ast):

```
Attributes         : {}
UsingStatements    : {}
ParamBlock         : 
BeginBlock         : 
ProcessBlock       : 
EndBlock           : "Hello" * 10
DynamicParamBlock  : 
ScriptRequirements : 
Extent             :  "Hello" * 10 
Parent             : 
```

> The AST looks a little bit different because this time you submitted a string instead of a scriptblock to the parser.

#### ParseInput()

The parser method **ParseInput()** used in this example has two overloads, and the example above used the first one:

```
OverloadDefinitions
-------------------
static ScriptBlockAst ParseInput(string input, [ref] Token[] tokens, [ref] ParseError[] errors)
static ScriptBlockAst ParseInput(string input, string fileName, [ref] Token[] tokens, [ref] ParseError[] errors)   
```

The second overload takes an additional *fileName* argument, and the first overload essentially calls the second one internally and submits `$null` for this argument.

But what does it do? It is simply adding an (arbitrary) filename to the resulting objects. It is *not* reading from this file, and in fact the file does not even need to exist. Put short: the second overload is used internally with **CIM** modules and manifests and can be safely ignored.

#### ParseFile()

If you *really* want to parse file content (and not strings), use the method **ParseFile()**. Here is its signature:

```
OverloadDefinitions
-------------------
static ScriptBlockAst ParseFile(string fileName, [ref] Token[] tokens, [ref] ParseError[] errors)
```

Instead of submitting a string with the code to parse, submit a string with the *path* to a script file *containing* the code. **ParseFile()** opens the file for reading using default encoding.

So with this method you could rewrite `Test-PowerShellScript` from [above](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#adding-pipeline-support) and invoke the parser directly to test for syntax errors:

```
<span>function</span><span> </span><span>Test-PowerShellScript</span><span>
</span><span>{</span><span>
    </span><span>param</span><span>
    </span><span>(</span><span>
        </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ValueFromPipeline</span><span>,</span><span>ValueFromPipelineByPropertyName</span><span>)]</span><span>
        </span><span>[</span><span>Alias</span><span>(</span><span>'FullName'</span><span>)]</span><span>
        </span><span>[</span><span>string</span><span>]</span><span>
        </span><span>$Path</span><span>
    </span><span>)</span><span>

    </span><span>process</span><span>
    </span><span>{</span><span>
        </span><span># create reference variable to return syntax errors:</span><span>
        </span><span>$errors</span><span> </span><span>=</span><span> </span><span>$null</span><span>
        </span><span># parse script content and ignore ast and tokens</span><span>
        </span><span># we are just interested in syntax errors:</span><span>
        </span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseFile</span><span>(</span><span>$Path</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$null</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>
        
        </span><span>[</span><span>PSCustomObject</span><span>]@{</span><span>
            </span><span>Name</span><span> </span><span>=</span><span> </span><span>Split</span><span>-</span><span>Path</span><span> </span><span>-</span><span>Path</span><span> </span><span>$Path</span><span> </span><span>-</span><span>Leaf</span><span>
            </span><span>#</span><span> </span><span>return</span><span> </span><span>$false</span><span> </span><span>if</span><span> </span><span>$errors</span><span> </span><span>is</span><span> </span><span>empty</span><span>
            </span><span>HasErrors</span><span> </span><span>=</span><span> </span><span>$errors</span><span>.</span><span>Count</span><span> </span><span>-</span><span>gt</span><span> </span><span>0</span><span>
            </span><span>#</span><span> </span><span>return</span><span> </span><span>syntax</span><span> </span><span>errors</span><span>
            </span><span>Errors</span><span> </span><span>=</span><span> </span><span>$errors</span><span>
            </span><span>Path</span><span> </span><span>=</span><span> </span><span>$Path</span><span>
        </span><span>}</span><span>
    </span><span>}</span><span>
</span><span>}</span><span>
</span>
```

## Understanding the AST

By now you know how to invoke the parser [*indirectly*](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#looking-at-the-ast) and [*directly*](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#invoking-parser-directly) and get a hold of the AST. So what can you do with it?

The *Abstract Syntax Tree* (AST) is a tree of *Ast* objects. The top of this tree is what the parser returns to you, for example in the [example code](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#invoking-parser-directly) above:

```
<span># since it is the top of the tree, it has no parent and yields $null:</span><span>
</span><span>$ast</span><span>.</span><span>Parent</span><span>

</span><span># the "Extent" describes the PowerShell code this Ast object represents</span><span>
</span><span># since it is the top element, it represents the entire code:</span><span>
</span><span>$ast</span><span>.</span><span>Extent</span><span>
</span>
```

```
File                : 
StartScriptPosition : System.Management.Automation.Language.InternalScriptPosition
EndScriptPosition   : System.Management.Automation.Language.InternalScriptPosition
StartLineNumber     : 1
StartColumnNumber   : 1
EndLineNumber       : 1
EndColumnNumber     : 15
Text                :  "Hello" * 10 
StartOffset         : 0
EndOffset           : 14
```

### Ast Objects

Any *Ast* object you come across when you traverse the *Abstract Syntax Tree* has the properties **Parent** and **Extent**. **Parent** defines the tree relationships, and **Extent** defines the **PowerShell** code that an *Ast* object covers.

#### Default Properties

Or technically speaking. all *Ast* objects *derive* from the type **\[System.Management.Automation.Language.Ast\]** which in turn implements the properties **Parent** and **Extent**:

```
<span>[</span><span>System.Management.Automation.Language.</span><span>ScriptBlockAst</span><span>]</span><span>.</span><span>BaseType</span><span>.</span><span>GetProperties</span><span>()</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Name</span><span>,</span><span> </span><span>PropertyType</span><span>
</span>
```

```
Name   PropertyType                                       
----   ------------                                       
Extent System.Management.Automation.Language.IScriptExtent
Parent System.Management.Automation.Language.Ast     
```

**Extent** provides you with the original **PowerShell** code extend and position that is covered by the *Ast* object:

```
<span>[</span><span>System.Management.Automation.Language.</span><span>ScriptExtent</span><span>]</span><span>.</span><span>GetProperties</span><span>()</span><span> </span><span>|</span><span> </span><span>Sort-Object</span><span> </span><span>-Property</span><span> </span><span>Name</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Name</span><span>,</span><span> </span><span>PropertyType</span><span>
</span>
```

```
Name                PropertyType
----                ------------
EndColumnNumber     System.Int32
EndLineNumber       System.Int32
EndOffset           System.Int32
EndScriptPosition   System.Management.Automation.Language.IScriptPosition
File                System.String
StartColumnNumber   System.Int32
StartLineNumber     System.Int32
StartOffset         System.Int32
StartScriptPosition System.Management.Automation.Language.IScriptPosition
Text                System.String
```

And with the help of the reference found in **Parent**, you can easily traverse the tree *bottom-to-top*.

Which raises the question: how do you traverse the opposite direction, from *top-to-bottom*? After all, the parser returns the *top* tree element.

#### Default Methods

That’s why the type **\[System.Management.Automation.Language.Ast\]** also defines a number of methods:

```
<span>$ast</span><span>.</span><span>PSObject</span><span>.</span><span>Methods</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>Name</span><span>,</span><span> </span><span>@{</span><span>Name</span><span>=</span><span>'Signature'</span><span>;</span><span>E</span><span>=</span><span>{</span><span>"</span><span>$_</span><span>"</span><span>.</span><span>Trim</span><span>()</span><span>}}</span><span>
</span>
```

```
Name                   Signature
----                   ---------
Copy                   System.Management.Automation.Language.Ast Copy()
Find                   System.Management.Automation.Language.Ast Find(System.Func[System.Management.Automation.Language.Ast,bool] predicate, bool searchNestedScriptBlocks)
FindAll                System.Collections.Generic.IEnumerable[System.Management.Automation.Language.Ast] FindAll(System.Func[System.Management.Automation.Language.Ast,bool] predicate, b...
Visit                  System.Object Visit(System.Management.Automation.Language.ICustomAstVisitor astVisitor), void Visit(System.Management.Automation.Language.AstVisitor astVisitor)
```

> I removed all generic methods such as the accessor methods for properties, and the methods derived from **\[System.Object\]**, and focused only on methods newly defined in the *Ast* type.

**Copy()** copies (clones) an *Ast* object. The remaining functions help you traverse the *Ast* tree:

| Method | Description |
| --- | --- |
| **Find()** | Finds the first *Ast* object in the tree that matches the defined criteria |
| **FindAll()** | Finds *all* *Ast* objects in the tree that match the defined criteria |
| **Visit()** | Submits a *astVisitor* object that implements methods for each *Ast* object. These methods are called for each *Ast* object in the tree. **Visit()** is more efficient than **Find()/FindAll()** but since a custom-tailored *astVisitor* object is required, it is much more complex to use. |

### Exposing Ast Objects

The parser always returns the top tree element, and with **FindAll()** you can traverse the tree top-to-bottom and expose all child objects.

Here is a quick example how to expose all *Ast* objects in the tree based on our [previous](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#invoking-parser-directly) example:

```
<span>$code</span><span> </span><span>=</span><span> </span><span>' "Hello" * 10 '</span><span>
</span><span>$ast</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseInput</span><span>(</span><span>$code</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$null</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$null</span><span>)</span><span>

</span><span># search criteria similar to how Where-Object works:</span><span>
</span><span># when this scriptblock returns $true, the object is included</span><span>
</span><span># let's include everything and always return $true:</span><span>
</span><span>$predicate</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>$true</span><span> </span><span>}</span><span>

</span><span># search for all ast objects, including nested scriptblocks:</span><span>
</span><span>$recurse</span><span> </span><span>=</span><span> </span><span>$true</span><span>

</span><span># traverse the tree from top to bottom, and emit all Ast objects:</span><span>
</span><span>$ast</span><span>.</span><span>FindAll</span><span>(</span><span>$predicate</span><span>,</span><span> </span><span>$recurse</span><span>)</span><span>
</span>
```

The result is a series of *Ast* objects describing the structures found in the **PowerShell** source code:

```
Attributes         : {}
UsingStatements    : {}
ParamBlock         : 
BeginBlock         : 
ProcessBlock       : 
EndBlock           : "Hello" * 10
DynamicParamBlock  : 
ScriptRequirements : 
Extent             :  "Hello" * 10 
Parent             : 

Unnamed    : True
BlockKind  : End
Statements : {"Hello" * 10}
Traps      : 
Extent     : "Hello" * 10
Parent     :  "Hello" * 10 

PipelineElements : {"Hello" * 10}
Extent           : "Hello" * 10
Parent           : "Hello" * 10

Expression   : "Hello" * 10
Redirections : {}
Extent       : "Hello" * 10
Parent       : "Hello" * 10

Operator      : Multiply
Left          : "Hello"
Right         : 10
ErrorPosition : *
StaticType    : System.Object
Extent        : "Hello" * 10
Parent        : "Hello" * 10

StringConstantType : DoubleQuoted
Value              : Hello
StaticType         : System.String
Extent             : "Hello"
Parent             : "Hello" * 10

Value      : 10
StaticType : System.Int32
Extent     : 10
Parent     : "Hello" * 10
```

### Kinds of Ast Objects

Each *Ast* object derives from the common type **\[System.Management.Automation.Language.Ast\]** and thus exposes the properties **Parent** and **Extent**. When you look at the results above, though, you immediately notice that each object exposes different *additional* details.

Let’s have a look at the actual types of these *Ast* objects next:

```
<span># PowerShell code to analyze:</span><span>
</span><span>$code</span><span> </span><span>=</span><span> </span><span>' "Hello" * 10 '</span><span>

</span><span># parse code:</span><span>
</span><span>$ast</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseInput</span><span>(</span><span>$code</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$null</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$null</span><span>)</span><span>

</span><span># include all ast objects:</span><span>
</span><span>$predicate</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>$true</span><span> </span><span>}</span><span>

</span><span># search for all ast objects, including nested scriptblocks:</span><span>
</span><span>$recurse</span><span> </span><span>=</span><span> </span><span>$true</span><span>

</span><span># expose the object type:</span><span>
</span><span>$type</span><span> </span><span>=</span><span> </span><span>@{</span><span>
  </span><span>Name</span><span> </span><span>=</span><span> </span><span>'Type'</span><span>
  </span><span>Expression</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>$_</span><span>.</span><span>GetType</span><span>().</span><span>Name</span><span> </span><span>}</span><span>
</span><span>}</span><span>

</span><span># expose the code position:</span><span>
</span><span>$position</span><span> </span><span>=</span><span> </span><span>@{</span><span>
  </span><span>Name</span><span> </span><span>=</span><span> </span><span>'Position'</span><span>
  </span><span>Expression</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>'{0,3}-{1,-3}'</span><span> </span><span>-</span><span>f</span><span>  </span><span>$_</span><span>.</span><span>Extent</span><span>.</span><span>StartOffset</span><span>,</span><span> </span><span>$_</span><span>.</span><span>Extent</span><span>.</span><span>EndOffset</span><span>,</span><span> </span><span>$_</span><span>.</span><span>Extent</span><span>.</span><span>Text</span><span> </span><span>}</span><span>
</span><span>}</span><span>

</span><span># expose the text of the code:</span><span>
</span><span>$text</span><span> </span><span>=</span><span> </span><span>@{</span><span>
  </span><span>Name</span><span> </span><span>=</span><span> </span><span>'Code'</span><span>
  </span><span>Expression</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>$_</span><span>.</span><span>Extent</span><span>.</span><span>Text</span><span> </span><span>}</span><span>
</span><span>}</span><span>


</span><span># find the ast objects:</span><span>
</span><span>$astObjects</span><span> </span><span>=</span><span> </span><span>$ast</span><span>.</span><span>FindAll</span><span>(</span><span>$predicate</span><span>,</span><span> </span><span>$recurse</span><span>)</span><span>

</span><span># output the ast type and code position</span><span>
</span><span>$astObjects</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-Property</span><span> </span><span>$position</span><span>,</span><span> </span><span>$type</span><span>,</span><span> </span><span>$text</span><span>
</span>
```

The result visualizes the many different *Ast* objects that describe the code:

```
Position Type                        Code          
-------- ----                        ----          
  0-14   ScriptBlockAst               "Hello" * 10 
  1-13   NamedBlockAst               "Hello" * 10  
  1-13   PipelineAst                 "Hello" * 10  
  1-13   CommandExpressionAst        "Hello" * 10  
  1-13   BinaryExpressionAst         "Hello" * 10  
  1-8    StringConstantExpressionAst "Hello"       
 11-13   ConstantExpressionAst       10     
```

#### “Reading” Ast Objects

The *Ast* starts with a generic *ScriptBlockAst* and then starts to become increasingly specific: the *ScriptBlockAst* contains one *NamedBlockAst* which turns out to be a *PipelineAst* (a **PowerShell** pipeline) which contains exactly one *CommandExpressionAst* (a **PowerShell** command) which turns out to be a *BinaryExpressionAst* (a binary operator statement), each covering code position 1 to 13.

The *BinaryExpressionAst* is broken down into the two components each binary operator is made up of: on the left side a *StringConstantExpressionAst* (a literal string), and on the right side a *ConstantExpressionAst* (a number).

### Ast Object Inheritance

The nested hierarchy of *Ast* objects describes the **PowerShell** syntax (and evolution). There are a few new types introduced in **PowerShell** 7 (and marked in red) to cater for newly added syntax such as the *ternary operator*:

## Searching For Ast Elements

The methods **Find()** and **FindAll()** can *filter* and search elements for you. In previous examples, the entire *Ast* tree was traversed, and *all* *Ast* objects returned. You can as well search for *specific* *Ast* objects by adjusting the *predicate* that is submitted to the methods.

This *predicate* is a scriptblock that gets executed for every *Ast* object. The object is included in the results when the scriptblock evaluates to `$true`. In the previous examples, the predicate scriptblock always returned `$true`, thus returning *every* object.

To filter, the predicate scriptblock receives an argument: the *Ast* object to test. So your predicate scriptblock can employ whatever testing is required to determine whether a given *Ast* object should be returned or not.

### Searching For Commands

For example, you [learned](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#reading-ast-objects) that a *CommandExpressionAst* represents a command including all of its parameters and arguments. If you’d like to auto-document your code and create a list of all commands used by a script, you can ask the *Ast* to find all *Ast* objects of type *CommandExpressionAst*:

```
<span>function</span><span> </span><span>Get-PowerShellCommand</span><span>
</span><span>{</span><span>
  </span><span>param</span><span>
  </span><span>(</span><span>
    </span><span># accept string path to powershell files</span><span>
    </span><span># accept objects with FullName property</span><span>
    </span><span># accept pipeline input</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ValueFromPipeline</span><span>,</span><span>ValueFromPipelineByPropertyName</span><span>)]</span><span>
    </span><span>[</span><span>Alias</span><span>(</span><span>'FullName'</span><span>)]</span><span>
    </span><span>[</span><span>string</span><span>]</span><span>
    </span><span>$Path</span><span>
  </span><span>)</span><span>

  </span><span># do this for each file:</span><span>
  </span><span>process</span><span>
  </span><span>{</span><span>
    </span><span># parse file and focus on ast only:</span><span>
    </span><span>$ast</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseFile</span><span>(</span><span>$Path</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$null</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$null</span><span>)</span><span>

    </span><span># include command ast objects only</span><span>
    </span><span># (return $true only for objects that are of required type)</span><span>
    </span><span>$predicate</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>param</span><span>(</span><span>$astObject</span><span>)</span><span>  </span><span>$astObject</span><span> </span><span>-is</span><span> </span><span>[</span><span>System.Management.Automation.Language.</span><span>CommandExpressionAst</span><span>]</span><span> </span><span>}</span><span>
        
    </span><span># search for all ast objects, including nested scriptblocks:</span><span>
    </span><span>$recurse</span><span> </span><span>=</span><span> </span><span>$true</span><span>
    
    </span><span># find the ast objects:</span><span>
    </span><span>$ast</span><span>.</span><span>FindAll</span><span>(</span><span>$predicate</span><span>,</span><span> </span><span>$recurse</span><span>)</span><span> </span><span>|</span><span>
    
    </span><span># take the command expression from the Ast object, and return it</span><span>
    </span><span># with the file path and code position (Line, Column):</span><span>
    </span><span>ForEach-Object</span><span> </span><span>{</span><span>
      </span><span>[</span><span>PSCustomObject</span><span>]@{</span><span>
        </span><span>Extent</span><span> </span><span>=</span><span> </span><span>(</span><span> </span><span>'[{0,2}:{1,-2}]'</span><span> </span><span>-</span><span>f</span><span>  </span><span>$_</span><span>.</span><span>Extent</span><span>.</span><span>StartLineNumber</span><span>,</span><span> </span><span>$_</span><span>.</span><span>Extent</span><span>.</span><span>StartColumnNumber</span><span> </span><span>)</span><span>
        </span><span>Expression</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Expression</span><span>
        </span><span>Path</span><span> </span><span>=</span><span> </span><span>$Path</span><span>
      </span><span>}</span><span>
    </span><span>}</span><span>
  </span><span>}</span><span>
</span><span>}</span><span>
</span>
```

#### Defining The Predicate

The only new part about above code is the predicate in `$predicate`: it uses **param** to receive arguments from the caller.

The *Ast* submits the *Ast* object that it is about to return. The predicate scriptblock can now test the object in `$astObject`. If it is of the type we are after, the predicate scriptblock returns `$true`, and the object is included in the results.

#### Testing

You can submit either a path to `Test-PowerShellCommand` or pipe files into the command. If you are using the *ISE* editor, make sure you *save* above file, then run this in the interactive console pane:

```
<span># this works only if you are using the ISE editor, </span><span>
</span><span># and there is a *saved* file in the current script pane</span><span>
</span><span>$result</span><span> </span><span>=</span><span> </span><span>Get-Item</span><span> </span><span>-Path</span><span> </span><span>$psise</span><span>.</span><span>CurrentFile</span><span>.</span><span>FullPath</span><span> </span><span>|</span><span> </span><span>Get-PowerShellCommand</span><span>
</span><span>$result</span><span>
</span>
```

If you prefer *VSCode*, again make sure the code is saved (or there is another saved file present in the active editor pane), then run this in the interactive console pane:

```
<span># this works only if you are using the VSCode editor, </span><span>
</span><span># and there is a *saved* file in the current script pane</span><span>
</span><span>$result</span><span> </span><span>=</span><span> </span><span>Get-Item</span><span> </span><span>-Path</span><span> </span><span>$pseditor</span><span>.</span><span>GetEditorContext</span><span>()</span><span>.</span><span>CurrentFile</span><span>.</span><span>Path</span><span> </span><span>|</span><span> </span><span>Get-PowerShellCommand</span><span>
</span><span>$result</span><span>
</span>
```

The result looks like this:

```
Extent  Expression
------  ----------
[13:12] [System.Management.Automation.Language.Parser]::ParseFile($Path, [ref]$null, [ref]$null)
[16:18] { param($astObject)  $astObject -is [System.Management.Automation.Language.CommandExpressionAst] }
[16:39] $astObject -is [System.Management.Automation.Language.CommandExpressionAst]
[19:16] $true
[21:5 ] $ast.FindAll($predicate, $recurse)
[25:7 ] [PSCustomObject]@{...
[26:18] ( '[{0,2}:{1,-2}]' -f  $_.Extent.StartLineNumber, $_.Extent.StartColumnNumber )
[26:20] '[{0,2}:{1,-2}]' -f  $_.Extent.StartLineNumber, $_.Extent.StartColumnNumber
[27:22] $_.Expression
[28:16] $Path
```

#### Evaluating Results

The *Ast* returned all commands found in this script. As you see, a **PowerShell** command is *any* executable statement and can be an application, a cmdlet, but also a method invocation or just a variable or scriptblock.

That’s why the *Ast* further refines the commands: **Expression** really is a different object for different types of expressions:

```
<span>$result</span><span>.</span><span>Expression</span><span> </span><span>|</span><span> </span><span>ForEach-Object</span><span> </span><span>{</span><span> </span><span>$_</span><span>.</span><span>GetType</span><span>()</span><span>.</span><span>Name</span><span> </span><span>}</span><span>
</span>
```

```
InvokeMemberExpressionAst
ScriptBlockExpressionAst
BinaryExpressionAst
VariableExpressionAst
InvokeMemberExpressionAst
ConvertExpressionAst
ParenExpressionAst
BinaryExpressionAst
MemberExpressionAst
VariableExpressionAst
```

## Picking Suitable Ast Types

To work efficiently with the *Ast* and find what you are after, the most important step to take is to understand the different *Ast* types, and what they represent.

You may want to review the [object inheritance](https://powershell.one/powershell-internals/parsing-and-tokenization/abstract-syntax-tree#ast-object-inheritance) tree: look up *CommandElementAst*, then *ExpressionAst*, and you see the list of *Ast* expressions that can be returned above.

### Investigate By Example

Probably the best and easiest way to find suitable *Ast* objects is to learn by example: create a simple test setup like below, and examine how your sample code turns up in the *Ast*:

```
<span>$code</span><span> </span><span>=</span><span>
</span><span>{</span><span>
  </span><span># place your test code here (make it as simple as you can):</span><span>
  </span><span>$a</span><span> </span><span>=</span><span> </span><span>1</span><span>
</span><span>}</span><span>

</span><span># return the ast information:</span><span>
</span><span>$code</span><span>.</span><span>Ast</span><span>.</span><span>FindAll</span><span>(</span><span> </span><span>{</span><span> </span><span>$true</span><span> </span><span>},</span><span> </span><span>$true</span><span>)</span><span> </span><span>|</span><span>
  </span><span>ForEach-Object</span><span> </span><span>{</span><span>
    </span><span>[</span><span>PSCustomObject</span><span>]@{</span><span>
      </span><span>Type</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>GetType</span><span>().</span><span>FullName</span><span>
      </span><span>Code</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Extent</span><span>.</span><span>Text</span><span>
    </span><span>}</span><span>
  </span><span>}</span><span>
</span>
```

In this example, I investigated the statement `$a = 1`, and this is the output:

```
Type                                                         Code
----                                                         ----
System.Management.Automation.Language.ScriptBlockAst         {...
System.Management.Automation.Language.NamedBlockAst          $a = 1
System.Management.Automation.Language.AssignmentStatementAst $a = 1
System.Management.Automation.Language.VariableExpressionAst  $a
System.Management.Automation.Language.CommandExpressionAst   1
System.Management.Automation.Language.ConstantExpressionAst  1
```

### Visualize The Tree

It may be helpful to add the *Ast* object relationships to the output, and visualize the tree, and how the objects are nested. That’s why I created `Convert-CodeToAst` that takes any simple (or complex) **PowerShell** code (scriptblock) and outputs the object hierarchy and involved types:

```
<span>function</span><span> </span><span>Convert-CodeToAst</span><span>
</span><span>{</span><span>
  </span><span>param</span><span>
  </span><span>(</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>)]</span><span>
    </span><span>[</span><span>ScriptBlock</span><span>]</span><span>
    </span><span>$Code</span><span>
  </span><span>)</span><span>


  </span><span># build a hashtable for parents</span><span>
  </span><span>$hierarchy</span><span> </span><span>=</span><span> </span><span>@{}</span><span>

  </span><span>$code</span><span>.</span><span>Ast</span><span>.</span><span>FindAll</span><span>(</span><span> </span><span>{</span><span> </span><span>$true</span><span> </span><span>},</span><span> </span><span>$true</span><span>)</span><span> </span><span>|</span><span>
  </span><span>ForEach-Object</span><span> </span><span>{</span><span>
    </span><span># take unique object hash as key</span><span>
    </span><span>$id</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Parent</span><span>.</span><span>GetHashCode</span><span>()</span><span>
    </span><span>if</span><span> </span><span>(</span><span>$hierarchy</span><span>.</span><span>ContainsKey</span><span>(</span><span>$id</span><span>)</span><span> </span><span>-eq</span><span> </span><span>$false</span><span>)</span><span>
    </span><span>{</span><span>
      </span><span>$hierarchy</span><span>[</span><span>$id</span><span>]</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Collections.</span><span>ArrayList</span><span>]@()</span><span>
    </span><span>}</span><span>
    </span><span>$null</span><span> </span><span>=</span><span> </span><span>$hierarchy</span><span>[</span><span>$id</span><span>]</span><span>.</span><span>Add</span><span>(</span><span>$_</span><span>)</span><span>
    </span><span># add ast object to parent</span><span>
    
  </span><span>}</span><span>
  
  </span><span># visualize tree recursively</span><span>
  </span><span>function</span><span> </span><span>Visualize-Tree</span><span>(</span><span>$Id</span><span>,</span><span> </span><span>$Indent</span><span> </span><span>=</span><span> </span><span>0</span><span>)</span><span>
  </span><span>{</span><span>
    </span><span># use this as indent per level:</span><span>
    </span><span>$space</span><span> </span><span>=</span><span> </span><span>'--'</span><span> </span><span>*</span><span> </span><span>$indent</span><span>
    </span><span>$hierarchy</span><span>[</span><span>$id</span><span>]</span><span> </span><span>|</span><span> </span><span>ForEach-Object</span><span> </span><span>{</span><span>
      </span><span># output current ast object with appropriate</span><span>
      </span><span># indentation:</span><span>
      </span><span>'{0}[{1}]: {2}'</span><span> </span><span>-f</span><span> </span><span>$space</span><span>,</span><span> </span><span>$_</span><span>.</span><span>GetType</span><span>()</span><span>.</span><span>Name</span><span>,</span><span> </span><span>$_</span><span>.</span><span>Extent</span><span>
    
      </span><span># take id of current ast object</span><span>
      </span><span>$newid</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>GetHashCode</span><span>()</span><span>
      </span><span># recursively look at its children (if any):</span><span>
      </span><span>if</span><span> </span><span>(</span><span>$hierarchy</span><span>.</span><span>ContainsKey</span><span>(</span><span>$newid</span><span>))</span><span>
      </span><span>{</span><span>
        </span><span>Visualize-Tree</span><span> </span><span>-id</span><span> </span><span>$newid</span><span> </span><span>-indent</span><span> </span><span>(</span><span>$indent</span><span> </span><span>+</span><span> </span><span>1</span><span>)</span><span>
      </span><span>}</span><span>
    </span><span>}</span><span>
  </span><span>}</span><span>

  </span><span># start visualization with ast root object:</span><span>
  </span><span>Visualize-Tree</span><span> </span><span>-id</span><span> </span><span>$code</span><span>.</span><span>Ast</span><span>.</span><span>GetHashCode</span><span>()</span><span>
</span><span>}</span><span>
</span>
```

Call it like this:

```
<span>Convert-CodeToAst</span><span> </span><span>-Code</span><span> </span><span>{</span><span>
  </span><span># place your test code here (make it as simple as you can):</span><span>
  </span><span>$a</span><span> </span><span>=</span><span> </span><span>1</span><span>
</span><span>}</span><span>
</span>
```

The result looks like this:

```
[NamedBlockAst]: $a = 1
--[AssignmentStatementAst]: $a = 1
----[VariableExpressionAst]: $a
----[CommandExpressionAst]: 1
------[ConstantExpressionAst]: 1
```

## Returning Ast Objects

Here is a *catch-all* helper function that can be used to easily retrieve *Ast* objects of given type from **PowerShell** code:

```
<span>function</span><span> </span><span>Get-PsOneAst</span><span>
</span><span>{</span><span>
  </span><span>param</span><span>
  </span><span>(</span><span>
    </span><span># PowerShell code to examine:</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ValueFromPipeline</span><span>)]</span><span>
    </span><span>[</span><span>string</span><span>]</span><span>
    </span><span>$Code</span><span>,</span><span>
    
    </span><span># requested Ast type</span><span>
    </span><span># use dynamic argument completion:</span><span>
    </span><span>[</span><span>ArgumentCompleter</span><span>({</span><span>
          </span><span># receive information about current state:</span><span>
          </span><span>param</span><span>(</span><span>$commandName</span><span>,</span><span> </span><span>$parameterName</span><span>,</span><span> </span><span>$wordToComplete</span><span>,</span><span> </span><span>$commandAst</span><span>,</span><span> </span><span>$fakeBoundParameters</span><span>)</span><span>
    
    
          </span><span># get all ast types</span><span>
          </span><span>[</span><span>PSObject</span><span>]</span><span>.</span><span>Assembly</span><span>.</span><span>GetTypes</span><span>()</span><span>.</span><span>Where</span><span>{</span><span>$_</span><span>.</span><span>Name</span><span>.</span><span>EndsWith</span><span>(</span><span>'Ast'</span><span>)}</span><span>.</span><span>Name</span><span> </span><span>|</span><span> 
            </span><span>Sort</span><span>-Object</span><span> </span><span>|</span><span>
          </span><span># filter results by word to complete</span><span>
          </span><span>Where</span><span>-Object</span><span> </span><span>{</span><span> </span><span>$_</span><span>.</span><span>LogName</span><span> </span><span>-like</span><span> </span><span>"</span><span>$wordToComplete</span><span>*"</span><span> </span><span>}</span><span> </span><span>|</span><span> 
          </span><span>Foreach</span><span>-Object</span><span> </span><span>{</span><span> 
            </span><span># create completionresult items:</span><span>
            </span><span>[</span><span>System.Management.Automation.</span><span>CompletionResult</span><span>]::</span><span>new</span><span>(</span><span>$_</span><span>,</span><span> </span><span>$_</span><span>,</span><span> </span><span>"ParameterValue"</span><span>,</span><span> </span><span>$_</span><span>)</span><span>
          </span><span>}</span><span>
            </span><span>})]</span><span>
    </span><span>$AstType</span><span> </span><span>=</span><span> </span><span>'*'</span><span>,</span><span>
    
    </span><span># when set, do not recurse into nested scriptblocks:</span><span>
    </span><span>[</span><span>Switch</span><span>]</span><span>
    </span><span>$NoRecursion</span><span>
  </span><span>)</span><span>

  </span><span>begin</span><span>
  </span><span>{</span><span>
    </span><span># create the filter predicate by using the submitted $AstType</span><span>
    </span><span># if the user did not specify it is "*" by default, including all:</span><span>
    </span><span>$predicate</span><span> </span><span>=</span><span> </span><span>{</span><span> </span><span>param</span><span>(</span><span>$astObject</span><span>)</span><span> </span><span>$astObject</span><span>.</span><span>GetType</span><span>()</span><span>.</span><span>Name</span><span> </span><span>-like</span><span> </span><span>$AstType</span><span> </span><span>}</span><span>
  </span><span>}</span><span>  
  </span><span># do this for every submitted code:</span><span>
  </span><span>process</span><span>
  </span><span>{</span><span>
    </span><span># we need to read the errors because we are accepting text which</span><span>
    </span><span># can contain syntax errors:</span><span>
    </span><span>$errors</span><span> </span><span>=</span><span> </span><span>$null</span><span>
    </span><span>$ast</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Management.Automation.Language.</span><span>Parser</span><span>]::</span><span>ParseInput</span><span>(</span><span>$Code</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$null</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>
    
    </span><span># if the code contains syntax errors and is invalid, bail out:</span><span>
    </span><span>if</span><span> </span><span>(</span><span>$errors</span><span>)</span><span> </span><span>{</span><span> </span><span>throw</span><span> </span><span>[</span><span>System.</span><span>InvalidCastException</span><span>]::</span><span>new</span><span>(</span><span>"Submitted text could not be converted to PowerShell because it contains syntax errors: </span><span>$(</span><span>$errors</span><span> </span><span>|</span><span> </span><span>Out-String</span><span>)</span><span>")}
    
    # search for all requested ast...
    </span><span>$ast</span><span>.FindAll(</span><span>$predicate</span><span>, !</span><span>$NoRecursion</span><span>) |
      # and dynamically add a visible property for the ast object type:
      Add-Member -MemberType ScriptProperty -Name Type -Value { </span><span>$this</span><span>.GetType().Name } -PassThru
  }
}
</span>
```

And here is an example:

```
<span>Get-PsOneAst</span><span> </span><span>-Code</span><span> </span><span>'ping 127.0.0.1'</span><span> 
</span>
```

The result looks like this:

```
Type               : ScriptBlockAst
Attributes         : {}
UsingStatements    : {}
ParamBlock         : 
BeginBlock         : 
ProcessBlock       : 
EndBlock           : ping 127.0.0.1
DynamicParamBlock  : 
ScriptRequirements : 
Extent             : ping 127.0.0.1
Parent             : 

Type       : NamedBlockAst
Unnamed    : True
BlockKind  : End
Statements : {ping 127.0.0.1}
Traps      : 
Extent     : ping 127.0.0.1
Parent     : ping 127.0.0.1

Type             : PipelineAst
PipelineElements : {ping 127.0.0.1}
Extent           : ping 127.0.0.1
Parent           : ping 127.0.0.1

Type               : CommandAst
CommandElements    : {ping, 127.0.0.1}
InvocationOperator : Unknown
DefiningKeyword    : 
Redirections       : {}
Extent             : ping 127.0.0.1
Parent             : ping 127.0.0.1

Type               : StringConstantExpressionAst
StringConstantType : BareWord
Value              : ping
StaticType         : System.String
Extent             : ping
Parent             : ping 127.0.0.1

Type               : StringConstantExpressionAst
StringConstantType : BareWord
Value              : 127.0.0.1
StaticType         : System.String
Extent             : 127.0.0.1
Parent             : ping 127.0.0.1
```

> Note how the property **Type** was added to each returned *Ast* object so you can easily understand what the types are.

Obviously, a *CommandAst* represents commands of the type that I used as an example, so let’s return only these:

```
<span>Get-PsOneAst</span><span> </span><span>-Code</span><span> </span><span>'ping 127.0.0.1'</span><span> </span><span>-AstType</span><span> </span><span>CommandAst</span><span>
</span>
```

Note how **\-AstType** sports convenient [dynamic argument completion](https://powershell.one/powershell-internals/attributes/auto-completion) and suggests all available *Ast* types. The result looks like this:

```
Type               : CommandAst
CommandElements    : {ping, 127.0.0.1}
InvocationOperator : Unknown
DefiningKeyword    : 
Redirections       : {}
Extent             : ping 127.0.0.1
Parent             : ping 127.0.0.1
```

From here, it is only a trivial step to create your own full-fledged auto-documentation or even refactoring tools.

Since *every* *Ast* object has the property **Extent** which tells you exactly where in the original **PowerShell** code the structure is located, you could easily now identify commands that use positional arguments, replace global variables with scriptglobal variables, or even identify the new **PowerShell** 7 *ternary* operator and replace it by the classic *If-Else* construct in case you want to make sure the code is compatible with **Windows PowerShell**.

## Graphical Analysis: ShowPSAst

While exploring the *Ast*, you may also look at [Jason Shirks](https://twitter.com/lzybkr) **ShowPSAst**, a simple yet powerful UI to explore the **PowerShell** *Ast*. Simply install the module from the *PowerShell Gallery*:

```
<span># install ShowPSAst module:</span><span>
</span><span>Install-Module</span><span> </span><span>-Name</span><span> </span><span>ShowPSAst</span><span> </span><span>-Scope</span><span> </span><span>CurrentUser</span><span> </span><span>-Force</span><span>
</span>
```

Next, pick a **PowerShell** script you want to explore, and load it:

```
<span>Show-Ast</span><span> </span><span>-InputObject</span><span> </span><span>"C:\file.ps1"</span><span>
</span>
```

> The window does not respond very well to resizing and maximizing at this time, so maybe you feel intrigued to polish the code a bit and get in touch with Jason. You find the project [here](https://github.com/lzybkr/ShowPSAst).

## What’s Next?

I hope I opened up the **PowerShell** *Ast* for you and provided all you need to get started. If you create cool documentation or refactoring tools, please do not forget to leave a comment so we can point to your repo or article.

There is *so* much more you can do, this is just the tip of the iceberg. Leave your questions as a comment should you get stuck anywhere.

https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer

> By turning PowerShell code into tokens and structures, you can find errors, auto-document your code, and create powerful refactoring tools.

# Tokenizing PowerShell Scripts - powershell.one
By turning **PowerShell** code into tokens and structures, you can find errors, auto-document your code, and create powerful refactoring tools.

## Colorful World of Tokens

Whenever you load **PowerShell** code into specialized editors, the code gets magically colored, and each color represents a given token type. The colors can help you understand how **PowerShell** interprets your code.

Generic editors without a built-in **PowerShell Engine** like *notepad++* or *VSCode* use complex regular expressions to try and identify the correct tokens. A 100% precise tokenization however comes directly from the **PowerShell Parser** and is not the result of generic *RegEx* rules. In this article series we’ll look at all the goodness the **PowerShell Parser** is willing to share with you.

At the end of today, you get a new command: `Test-PSOneScript` parses one - or thousands - of PowerShell files and returns always 100% accurate tokens in no time. It is part of our **PSOneTools** module, so just install the latest version to get your hands on the command, or use the source code presented later in this article.

```
<span>Install-Module</span><span> </span><span>-Name</span><span> </span><span>PSOneTools</span><span> </span><span>-Scope</span><span> </span><span>CurrentUser</span><span> </span><span>-Force</span><span>
</span>
```

With tokens you can do a whole bunch of interesting things, for example:

-   Auto-document code and create lists of variables, commands, or method calls found in a script
-   Identify syntax errors that make the parser choke
-   Perform a security analysis and identify scripts using risky commands

## PSParser Overview

The **PSParser** is the original parser built into the early versions of **PowerShell**. Even though it is old, it is still part of all **PowerShell** versions and very useful because of its simplicity. It distinguishes 20 different token types:

```
<span>PS</span><span>&gt;</span><span> </span><span>[</span><span>Enum</span><span>]::</span><span>GetNames</span><span>([</span><span>System.Management.Automation.</span><span>PSTokenType</span><span>])</span><span>.</span><span>Count</span><span>
</span><span>20</span><span>

</span><span>PS</span><span>&gt;</span><span> </span><span>[</span><span>Enum</span><span>]::</span><span>GetNames</span><span>([</span><span>System.Management.Automation.</span><span>PSTokenType</span><span>])</span><span> </span><span>|</span><span> </span><span>Sort-Object</span><span>
</span><span>Attribute</span><span>
</span><span>Command</span><span>
</span><span>CommandArgument</span><span>
</span><span>CommandParameter</span><span>
</span><span>Comment</span><span>
</span><span>GroupEnd</span><span>
</span><span>GroupStart</span><span>
</span><span>Keyword</span><span>
</span><span>LineContinuation</span><span>
</span><span>LoopLabel</span><span>
</span><span>Member</span><span>
</span><span>NewLine</span><span>
</span><span>Number</span><span>
</span><span>Operator</span><span>
</span><span>Position</span><span>
</span><span>StatementSeparator</span><span>
</span><span>String</span><span>
</span><span>Type</span><span>
</span><span>Unknown</span><span>
</span><span>Variable</span><span>
</span>
```

When you use **PSParser** to tokenize **PowerShell** code, it reads your code character by character and groups the characters into meaningful words, the **tokens**. If the **PSParser** encounters characters it isn’t expecting, it generates **Syntax Errors**, i.e. when a string starts with double-quotes but ends with single-quotes.

## Tokenizing PowerShell Code

Use **Tokenize()** to tokenize PowerShell code. Here is a simple example:

```
<span># the code that you want tokenized:</span><span>
</span><span>$code</span><span> </span><span>=</span><span> </span><span>{</span><span>
  </span><span># this is some test code</span><span>
  </span><span>$service</span><span> </span><span>=</span><span> </span><span>Get-Service</span><span> </span><span>|</span><span>
    </span><span>Where-Object</span><span> </span><span>Status</span><span> </span><span>-eq</span><span> </span><span>Running</span><span>
</span><span>}</span><span>


</span><span># create a variable to receive syntax errors:</span><span>
</span><span>$errors</span><span> </span><span>=</span><span> </span><span>$null</span><span>
</span><span># tokenize PowerShell code:</span><span>
</span><span>$tokens</span><span> </span><span>=</span><span> </span><span>[</span><span>System.Management.Automation.</span><span>PSParser</span><span>]::</span><span>Tokenize</span><span>(</span><span>$code</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>

</span><span># analyze errors:</span><span>
</span><span>if</span><span> </span><span>(</span><span>$errors</span><span>.</span><span>Count</span><span> </span><span>-gt</span><span> </span><span>0</span><span>)</span><span>
</span><span>{</span><span>
  </span><span># move the nested token up one level so we see all properties:</span><span>
  </span><span>$syntaxError</span><span> </span><span>=</span><span> </span><span>$errors</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Token</span><span> </span><span>-Property</span><span> </span><span>Message</span><span>
  </span><span>$syntaxError</span><span>
</span><span>}</span><span>
</span><span>else</span><span>
</span><span>{</span><span>
  </span><span>$tokens</span><span>
</span><span>}</span><span>
</span>
```

**Tokenize()** expects the code you want to tokenize, plus an empty variable that it can fill with any syntax errors. Because the variable **$errors** is empty when **Tokenize** starts, and gets filled while the method parses the code, it needs to be submitted *by reference* (by memory pointer) which in **PowerShell** is done through **\[ref\]**.

When **Tokenize()** completes, you receive all tokens as return value in **$tokens**, plus any syntax errors in **$errors**.

### Looking at Tokens

This is what the first three token returned in **$tokens** look like:

```
<span>PS</span><span>&gt;</span><span> </span><span>$tokens</span><span>[</span><span>0</span><span>..</span><span>2</span><span>]</span><span>


</span><span>Content</span><span>     </span><span>:</span><span> 
              
</span><span>Type</span><span>        </span><span>:</span><span> </span><span>NewLine</span><span>
</span><span>Start</span><span>       </span><span>:</span><span> </span><span>0</span><span>
</span><span>Length</span><span>      </span><span>:</span><span> </span><span>2</span><span>
</span><span>StartLine</span><span>   </span><span>:</span><span> </span><span>1</span><span>
</span><span>StartColumn</span><span> </span><span>:</span><span> </span><span>1</span><span>
</span><span>EndLine</span><span>     </span><span>:</span><span> </span><span>2</span><span>
</span><span>EndColumn</span><span>   </span><span>:</span><span> </span><span>1</span><span>

</span><span>Content</span><span>     </span><span>:</span><span> </span><span># this is some test code</span><span>
</span><span>Type</span><span>        </span><span>:</span><span> </span><span>Comment</span><span>
</span><span>Start</span><span>       </span><span>:</span><span> </span><span>4</span><span>
</span><span>Length</span><span>      </span><span>:</span><span> </span><span>24</span><span>
</span><span>StartLine</span><span>   </span><span>:</span><span> </span><span>2</span><span>
</span><span>StartColumn</span><span> </span><span>:</span><span> </span><span>3</span><span>
</span><span>EndLine</span><span>     </span><span>:</span><span> </span><span>2</span><span>
</span><span>EndColumn</span><span>   </span><span>:</span><span> </span><span>27</span><span>

</span><span>Content</span><span>     </span><span>:</span><span> 
              
</span><span>Type</span><span>        </span><span>:</span><span> </span><span>NewLine</span><span>
</span><span>Start</span><span>       </span><span>:</span><span> </span><span>28</span><span>
</span><span>Length</span><span>      </span><span>:</span><span> </span><span>2</span><span>
</span><span>StartLine</span><span>   </span><span>:</span><span> </span><span>2</span><span>
</span><span>StartColumn</span><span> </span><span>:</span><span> </span><span>27</span><span>
</span><span>EndLine</span><span>     </span><span>:</span><span> </span><span>3</span><span>
</span><span>EndColumn</span><span>   </span><span>:</span><span> </span><span>1</span><span>
</span>
```

Each token is represented by a **PSToken** object which returns the token content as string, the token type, and the exact position where the token was found.

### How Syntax Errors Work

If the parser encounters unexpected characters while parsing the code, it generates a syntax error. The parser continues parsing, so there can be multiple syntax errors returned.

Let’s create a syntax error and send a string to the parser that is missing its ending quote.

To send faulty code to the parser, you cannot use a scriptblock though because scriptblocks are smart and only accept formally correct **PowerShell** code. That’s why you have to send your faulty **PowerShell** code to the parser as a string instead of a scriptblock.

```
<span># the code that you want tokenized:</span><span>
</span><span>$code</span><span> </span><span>=</span><span> </span><span>"
  'Hello
"</span><span>
</span>
```

When you run the script again, it now returns the syntax error(s):

```
<span>PS</span><span>&gt;</span><span> </span><span>$syntaxError</span><span>


</span><span>Message</span><span>     </span><span>:</span><span> </span><span>The</span><span> </span><span>string</span><span> </span><span>is</span><span> </span><span>missing</span><span> </span><span>the</span><span> </span><span>terminator:</span><span> </span><span>'.
Content     : '</span><span>Hello</span><span>
              
</span><span>Type</span><span>        </span><span>:</span><span> </span><span>Position</span><span>
</span><span>Start</span><span>       </span><span>:</span><span> </span><span>4</span><span>
</span><span>Length</span><span>      </span><span>:</span><span> </span><span>8</span><span>
</span><span>StartLine</span><span>   </span><span>:</span><span> </span><span>2</span><span>
</span><span>StartColumn</span><span> </span><span>:</span><span> </span><span>3</span><span>
</span><span>EndLine</span><span>     </span><span>:</span><span> </span><span>3</span><span>
</span><span>EndColumn</span><span>   </span><span>:</span><span> </span><span>1</span><span>
</span>
```

#### Improving Parser Error Objects

The parser emits a **PSParseError** object per syntax error which looks like this:

```
<span>PS</span><span>&gt;</span><span> </span><span>$errors</span><span>

</span><span>Token</span><span>                                </span><span>Message</span><span>                                 
</span><span>-----</span><span>                                </span><span>-------</span><span>                                 
</span><span>System.Management.Automation.PSToken</span><span> </span><span>The</span><span> </span><span>string</span><span> </span><span>is</span><span> </span><span>missing</span><span> </span><span>the</span><span> </span><span>terminator:</span><span> </span><span>'.
</span>
```

Unfortunately, the token details are hidden inside the property **Token**. So I use a little-known trick to make all properties visible immediately:

`Select-Object` supports the use of **\-Property** and **\-ExpandProperty** *at the same time*. So I used **\-ExpandProperty** to take the **PSToken** object out of **Token**, plus used **\-Property** to attach the original property **Message** to the extracted token. As a result, all properties show up immediately:

```
<span>PS</span><span>&gt;</span><span> </span><span>$errors</span><span> </span><span>|</span><span> </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Token</span><span> </span><span>-Property</span><span> </span><span>Message</span><span>


</span><span>Message</span><span>     </span><span>:</span><span> </span><span>The</span><span> </span><span>string</span><span> </span><span>is</span><span> </span><span>missing</span><span> </span><span>the</span><span> </span><span>terminator:</span><span> </span><span>'.
Content     : '</span><span>Hello</span><span>
              
</span><span>Type</span><span>        </span><span>:</span><span> </span><span>Position</span><span>
</span><span>Start</span><span>       </span><span>:</span><span> </span><span>4</span><span>
</span><span>Length</span><span>      </span><span>:</span><span> </span><span>8</span><span>
</span><span>StartLine</span><span>   </span><span>:</span><span> </span><span>2</span><span>
</span><span>StartColumn</span><span> </span><span>:</span><span> </span><span>3</span><span>
</span><span>EndLine</span><span>     </span><span>:</span><span> </span><span>3</span><span>
</span><span>EndColumn</span><span>   </span><span>:</span><span> </span><span>1</span><span>
</span>
```

## Examining Real Scripts

To examine real file-based scripts, simply embed the logic from above inside a pipeline-aware function. `Test-PSOneScript` does exactly this and makes parsing **PowerShell** files a snap:

```
<span>function</span><span> </span><span>Test-PSOneScript</span><span>
</span><span>{</span><span>
  </span><span>&lt;#
      </span><span>.SYNOPSIS</span><span>
      Parses a PowerShell Script (*.ps1, *.psm1, *.psd1)

      </span><span>.DESCRIPTION</span><span>
      Invokes the simple PSParser and returns tokens and syntax errors

      </span><span>.EXAMPLE</span><span>
      Test-PSOneScript -Path c:\test.ps1
      Parses the content of c:\test.ps1 and returns tokens and syntax errors

      </span><span>.EXAMPLE</span><span>
      Get-ChildItem -Path $home -Recurse -Include *.ps1,*.psm1,*.psd1 -File |
         Test-PSOneScript |
         Out-GridView

      parses all PowerShell files found anywhere in your user profile

      </span><span>.EXAMPLE</span><span>
      Get-ChildItem -Path $home -Recurse -Include *.ps1,*.psm1,*.psd1 -File |
         Test-PSOneScript |
         Where-Object Errors

      parses all PowerShell files found anywhere in your user profile
      and returns only those files that contain syntax errors

      </span><span>.LINK</span><span>
      https://powershell.one
  #&gt;</span><span>


  </span><span>param</span><span>
  </span><span>(</span><span>
    </span><span># Path to PowerShell script file</span><span>
    </span><span># can be a string or any object that has a "Path" </span><span>
    </span><span># or "FullName" property:</span><span>
    </span><span>[</span><span>String</span><span>]</span><span>
    </span><span>[</span><span>Parameter</span><span>(</span><span>Mandatory</span><span>,</span><span>ValueFromPipeline</span><span>)]</span><span>
    </span><span>[</span><span>Alias</span><span>(</span><span>'FullName'</span><span>)]</span><span>
    </span><span>$Path</span><span>
  </span><span>)</span><span>
  
  </span><span>begin</span><span>
  </span><span>{</span><span>
    </span><span>$errors</span><span> </span><span>=</span><span> </span><span>$null</span><span>
  </span><span>}</span><span>
  </span><span>process</span><span>
  </span><span>{</span><span>
    </span><span># create a variable to receive syntax errors:</span><span>
    </span><span>$errors</span><span> </span><span>=</span><span> </span><span>$null</span><span>
    </span><span># tokenize PowerShell code:</span><span>
    </span><span>$code</span><span> </span><span>=</span><span> </span><span>Get-Content</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span> </span><span>-Raw</span><span> </span><span>-Encoding</span><span> </span><span>Default</span><span>
    
    </span><span># return the results as a custom object</span><span>
    </span><span>[</span><span>PSCustomObject</span><span>]@{</span><span>
      </span><span>Name</span><span> </span><span>=</span><span> </span><span>Split</span><span>-</span><span>Path</span><span> </span><span>-</span><span>Path</span><span> </span><span>$Path</span><span> </span><span>-</span><span>Leaf</span><span>
      </span><span>Path</span><span> </span><span>=</span><span> </span><span>$Path</span><span>
      </span><span>Tokens</span><span> </span><span>=</span><span> </span><span>[</span><span>Management</span><span>.</span><span>Automation</span><span>.</span><span>PSParser</span><span>]::</span><span>Tokenize</span><span>(</span><span>$code</span><span>,</span><span> </span><span>[</span><span>ref</span><span>]</span><span>$errors</span><span>)</span><span>
      </span><span>Errors</span><span> </span><span>=</span><span> </span><span>$errors</span><span> </span><span>|</span><span> </span><span>Select</span><span>-</span><span>Object</span><span> </span><span>-</span><span>ExpandProperty</span><span> </span><span>Token</span><span> </span><span>-</span><span>Property</span><span> </span><span>Message</span><span>
    </span><span>}</span><span>  
  </span><span>}</span><span>
</span><span>}</span><span>
</span>
```

### Parsing Individual Files

To parse an individual file, simply submit its path to `Test-PSOneScript`. It immediately returns the tokens and any syntax errors (if present):

```
<span>$Path</span><span> </span><span>=</span><span> </span><span>"C:\Users\tobia\test.ps1"</span><span>
</span><span>$result</span><span> </span><span>=</span><span> </span><span>Test-PSOneScript</span><span> </span><span>-Path</span><span> </span><span>$Path</span><span>
</span>
```

### Checking for Errors

Let’s start with checking whether the script file has syntax errors:

```
<span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Errors</span><span>.</span><span>Count</span><span> </span><span>-gt</span><span> </span><span>0</span><span>
</span><span>False</span><span>
</span>
```

To get a list of all token types present in the script, try this (the output may vary depending on the actual code in your script file, of course):

```
<span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Tokens</span><span>.</span><span>Type</span><span> </span><span>|</span><span> </span><span>Sort-Object</span><span> </span><span>-Unique</span><span>
</span><span>Command</span><span>
</span><span>CommandParameter</span><span>
</span><span>CommandArgument</span><span>
</span><span>Number</span><span>
</span><span>String</span><span>
</span><span>Variable</span><span>
</span><span>Member</span><span>
</span><span>Type</span><span>
</span><span>Operator</span><span>
</span><span>GroupStart</span><span>
</span><span>GroupEnd</span><span>
</span><span>Keyword</span><span>
</span><span>Comment</span><span>
</span><span>NewLine</span><span>
</span>
```

### Creating a List of Used Variables

To get a **list of all variables** used in the script, simply filter for token type *Variable*:

```
<span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Tokens</span><span> </span><span>|</span><span> 
  </span><span>Where-Object</span><span> </span><span>Type</span><span> </span><span>-eq</span><span> </span><span>Variable</span><span> </span><span>|</span><span> 
  </span><span>Sort-Object</span><span> </span><span>-Property</span><span> </span><span>Content</span><span> </span><span>-Unique</span><span> </span><span>|</span><span> 
  </span><span>ForEach-Object</span><span> </span><span>{</span><span> </span><span>'${0}'</span><span> </span><span>-f</span><span> </span><span>$_</span><span>.</span><span>Content</span><span>}</span><span>

</span><span>$_</span><span>ldaptype</span><span>
</span><span>$_</span><span>SortedReportProp</span><span>
</span><span>$AD_Capabilities</span><span>
</span><span>$AD_CreateDiagrams</span><span>
</span><span>$AD_CreateDiagramSourceFiles</span><span>
</span><span>$AD_DomainGPOs</span><span>
</span><span>...</span><span>
</span><span>$xlEqual</span><span>
</span><span>$zipPackage</span><span>
</span><span>$ZipReport</span><span>
</span><span>$ZipReportName</span><span>
</span>
```

### Creating a List of Used Commands

Likewise, if you’d like to get a **list of commands** used by the script, filter for the appropriate token type (*Command*):

```
<span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Tokens</span><span> </span><span>|</span><span> 
  </span><span>Where-Object</span><span> </span><span>Type</span><span> </span><span>-eq</span><span> </span><span>Command</span><span> </span><span>|</span><span> 
  </span><span>Sort-Object</span><span> </span><span>-Property</span><span> </span><span>Content</span><span> </span><span>-Unique</span><span> </span><span>|</span><span> 
  </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Content</span><span>

</span><span>Add-Content</span><span>
</span><span>Add-Member</span><span>
</span><span>Add-Type</span><span>
</span><span>Add-Zip</span><span>
</span><span>Append-ADUserAccountControl</span><span>
</span><span>ConvertTo-HashArray</span><span>
</span><span>ConvertTo-Html</span><span>
</span><span>...</span><span>
</span><span>Start-sleep</span><span>
</span><span>Test-Path</span><span>
</span><span>Where</span><span>
</span><span>write-error</span><span>
</span><span>Write-Output</span><span>
</span><span>Write-Verbose</span><span>
</span><span>Write-Warning</span><span>
</span>
```

You can even analyze the frequency of **how often commands were used**. This gets you the 10 most-often used commands:

```
<span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Tokens</span><span> </span><span>|</span><span> 
  </span><span>Where-Object</span><span> </span><span>Type</span><span> </span><span>-eq</span><span> </span><span>Command</span><span> </span><span>|</span><span> 
  </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Content</span><span> </span><span>|</span><span>
  </span><span>Group-Object</span><span> </span><span>-NoElement</span><span> </span><span>|</span><span>
  </span><span>Sort-Object</span><span> </span><span>-Property</span><span> </span><span>Count</span><span> </span><span>-Descending</span><span> </span><span>|</span><span>
  </span><span>Select-Object</span><span> </span><span>-First</span><span> </span><span>10</span><span>

</span><span>Count</span><span> </span><span>Name</span><span>                     
</span><span>-----</span><span> </span><span>----</span><span>                     
   </span><span>51</span><span> </span><span>Search-AD</span><span>                
   </span><span>49</span><span> </span><span>New-Object</span><span>               
   </span><span>35</span><span> </span><span>Write-Verbose</span><span>            
   </span><span>29</span><span> </span><span>get-date</span><span>                 
   </span><span>25</span><span> </span><span>%</span><span>                        
   </span><span>24</span><span> </span><span>New-TimeSpan</span><span>             
   </span><span>24</span><span> </span><span>Where</span><span>                    
   </span><span>21</span><span> </span><span>select</span><span>                   
   </span><span>19</span><span> </span><span>Sort-Object</span><span>              
   </span><span>17</span><span> </span><span>Invoke-Method</span><span>            
</span>
```

### Analyzing Use of .NET Methods

Maybe you are interested in finding out **which native .NET methods** the script uses. Again, it is just a matter of token filtering:

```
<span>PS</span><span>&gt;</span><span> </span><span>$result</span><span>.</span><span>Tokens</span><span> </span><span>|</span><span> 
  </span><span>Where-Object</span><span> </span><span>Type</span><span> </span><span>-eq</span><span> </span><span>Member</span><span> </span><span>|</span><span> 
  </span><span>Select-Object</span><span> </span><span>-ExpandProperty</span><span> </span><span>Content</span><span> </span><span>|</span><span>
  </span><span>Sort-Object</span><span> </span><span>-Unique</span><span>
  
</span><span>Accessible</span><span>
</span><span>ActiveSheet</span><span>
</span><span>Add</span><span>
</span><span>AdjacentSites</span><span>
</span><span>adminDisplayName</span><span>
</span><span>...</span><span>
</span><span>whenchanged</span><span>
</span><span>whencreated</span><span>
</span><span>Workbooks</span><span>
</span><span>Worksheets</span><span>
</span>
```

At this point, you are reaching the limit of token analysis:

While it is nice to get a list of method names used by a script, it is not really useful. You’d need a bigger picture to know the object types the called methods belong to. All this is possible, too, but not with tokens alone. What’s required is a look at **script structures** that consist of multiple tokens - a case for the **Abstract Syntax Tree** (AST) which we shed light on in one of the next parts of this series.

## Bulk-Analysis: Scanning Entire Folders

`Test-PSOneScript` can’t just examine one file at a time. It is fully pipeline-aware and knows how to deal with files returned by `Get-ChildItem`.

### Finding Scripts With Errors

So if you want to identify scripts with syntax errors anywhere in your script library, simply run`Get-ChildItem` to gather the files to be tested, and pipe them to `Test-PSOneScript` like this:

```
<span># get all PowerShell files from your user profile...</span><span>
</span><span>Get-ChildItem</span><span> </span><span>-Path</span><span> </span><span>$home</span><span> </span><span>-Recurse</span><span> </span><span>-Include</span><span> </span><span>*.</span><span>ps1</span><span>,</span><span> </span><span>*.</span><span>psd1</span><span>,</span><span> </span><span>*.</span><span>psm1</span><span> </span><span>-File</span><span> </span><span>|</span><span>
  </span><span># ...parse them...</span><span>
  </span><span>Test-PSOneScript</span><span> </span><span>|</span><span>
  </span><span># ...filter those with syntax errors...</span><span>
  </span><span>Where-Object</span><span> </span><span>Errors</span><span> </span><span>|</span><span>
  </span><span># ...expose the errors:</span><span>
  </span><span>ForEach-Object</span><span> </span><span>{</span><span>
    </span><span>[</span><span>PSCustomObject</span><span>]@{</span><span>
      </span><span>Name</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Name</span><span>
      </span><span>Error</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Errors</span><span>[</span><span>0</span><span>].</span><span>Message</span><span>
      </span><span>Type</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Errors</span><span>[</span><span>0</span><span>].</span><span>Type</span><span>
      </span><span>Line</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Errors</span><span>[</span><span>0</span><span>].</span><span>StartLine</span><span>
      </span><span>Column</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Errors</span><span>[</span><span>0</span><span>].</span><span>StartColumn</span><span>
      </span><span>Path</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Path</span><span>
    </span><span>}</span><span>
  </span><span>}</span><span>
</span>
```

This will find any script with any syntax error. If you’d like to be more specific, you can filter on the error message.

### Identifying Risky Commands

The sky is the limit, so if you’d like to identify scripts that use risky commands such as `Invoke-Expression`, just adjust the filter:

```
<span>$blacklist</span><span> </span><span>=</span><span> </span><span>@(</span><span>'Invoke-Expression'</span><span>,</span><span> </span><span>'Stop-Computer'</span><span>,</span><span> </span><span>'Restart-Computer'</span><span>)</span><span>


</span><span># get all PowerShell files from your user profile...</span><span>
</span><span>Get-ChildItem</span><span> </span><span>-Path</span><span> </span><span>$home</span><span> </span><span>-Recurse</span><span> </span><span>-Include</span><span> </span><span>*.</span><span>ps1</span><span>,</span><span> </span><span>*.</span><span>psd1</span><span>,</span><span> </span><span>*.</span><span>psm1</span><span> </span><span>-File</span><span> </span><span>|</span><span>
</span><span># ...parse them...</span><span>
</span><span>Test-PSOneScript</span><span> </span><span>|</span><span>
</span><span># ...filter those using commands in our blacklist</span><span>
</span><span>Foreach-Object</span><span> </span><span>{</span><span>
  </span><span># get the first token that is a command and that is in our blacklist</span><span>
  </span><span>$badToken</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Tokens</span><span>.</span><span>Where</span><span>{</span><span>$_</span><span>.</span><span>Type</span><span> </span><span>-eq</span><span> </span><span>'Command'</span><span>}</span><span>.</span><span>Where</span><span>{</span><span>$_</span><span>.</span><span>Content</span><span> </span><span>-in</span><span> </span><span>$blacklist</span><span>}</span><span> </span><span>|</span><span> 
    </span><span>Select-Object</span><span> </span><span>-First</span><span> </span><span>1</span><span>
  
  </span><span>if</span><span> </span><span>(</span><span>$badToken</span><span>)</span><span>
  </span><span>{</span><span>
    </span><span>$_</span><span> </span><span>|</span><span> </span><span>Add-Member</span><span> </span><span>-MemberType</span><span> </span><span>NoteProperty</span><span> </span><span>-Name</span><span> </span><span>BadToken</span><span> </span><span>-Value</span><span> </span><span>$badToken</span><span> </span><span>-PassThru</span><span>
  </span><span>}</span><span>
  </span><span>}</span><span> </span><span>|</span><span>
  </span><span># ...expose the errors:</span><span>
  </span><span>ForEach-Object</span><span> </span><span>{</span><span>
    </span><span>[</span><span>PSCustomObject</span><span>]@{</span><span>
      </span><span>Name</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Name</span><span>
      </span><span>Offender</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>BadToken</span><span>.</span><span>Content</span><span>
      </span><span>Line</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>BadToken</span><span>.</span><span>StartLine</span><span>
      </span><span>Column</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>BadToken</span><span>.</span><span>StartColumn</span><span>
      </span><span>Path</span><span> </span><span>=</span><span> </span><span>$_</span><span>.</span><span>Path</span><span>
    </span><span>}</span><span>
  </span><span>}</span><span>
</span>
```

## What’s Next

Using the**PSParser** is just your first step into the wonderful world of tokens and script analysis. In the next part we’ll take a look at the more sophisticated **Parser** object which was introduced in **PowerShell 3** and differentiates 150 different token kinds plus 26 token flags.

And if that’s still not enough detail, we look into the **Abstract Syntax Tree** (AST) and how it forms meaningful structures from a group of token.

BTW, have you checked out [PowerShell Conference EU](https://psconf.eu/) yet? Both **Call for Papers** and **Delegate Registration** are open!

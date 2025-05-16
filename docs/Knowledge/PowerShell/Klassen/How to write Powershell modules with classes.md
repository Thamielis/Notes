Working with Powershell Classes can be tricky. There are multiple edge cases that module / framework developers need to take into consideration when they want to add classes to their project. Especially on how to make their classes available / consumable to end users.

In this article I will demonstrate what are the ways to organize code for PowerShell modules that contains classes, functions and enums. I will demonstrate the advantages and drawbacks of each solution, and conclude with best practises based on my own experience and failures.

I have found the perfect solution (in my opinion), which works for every case, and today I will be sharing this with you.

## Introduction

I have been working with Powershell classes since Powershell 5.0 got in february 2016. I have set my self a rule of thumb, to force my self into learning this: To `Write only classes.` And this is what I have done ever since. At work, or in my personal open source projects like [PSHTML][1] or [PSClassUtils][2] for instance, I have applied that rule. And I am really happy I did. Here is why.

## How to write a powershell module with classes?

To understand what is the best way to write a powershell module that uses classes, let’s have a look at what and what works well, and not so well for end users using the module.

The user experience is directly influenced on how one loads a class. We have to ways to do so: 1) `import-Module` 2) `Using Module`

I will go through each of these paths, and see together what the difference are.

I’ll cover firstly the `Using Module` statement, and then we will have a look in the `import-Module` cmdlet. I’ll conclude with short summary about the differences / identicalities of these two methods

## Using Module vs Import-Module

For the benefit of making this the most clear as possible, Let’s assume we have a module file called `plop.psm1` that contains the following code:

```
<span>
</span><span>Enum</span><span> </span><span>ComputerType</span><span> </span><span>{</span><span>
    </span><span>Server</span><span>
    </span><span>Client</span><span>
</span><span>}</span><span>

</span><span>Class</span><span> </span><span>Computer</span><span> </span><span>{</span><span>
    </span><span>[</span><span>String</span><span>]</span><span>$Name</span><span>
    </span><span>[</span><span>ComputerType</span><span>]</span><span>$Type</span><span>
</span><span>}</span><span>

</span><span>Function</span><span> </span><span>Get-InternalStuff</span><span> </span><span>{</span><span>
    </span><span>#Does internal stuff </span><span>
</span><span>}</span><span>

</span><span>Function</span><span> </span><span>Get-ComputerData</span><span> </span><span>{</span><span>
    </span><span>#Does stuff&lt;</span><span>
</span><span>}</span><span>

</span><span>Export-ModuleMember</span><span> </span><span>-Function</span><span> </span><span>Get-ComputerData</span><span> 

</span>
```

It contains an Enum, a Class, and two functions, but **only** `Get-ComputerData` is exported.

> For this example, a module manifest is not necessary.

### The `using module` statement

The `using module` statement got added in Powershell version 5 (February 2016). It will load any class, Enum and exported function into the current session.

We can use the `using module` statement to load our module into our session like this :

or if the module is not located in a folder located in the `$env:PsModulePath`, we can load it using the file fullname

```
<span>Using</span><span> </span><span>module</span><span> </span><span>c:/plop.psm1</span><span>
</span>
```

> The using statement **must** be located at the very top of your script. It also **must** be the very first statement of your script (Except of comments). This make **loading the module ‘conditionally’ impossible.**

![using module statement](https://stephanevg.github.io/images/using-modulestatementError.jpg)

_Trying to load a module using `using module` in a script after a `Get-Service` call_

Now that the module has been loaded using the `using module` statement, let’s have a look at what commands have actually been loaded into our session by calling the `Get-Command -Module` cmdlet.

```
<span>Get-command</span><span> </span><span>-Module</span><span> </span><span>plop</span><span>

</span><span>CommandType</span><span>     </span><span>Name</span><span>                                               </span><span>Version</span><span>    </span><span>Source</span><span>
</span><span>-----------</span><span>     </span><span>----</span><span>                                               </span><span>-------</span><span>    </span><span>------</span><span>
</span><span>Function</span><span>        </span><span>Get-ComputerData</span><span>                                     </span><span>0.0</span><span>        </span><span>plop</span><span>

</span>
```

we see that only `Get-ComputerData` is available. If we try to use `Get-InternalStuff` It throws an error.

```
<span>get-internalStuff</span><span>

</span><span>get-internalStuff</span><span> </span><span>:</span><span> </span><span>The</span><span> </span><span>term</span><span> </span><span>'get-internalStuff'</span><span> </span><span>is</span><span> </span><span>not</span><span> </span><span>recognized</span><span> </span><span>as</span><span> </span><span>the</span><span> </span><span>name</span><span> </span><span>of</span><span> </span><span>a</span><span> </span><span>cmdlet</span><span>,</span><span> </span><span>function</span><span>,</span><span> </span><span>script</span><span> </span><span>file</span><span>,</span><span> </span><span>or</span><span> </span><span>operable</span><span> </span><span>program.</span><span> </span><span>Check</span><span> </span><span>the</span><span> </span><span>spelling</span><span> </span><span>of</span><span> </span><span>the</span><span> </span><span>name</span><span>,</span><span> </span><span>or</span><span> </span><span>if</span><span> 
</span><span>a</span><span> </span><span>path</span><span> </span><span>was</span><span> </span><span>included</span><span>,</span><span> </span><span>verify</span><span> </span><span>that</span><span> </span><span>the</span><span> </span><span>path</span><span> </span><span>is</span><span> </span><span>correct</span><span> </span><span>and</span><span> </span><span>try</span><span> </span><span>again.</span><span>
</span><span>At</span><span> </span><span>line:1</span><span> </span><span>char:1</span><span>
</span><span>+</span><span> </span><span>get-internalStuff</span><span>
</span><span>+</span><span> </span><span>~~~~~~~~~~~~~~~~~</span><span>
    </span><span>+</span><span> </span><span>CategoryInfo</span><span>          </span><span>:</span><span> </span><span>ObjectNotFound:</span><span> </span><span>(</span><span>get-internalStuff:String</span><span>)</span><span> </span><span>[],</span><span> </span><span>CommandNotFoundException</span><span>
    </span><span>+</span><span> </span><span>FullyQualifiedErrorId</span><span> </span><span>:</span><span> </span><span>CommandNotFoundException</span><span>

</span>
```

> This error is a normal behaviour since the only command we exported from the module was `Get-ComputerData`.

There is **no** ‘out of the box’ and **simple** way to list the available classes. This can only be done with the usage of the AST, which ends up to be quite combersome. The easier and better option to list the available classes is to use `Get-CUClass` which is present in [PsClassUtils][3]

> There is a module Called [PsClassUtils][4] wich offers a lot of nice extra features for people working with classes. It allows to list the current available classes in a session, including their constructors, methods and properties. But not only that. It can also generate pester tests **automatically** for your classes, and draw awesome UML diagrams using just one single command. I would **highly** recommend you have a look at this module if you intend to / or are using classes.
> 
> You can download **PsclassUtils** from the powershell gallery using `Install-Module PsClassUtils`. You can find the Github project [here][5]

Even thoug we have no way of listing the classes present, we know that the class `Computer` **is** present, and we can instanciate it as follow:

```
<span>[</span><span>Computer</span><span>]::</span><span>New</span><span>()</span><span>

</span><span>Name</span><span>   </span><span>Type</span><span>
</span><span>----</span><span>   </span><span>----</span><span>
     </span><span>Server</span><span>
</span>
```

The Enum is also available to be used:

```
<span>[</span><span>ComputerType</span><span>]::</span><span>Client</span><span>
</span><span>Client</span><span>
</span>
```

Until now, everything works as expected.

### Import-module

`Import-module` is the command that allows to load the contents of a module into the session. It has been available since Powershell version 2 (October 2009) and has been the **only** way of loading a module up until powershell version 5 (February 2016).

`import-Module` must be called before the function you want to call that is located in that specific module. But not **\_\_necessarly\_\_** at the begining / top of your script. _(And this is an important point which I will come back to in just a little a bit.)_

Looking at the functions that are available to us using `get-Command` we get the following:

```
<span>Get-command</span><span> </span><span>-Module</span><span> </span><span>plop</span><span>

</span><span>CommandType</span><span>     </span><span>Name</span><span>                                               </span><span>Version</span><span>    </span><span>Source</span><span>
</span><span>-----------</span><span>     </span><span>----</span><span>                                               </span><span>-------</span><span>    </span><span>------</span><span>
</span><span>Function</span><span>        </span><span>Get-ComputerData</span><span>                                           </span><span>0.0</span><span>        </span><span>plop</span><span>

</span>
```

we see that only `Get-ComputerData` is available. If we try to use `Get-InternalStuff` It throws an error. (Just as expected)

```
<span>get-internalStuff</span><span>

</span><span>get-internalStuff</span><span> </span><span>:</span><span> </span><span>The</span><span> </span><span>term</span><span> </span><span>'get-internalStuff'</span><span> </span><span>is</span><span> </span><span>not</span><span> </span><span>recognized</span><span> </span><span>as</span><span> </span><span>the</span><span> </span><span>name</span><span> </span><span>of</span><span> </span><span>a</span><span> </span><span>cmdlet</span><span>,</span><span> </span><span>function</span><span>,</span><span> </span><span>script</span><span> </span><span>file</span><span>,</span><span> </span><span>or</span><span> </span><span>operable</span><span> </span><span>program.</span><span> </span><span>Check</span><span> </span><span>the</span><span> </span><span>spelling</span><span> </span><span>of</span><span> </span><span>the</span><span> </span><span>name</span><span>,</span><span> </span><span>or</span><span> </span><span>if</span><span> 
</span><span>a</span><span> </span><span>path</span><span> </span><span>was</span><span> </span><span>included</span><span>,</span><span> </span><span>verify</span><span> </span><span>that</span><span> </span><span>the</span><span> </span><span>path</span><span> </span><span>is</span><span> </span><span>correct</span><span> </span><span>and</span><span> </span><span>try</span><span> </span><span>again.</span><span>
</span><span>At</span><span> </span><span>line:1</span><span> </span><span>char:1</span><span>
</span><span>+</span><span> </span><span>get-internalStuff</span><span>
</span><span>+</span><span> </span><span>~~~~~~~~~~~~~~~~~</span><span>
    </span><span>+</span><span> </span><span>CategoryInfo</span><span>          </span><span>:</span><span> </span><span>ObjectNotFound:</span><span> </span><span>(</span><span>get-internalStuff:String</span><span>)</span><span> </span><span>[],</span><span> </span><span>CommandNotFoundException</span><span>
    </span><span>+</span><span> </span><span>FullyQualifiedErrorId</span><span> </span><span>:</span><span> </span><span>CommandNotFoundException</span><span>

</span>
```

When trying to instanciate the class, it will throw an error saying it didn’t found the Type. Which really means that it couldn’t find the class.

```
<span> </span><span>[</span><span>Computer</span><span>]::</span><span>New</span><span>()</span><span>
</span><span>Unable</span><span> </span><span>to</span><span> </span><span>find</span><span> </span><span>type</span><span> </span><span>[</span><span>Computer</span><span>]</span><span>.</span><span>
</span><span>At</span><span> </span><span>line:1</span><span> </span><span>char:1</span><span>
</span><span>+</span><span> </span><span>[</span><span>Computer</span><span>]::</span><span>New</span><span>()</span><span>
</span><span>+</span><span> </span><span>~~~~~~~~~~</span><span>
    </span><span>+</span><span> </span><span>CategoryInfo</span><span>          </span><span>:</span><span> </span><span>InvalidOperation:</span><span> </span><span>(</span><span>Computer:TypeName</span><span>)</span><span> </span><span>[],</span><span> </span><span>RuntimeException</span><span>
    </span><span>+</span><span> </span><span>FullyQualifiedErrorId</span><span> </span><span>:</span><span> </span><span>TypeNotFound</span><span>
</span>
```

Using the `import-module` command, we have access to the same exported functions as the `using module` statement, but we don’t have access to the classes. It can be called anywhere in a script, and doesn’t need to be the first statement of the script.

## summary

The following table summarized the difference in loading between `using module` and `import-module`.

| Command Type | Can be called anywere in script | internal functions | public functions | Enums | Classes |
| --- | --- | --- | --- | --- | --- |
| Import-Module | Yes | No | Yes | No | No |
| using Module | No | No | Yes | Yes | Yes |

The two solutions have advantages and drawbacks. So, in both ways we don’t have the same features covered.

## Class vs Function

Now that we know the differences between `import-module` and `using module`, I would like to quickly compare the end-user experience between a `class` and a `function`.

## Functions

### Advantages

-   A function can contain comment based help, which the end user will be able to get using the `Get-help` cmdlet.
-   During developement, a function can be written loaded, rewritten, and reloaded without a probem. _this is what developers do during development phase_

### Disadvanteges

-   A function is not typed, so the content of the returned object (If an object is returned..) could potentially change without throwing a compilation error.
-   A function can return anything at anytime. It actuall can return to different types of objects.
-   A function doesn’t require a `return` keyword to return something back. This can be problematic when some commands do return things back to the standard output, without you know of it.
-   There is no standard and programatic way to find out what a function will return. (using the AST for example). In other words, it **cannot** be _trusted_.

## Classes

### Advantages

-   A class will always return a known type. When a method doesn’t return anything, it will be specified so (using `void`)
-   A class is strongly typed. This means we can _trust_ what a class will return and what it will be composed of.

### Disadvanteges

-   A class cannot contain comment based help
-   Once a class is loaded into memory, and we modify it, it will not see the changes although we reload the class. For that, we need to restart the complete powershell session.
-   To instanciate a class, the end-user needs to learn a new syntax (`[ComputerData]::New()`). A class can have overloaded constructors / methods. Not have any help, make things pretty difficult for the end user. In other words, the syntax of how to call a class **can** be an issue for end users.

## Summary

To summarize the features, have a look at the table below.

| Command Type | Has help | Is strongly typed | Can be trusted | is easy to use for developers | Import-module | Using module | Easy syntax for end user |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Class | No | Yes | Yes | Yes | No | Yes | No |
| Function | Yes | No | No | Yes | Yes | Yes | Yes |

Both ways have advantages and drawbacks. A function can contain help, it is easy to use. It works with `import-module` **and** `using module`. But **only** a class can be really trusted regarding it return values.

A class does **not** have any comment based help. On the other hand, people that want to keep using `import-module` are limited to using functions only, since classes and Enums are **not** loaded into the session with that command.

## how to get the best of the both worlds?

First, let’s list all the positive points that we would like to have as user based on our comparaison from above.

-   It must be trusted
-   Syntax must be easy
-   Loading of module must be standard, and should be able to be done anywhere in the script.
-   User must have access to help
-   internal functions should not be exposed
-   End users should not have to deal with classes (due to their complex nature)

## My experience

I have been working with classes for a while now. I got a lot of feedback internally at work, but also on my open source projects.

To resume the user experience in one sentence: `The user exeperience with classes sucks!`

To resume the programmer experience in one sentence: `The Programmer experience rocks! (Except for the reloading of the classes)`

I then started to search for the best way to offer the best user experience throughout my modules, while still beeing able to use classes, and by trying to minimize the negative effects that using classes in a module can have.

The solution resides in still using `import-module`, which is what everybody has been using since 5 years now, and which has the benefit of beeing able to be called from anywhere in a script.

But, as a developper, I wanted to write classes as I feel can _trust_ them.

It would be great to have the **flexibility** of `import-module` and the **robustness** of a class.

Well, this is possible using the following convention:

Functions must be exported, and classes must be instanciated in a function. I rewrote `plop.psm1` to explain this new standard a bit easier.

```
<span>
</span><span>Enum</span><span> </span><span>ComputerType</span><span> </span><span>{</span><span>
    </span><span>Server</span><span>
    </span><span>Client</span><span>
</span><span>}</span><span>

</span><span>Class</span><span> </span><span>Computer</span><span> </span><span>{</span><span>
    </span><span>[</span><span>String</span><span>]</span><span>$Name</span><span>
    </span><span>[</span><span>ComputerType</span><span>]</span><span>$Type</span><span>
</span><span>}</span><span>

</span><span>Function</span><span> </span><span>Get-InternalStuff</span><span> </span><span>{</span><span>
    </span><span>#Does internal stuff </span><span>
</span><span>}</span><span>

</span><span>Function</span><span> </span><span>Get-ComputerData</span><span> </span><span>{</span><span>
    </span><span>#Does stuff&lt;</span><span>
</span><span>}</span><span>

</span><span>Function</span><span> </span><span>New-Computer</span><span> </span><span>{</span><span>
    </span><span>[</span><span>Computer</span><span>]::</span><span>New</span><span>()</span><span>
</span><span>}</span><span>

</span><span>Export-ModuleMember</span><span> </span><span>-Function</span><span> </span><span>Get-ComputerData</span><span>,</span><span>New-Computer</span><span>
</span>
```

I have added two things here:

1) A function called `New-computer` which instanciate the `[computer]` class 2) I added `New-Computer` to the exported commands

Let’s test this!

We will load our module using `import-module` and see which commands are available to us using `get-command`

```
<span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>import-module</span><span> </span><span>plop</span><span>
</span><span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>get-command</span><span> </span><span>-Module</span><span> </span><span>plop</span><span>

</span><span>CommandType</span><span>     </span><span>Name</span><span>                                               </span><span>Version</span><span>    </span><span>Source</span><span>
</span><span>-----------</span><span>     </span><span>----</span><span>                                               </span><span>-------</span><span>    </span><span>------</span><span>
</span><span>Function</span><span>        </span><span>Get-ComputerData</span><span>                                   </span><span>0.0</span><span>        </span><span>plop</span><span>
</span><span>Function</span><span>        </span><span>New-Computer</span><span>                                       </span><span>0.0</span><span>        </span><span>plop</span><span>

</span>
```

`New-computer` is new the function we just added. And Just like before, the class `[Computer]` is not availble in our session, since we loaded the module using `import-module`.

```
<span>
</span><span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>[</span><span>computer</span><span>]::</span><span>new</span><span>()</span><span>
</span><span>Unable</span><span> </span><span>to</span><span> </span><span>find</span><span> </span><span>type</span><span> </span><span>[</span><span>computer</span><span>]</span><span>.</span><span>
</span><span>At</span><span> </span><span>line:1</span><span> </span><span>char:1</span><span>
</span><span>+</span><span> </span><span>[</span><span>computer</span><span>]::</span><span>new</span><span>()</span><span>
</span><span>+</span><span> </span><span>~~~~~~~~~~</span><span>
</span><span>+</span><span> </span><span>CategoryInfo</span><span>          </span><span>:</span><span> </span><span>InvalidOperation:</span><span> </span><span>(</span><span>computer:TypeName</span><span>)</span><span> </span><span>[],</span><span> </span><span>RuntimeException</span><span>
</span><span>+</span><span> </span><span>FullyQualifiedErrorId</span><span> </span><span>:</span><span> </span><span>TypeNotFound</span><span>

</span>
```

And let’s try `New-computer`

```
<span>
</span><span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>new-computer</span><span>

</span><span>Name</span><span>   </span><span>Type</span><span>
</span><span>----</span><span>   </span><span>----</span><span>
     </span><span>Server</span><span>


</span>
```

As you might have noticed, it returned a new instance of our `[computer]` class.

To finalize this experiment, i have added two other modifications:

1) I updated the `[Computer]` constructor to accept a type parameter as follow

```
<span>Class</span><span> </span><span>Computer</span><span> </span><span>{</span><span>
    </span><span>[</span><span>String</span><span>]</span><span>$Name</span><span>
    </span><span>[</span><span>ComputerType</span><span>]</span><span>$Type</span><span>

    </span><span>Computer</span><span>(</span><span>$type</span><span>){</span><span>
        </span><span>$this</span><span>.</span><span>Type</span><span> </span><span>=</span><span> </span><span>$type</span><span>
        </span><span>$this</span><span>.</span><span>Name</span><span> </span><span>=</span><span> </span><span>$this</span><span>.</span><span>GetNewName</span><span>()</span><span>

    </span><span>}</span><span>

    </span><span>[</span><span>String</span><span>]</span><span>GetNewName</span><span>(){</span><span>
        </span><span>$Guid</span><span> </span><span>=</span><span> </span><span>[</span><span>guid</span><span>]::</span><span>NewGuid</span><span>()</span><span>
        </span><span>$FullName</span><span> </span><span>=</span><span> </span><span>''</span><span>
        </span><span>switch</span><span> </span><span>(</span><span>$this</span><span>.</span><span>type</span><span>)</span><span> </span><span>{</span><span>
            </span><span>'client'</span><span> </span><span>{</span><span>
                </span><span>$FullName</span><span> </span><span>=</span><span> </span><span>'CLT-'</span><span> </span><span>+</span><span> </span><span>$Guid</span><span> 
                </span><span>break</span><span>
              </span><span>}</span><span>'Server'</span><span> </span><span>{</span><span>
                </span><span>$FullName</span><span> </span><span>=</span><span> </span><span>'SRV-'</span><span> </span><span>+</span><span> </span><span>$Guid</span><span> 
              </span><span>}</span><span>
        </span><span>}</span><span>

        </span><span>return</span><span> </span><span>$FullName</span><span>
    </span><span>}</span><span>
</span><span>}</span><span>
</span>
```

2) I updated the `new-computer` function to take this into consideration.

```
<span>Function</span><span> </span><span>New-Computer</span><span> </span><span>{</span><span>
    </span><span>Param</span><span>(</span><span>
        </span><span>[</span><span>ComputerType</span><span>]</span><span>$Type</span><span>

    </span><span>)</span><span>
    </span><span>[</span><span>Computer</span><span>]::</span><span>New</span><span>(</span><span>$Type</span><span>)</span><span>
</span><span>}</span><span>
</span>
```

> Since we modified our class, we need re-open a new session.

```
<span>
</span><span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>import-module</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io/_Drafts/plop.psm1</span><span> </span><span>-Force</span><span>

</span><span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>New-Computer</span><span> </span><span>-Type</span><span> </span><span>Client</span><span>

</span><span>Name</span><span>                                       </span><span>Type</span><span>
</span><span>----</span><span>                                       </span><span>----</span><span>
</span><span>CLT-f0b0827c-82f7-44b8-9324-36673c6cd78f</span><span> </span><span>Client</span><span>

</span>
```

It create a new client. Let’s create a server, and see what it actually sends us back.

```
<span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>$Server</span><span> </span><span>=</span><span> </span><span>New-Computer</span><span> </span><span>-Type</span><span> </span><span>Server</span><span>
</span><span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>$Server</span><span>

</span><span>Name</span><span>                                       </span><span>Type</span><span>
</span><span>----</span><span>                                       </span><span>----</span><span>
</span><span>SRV-2780e4e7-67ca-45af-b127-e197f12b1f79</span><span> </span><span>Server</span><span>
</span>
```

This would be what we expected, right?

We can access the object properties as well

```
<span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>$Server</span><span>.</span><span>GetNewName</span><span>()</span><span>
</span><span>SRV-b7641dd4-14fa-4217-911e-2be15ec6a17b</span><span>
</span>
```

You might have guessed it already, but what would be the type of the `$Server` variable?

```
<span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>$Server</span><span> </span><span>|</span><span> </span><span>gm</span><span>


   </span><span>TypeName:</span><span> </span><span>Computer</span><span>
</span><span>Name</span><span>        </span><span>MemberType</span><span> </span><span>Definition</span><span>
</span><span>----</span><span>        </span><span>----------</span><span> </span><span>----------</span><span>
</span><span>Equals</span><span>      </span><span>Method</span><span>     </span><span>bool</span><span> </span><span>Equals</span><span>(</span><span>System.Object</span><span> </span><span>obj</span><span>)</span><span>
</span><span>GetHashCode</span><span> </span><span>Method</span><span>     </span><span>int</span><span> </span><span>GetHashCode</span><span>()</span><span>
</span><span>GetNewName</span><span>  </span><span>Method</span><span>     </span><span>string</span><span> </span><span>GetNewName</span><span>()</span><span>
</span><span>GetType</span><span>     </span><span>Method</span><span>     </span><span>type</span><span> </span><span>GetType</span><span>()</span><span>
</span><span>ToString</span><span>    </span><span>Method</span><span>     </span><span>string</span><span> </span><span>ToString</span><span>()</span><span>
</span><span>Name</span><span>        </span><span>Property</span><span>   </span><span>string</span><span> </span><span>Name</span><span> </span><span>{</span><span>get</span><span>;</span><span>set</span><span>;}</span><span>
</span><span>Type</span><span>        </span><span>Property</span><span>   </span><span>ComputerType</span><span> </span><span>Type</span><span> </span><span>{</span><span>get</span><span>;</span><span>set</span><span>;}</span><span>
</span>
```

Yes, it is of type `Computer`. This means that all the properties, and all the methods of this object are avaible to us now. I bet you noticed the `GetNewName` method I have added earlier in the list. Let’s try out!

```
<span>PS</span><span> </span><span>/Users/stephanevg/github/Stephanevg.github.io</span><span>&gt;</span><span> </span><span>$Server</span><span>.</span><span>GetNewName</span><span>()</span><span>
</span><span>SRV-b7641dd4-14fa-4217-911e-2be15ec6a17b</span><span>
</span>
```

Et voila!

We saw how I created one new Server, and one new client using classes nested in functions. The exported function `New-computer` actually created an instance of `[computer]` class, which we can use in our script, and call existing properties or methods. This works since the class and the function are both in the module scope.

## Class in modules schema

I have summarized the complete concept from above on the following schema, because I think that most things are easier to understand, once you see an image of it:

![ClassesInPowershell](https://stephanevg.github.io/images/module-diagram.png)

Cheers!

[1]: https://github.com/Stephanevg/PSHTML
[2]: https://github.com/Stephanevg/PsClassUtils
[3]: https://github.com/Stephanevg/PSClassUtils
[4]: https://github.com/Stephanevg/PSClassUtils
[5]: https://github.com/Stephanevg/PSClassUtils
![Img](https://xainey.github.io/images/posts/powershell-classes-and-concepts/powershell-highlander.png)

## Abstract

The release of _Powershell WMF5_ added classes to help simplify the creation of DSC resources. The class wrapper helps us encapsulate and localize variables and methods by creating objects. Classes expose an entirely new paradigm to Powershell known as Object-Oriented Programming. Taking a glance at the authoring process for earlier modules and DSC resources we can see a few common problems. Code duplication, an easily identifiable code smell, is found through many of the open source projects. Dynamic scoping and encapsulation issues forced developers to clear, cast, or rename variables. Many of these problems are easily resolved using OOP. The following article outlines the basic syntax of PowerShell classes while subsequently introducing intermediate and advanced design pattern concepts.

___

-   [Abstract][1]
-   [Introduction][2]
-   [Syntax Overview][3]
    -   [Class Structure][4]
        -   [Classes][5]
        -   [Properties][6]
        -   [Methods][7]
        -   [$this][8]
        -   [Constructor][9]
        -   [ToString][10]
        -   [Example 1: Class Structure][11]
    -   [Creating instances of a class][12]
    -   [Static vs. Instance][13]
        -   [Static][14]
        -   [Instance][15]
    -   [Accessors/Mutators aka Getter/Setter][16]
    -   [Overloaded Methods][17]
    -   [Inheritance][18]
    -   [Using the Base Constructor][19]
    -   [Enumerations][20]
-   [Design Patterns][21]
    -   [Polymorphism][22]
    -   [Abstract Classes][23]
    -   [Singleton][24]
    -   [Factory Pattern][25]
        -   [Standard Factory Object Generation][26]
        -   [Using Static Methods to Set/Fetch Objects][27]
    -   [Method Chaining][28]
    -   [Base Splat Pattern][29]
        -   [Using object properties to Splat a function][30]
        -   [Using Base Helper to Generate Splat HashTable][31]
    -   [Loading Class Files][32]
        -   [Possible Workarounds][33]
-   [Conclusion][34]
-   [References][35]

___

## Introduction

Developers new to PowerShell, often find themselves looking for better design patterns to keep code clean and manageable. Since PowerShell is a _functional_ language, it felt worthwhile to experiment with modern design patterns commonly seen in languages like **JavaScript**. One example of this is `closures`. Keep in mind, treating PowerShell like JavaScript is a recipe for a hard time – albeit an entertaining challenge.

<table data-hpc="" data-tab-size="8" data-paste-markdown-skip="" data-tagsearch-lang="PowerShell" data-tagsearch-path="PoshClosure.ps1"><tbody><tr><td id="file-poshclosure-ps1-L1" data-line-number="1"></td><td id="file-poshclosure-ps1-LC1"><span>$Adder</span> <span>=</span> {</td></tr><tr><td id="file-poshclosure-ps1-L2" data-line-number="2"></td><td id="file-poshclosure-ps1-LC2"><span>param</span> ([<span>int</span>] <span>$x</span>)</td></tr><tr><td id="file-poshclosure-ps1-L3" data-line-number="3"></td><td id="file-poshclosure-ps1-LC3"><span>return</span> (</td></tr><tr><td id="file-poshclosure-ps1-L4" data-line-number="4"></td><td id="file-poshclosure-ps1-LC4">{</td></tr><tr><td id="file-poshclosure-ps1-L5" data-line-number="5"></td><td id="file-poshclosure-ps1-LC5"><span>param</span> ([<span>string</span>] <span>$y</span>)</td></tr><tr><td id="file-poshclosure-ps1-L6" data-line-number="6"></td><td id="file-poshclosure-ps1-LC6"></td></tr><tr><td id="file-poshclosure-ps1-L7" data-line-number="7"></td><td id="file-poshclosure-ps1-LC7"><span>return</span> (<span>$x</span> <span>+</span> <span>$y</span>)</td></tr><tr><td id="file-poshclosure-ps1-L8" data-line-number="8"></td><td id="file-poshclosure-ps1-LC8">}.GetNewClosure()</td></tr><tr><td id="file-poshclosure-ps1-L9" data-line-number="9"></td><td id="file-poshclosure-ps1-LC9">)</td></tr><tr><td id="file-poshclosure-ps1-L10" data-line-number="10"></td><td id="file-poshclosure-ps1-LC10">}</td></tr><tr><td id="file-poshclosure-ps1-L11" data-line-number="11"></td><td id="file-poshclosure-ps1-LC11"></td></tr><tr><td id="file-poshclosure-ps1-L12" data-line-number="12"></td><td id="file-poshclosure-ps1-LC12"><span>Set-Item</span> <span>-</span>Path <span><span>"</span>Function:Adder<span>"</span></span> <span>-</span>Value <span>$Adder</span></td></tr><tr><td id="file-poshclosure-ps1-L13" data-line-number="13"></td><td id="file-poshclosure-ps1-LC13"></td></tr><tr><td id="file-poshclosure-ps1-L14" data-line-number="14"></td><td id="file-poshclosure-ps1-LC14"><span>$add5</span> <span>=</span> Adder <span>5</span></td></tr><tr><td id="file-poshclosure-ps1-L15" data-line-number="15"></td><td id="file-poshclosure-ps1-LC15"><span>$add10</span> <span>=</span> Adder <span>10</span></td></tr><tr><td id="file-poshclosure-ps1-L16" data-line-number="16"></td><td id="file-poshclosure-ps1-LC16"></td></tr><tr><td id="file-poshclosure-ps1-L17" data-line-number="17"></td><td id="file-poshclosure-ps1-LC17"><span>$add5<span>.Invoke</span></span>(<span>2</span>)</td></tr><tr><td id="file-poshclosure-ps1-L18" data-line-number="18"></td><td id="file-poshclosure-ps1-LC18"><span>$add10<span>.Invoke</span></span>(<span>2</span>)</td></tr></tbody></table>

Eventually, we find ourselves settling for the current arsenal such as _Splatting_, _Pipelines_, and _Remoting_. The introduction of class-based resources rekindles the quest for better code design. At that time, finding resources on the new syntax was nearly impossible.

Huge thanks go out to [June Blender][36] for her section on MVA ([What’s new in Powershell v5][37]) as well as her blog articles over at Sapien. June’s contributions helped us get a handle on the basics and inspired me to help others in return.

-   For anyone primarily looking for information on authoring DSC Class based resources.
    -   [Matthew Hodgkins][38] has an excellent article to get you started.
-   For testing _WMF4/5_ resources, I highly recommend investing time with `Test-Kitchen` and `Kitchen-DSC`.
    -   [Steven Murawski][39] from Chef provides an exceptional collection of resources.
-   Class-based resouces requires some workarounds.
    -   [Doug Finke][40] and [Christopher Hunt][41] provide a few articles on the caveats.

## Syntax Overview

### Class Structure

The following is an overview of Object-Oriented Programming and Class syntax in WMF5.

#### Classes

We can think of `Classes` as models or blueprints. To use a _Class_, we create a special _Type_ of variable known as an **Object**; an _Object_ is an **instance** of a _Class_.

Think of a class as a way to create a specification of variables, functions, and other properties (e.g. a template). Now to use this model, we must create an instance of the specification (object). Similarly, this is the same idea where a contractor can use a blueprint to build multiple houses. Once created, an object has _access_ to **properties** and **methods** defined by its class.

<table><tbody><tr><td><pre>1
2
3
4</pre></td><td><pre><span># Class Syntax</span>
<span>class </span>CyberNinja
<span>{</span>
<span>}</span>
</pre></td></tr></tbody></table>

#### Properties

`Properties` are a special type of class member which define a **field** (data variable) as well as hidden methods to _get_ and _set_ the value.

A **Property** is composed of a `data type`, `name`, `default value`, `access modifier`, and `non-access modifier`.

-   **Data Type**: A data type can be a built-in type like _\[String\]_, _\[Int32\]_, _\[Bool\]_.
    -   Additionally, this could also be a custom data type such as another PowerShell class: `[CyberNinja]`.
-   **Name**: The name of the property.
    -   The name follows a set of allowed rules such as alphanumeric, underscores, dashes, and, numbers.
-   **Default Value (Optional)**: Specifies the default value of a Property when creating an object.
    -   If a value is not declared, the property will not always be null.
    -   The default value of the properties data type determines the value.
-   **Access Modifier (Optional)**: _\[public, hidden\]_. The default modifier is public; however, we do not use the public keyword.
-   **Non-access Modifier (Optional)**: The _static_ keyword controls if a property is an _instance_ or _class/static_ type.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9</pre></td><td><pre><span># Public Properties</span>
<span>[</span><span>String</span><span>]</span> <span>$Alias</span>
<span>[</span>Int32] <span>$HitPoints</span>

<span># Static Properties</span>
static <span>[</span><span>String</span><span>]</span> <span>$Clan</span> <span>=</span> <span>"Posh Shinobi"</span>

<span># Hidden Properties</span>
hidden <span>[</span><span>String</span><span>]</span> <span>$RealName</span>
</pre></td></tr></tbody></table>

> _Note:_ More on Access Modifiers below.

#### Methods

The term `Method` is a fancy way of describing a function defined inside of a class. In OOP, a method can take arguments the same as a function; however, they must return a value.

-   If a method **does not** return a value, the return type is `[Void]`.
-   A **data type** should be type-hinted for each argument in the method header, e.g., `[String] $Name`.

A method should have an `access modifier`, `name`, `arguments`, and `return type`.

-   The access modifier is considered **public** if left blank.
-   If `static` is **not** declared the property will be an instance type.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17</pre></td><td><pre><span># Instance Method</span>
<span>[</span><span>String</span><span>]</span> getAlias<span>()</span>
<span>{</span>
    <span>return</span> <span>$this</span>.Alias
<span>}</span>

<span># Static Method</span>
static <span>[</span><span>String</span><span>]</span> getClan<span>()</span>
<span>{</span>
    <span>return</span> <span>[</span>CyberNinja]::Clan
<span>}</span>

<span># Static Method</span>
static <span>[</span><span>String</span><span>]</span> Whisper <span>([</span><span>String</span><span>]</span> <span>$Name</span><span>)</span>
<span>{</span>
    <span>return</span> <span>"Hello {0}!"</span> -f <span>$Name</span>
<span>}</span>
</pre></td></tr></tbody></table>

#### $this

The `$this` variable describes the **current instance** of the object. It is thought of like `$_` for classes.

-   If a property is not static, the syntax `$this.PropertyName` is used to reference the instance property.
-   To refer to methods simply use the method name or `$this.MethodName()`.

> _Note:_ A static method cannot use **$this**.

#### Constructor

A `Constructor` is a type of method that is called only when an object is created.

-   A constructor **must** use the same name as the class.

Let’s say we create a class called `CyberNinja` with properties for the ninja’s **Alias** and **HitPoints**. By design, we would not want to allow someone to create a ninja object without filling in the required properties. To force any required arguments, we need a constructor.

Constructors are similar to the `Begin` block in `Functions`.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9</pre></td><td><pre><span>class </span>CyberNinja
<span>{</span>
    <span># Constructor</span>
    CyberNinja <span>([</span><span>String</span><span>]</span> <span>$Alias</span>, <span>[</span>int32] <span>$HitPoints</span><span>)</span>
    <span>{</span>
        <span>$this</span>.Alias <span>=</span> <span>$Alias</span>
        <span>$this</span>.HitPoints <span>=</span> <span>$HitPoints</span>
    <span>}</span>
<span>}</span>
</pre></td></tr></tbody></table>

#### ToString

`ToString` is one of the convenient object methods seen in traditional OOP. If an object is passed to a function which accepts a string argument, **ToString** will automatically be called.

-   If ToString is not added/overwritten in the class, the default _ToString_ method returns the class name.
-   The default object behavior can be forced by casting the object to `[System.Object]`.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16</pre></td><td><pre><span>class </span>myColor
<span>{</span>
    <span>[</span><span>String</span><span>]</span> <span>$Color</span>
    <span>[</span><span>String</span><span>]</span> <span>$Hex</span>

    myColor<span>([</span><span>String</span><span>]</span> <span>$Color</span>, <span>[</span><span>String</span><span>]</span> <span>$Hex</span><span>)</span>
    <span>{</span>
        <span>$this</span>.Color <span>=</span> <span>$Color</span>
        <span>$this</span>.Hex <span>=</span> <span>$Hex</span>
    <span>}</span>

    <span>[</span><span>String</span><span>]</span> ToString<span>()</span>
    <span>{</span>
        <span>return</span> <span>$this</span>.Color + <span>":"</span> + <span>$this</span>.Hex
    <span>}</span>
<span>}</span>
</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2
3
4
5
6
7</pre></td><td><pre>PS C:\&gt; $red = [myColor]::new("Red", "#FF0000")

PS C:\&gt; Write-Host $red
Red:#FF0000

PS C:\&gt; Write-Host ([System.Object]$red).ToString()
myColor
</pre></td></tr></tbody></table>

#### Example 1: Class Structure

The following code is a simple example of a basic class. Next, we look at how to use a class and continue with some more advanced concepts.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42</pre></td><td><pre><span>class </span>CyberNinja
<span>{</span>
    <span># Properties</span>
    <span>[</span><span>String</span><span>]</span> <span>$Alias</span>
    <span>[</span>int32] <span>$HitPoints</span>

    <span># Static Properties</span>
    static <span>[</span><span>String</span><span>]</span> <span>$Clan</span> <span>=</span> <span>"DevOps Library"</span>

    <span># Hidden Properties</span>
    hidden <span>[</span><span>String</span><span>]</span> <span>$RealName</span>

    <span># Parameterless Constructor</span>
    CyberNinja <span>()</span>
    <span>{</span>
    <span>}</span>

    <span># Constructor</span>
    CyberNinja <span>([</span><span>String</span><span>]</span> <span>$Alias</span>, <span>[</span>int32] <span>$HitPoints</span><span>)</span>
    <span>{</span>
        <span>$this</span>.Alias <span>=</span> <span>$Alias</span>
        <span>$this</span>.HitPoints <span>=</span> <span>$HitPoints</span>
    <span>}</span>

    <span># Method</span>
    <span>[</span><span>String</span><span>]</span> getAlias<span>()</span>
    <span>{</span>
       <span>return</span> <span>$this</span>.Alias
    <span>}</span>

    <span># Static Method</span>
    static <span>[</span><span>String</span><span>]</span> getClan<span>()</span>
    <span>{</span>
        <span>return</span> <span>[</span>CyberNinja]::Clan
    <span>}</span>

    <span># ToString Method</span>
    <span>[</span><span>String</span><span>]</span> ToString<span>()</span>
    <span>{</span>
        <span>return</span> <span>$this</span>.Alias + <span>":"</span> + <span>$this</span>.HitPoints
    <span>}</span>
<span>}</span>
</pre></td></tr></tbody></table>

### Creating instances of a class

To use a class, we must instantiate an object unless using static properties or methods. Most commonly, this is done using the `new()` static method or the [New-Object Command][42]. In some cases, such as creating classes dynamically by type, the _New-Object_ command is necessary.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15</pre></td><td><pre><span># Using Static "new" method.</span>
<span>$Ken</span> <span>=</span> <span>[</span>CyberNinja]::new<span>(</span><span>"Ken"</span>, 28<span>)</span>

<span># Using New-Object. Parameters for Argument list are positional and required by the constructor.</span>
<span>$Hodge</span> <span>=</span> <span>New-Object </span>CyberNinja -ArgumentList <span>"Hodge"</span>, 31

<span># Using a HashTable. Note: requires default or parameterless constructor.</span>
<span>$June</span> <span>=</span> <span>[</span>CyberNinja]@<span>{</span>
    Alias <span>=</span> <span>"June"</span>;
    HitPoints <span>=</span> 40;
<span>}</span>

<span># Dynamic Object Type using a variable name.</span>
<span>$Type</span> <span>=</span> <span>"CyberNinja"</span>
<span>$Steven</span> <span>=</span> <span>New-Object</span> -TypeName <span>$Type</span>
</pre></td></tr></tbody></table>

When considering code design, it is common to declare the object type explicitly.

<table><tbody><tr><td><pre>1</pre></td><td><pre>PS C:\&gt; [CyberNinja] $Ken = [CyberNinja]::new("Ken", 28)
</pre></td></tr></tbody></table>

### Static vs. Instance

The keyword `static` is a **non-access modifier** for properties and methods within a class.

-   For **properties**, the value is the same across every instance of the class.
-   For **methods**, the method cannot use instanced variables such as `$this.Name`

Looking back at _Example 1_, if we create ten _CyberNinja_ objects and change the **$Clan** property of any one of them, the change will be reflected in every single _Object_.

#### Static

-   Uses the `::` operator to access the property or method.
-   Typically called using `[Class]::Property`, where “Class” is the name of the class.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13</pre></td><td><pre><span>[</span>CyberNinja] <span>$Ken</span> <span>=</span> <span>[</span>CyberNinja]::new<span>(</span><span>"Ken"</span>, 28<span>)</span>

<span># Call a Static Method</span>
<span>$Ken</span>::getClan<span>()</span>
<span>[</span>CyberNinja]::getClan<span>()</span>

<span># Fetch Static Prop Value</span>
<span>$Ken</span>::Clan
<span>[</span>CyberNinja]::Clan

<span># Set Static Prop Value</span>
<span>$Ken</span>::Clan <span>=</span> <span>"DevOps Library"</span>
<span>[</span>CyberNinja]::Clan <span>=</span> <span>"DevOps Library"</span>
</pre></td></tr></tbody></table>

#### Instance

-   Uses the `.` operator to access the property or method.
-   Must be called on an instanced object of a class – not directly.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10</pre></td><td><pre><span>[</span>CyberNinja] <span>$Ken</span> <span>=</span> <span>[</span>CyberNinja]::new<span>(</span><span>"Ken"</span>, 28<span>)</span>

<span># Call an Instance Method</span>
<span>$Ken</span>.getAlias<span>()</span>

<span># Fetch Instance Prop Value</span>
<span>$Ken</span>.HitPoints

<span># Set Instance Prop Value</span>
<span>$Ken</span>.Alias <span>=</span> <span>"Mekuto"</span>
</pre></td></tr></tbody></table>

### Accessors/Mutators aka Getter/Setter

Properties in a PowerShell class can be `static`, `public`, and `hidden`.

-   By default, a property is **public**.
-   To **get** a property value from an object, use `$obj.Name`.
-   To **set** a property from an object, use `$obj.Name = "New Name"`.

Powershell automatically creates **accessor** methods for getting and setting the value. These **hidden** accessor methods are called `get_x`, `set_x` where “x” is the property name.

> **Hidden** is not the same as **private** in languages such as C#.

If we create an object of the _\[CyberNinja\]_ class and view the members with `Get-Member`, we can see all of the **public** members.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17</pre></td><td><pre>PS C:\&gt; $Chris = [CyberNinja]::new("Mirishikiari", 28)

PS C:\&gt; $Chris | Get-Member

PS C:\&gt; $Chris | Get-Member

   TypeName: CyberNinja

Name        MemberType Definition
----        ---------- ----------
Equals      Method     bool Equals(System.Object obj)
GetHashCode Method     int GetHashCode()
getAlias    Method     string getAlias()
GetType     Method     type GetType()
ToString    Method     string ToString()
Alias       Property   string Alias {get;set;}
HitPoints   Property   int HitPoints {get;set;}
</pre></td></tr></tbody></table>

Hidden members can be viewed by supplying the `-Force` Flag to `Get-Member`.

> **Note:** V5 does not have private variables since PowerShell uses PowerShell for debugging.

In the following code example, notice the **get\_x** and **set\_x** methods PowerShell automatically creates for our properties. Our hidden **RealName** Property is also accessible – how quaint.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28</pre></td><td><pre>PS C:\&gt; $Mike = [CyberNinja]::new("Xainey", 28)

PS C:\&gt; $Mike | Get-Member -Force

   TypeName: CyberNinja

Name          MemberType   Definition                                 
----          ----------   ----------                                 
pstypenames   CodeProperty System.Collections.ObjectModel.Collection`1...
psadapted     MemberSet    psadapted {Alias, HitPoints, get_Alias, set...
psbase        MemberSet    psbase {Alias, HitPoints, get_Alias, set_Al...
psextended    MemberSet    psextended {}                              
psobject      MemberSet    psobject {Members, Properties, Methods, Imm...
Equals        Method       bool Equals(System.Object obj)             
getAlias      Method       string getAlias()                          
GetHashCode   Method       int GetHashCode()                          
GetType       Method       type GetType()                             
get_Alias     Method       string get_Alias()                         
get_HitPoints Method       int get_HitPoints()                        
get_RealName  Method       string get_RealName()                      
set_Alias     Method       void set_Alias(string )                    
set_HitPoints Method       void set_HitPoints(int )                   
set_RealName  Method       void set_RealName(string )                 
ToString      Method       string ToString()                          
Alias         Property     string Alias {get;set;}                    
HitPoints     Property     int HitPoints {get;set;}                   
RealName      Property     string RealName {get;set;}                 

</pre></td></tr></tbody></table>

> Hidden properties are masked, but still accessible to the debugger. _June Blender - @juneb_

`Get-Member` can be useful for finding methods on custom objects and built-in objects.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8</pre></td><td><pre><span># All</span>
<span>[</span>Math] | <span>Get-Member</span>

<span># Static Only Methods</span>
<span>[</span>Math] | <span>Get-Member</span> -Static

<span># Hidden</span>
<span>[</span>Math] | <span>Get-Member</span> -Force
</pre></td></tr></tbody></table>

### Overloaded Methods

`Method Overloading` is a way to define multiple methods with the same name. Overloaded methods behave differently depending on **the number of arguments** or the **data types of the arguments** supplied. In the following code example, `SayHello()` and `add()` can be called different ways.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22</pre></td><td><pre><span>class </span>OverloadExample
<span>{</span>
    static <span>[</span><span>String</span><span>]</span> SayHello <span>()</span>
    <span>{</span>
        <span>return</span> <span>"Hello There!"</span>
    <span>}</span>

    static <span>[</span><span>String</span><span>]</span> SayHello <span>([</span><span>String</span><span>]</span> <span>$Name</span><span>)</span>
    <span>{</span>
        <span>return</span> <span>"Hello {0}!"</span> -f <span>$Name</span>
    <span>}</span>

    static <span>[</span><span>int</span><span>]</span> add<span>([</span><span>int</span><span>]</span> <span>$a</span>, <span>[</span><span>int</span><span>]</span> <span>$b</span><span>)</span>
    <span>{</span>
        <span>return</span> <span>$a</span> + <span>$b</span>
    <span>}</span>

    static <span>[</span><span>double</span><span>]</span> add<span>([</span><span>double</span><span>]</span> <span>$a</span>, <span>[</span><span>double</span><span>]</span> <span>$b</span><span>)</span>
    <span>{</span>
        <span>return</span> <span>$a</span> + <span>$b</span>
    <span>}</span>
<span>}</span>
</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11</pre></td><td><pre>PS C:\&gt; [OverloadExample]::SayHello()
Hello There!

PS C:\&gt; [OverloadExample]::SayHello("Mike")
Hello Mike!

PS C:\&gt; [OverloadExample]::add(1, 2)
3

PS C:\&gt; [OverloadExample]::add(1.1, 2.3)
3.4
</pre></td></tr></tbody></table>

> Methods and Constructors are overloadable.

We could also refactor the above example to simplify `SayHello()`. In this next snippet, the parameterless `SayHello()` method is funneled through the single argument method.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13</pre></td><td><pre><span>class </span>OverloadRefactor
<span>{</span>
    <span># Calls Overloaded Method</span>
    static <span>[</span><span>String</span><span>]</span> SayHello <span>()</span>
    <span>{</span>
        <span>return</span> <span>[</span>OverloadRefactor]::SayHello<span>(</span><span>"There"</span><span>)</span>
    <span>}</span>

    static <span>[</span><span>String</span><span>]</span> SayHello <span>([</span><span>String</span><span>]</span> <span>$Name</span><span>)</span>
    <span>{</span>
        <span>return</span> <span>"Hello {0}!"</span> -f <span>$Name</span>
    <span>}</span>
<span>}</span>
</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2
3
4
5</pre></td><td><pre>PS C:\&gt; [OverloadRefactor]::SayHello()
Hello There!

PS C:\&gt; [OverloadRefactor]::SayHello("Mike")
Hello Mike!
</pre></td></tr></tbody></table>

### Inheritance

`Inheritance` allows for programmers to create classes from existing classes by **extending** them. In this way, we can reuse classes and extend the functionality without editing a closed class. \*cough SOLID\* When a class is **extended**, all of the members from the base or parent class are inherited (passed on) to the child class.

-   To extend a class, use the syntax `Class Child : Parent`.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16</pre></td><td><pre><span># Foo is the parent class</span>
<span>class </span>Foo
<span>{</span>
    <span>[</span><span>string</span><span>]</span> <span>$Message</span> <span>=</span> <span>"Hello!"</span>

    <span>[</span><span>string</span><span>]</span> GetMessage<span>()</span>
    <span>{</span>
        <span>return</span> <span>(</span><span>"Message: {0}"</span> -f <span>$this</span>.Message<span>)</span>
    <span>}</span>
<span>}</span>

<span># Bar extends Foo and inherits its members</span>
<span>class </span>Bar : Foo
<span>{</span>

<span>}</span>
</pre></td></tr></tbody></table>

The class **Bar** does not declare any properties or methods. If we create an instance of the **Bar** class, it will **inherit** all of the members of its parent class.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7</pre></td><td><pre>PS C:\&gt; $myBar = [Bar]::new()

PS C:\&gt; $myBar.Message
Hello!

PS C:\&gt; $myBar.GetMessage()
Message: Hello!
</pre></td></tr></tbody></table>

> Note: To override this behavior, we must **redeclare** the members in the child class.

### Using the Base Constructor

A child class can call the constructor of its parent by using the `: base()` command on its constructor.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24</pre></td><td><pre><span>class </span>ZeroWing
<span>{</span>
    <span>[</span><span>String</span><span>]</span> <span>$User</span>
    <span>[</span><span>String</span><span>]</span> <span>$Message</span>

    ZeroWing<span>([</span><span>String</span><span>]</span> <span>$User</span>, <span>[</span><span>String</span><span>]</span> <span>$Message</span><span>)</span>
    <span>{</span>
        <span>$this</span>.User <span>=</span> <span>$User</span>
        <span>$this</span>.Message <span>=</span> <span>$Message</span>
    <span>}</span>

    <span>[</span><span>String</span><span>]</span> TurnOn<span>()</span>
    <span>{</span>
        <span>return</span> <span>(</span><span>"{0} : {1}"</span> -f <span>$this</span>.User, <span>$this</span>.Message<span>)</span>
    <span>}</span>
<span>}</span>

<span>class </span>MainScreen : ZeroWing
<span>{</span>
    MainScreen<span>([</span><span>String</span><span>]</span> <span>$User</span>, <span>[</span><span>String</span><span>]</span> <span>$Message</span><span>)</span> : base<span>(</span><span>$User</span>, <span>$Message</span><span>)</span>
    <span>{</span>

    <span>}</span>
<span>}</span>
</pre></td></tr></tbody></table>

The constructor for `MainScreen` **maps** parameters to the base constructor.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7</pre></td><td><pre>PS C:\&gt; $mainScreen = [MainScreen]::new("CATS", "All your base are belong to us.")

PS C:\&gt; $mainScreen.User
CATS

PS C:\&gt; $mainScreen.TurnOn()
CATS : All your base are belong to us.
</pre></td></tr></tbody></table>

### Enumerations

An `Enum` is a special _Type_ which defines a set of named constants. In PowerShell, we can use an **Enum** as an argument type for a method in a _Class_. The Enum type lets a method **restrict** the argument values it can accept.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7</pre></td><td><pre>Enum Turtles
<span>{</span>
    Donatello
    Leonardo
    Michelangelo
    Raphael
<span>}</span>
</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2
3
4
5
6
7</pre></td><td><pre>Enum Turtles
<span>{</span>
    Donatello <span>=</span> 1
    Leonardo <span>=</span> 2
    Michelangelo <span>=</span> 3
    Raphael <span>=</span> 4
<span>}</span>
</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2
3
4
5</pre></td><td><pre>To get names from an enum
PS C:\&gt; [System.Enum]::GetValues([Turtles])

To get int values from an enum
PS C:\&gt; [System.Enum]::GetValues([Turtles]) | foreach { [int] $_ }
</pre></td></tr></tbody></table>

## Design Patterns

### Polymorphism

`Polymorphism` commonly uses a **parent class** to reference a **child class**. In more advanced cases we rely on _interfaces_. However, interfaces are not included natively in PowerShell v5.

Using classes to demonstrate polymorphism is straightforward as seen in the next example.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52</pre></td><td><pre><span>class </span>Foo
<span>{</span>
    <span>[</span><span>string</span><span>]</span> <span>$SomePram</span>

    Foo<span>([</span><span>string</span><span>]</span><span>$somePram</span><span>)</span>
    <span>{</span>
        <span>$this</span>.SomePram <span>=</span> <span>$somePram</span>
    <span>}</span>

    <span>[</span><span>string</span><span>]</span> GetMessage<span>()</span>
    <span>{</span>
        <span>return</span> <span>$null</span>
    <span>}</span>

    <span>[</span>void] WriteMessage<span>()</span>
    <span>{</span>
        <span>Write-Host</span><span>(</span><span>$this</span>.GetMessage<span>())</span>
    <span>}</span>
<span>}</span>

<span>class </span>Bar : Foo
<span>{</span>
    Bar<span>([</span><span>string</span><span>]</span><span>$somePram</span><span>)</span>: base<span>(</span><span>$somePram</span><span>)</span>
    <span>{</span>

    <span>}</span>

    <span>[</span><span>string</span><span>]</span> GetMessage<span>()</span>
    <span>{</span>
        <span>return</span> <span>(</span><span>"{0} Success"</span> -f <span>$this</span>.SomePram<span>)</span>
    <span>}</span>
<span>}</span>

<span>class </span>Bar2 : Foo
<span>{</span>
    Bar2<span>([</span><span>string</span><span>]</span><span>$somePram</span><span>)</span>: base<span>(</span><span>$somePram</span><span>)</span>
    <span>{</span>

    <span>}</span>

    <span>[</span><span>string</span><span>]</span> GetMessage<span>()</span>
    <span>{</span>
        <span>return</span> <span>(</span><span>"{0} Success"</span> -f <span>$this</span>.SomePram<span>)</span>
    <span>}</span>
<span>}</span>

<span>[</span>Foo[]] <span>$foos</span> <span>=</span> @<span>([</span>Bar]::new<span>(</span><span>"Bar"</span><span>)</span>, <span>[</span>Bar2]::new<span>(</span><span>"Bar2"</span><span>))</span>

<span>foreach</span><span>(</span><span>$foo</span> <span>in</span> <span>$foos</span><span>)</span>
<span>{</span>
    <span>$foo</span>.WriteMessage<span>()</span>
<span>}</span>
</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2</pre></td><td><pre>Bar Success
Bar2 Success
</pre></td></tr></tbody></table>

While this may work in some cases, we may decide that the logic for `WriteMessage()` should not be in the base class. If we had interfaces, this feat would be simple enough. Since we do not, this brings us to the next pattern: _Abstract Classes_.

### Abstract Classes

An `Abstract Class` is similar to a combination of an **Interface** and a **Class**. It can be used to define the underlying contract required by any class extending it.

-   In OOP a class which extends an abstract class **should implement** all of the defined methods, similar to an interface.
-   Additionally, we **cannot** create an instance of an abstract class.

Since PowerShell **does not** have the `abstract` keyword, we need to simulate this functionality. In the next example:

-   _Foo_ **cannot** be directly instantiated
-   `SayHello()` in the _Foo_ class **must be overridden** by a child class. Otherwise, we should throw an error.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31</pre></td><td><pre><span>class </span>Foo
<span>{</span>
    Foo <span>()</span>
    <span>{</span>
        <span>$type</span> <span>=</span> <span>$this</span>.GetType<span>()</span>

        <span>if</span> <span>(</span><span>$type</span> -eq <span>[</span>Foo]<span>)</span>
        <span>{</span>
            <span>throw</span><span>(</span><span>"Class </span><span>$type</span><span> must be inherited"</span><span>)</span>
        <span>}</span>
    <span>}</span>

    <span>[</span><span>string</span><span>]</span> SayHello<span>()</span>
    <span>{</span>
        <span>throw</span><span>(</span><span>"Must Override Method"</span><span>)</span>
    <span>}</span>
<span>}</span>

<span>class </span>Bar : Foo
<span>{</span>
    Bar <span>()</span>
    <span>{</span>

    <span>}</span>

    <span>[</span><span>string</span><span>]</span> SayHello<span>()</span>
    <span>{</span>
        <span>return</span> <span>"Hello"</span>
    <span>}</span>
<span>}</span>

</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17</pre></td><td><pre><span># </span><span>Can</span><span> not instantiate [Foo]
</span><span># </span><span>$Foo</span><span> = [Foo]::new()
</span>
<span># </span><span>Since</span><span> we cannot create a direct object from [Foo] we cannot call SayHello()
</span><span># </span><span>$Foo.SayHello()</span><span>
</span>
<span># </span><span>[Bar]</span><span> must override SayHello()
</span>$Bar = [Bar]::new()
$Bar.SayHello()

<span># </span><span>Can</span><span> use polymorphism
</span>[Foo[]] $MyFoo = @([Bar]::new())

foreach($obj in $MyFoo)
{
    $obj.SayHello()
}
</pre></td></tr></tbody></table>

### Singleton

The `Singleton` design pattern used to restrict the instantiation of a _Class_ to **one object only**. Many other design patterns require a singleton implementation.

Typically, we want to use a singleton when:

-   There should only be a single global object.
-   There is a need to control concurrent access to a shared resource.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17</pre></td><td><pre><span>class </span>Singleton
<span>{</span>
    <span># Instanced Property</span>
    <span>[</span><span>int</span><span>]</span> <span>$SomeParm</span>

    static <span>[</span>Singleton] <span>$instance</span>

    static <span>[</span>Singleton] GetInstance<span>()</span>
    <span>{</span>
        <span>if</span> <span>([</span>Singleton]::instance -eq <span>$null</span><span>)</span>
        <span>{</span>
            <span>[</span>Singleton]::instance <span>=</span> <span>[</span>Singleton]::new<span>()</span>
        <span>}</span>

        <span>return</span> <span>[</span>Singleton]::instance
    <span>}</span>
<span>}</span>
</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11</pre></td><td><pre>PS C:\&gt; $single = [Singleton]::GetInstance()

PS C:\&gt; $single.SomeParm = "Highlander"

PS C:\&gt; $single.SomeParm
Highlander

PS C:\&gt; $another = [Singleton]::GetInstance()

PS C:\&gt; $another.SomeParm
Highlander
</pre></td></tr></tbody></table>

> There can be only one!

### Factory Pattern

The `Factory Pattern` considered a **creational pattern**, is by far one of the most valuable models. It lets us create objects, though a common factory interface, _without_ needing to reference an exact class. This pattern also allows for the creation of objects without exposing the underlying creation logic.

> Note: The following example builds on my earlier concepts on abstract classes.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94</pre></td><td><pre><span>&lt;#
 # Abstract Class: Drink
 # Create an Abstract drink class to serve as the interface.
 # Constructor restricts this class being instantiated directly.
 # Methods are defined and force children to override.
 #&gt;</span>
<span>class </span>Drink
<span>{</span>
    <span>[</span><span>String</span><span>]</span> <span>$Name</span>

    <span>[</span>Int32] <span>$Caffeine</span>

    Drink <span>([</span><span>String</span><span>]</span> <span>$Name</span>, <span>[</span>Int32] <span>$Caffeine</span><span>)</span>
    <span>{</span>
        <span>$type</span> <span>=</span> <span>$this</span>.GetType<span>()</span>

        <span>if</span> <span>(</span><span>$type</span> -eq <span>[</span>Drink]<span>)</span>
        <span>{</span>
            <span>throw</span><span>(</span><span>"Class </span><span>$type</span><span> must be inherited"</span><span>)</span>
        <span>}</span>

        <span>$this</span>.Name <span>=</span> <span>$Name</span>
        <span>$this</span>.Caffeine <span>=</span> <span>$Caffeine</span>
    <span>}</span>

    <span>[</span><span>string</span><span>]</span> Open<span>()</span>
    <span>{</span>
        <span>throw</span><span>(</span><span>"Must Override Method"</span><span>)</span>
    <span>}</span>

<span>}</span>

<span>&lt;#
 # EnergyDrink Class: implements Drink
 # Constructor uses base constructor.
 # Methods overrides are declared.
 #&gt;</span>
<span>class </span>EneryDrink : Drink
<span>{</span>
    EneryDrink <span>([</span><span>String</span><span>]</span> <span>$Name</span>, <span>[</span>Int32] <span>$Caffeine</span><span>)</span> : base <span>(</span><span>$Name</span>, <span>$Caffeine</span><span>)</span>
    <span>{</span>
    <span>}</span>

    <span># @Override</span>
    <span>[</span><span>string</span><span>]</span> Open<span>()</span>
    <span>{</span>
        <span>return</span> <span>"Popped the tab on a can of: {0}"</span> -f <span>$this</span>.Name
    <span>}</span>
<span>}</span>

<span>&lt;#
 # Soda Class: implements Drink
 # Constructor uses base constructor.
 # Methods overrides are declared.
 #&gt;</span>
<span>class </span>Soda : Drink
<span>{</span>
    Soda <span>([</span><span>String</span><span>]</span> <span>$Name</span>, <span>[</span>Int32] <span>$Caffeine</span><span>)</span> : base <span>(</span><span>$Name</span>, <span>$Caffeine</span><span>)</span>
    <span>{</span>
    <span>}</span>

    <span># @Override</span>
    <span>[</span><span>string</span><span>]</span> Open<span>()</span>
    <span>{</span>
        <span>return</span> <span>"Twisted the top of a bottle of: {0}"</span> -f <span>$this</span>.Name
    <span>}</span>
<span>}</span>

<span>&lt;#
 # Factory Class: DrinkFactory
 # Instance Methods generate new Drinks.
 # Static Properties/Methods demonstrate Storage/Fetch Concepts.
 #&gt;</span>
<span>class </span>DrinkFactory
<span>{</span>
    <span>#Store and Fetch</span>
    static <span>[</span>Drink[]] <span>$Drinks</span>

    static <span>[</span><span>Object</span><span>]</span> getByType<span>([</span><span>Object</span><span>]</span> <span>$O</span><span>)</span>
    <span>{</span>
        <span>return</span> <span>[</span>DrinkFactory]::Drinks.Where<span>({</span><span>$_</span> -is <span>$O</span><span>})</span>
    <span>}</span>

    static <span>[</span><span>Object</span><span>]</span> getByName<span>([</span><span>String</span><span>]</span> <span>$Name</span><span>)</span>
    <span>{</span>
        <span>return</span> <span>[</span>DrinkFactory]::Drinks.Where<span>({</span><span>$_</span>.Name -eq <span>$Name</span><span>})</span>
    <span>}</span>

    <span>#Create an instance</span>
    <span>[</span>Drink] makeDrink<span>([</span><span>String</span><span>]</span> <span>$Name</span>, <span>[</span><span>String</span><span>]</span> <span>$Caffeine</span>, <span>[</span><span>String</span><span>]</span> <span>$Type</span><span>)</span>
    <span>{</span>
        <span>return</span> <span>(</span><span>New-Object</span> -TypeName <span>"</span><span>$Type</span><span>"</span> -ArgumentList <span>$Name</span>, <span>$Caffeine</span><span>)</span>
    <span>}</span>
<span>}</span>
</pre></td></tr></tbody></table>

#### Standard Factory Object Generation

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16</pre></td><td><pre>PS C:\&gt; [DrinkFactory] $DrinkFactory = [DrinkFactory]::new()

PS C:\&gt; [Drink] $Beverage1 = $DrinkFactory.makeDrink("RedBull", 100, "EneryDrink")

PS C:\&gt; [Drink] $Beverage2 = $DrinkFactory.makeDrink("Monster", 100, "EneryDrink")

PS C:\&gt; [Drink] $Beverage3 = $DrinkFactory.makeDrink("Coke", 100, "Soda")

PS C:\&gt; $Beverage1.Open()
Popped the tab on a can of: RedBull

PS C:\&gt; $Beverage2.Open()
Popped the tab on a can of: Monster

PS C:\&gt; $Beverage3.Open()
Twisted the top of a bottle of: Coke
</pre></td></tr></tbody></table>

#### Using Static Methods to Set/Fetch Objects

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20</pre></td><td><pre>PS C:\&gt; [DrinkFactory]::Drinks = @(
            [EneryDrink]::new("RedBull", 28),
            [EneryDrink]::new("Monster", 20),
            [Soda]::new("Coke", 24)
        )

PS C:\&gt; [DrinkFactory]::getByType([EneryDrink])

Name    Caffeine
----    --------
RedBull       28
Monster       20


PS C:\&gt; [DrinkFactory]::getByName("Coke")

Name Caffeine
---- --------
Coke       24

</pre></td></tr></tbody></table>

### Method Chaining

`Method chaining` is a popular design pattern in languages such as _JavaScript_ and _PHP_. Traditionally, in functional languages, functions or constructors required large numbers of positional arguments. Method chaining gives us a way to create an object and set these values in a maintainable and readable fashion.

This pattern is also known as the **named parameter idiom**. To create this pattern:

1.  Create a method to set a property.
2.  Set the return type of the method to the class type.
3.  Set an instance variable.
4.  Return `$this`.

> _Note:_ The following example uses Enums to handle defaults easily.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69</pre></td><td><pre>Enum Crust
<span>{</span>
    Thin
    HandTossed
    DeepDish
<span>}</span>

Enum Sauce
<span>{</span>
    Marinara
    GarlicParmesan
    Buffalo
<span>}</span>

Enum Toppings
<span>{</span>
    Pepperoni
    Sausage
    Chicken
<span>}</span>

<span>class </span>Pizza
<span>{</span>
    <span>[</span>Crust] <span>$crust</span>
    <span>[</span>Sauce] <span>$sauce</span>
    <span>[</span>Toppings] <span>$toppings</span>

    <span># Default, Parameterless Constructor</span>
    Pizza<span>()</span>
    <span>{</span>

    <span>}</span>

    <span># Named Constructor</span>
    static <span>[</span>Pizza] newOrder<span>()</span>
    <span>{</span>
        <span>return</span> <span>[</span>Pizza]::New<span>()</span>
    <span>}</span>


    <span>[</span>Pizza] chooseCrust<span>([</span>Crust] <span>$crust</span><span>)</span>
    <span>{</span>
        <span>$this</span>.crust <span>=</span> <span>$crust</span>
        <span>return</span> <span>$this</span>
    <span>}</span>

    <span>[</span>Pizza] addSauce<span>([</span>Sauce] <span>$sauce</span><span>)</span>
    <span>{</span>
        <span>$this</span>.sauce <span>=</span> <span>$sauce</span>
        <span>return</span> <span>$this</span>
    <span>}</span>

    <span>[</span>Pizza] addToppings<span>([</span>Toppings] <span>$toppings</span><span>)</span>
    <span>{</span>
        <span>$this</span>.toppings <span>=</span> <span>$toppings</span>
        <span>return</span> <span>$this</span>
    <span>}</span>

    <span>[</span>Void] placeOrder<span>()</span>
    <span>{</span>
        <span>Write-Host</span> <span>(</span><span>"Pizza ordered. Details {0}"</span> -f <span>$this</span>.toString<span>())</span>
    <span>}</span>

    <span>[</span><span>String</span><span>]</span> toString<span>()</span>
    <span>{</span>
        <span>return</span> <span>"Crust: {0} Sauce: {1} Toppings: {2}"</span> -f <span>$this</span>.crust, <span>$this</span>.sauce, <span>$this</span>.toppings
    <span>}</span>

<span>}</span>
</pre></td></tr></tbody></table>

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27</pre></td><td><pre><span># </span><span>separate</span><span> steps
</span>$myPizza = [Pizza]::new()
$myPizza.chooseCrust("DeepDish").addSauce("GarlicParmesan").addToppings("Sausage") | Out-Null
$myPizza.placeOrder()

<span># </span><span>combined</span><span> steps, using named constructor
</span>[Pizza]::newOrder().chooseCrust("HandTossed").addSauce("Marinara").addToppings("Pepperoni").placeOrder()

<span># </span><span>Using</span><span> Normal Constructor: Parens not required in first example
</span>([Pizza]::new()).placeOrder()

(New-Object -TypeName Pizza).placeOrder()

<span># </span><span>Chaining</span><span> Example Multiline. The "." on the right feels strange.
</span>cls
[Pizza]::newOrder().
    chooseCrust("HandTossed").
    addSauce("Marinara").
    addToppings("Pepperoni").
    placeOrder()

<span># </span><span>Chaining</span><span> Example 2 Multiline
</span>[Pizza]::newOrder() `
   | %{$_.chooseCrust("HandTossed")} `
   | %{$_.addSauce("Marinara")} `
   | %{$_.addToppings("Chicken")} `
   | %{$_.placeOrder()}
</pre></td></tr></tbody></table>

### Base Splat Pattern

While this may not be a traditional class design pattern, I created this pattern to simply **using object properties** with other PowerShell commands.

Calling a function with many positional arguments OR many named Parameters can become difficult to manage.

To solve this issue, we use a technique known as **Splatting**.

#### Using object properties to Splat a function

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25</pre></td><td><pre><span>class </span>Concept
<span>{</span>
    <span>[</span><span>String</span><span>]</span> <span>$Name</span>
    <span>[</span>Int32] <span>$Answer</span>

    Concept <span>([</span><span>String</span><span>]</span> <span>$Name</span>, <span>[</span>Int32] <span>$Answer</span><span>)</span>
    <span>{</span>
        <span>$this</span>.Name <span>=</span> <span>$Name</span>
        <span>$this</span>.Answer <span>=</span> <span>$Answer</span>
    <span>}</span>
<span>}</span>

<span>function </span>Get-Meaning <span>(</span><span>$Name</span>, <span>$Answer</span><span>)</span>
<span>{</span>
    <span>"The meaning of {0} is {1}."</span> -f <span>$Name</span>, <span>$Answer</span>
<span>}</span>

<span>[</span>Concept] <span>$concept</span> <span>=</span> <span>[</span>Concept]::new<span>(</span><span>"Life"</span>, 42<span>)</span>

<span>$parms</span> <span>=</span> @<span>{</span>
    Name   <span>=</span> <span>$concept</span>.Name
    Answer <span>=</span> <span>$concept</span>.Answer
<span>}</span>

Get-Meaning @parms
</pre></td></tr></tbody></table>

#### Using Base Helper to Generate Splat HashTable

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35</pre></td><td><pre><span>class </span>Helper
<span>{</span>
    <span>[</span>HashTable] Splat<span>([</span><span>String</span><span>[]]</span> <span>$Properties</span><span>)</span>
    <span>{</span>
        <span>$splat</span> <span>=</span> @<span>{}</span>

        <span>foreach</span><span>(</span><span>$prop</span> <span>in</span> <span>$Properties</span><span>)</span>
        <span>{</span>
            <span>if</span><span>(</span><span>$this</span>.GetType<span>()</span>.GetProperty<span>(</span><span>$prop</span><span>))</span>
            <span>{</span>
                <span>$splat</span>.Add<span>(</span><span>$prop</span>, <span>$this</span>.<span>$prop</span><span>)</span>
            <span>}</span>
        <span>}</span>

        <span>return</span> <span>$splat</span>
    <span>}</span>
<span>}</span>

<span>class </span>Concept : Helper
<span>{</span>
    <span>[</span><span>String</span><span>]</span> <span>$Name</span>
    <span>[</span>Int32] <span>$Answer</span>
    <span>[</span>Boolean] <span>$HasTowel</span>

    Concept <span>([</span><span>String</span><span>]</span> <span>$Name</span>, <span>[</span>Int32] <span>$Answer</span><span>)</span>
    <span>{</span>
        <span>$this</span>.Name <span>=</span> <span>$Name</span>
        <span>$this</span>.Answer <span>=</span> <span>$Answer</span>
    <span>}</span>
<span>}</span>

<span>function </span>Get-Meaning <span>(</span><span>$Name</span>, <span>$Answer</span><span>)</span>
<span>{</span>
    <span>"The meaning of {0} is {1}."</span> -f <span>$Name</span>, <span>$Answer</span>
<span>}</span>
</pre></td></tr></tbody></table>

Using the `Helper` class, anytime we need to _Splat_ selected properties from an object, the base class handles the heavy lifting.

<table><tbody><tr><td><pre>1
2
3
4
5
6</pre></td><td><pre>PS C:\&gt; [Concept] $concept = [Concept]::new("Life", 42)

PS C:\&gt; $splat = $concept.Splat(("Name", "Answer"))

PS C:\&gt; Get-Meaning @splat
The meaning of Life is 42.
</pre></td></tr></tbody></table>

### Loading Class Files

Currently, there are some **restrictions** for loading class files.

-   Parent classes **must** load before their children.

Thankfully, classes and child classes do not have to be in the same file.

If we use the following common example of **dot source** loading `.ps1` files, we could run into this restriction.

<table><tbody><tr><td><pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16</pre></td><td><pre><span>$Public</span>  <span>=</span> @<span>(</span> <span>Get-ChildItem</span> -Path <span>$PSScriptRoot</span><span>\P</span>ublic<span>\*</span>.ps1 -ErrorAction SilentlyContinue <span>)</span>

<span># Dot source the files</span>
<span>foreach</span><span>(</span><span>$import</span> <span>in</span> <span>$Public</span><span>)</span>
<span>{</span>
    <span>try</span>
    <span>{</span>
        . <span>$import</span>.fullname
    <span>}</span>
    <span>catch</span>
    <span>{</span>
        <span>Write-Error</span> -Message <span>"Failed to import function </span><span>$(</span><span>$import</span>.fullname<span>)</span><span>: </span><span>$_</span><span>"</span>
    <span>}</span>
<span>}</span>

Export-ModuleMember -Function <span>$Public</span>.Basename
</pre></td></tr></tbody></table>

#### Possible Workarounds

-   Class/child class naming conventions which force alphabetic ordering precedence.
-   Recursive try/catch until all of the classes load.
-   Manually define the order and files in the module manifest.
-   Use a lower level directory structure for child classes.

## Conclusion

The PowerShell language is steadily evolving, which in turn adapts developer methodologies. People are amazing at taking a great invention and using it for entirely new ideas. Perhaps this is one of the reasons open source thrives. Take Play-Doh for example, Noah McVicker invented this goop as a wallpaper cleaner in the 1930s, around 20 years later it became a children’s toy. Hopefully, this article helps others learn PowerShell class syntax, OOP concepts, design patterns and explore new ideas.

Feel free to ask questions or send a pull request if you find anything that needs improvement.

## References

1.  [Five Tips for Writing DSC Resources][43].
2.  [What’s new in PowerShell Version 5][44].
3.  [Inheritance in PowerShell Classes][45]
4.  [Enumerations in PowerShell Classes][46]
5.  [Scripting Guys: PowerShell 5 create a simple class][47]
6.  [New-Object Command][48]
7.  [Testing PowerShell Classes][49]
8.  [Getting Started With Test-Kitchen and DSC][50]
9.  [Development in a Blink][51]

[1]: https://xainey.github.io//2016/powershell-classes-and-concepts/#abstract
[2]: https://xainey.github.io//2016/powershell-classes-and-concepts/#introduction
[3]: https://xainey.github.io//2016/powershell-classes-and-concepts/#syntax-overview
[4]: https://xainey.github.io//2016/powershell-classes-and-concepts/#class-structure
[5]: https://xainey.github.io//2016/powershell-classes-and-concepts/#classes
[6]: https://xainey.github.io//2016/powershell-classes-and-concepts/#properties
[7]: https://xainey.github.io//2016/powershell-classes-and-concepts/#methods
[8]: https://xainey.github.io//2016/powershell-classes-and-concepts/#this
[9]: https://xainey.github.io//2016/powershell-classes-and-concepts/#constructor
[10]: https://xainey.github.io//2016/powershell-classes-and-concepts/#tostring
[11]: https://xainey.github.io//2016/powershell-classes-and-concepts/#example-1-class-structure
[12]: https://xainey.github.io//2016/powershell-classes-and-concepts/#creating-instances-of-a-class
[13]: https://xainey.github.io//2016/powershell-classes-and-concepts/#static-vs-instance
[14]: https://xainey.github.io//2016/powershell-classes-and-concepts/#static
[15]: https://xainey.github.io//2016/powershell-classes-and-concepts/#instance
[16]: https://xainey.github.io//2016/powershell-classes-and-concepts/#accessorsmutators-aka-gettersetter
[17]: https://xainey.github.io//2016/powershell-classes-and-concepts/#overloaded-methods
[18]: https://xainey.github.io//2016/powershell-classes-and-concepts/#inheritance
[19]: https://xainey.github.io//2016/powershell-classes-and-concepts/#using-the-base-constructor
[20]: https://xainey.github.io//2016/powershell-classes-and-concepts/#enumerations
[21]: https://xainey.github.io//2016/powershell-classes-and-concepts/#design-patterns
[22]: https://xainey.github.io//2016/powershell-classes-and-concepts/#polymorphism
[23]: https://xainey.github.io//2016/powershell-classes-and-concepts/#abstract-classes
[24]: https://xainey.github.io//2016/powershell-classes-and-concepts/#singleton
[25]: https://xainey.github.io//2016/powershell-classes-and-concepts/#factory-pattern
[26]: https://xainey.github.io//2016/powershell-classes-and-concepts/#standard-factory-object-generation
[27]: https://xainey.github.io//2016/powershell-classes-and-concepts/#using-static-methods-to-setfetch-objects
[28]: https://xainey.github.io//2016/powershell-classes-and-concepts/#method-chaining
[29]: https://xainey.github.io//2016/powershell-classes-and-concepts/#base-splat-pattern
[30]: https://xainey.github.io//2016/powershell-classes-and-concepts/#using-object-properties-to-splat-a-function
[31]: https://xainey.github.io//2016/powershell-classes-and-concepts/#using-base-helper-to-generate-splat-hashtable
[32]: https://xainey.github.io//2016/powershell-classes-and-concepts/#loading-class-files
[33]: https://xainey.github.io//2016/powershell-classes-and-concepts/#possible-workarounds
[34]: https://xainey.github.io//2016/powershell-classes-and-concepts/#conclusion
[35]: https://xainey.github.io//2016/powershell-classes-and-concepts/#references
[36]: https://github.com/juneb
[37]: https://mva.microsoft.com/en-US/training-courses/whats-new-in-powershell-v5-16434
[38]: https://hodgkins.io/five-tips-for-writing-dsc-resources-in-powershell-version-5
[39]: http://stevenmurawski.com/powershell/2016/05/getting-started-with-test-kitchen-and-dsc/
[40]: http://dougfinke.com/blog/
[41]: https://www.automatedops.com/blog/2016/01/28/testing-powershell-classes/
[42]: https://technet.microsoft.com/en-us/library/hh849885.aspx
[43]: https://hodgkins.io/five-tips-for-writing-dsc-resources-in-powershell-version-5
[44]: https://mva.microsoft.com/en-US/training-courses/whats-new-in-powershell-v5-16434
[45]: https://www.sapien.com/blog/2016/03/16/inheritance-in-powershell-classes/
[46]: https://www.sapien.com/blog/2015/01/05/enumerators-in-windows-powershell-5-0/
[47]: https://blogs.technet.microsoft.com/heyscriptingguy/2015/09/01/powershell-5-create-simple-class/
[48]: https://technet.microsoft.com/en-us/library/hh849885.aspx
[49]: https://www.automatedops.com/blog/2016/01/28/testing-powershell-classes/
[50]: http://stevenmurawski.com/powershell/2016/05/getting-started-with-test-kitchen-and-dsc/
[51]: http://dougfinke.com/blog/
https://www.sapien.com/blog/2014/12/02/beyond-custom-objects-create-a-net-class/

> In yesterday's blog post, I used the Select-String cmdlet to capture the table of keywords and references from the about_language_keywords help topic and then used the new ConvertFrom-String cmdlet in the Windows PowerShell 5.0 preview to convert each row of the table into a custom object (PSCustomObject). The custom object worked quite well. I could search, sort, format, and use the objects in Windows PowerShell.

# Beyond custom objects: Create a .NET class
In [yesterday's blog post](http://www.sapien.com/blog/2014/12/01/get-languagekeywords-using-convertfrom-string-on-about-topics/), I used the [Select-String](http://go.microsoft.com/fwlink/?LinkID=113388) cmdlet to capture the table of keywords and references from the [about\_language\_keywords](http://technet.microsoft.com/en-us/library/hh847744.aspx) help topic and then used the new [ConvertFrom-String](http://go.microsoft.com/fwlink/?LinkID=507579) cmdlet in the Windows PowerShell 5.0 preview to convert each row of the table into a custom object (PSCustomObject). The custom object worked quite well. I could search, sort, format, and use the objects in Windows PowerShell.

```
PS C:\&gt; $k = $table | ConvertFrom-String -TemplateContent $template 
    | Select-Object -Property Keyword, Reference

PS C:\&gt; $k | where Keyword -eq "Trap"

Keyword    Reference                                                                                 
-------    ---------                                                                                 
Trap       about_Trap, about_Break, about_Try_Catch_Finally
```

But, it's just a simple step from the generic custom object to a named dynamic .NET object that I can create, manage, and use in many different contexts. In this post, I'll use the new **class** feature of the Windows PowerShell 5.0 preview to create a **Keyword** class and real Keyword objects.

The class feature is new and works somewhat differently in the September version of the preview ($PSVersionTable.PSVersion = 5.0.9814.0) than it does in the November version (5.0.9883.0), so it's likely to continue to change until (and even after) the official release.

For background, see the release notes that come with the Windows PowerShell 5.0 preview and Windows PowerShell MVP Trevor Sullivan's playful and informative blog post, [Implementing a .NET Class in PowerShell v5](http://trevorsullivan.net/2014/10/25/implementing-a-net-class-in-powershell-v5/), in which he creates a Beer class.

## **Custom Objects for Keywords**

The [ConvertFrom-String](http://go.microsoft.com/fwlink/?LinkID=507579) cmdlet returns custom objects with the properties that you specify, either by using the **PropertyNames** parameter or one of the template parameters, **TemplateContent** or **TemplateFile**.

To see the properties and method of the objects that it returns, pipe the output (in this case, saved in the $k variable) to the [Get-Member](http://go.microsoft.com/fwlink/?LinkID=113322) cmdlet.

```
PS C:\&gt; $k | Get-Member

   TypeName: Selected.System.Management.Automation.PSCustomObject

Name        MemberType   Definition                                                       
----        ----------   ----------                                                       
Equals      Method       bool Equals(System.Object obj)                                   
GetHashCode Method       int GetHashCode()                                                
GetType     Method       type GetType()                                                   
ToString    Method       string ToString()                                                
Keyword     NoteProperty System.String Keyword=Begin                                      
Reference   NoteProperty System.String Reference=about_Functions, about_Functions_Advanced
```

The objects have the **Keyword** and **Reference** properties that we need, but the methods are pretty generic and not particularly useful.

And, beginning in Windows PowerShell 5.0, it's very easy to create a .NET class dynamically.

## **Create a Keyword Class**

To create a class, begin with the **class** keyword followed by the name of the class, which, in this case, is **Keyword**. The content of the class is enclosed in curly braces.

To add properties to the class, just create global variables. In this case, I've added **Name** and **Reference** properties. (Yes, it's that easy.)

```
class Keyword 
<span>{</span>
    <span>#Properties</span>
    <span>[</span><span>String</span><span>]</span><span>$Name</span>
    <span>[</span><span>String</span><span>]</span><span>$Reference</span>
<span>}</span>
```

To allow people to create objects that are instances of the class, add at least one constructor.

A **constructor** is a special type of method that creates new objects. It has the same name as the class and it never returns anything (the return type is \[Void\], which means nothing. You can have multiple constructors, but each one has to take different numbers and types of parameters.

In the Keyword class, I added one constructor that has two string parameters, **Keyword** and **Reference**. The commands in the constructor assign the value of the **Keyword** parameter to the **Name** property of the object and the value of the **Reference** parameter to the **Reference** property of the object.

```
class Keyword 
<span>{</span>
    <span>#Properties</span>
    <span>[</span><span>String</span><span>]</span><span>$Name</span>
    <span>[</span><span>String</span><span>]</span><span>$Reference</span>
&nbsp;
    <span>#Constructor</span>
    Keyword <span>(</span>
        <span>[</span><span>String</span><span>]</span><span>$Keyword</span>
        <span>[</span><span>String</span><span>]</span><span>$Reference</span>
    <span>)</span>
    <span>{</span>
        <span>$this</span>.Name <span>=</span> <span>$Keyword</span>
        <span>$this</span>.Reference <span>=</span> <span>$Reference</span>
    <span>}</span>
<span>}</span>
```

Unlike the output types of functions, which are just notes, the output types of methods are enforced. If the method doesn't return the declared output type, the method generates an error.

The parentheses that surround the parameters are required, even when the method doesn't take any parameters.

As we discussed in the section about constructors, all method parameters are mandatory and positional. Each method has only one parameter set. Methods in a class can have the same name, but if they do, they must take different types and numbers of parameters.

Did you notice the **$this** automatic variable? Like **$\_** in pipelines, **$this** refers to the current object. Inside a class, when you refer to a property of the current object, you must use the $this prefix, a dot, and the property name.

For example, to refer to the **Name** property of the current object, type:

Requiring the **$this** variable lets you use parameters with the same names as the properties. Windows PowerShell uses the **$this** to distinguish the property from the parameter. For example, I used **$Reference** as a property of the object and a parameter of the constructor. To assign the **$Reference** parameter value to the **$Reference** property, I type:

```
        <span># Property      = Parameter               </span>
<span>$this</span>.Reference <span>=</span> $Reference
```

## Create Keyword Objects

Now that our class is complete, we can create Keyword objects. To create an object that is an instance of a .NET class, call the **New** method. (The New-Object cmdlet doesn't yet work for dynamically created .NET classes.) **New** is a static method — a method of the class, not of any particular object in the class. All .NET objects have the **New** method, because they inherit it from the System.Object class.

To call a static method, type the class name in square brackets, two colons (with no intervening spaces), the method name, **New**, and a set of parentheses.

This code calls the New method of the Keyword class:

Inside the parentheses, call the constructor. Enter a comma-separated list of the values (omit the names) of the constructor parameters. All constructor parameters are mandatory and positional, so pay attention to the order of the values.

The Keyword class constructor has $Keyword and $Reference string parameters (in that order). To create a keyword object for the "If" keyword, use a command like this one:

```
<span>[</span>Keyword<span>]</span>::New<span>(</span><span>"If"</span><span>,</span> <span>"about_If"</span><span>)</span>
```

To convert a custom object that has Keyword and Reference properties to a Keyword object, use a command like this one. It pipes the custom objects in the **$k** variable to the **ForEach-Object** cmdlet, which calls the **New** static method of the Keyword class on each object and then stores the results in the $keywords variable.

```
<span>$keywords</span> <span>=</span> <span>$k</span> <span>|</span> <span>ForEach-Object</span> <span>{</span> <span>[</span>Keyword<span>]</span>::new<span>(</span><span>$_</span>.Keyword<span>,</span> <span>$_</span>.Reference<span>)</span>
```

Let's see the result. The display looks just like the custom objects.

```
PS C:\&gt; $keywords

Name         Reference                                                                                 
----         ---------                                                                                 
Begin        about_Functions, about_Functions_Advanced                                                 
Break        about_Break, about_Trap                                                                   
Catch        about_Try_Catch_Finally                                                                   
Continue     about_Continue, about_Trap
```

But, when you pipe them to the Get-Member cmdlet, you can see that the type is Keyword.

```
PS C:\&gt; $keywords | Get-Member

   TypeName: Keyword

Name        MemberType Definition                    
----        ---------- ----------                    
Equals      Method     bool Equals(System.Object obj)
GetHashCode Method     int GetHashCode()             
GetType     Method     type GetType()                
ToString    Method     string ToString()             
Name        Property   string Name {get;set;}        
Reference   Property   string Reference {get;set;}
```

The real value becomes evident when you add methods to the class.

## Add a Method

The value of the Reference property of each keyword is a list of help topics that explain how the keyword is used in Windows PowerShell. Let's add a GetHelp() method to the Keyword class that returns the first help topic in each reference set.

The syntax of a class method is as follows.

```
    <span>[</span>OutputType<span>]</span> Name <span>(</span>Parameters<span>)</span>
```

*   **OutputType**. Enclose in square brackets the .NET type of the objects that the method returns. If the method doesn't return anything, that is, if the output type is **\[Void\]**, you can omit the output type, because Void is the default. It's nice to include it anyway.Unlike the output types of functions, which are just notes, the output types of methods are enforced. If the method doesn't return the declared output type, the method generates an error.
*   **Name**. Specify the name of the method. Typically, method names are a single camel-cased string.
*   **Parameters**. The parameters of a method are always mandatory and positional. Each method has only one parameter set. Methods in a class can have the same name as other methods, but if they do, they must take different types and numbers of parameters. The parentheses that surround the parameters are required, even when the method doesn't take any parameters.

Here's the code for the GetHelp() method of Keyword objects. It returns the first help topic in the Reference value as a single string. I used a [Try-Catch](http://technet.microsoft.com/en-us/library/hh847793.aspx) block in case the help topic isn't on the computer. In that case, it just returns an empty string.

```
    <span>[</span><span>String</span><span>]</span> GetHelp<span>(</span><span>)</span> 
    <span>{</span>
        <span>[</span><span>String</span><span>]</span><span>$firstRef</span> <span>=</span> <span>$this</span>.Reference.Split<span>(</span><span>","</span><span>)</span>.Trim<span>(</span><span>)</span> <span>|</span> <span>Select-Object</span> <span>-First</span> <span>1</span>
        try 
        <span>{</span>
            <span>return</span> <span>Get-Help</span> <span>$firstRef</span>
        <span>}</span>
        catch
        <span>{</span>
            <span>return</span> <span>""</span>
       <span>}</span>
    <span>}</span>
```

Let's run the new improved Get-LanguageKeywords.ps1 script that contains the class and save the results in the $keywords property. Now, when you pipe the Keyword objects in the $keywords variable to the Get-Member cmdlet, you can see the new GetHelp() method:

```
PS C:\&gt; $keywords | Get-Member

   TypeName: Keyword

Name        MemberType Definition                    
----        ---------- ----------                    
Equals      Method     bool Equals(System.Object obj)
GetHashCode Method     int GetHashCode()             
GetHelp     Method     string GetHelp()
GetType     Method     type GetType()               
ToString    Method     string ToString()             
Name        Property   string Name {get;set;}        
Reference   Property   string Reference {get;set;}

```

And, you can call the GetHelp() method of any **Keyword** object. In these commands, I get the Keyword object whose name equals "If" and call its GetHelp() method. The method returns the text of the about\_If help topic.

```
PS C:\&gt; $if = $keywords | where Name -eq "If"
PS C:\&gt; $if.GetHelp()
TOPIC
    about_If

SHORT DESCRIPTION
    Describes a language command you can use to run statement lists based 
    on the results of one or more conditional tests.


LONG DESCRIPTION
    You can use the If statement to run code blocks if a specified 
    conditional test evaluates to true. You can also specify one or more
...
```

## Summary

It's just a short hop from the custom object with its generic methods to a Keyword object with specialized methods.

One word of caution. When you create a class in Windows PowerShell, it's not saved in a library like the standard .NET classes, so it exists only in your session. To save your class, save it in a script or script module file.

_June Blender is a technology evangelist at SAPIEN Technologies, Inc. You can reach her at_ [_juneb@sapien.com_](mailto:juneb@sapien.com) _or follow her on Twitter at_ [_@juneb\_get\_help_](https://twitter.com/juneb_get_help)_._

## Get-Keywords.ps1

You can copy the script code here or download [a ZIP file](https://sapien.s3.amazonaws.com/downloads/Sample+Scripts/Get-Keywords.ps1.zip) from the [SAPIEN Downloads](http://www.sapien.com/downloads) site.

To download, sign in, in the left nav, click **Sample Scripts**, click **Get-Keywords.ps1.zip**, and in the top right corner, click **Download**.

```
<span>&lt;#    
    .NOTES
    ===========================================================================
     Created with:     SAPIEN Technologies, Inc., PowerShell Studio 2014 v4.1.74
     Created on:       11/30/2014 12:10 AM
     Organization:     SAPIEN Technologies, Inc.
     Contact:       June Blender, juneb@sapien.com, @juneb_get_help
     Filename:         Get-Keywords.ps1
    ===========================================================================
    .SYNOPSIS
        Creates Keyword objects from the Keyword-Reference table in the
        about_Language_Keywords help topic.

    .DESCRIPTION
        The Get-Keywords.ps1 script gets the Keyword-Reference table
        from the about_Language_Keywords help topic. It uses the ConvertFrom-String
        cmdlet to convert each row of the table to a custom object, and returns
        the custom objects. Then it uses a Keyword class defined in the script to
        create Keyword objects.

        The Script takes no parameters, but it requires the about_Language_Keyword help
        topic and Windows PowerShell version 5.0.

    .INPUTS
        None

    .OUTPUTS
        Keyword

    .EXAMPLE
        $keywords = .\Get-LanguageKeyword.ps1
        
        $keywords.Keyword.Contains("While")
        True
        
        $keywords.Keyword.Contains("Grapefruit")
        False
        
        $keywords | where Name -eq "Finally"| Format-Table -Autosize
        Keyword                  Reference
        ----                     ---------
        Finally                  about_Try_Catch_Finally

        Get-Help ($keywords | where Name -eq "Finally").Reference
#&gt;</span>


<span>class</span><span> Keyword{

    </span><span>#Properties</span><span>
    [</span><span>String</span><span>]</span><span>$Name</span><span>
    [</span><span>String</span><span>]</span><span>$Reference</span>

    <span>#Constructors</span>
    <span>Keyword</span><span>(
        [</span><span>String</span><span>]</span><span>$Keyword</span><span>,
        [</span><span>String</span><span>]</span><span>$Reference</span><span>     
       )
    {
        </span><span>$this</span><span>.Name </span><span>=</span> <span>$Keyword</span>
        <span>$this</span><span>.Reference </span><span>=</span> <span>$Reference</span><span>
    }
    
    </span><span>#Methods</span><span>
    [</span><span>String</span><span>] </span><span>GetHelp</span><span>()
    {
        [</span><span>String</span><span>]</span><span>$firstRef</span> <span>=</span> <span>$this</span><span>.Reference.Split(</span><span>","</span><span>).Trim() </span><span>|</span> <span>Select-Object</span> <span>-First</span> <span>1</span>
        <span>try</span><span>
        {
            </span><span>return</span> <span>Get-Help</span> <span>$firstRef</span><span>
        }
        </span><span>catch</span><span>
        {
            </span><span>return</span> <span>""</span><span>
        }
    }
}


</span><span>$template</span> <span>=</span><span> @</span><span>"

        {Keyword*:Begin}   {Reference:about_Functions, about_Functions_Advanced}
        {Keyword*:Catch}       {Reference:about_Try_Catch_Finally}
        {Keyword*:Exit}    {Reference:Described in this topic.}
        {Keyword*:Workflow}          {Reference:about_Workflows}
"</span><span>@

</span><span>if</span><span> (</span><span>!</span><span>(</span><span>$help</span> <span>=</span> <span>dir</span> <span>$pshome</span><span>\en-us\about_language_keywords.help.txt))
{
    </span><span>throw</span> <span>"Can't find the about_language_keywords help topic. Run Update-Help and try again."</span><span>
}

</span><span>#Get the line number of the Keyword-Reference table header</span>
<span>#Add 2 to get the line number of the first entry in the table</span>
<span>$start</span> <span>=</span><span> ((</span><span>$help</span> <span>|</span> <span>Select-String</span> <span>-Pattern</span> <span>'Keyword\s{7,}Reference'</span><span>).LineNumber) </span><span>+</span> <span>2</span>

<span>#Get the line number of the first blank line after the table</span>
<span>#Subtract one to get the line number of the last table entry</span>
<span>$end</span> <span>=</span> <span>$start</span> <span>+</span><span> ((</span><span>$help</span><span>[(</span><span>$start</span> <span>-</span> <span>1</span><span>) </span><span>..</span> <span>999</span><span>] </span><span>|</span> <span>Select-string</span> <span>-Pattern</span> <span>'^\s*
</span><span>).LineNumber </span><span>|</span> <span>Select-Object</span> <span>-First</span> <span>1</span><span>) </span><span>-</span> <span>1</span>

<span>#Get only the Keyword-Reference table</span>
<span>#Subtract 1 from each line number to get the indexes</span>
<span>$table</span> <span>=</span> <span>$help</span><span>[(</span><span>$start</span> <span>-</span> <span>1</span><span>) </span><span>..</span><span> (</span><span>$end</span> <span>-</span> <span>1</span><span>)]

</span><span>#Create a custom object from the Keyword-Reference table</span>
<span>$k</span> <span>=</span> <span>$table</span> <span>|</span> <span>ConvertFrom-String</span> <span>-</span><span>TemplateContent </span><span>$template</span> <span>|</span> <span>Select-Object</span> <span>-Property</span><span> Keyword, Reference

</span><span>#Convert each custom object to a Keyword object</span>
<span>#Use the null constructor and a hash table</span>
<span>$keywords</span> <span>=</span> <span>$k</span> <span>|</span> <span>foreach</span><span> { [Keyword]@{ Name </span><span>=</span> <span>$_</span><span>.Keyword; Reference </span><span>=</span> <span>$_</span><span>.Reference } }</span>
```

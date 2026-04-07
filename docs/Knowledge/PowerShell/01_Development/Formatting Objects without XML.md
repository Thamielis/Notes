---
created: 2026-04-07T16:35:24 (UTC +02:00)
tags: []
source: https://seeminglyscience.github.io/powershell/2017/04/20/formatting-objects-without-xml
author: Patrick Meinecke
---

# Formatting Objects without XML

---
Custom formatting in PowerShell has always seemed like one of the most under utilized features of PowerShell to me. And I understand why. It feels kind of bizarre to spend all this time writing PowerShell, creating a cool custom object and then jumping into…XML.

The bad news is, what I’m about to tell you is still going to involve XML. The good news, you don’t have to write it.

## PSControl Classes

One of the things I love the most about PowerShell is the pure discoverability it provides. You can usually figure out what you need to do with just about any command, object, etc. That all gets a little abstracted when you’re working through XML.

The PSControl object (and more importantly it’s child classes) give that discoverability back. Let’s pipe `TableControl` to `Get-Member` so you can see what I mean.

```raw
PS C:\> [System.Management.Automation.TableControl] | Get-Member -Static TypeName: System.Management.Automation.TableControl Name MemberType Definition ---- ---------- ---------- Create Method static System.Management.Automation.Table... Equals Method static bool Equals(System.Object objA, Sy... new Method System.Management.Automation.TableControl... ReferenceEquals Method static bool ReferenceEquals(System.Object...
```

Let’s take a closer look at the `Create` static method.

```raw
PS C:\> [System.Management.Automation.TableControl]::Create OverloadDefinitions ------------------- static System.Management.Automation.TableControlBuilder Create(bool outOfBand, bool autoSize, bool hideTableHeaders)
```

Now, I know I just went on about discoverability, but what this is leaving out is all of these parameters are optional. So all we actually need to do is run `Create()`. Also, you may have noticed that returns a different type, so let’s see what options it has.

```raw
PS C:\> [System.Management.Automation.TableControl]::Create() | Get-Member TypeName: System.Management.Automation.TableControlBuilder Name MemberType Definition ---- ---------- ---------- AddHeader Method System.Management.Automation.TableCont... EndTable Method System.Management.Automation.TableCont... GroupByProperty Method System.Management.Automation.TableCont... GroupByScriptBlock Method System.Management.Automation.TableCont... StartRowDefinition Method System.Management.Automation.TableRowD...
```

So if you were to expand the definitions you would see a few of the methods return a copy of themselves, meaning they are meant to be chained together. We also have a new builder, `TableRowDefinitionBuilder`.

I’m sure you get the idea by now, so I’m going to skip ahead a little and show you an example I made for an existing type.

```
<span># For System.Reflection.RuntimeParameterInfo</span>
<span>[</span>System.Management.Automation.TableControl]::Create<span>()</span>.
    GroupByProperty<span>(</span><span>'Member'</span>, <span>$null</span>, <span>'Definition'</span><span>)</span>.
    AddHeader<span>(</span><span>'Left'</span>,   3,  <span>'#'</span><span>)</span>.
    AddHeader<span>(</span><span>'Left'</span>,   30, <span>'Type'</span><span>)</span>.
    AddHeader<span>(</span><span>'Left'</span>,   20, <span>'Name'</span><span>)</span>.
    AddHeader<span>(</span><span>'Center'</span>, 2,  <span>'In'</span><span>)</span>.
    AddHeader<span>(</span><span>'Center'</span>, 3,  <span>'Out'</span><span>)</span>.
    AddHeader<span>(</span><span>'Center'</span>, 3,  <span>'Opt'</span><span>)</span>.
    StartRowDefinition<span>(</span><span>$false</span><span>)</span>.
        AddPropertyColumn<span>(</span><span>'Position'</span><span>)</span>.
        AddScriptBlockColumn<span>(</span><span>'$_.ParameterType.Name'</span><span>)</span>.
        AddPropertyColumn<span>(</span><span>'Name'</span><span>)</span>.
        AddScriptBlockColumn<span>(</span><span>'if ($_.IsIn) { ''X'' }'</span><span>)</span>.
        AddScriptBlockColumn<span>(</span><span>'if ($_.IsOut) { ''X'' }'</span><span>)</span>.
        AddScriptBlockColumn<span>(</span><span>'if ($_.IsOptional) { ''X'' }'</span><span>)</span>.
    EndRowDefinition<span>()</span>.
EndTable<span>()</span>
```

If you’ve ever dug into reflection you know most of it is completely unformatted. For example, here is what the `TableControl.Create()` method looks like.

```
<span># Before (this is just *one* parameter)</span>
<span>PS </span>C:<span>\&gt;</span> <span>[</span>System.Management.Automation.TableControl].GetMethod<span>(</span><span>'Create'</span><span>)</span>.GetParameters<span>()</span>


ParameterType    : System.Boolean
Name             : outOfBand
HasDefaultValue  : True
DefaultValue     : False
RawDefaultValue  : False
MetadataToken    : 134234830
Position         : 0
Attributes       : Optional, HasDefault
Member           : System.Management.Automation.TableControlBuilder Create<span>(</span>Boolean, Boolean, Boolean<span>)</span>
IsIn             : False
IsOut            : False
IsLcid           : False
IsRetval         : False
IsOptional       : True
CustomAttributes : <span>{[</span>System.Runtime.InteropServices.OptionalAttribute<span>()]}</span>

<span># After</span>
<span>PS </span>C:<span>\&gt;</span> <span>[</span>System.Management.Automation.TableControl].GetMethod<span>(</span><span>'Create'</span><span>)</span>.GetParameters<span>()</span>

   Definition: System.Management.Automation.TableControlBuilder Create<span>(</span>Boolean, Boolean, Boolean<span>)</span>

<span>#   Type                           Name                 In Out Opt</span>
-   ----                           ----                 -- --- ---
0   Boolean                        outOfBand                    X
1   Boolean                        autoSize                     X
2   Boolean                        hideTableHeaders             X
```

## Actually loading it

So you ran my example and all it did was return an object. Now what?

Well, we need to wrap it in an object that tells the formatter what types to target and what to name our view. Combine this with the `Export-FormatData` and `Update-FormatData` cmdlets to load it into the session.

```
<span>using </span>namespace System.Management.Automation

<span>[</span>ExtendedTypeDefinition]::new<span>(</span>
    <span>'System.Reflection.ParameterInfo'</span>,
    <span>[</span>FormatViewDefinition]::new<span>(</span>
        <span>'MyParameterView'</span>,
        <span>[</span>TableControl]::Create<span>()</span>.
            GroupByProperty<span>(</span><span>'Member'</span>, <span>$null</span>, <span>'Definition'</span><span>)</span>.
            AddHeader<span>(</span><span>'Left'</span>,   3,  <span>'#'</span><span>)</span>.
            AddHeader<span>(</span><span>'Left'</span>,   30, <span>'Type'</span><span>)</span>.
            AddHeader<span>(</span><span>'Left'</span>,   20, <span>'Name'</span><span>)</span>.
            AddHeader<span>(</span><span>'Center'</span>, 2,  <span>'In'</span><span>)</span>.
            AddHeader<span>(</span><span>'Center'</span>, 3,  <span>'Out'</span><span>)</span>.
            AddHeader<span>(</span><span>'Center'</span>, 3,  <span>'Opt'</span><span>)</span>.
            StartRowDefinition<span>(</span><span>$false</span><span>)</span>.
                AddPropertyColumn<span>(</span><span>'Position'</span><span>)</span>.
                AddScriptBlockColumn<span>(</span><span>'$_.ParameterType.Name'</span><span>)</span>.
                AddPropertyColumn<span>(</span><span>'Name'</span><span>)</span>.
                AddScriptBlockColumn<span>(</span><span>'if ($_.IsIn) { ''X'' }'</span><span>)</span>.
                AddScriptBlockColumn<span>(</span><span>'if ($_.IsOut) { ''X'' }'</span><span>)</span>.
                AddScriptBlockColumn<span>(</span><span>'if ($_.IsOptional) { ''X'' }'</span><span>)</span>.
            EndRowDefinition<span>()</span>.
        EndTable<span>()</span>
    <span>)</span> -as <span>[</span>List[FormatViewDefinition]]
<span>)</span> | <span>ForEach</span>-Object <span>{</span>

    Export-FormatData -Path        <span>".</span><span>\$</span><span>(</span><span>$PSItem</span><span>.TypeName).ps1xml"</span> <span>`</span>
                      -InputObject <span>$PSItem</span> <span>`</span>
                      -IncludeScriptBlock <span>`</span>
                      -Force
    <span># Use -PrependPath for existing types, -AppendPath for custom ones.</span>
    <span>Update-FormatData</span> -PrependPath <span>".</span><span>\$</span><span>(</span><span>$PSItem</span><span>.TypeName).ps1xml"</span>
<span>}</span>
```

I highly recommend exploring the objects with `Get-Member` or diving into the [MSDN documentation](https://msdn.microsoft.com/en-us/library/system.management.automation.pscontrol(v=vs.85).aspx) for each class.

## Getting Complex

So that was a small example of some pretty basic formatting. There are classes for all of the formatting types: `ListControl`, `WideControl`, `CustomControl` and of course `TableControl`. The one you’ll probably use the most for general formatting is `TableControl`

But if you need _really_ precise control over your output, you want `CustomControl`.

For example, I’ve been looking for a way to build flexible string expressions for generating code in editor commands. I’ve been playing with the idea of using formatting for this because it’s really easy to build dynamic statements, and you can easily customize it by adding your own view.

Here is a really early draft of some controls that take a

`[type]` object and “implements” any abstract or interface methods the type has.

```

<span>using </span>namespace System.Management.Automation
<span>using </span>namespace System.Collections.Generic

<span>$parameterControl</span> <span>=</span> <span>[</span>CustomControl]::
    Create<span>()</span>.
        StartEntry<span>()</span>.
            AddScriptBlockExpressionBinding<span>(</span><span>'", "'</span>, 0, 0, <span>'$_.Position -ne 0'</span><span>)</span>.
            AddText<span>(</span><span>'['</span><span>)</span>.
            AddPropertyExpressionBinding<span>(</span><span>'ParameterType'</span><span>)</span>.
            AddText<span>(</span><span>'] $'</span><span>)</span>.
            AddPropertyExpressionBinding<span>(</span><span>'Name'</span><span>)</span>.
        EndEntry<span>()</span>.
    EndControl<span>()</span>

<span>$methodControl</span> <span>=</span> <span>[</span>CustomControl]::
    Create<span>()</span>.
        StartEntry<span>()</span>.
            AddNewline<span>()</span>.
            AddText<span>(</span><span>'['</span><span>)</span>.
            AddPropertyExpressionBinding<span>(</span><span>'ReturnType'</span><span>)</span>.
            AddText<span>(</span><span>'] '</span><span>)</span>.
            AddPropertyExpressionBinding<span>(</span><span>'Name'</span><span>)</span>.
            AddText<span>(</span><span>' ('</span><span>)</span>.
            AddScriptBlockExpressionBinding<span>(</span>
                <span>&lt;# scriptBlock:         #&gt;</span> <span>'$_.GetParameters()'</span>,
                <span>&lt;# enumerateCollection: #&gt;</span> 1,
                <span>&lt;# selectedByType:      #&gt;</span> 0,
                <span>&lt;# selectedByScript:    #&gt;</span> <span>'$_.GetParameters().Count'</span>,
                <span>&lt;# customControl:       #&gt;</span> <span>$parameterControl</span>
            <span>)</span>.
            AddText<span>(</span><span>') {'</span><span>)</span>.
            AddNewline<span>()</span>.
            StartFrame<span>(</span>4<span>)</span>.
                AddText<span>(</span><span>'throw [NotImplementedException]::new()'</span><span>)</span>.
                AddNewline<span>()</span>.
            EndFrame<span>()</span>.
            AddText<span>(</span><span>'}'</span><span>)</span>.
            AddNewline<span>()</span>.
        EndEntry<span>()</span>.
    EndControl<span>()</span>

<span>$classControl</span> <span>=</span> <span>[</span>CustomControl]::
    Create<span>()</span>.
        StartEntry<span>()</span>.
            AddText<span>(</span><span>'class MyClass : '</span><span>)</span>.
            AddScriptBlockExpressionBinding<span>(</span><span>'$_'</span><span>)</span>.
            AddText<span>(</span><span>' {'</span><span>)</span>.
            AddNewline<span>()</span>.
            StartFrame<span>(</span>4<span>)</span>.
                AddScriptBlockExpressionBinding<span>(</span>
                    <span>&lt;# scriptBlock:         #&gt;</span> <span>'
                        if ($_.IsAbstract) {

                            $return = $_.DeclaredMethods.
                                Where{ $_.IsAbstract }

                        } elseif ($_.IsInterface) {
                            $return = $_.DeclaredMethods
                        }
                        $return
                    '</span>,
                    <span>&lt;# enumerateCollection: #&gt;</span> <span>$true</span>,
                    <span>&lt;# selectedByType:      #&gt;</span> <span>$null</span>,
                    <span>&lt;# selectedByScript:    #&gt;</span> <span>'
                        $_.IsInterface -or
                        ($_.IsAbstract -and
                        $_.DeclaredMethods.Where{ $_.IsAbstract })
                    '</span>,
                    <span>&lt;# customControl:       #&gt;</span> <span>$methodControl</span>
                <span>)</span>.
            EndFrame<span>()</span>.
            AddText<span>(</span><span>'}'</span><span>)</span>.
        EndEntry<span>()</span>.
    EndControl<span>()</span>


<span>$formats</span> <span>=</span> @<span>(</span>
    <span>[</span>ExtendedTypeDefinition]::new<span>(</span>
        <span>'System.Reflection.RuntimeParameterInfo'</span>,
        <span>[</span>FormatViewDefinition]::new<span>(</span>
            <span>'ParameterView'</span>,
            <span>$parameterControl</span>
        <span>)</span> -as <span>[</span>List[FormatViewDefinition]]
    <span>)</span>
    <span>[</span>ExtendedTypeDefinition]::new<span>(</span>
        <span>'System.Reflection.RuntimeMethodInfo'</span>,
        <span>[</span>FormatViewDefinition]::new<span>(</span>
            <span>'MethodView'</span>,
            <span>$methodControl</span>
        <span>)</span> -as <span>[</span>List[FormatViewDefinition]]
    <span>)</span>
    <span>[</span>ExtendedTypeDefinition]::new<span>(</span>
        <span>'System.RuntimeType'</span>,
        <span>[</span>FormatViewDefinition]::new<span>(</span>
            <span>'TypeView'</span>,
            <span>$classControl</span>
        <span>)</span> -as <span>[</span>List[FormatViewDefinition]]
    <span>)</span>
<span>)</span>
```

And here it is in action.

```
<span>PS </span>C:<span>\&gt;</span> <span>[</span>System.Collections.IDictionary]

<span># This won't actually load because it missed a method, but you get the idea.</span>
<span>class </span>MyClass : System.Collections.IDictionary <span>{</span>

    <span>[</span>System.Object] get_Item <span>([</span>System.Object] <span>$key</span><span>)</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Void] set_Item <span>([</span>System.Object] <span>$key</span>, <span>[</span>System.Object]
    <span>$value</span><span>)</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Collections.ICollection] get_Keys <span>()</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Collections.ICollection] get_Values <span>()</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Boolean] Contains <span>([</span>System.Object] <span>$key</span><span>)</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Void] Add <span>([</span>System.Object] <span>$key</span>, <span>[</span>System.Object] <span>$value</span><span>)</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Void] <span>Clear</span> <span>()</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Boolean] get_IsReadOnly <span>()</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Boolean] get_IsFixedSize <span>()</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Collections.IDictionaryEnumerator] GetEnumerator <span>()</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>

    <span>[</span>System.Void] Remove <span>([</span>System.Object] <span>$key</span><span>)</span> <span>{</span>
        <span>throw</span> <span>[</span>NotImplementedException]::new<span>()</span>
    <span>}</span>
<span>}</span>
```

## Final thoughts

There **is** a way to load this directly without writing it to XML, but it requires a _huge_ amount of reflection and isn’t really consistant. If anyone is looking for a project, a domain specific language that does all this for you would be _really_ cool.

Also, if you’re looking for more examples, check out the [DefaultFormatters](https://github.com/PowerShell/PowerShell/tree/master/src/System.Management.Automation/commands/utility/FormatAndOutput/common/DefaultFormatters) folder in the PowerShell repo. It’s all in C#, but it should be pretty easy to translate.

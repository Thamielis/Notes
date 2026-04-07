---
created: 2026-04-07T16:15:59 (UTC +02:00)
tags: []
source: https://seeminglyscience.github.io/powershell/2017/09/30/invocation-operators-states-and-scopes
author: Patrick Meinecke
---

# Invocation Operators, States and Scopes

---
I’m going to start off with invocation operators, but don’t worry it’ll come around full circle. If you’re here just for scopes, you can skip to the PSModuleInfo section.

## Common Knowledge

In general you can think of the invocation operators `&` and `.` as a way of telling PowerShell “run whatever is after this symbol”. There are a few different ways you can use theses symbols.

### Name or Path

Invoke whatever is at this path. The path can be a script, an executable, or anything else that resolves as a command.

Invoke a command by name. You don’t typically need an operator to invoke a command, but what you might not know is you can also use the `.` operator here to invoke a command without creating a new scope. For example:

```
<span>function </span>MyPrivateCommand <span>{</span>
    <span>$var</span> <span>=</span> 10
<span>}</span>

. MyPrivateCommand
<span>$var</span>
<span># 10</span>
```

### Invoke a ScriptBlock

There’s a ton of ways to use this and it could probably be it’s own blog post. There is one use though, that I don’t see a lot and want to talk about.

Let’s say you have a bunch of commands that output to the pipeline, but you really don’t care about their output. You aren’t going to assign them to a variable, so you would typically use `Out-Null` or `$null =` on each statement to ensure your pipeline remains clean. Instead, you can group those commands in a single scriptblock and null them all at once.

Lets take `StringBuilder` for instance. This class returns an instance of itself with every method. It does this so you can “chain” the methods together, like this.

```
<span>$sb</span> <span>=</span> <span>[</span>System.Text.StringBuilder]::new<span>()</span>
<span>$sb</span>.Append<span>(</span><span>"This"</span><span>)</span>.AppendLine<span>(</span><span>" is a string"</span><span>)</span>.Append<span>(</span><span>"Cool right?"</span><span>)</span>.ToString<span>()</span>
<span># This is a string</span>
<span># Cool right?</span>
```

But let’s say you can’t chain all the way through, you need to stop and check some things after you append to see what comes next in the string. If you do that often enough, you end up with a lot of lines you need to null.

Alternatively, just group them together and don’t worry about it.

```
<span>$sb</span> <span>=</span> <span>[</span>System.Text.StringBuilder]::new<span>()</span>
<span>$isString</span> <span>=</span> <span>$false</span>
<span>$null</span> <span>=</span> &amp; <span>{</span>
    <span>$sb</span>.Append<span>(</span><span>"This is a"</span><span>)</span>
    <span>if</span> <span>(</span><span>$isString</span><span>)</span> <span>{</span>
        <span>$sb</span>.Append<span>(</span><span>" string!"</span><span>)</span>
    <span>}</span> <span>else</span> <span>{</span>
        <span>$sb</span>.Append<span>(</span><span>"... I'm not sure actually"</span><span>)</span>
    <span>}</span>
<span>}</span>

<span>$sb</span>.ToString<span>()</span>
<span># This is a... I'm not sure actually</span>
```

## Less Common Knowledge

### CommandInfo objects

`CommandInfo` is the object type returned by the `Get-Command` cmdlet. I tend to use this when I need to look a few different places for a command, or if I need to be very specific.

Lets say you’re looking for a executable. If they have it installed and in their `$env:PATH`, you want to use that. If they don’t, you want to install it to the current folder.

```
<span>function </span>Get-DotNet <span>{</span>
    <span>$dotnet</span> <span>=</span> <span>Get-Command </span>dotnet -ErrorAction Ignore
    <span>if</span> <span>(</span>-not <span>$dotnet</span><span>)</span> <span>{</span>
        <span># Some code that saves the dotnet cli to ./dotnet</span>
        <span>$dotnet</span> <span>=</span> <span>Get-Command</span> ./dotnet/dotnet.exe -ErrorAction Ignore
    <span>}</span>

    <span>if</span> <span>(</span>-not <span>$dotnet</span> -or <span>$dotnet</span>.Version -lt <span>'2.0.0'</span><span>)</span> <span>{</span>
        <span>throw</span> <span>"Couldn't find dotnet!"</span>
    <span>}</span>

    <span>return</span> <span>$dotnet</span>
<span>}</span>

&amp; <span>(</span>Get-DotNet<span>)</span> build
```

At the end of `Get-DotNet` I don’t care where I got it from, or even what type of command it is. I can call it all the same. You can use `Get-Command` to narrow down a command to a specific version, from a specific module, in a specific path, of a specific command type and more.

### PSModuleInfo

Here’s where things get cool. I’m going to be honest though, this is not widely applicable. If you read this and think “I can’t see myself ever using this” don’t worry, that’s normal. But a few of you might be screaming with excitement.

```
<span>$module</span> <span>=</span> Get-Module Pester

&amp; <span>$module</span> <span>{</span> <span>$ExecutionContext</span>.SessionState.Module <span>}</span>
<span># ModuleType Version    Name                ExportedCommands</span>
<span># ---------- -------    ----                ----------------</span>
<span># Script     4.0.6      pester              {Add-AssertionOperator,</span>
```

This one works a little differently. It isn’t _invoking_ the module, instead it’s acting as a modifier. It basically tells PowerShell to run whatever comes after the module as if it was ran from within the module.

More specifically, it replaces the `SessionStateInternal` of the command with the `SessionStateInternal` of the modules `SessionState`.

#### Non-Exported Commands

Most modules have private functions, classes, variables, etc. that it uses internally, but aren’t meant to be used from outside the module. Using this method, you can do just that.

Let me be clear here though. If you do use them, **you’re on your own**. They are private for a reason. Maybe they are dangerous, maybe they are buggy in less than perfect scenarios, or maybe they are just obtuse to use. Whatever the reason, they are **not supported**. If it’s your module though, go nuts. It’s great for troubleshooting and testing.

Anyway, lets look at Pester again. If you’ve ever glanced at Pester’s source, you’ve probably seen they make a table of “safe” commands that aren’t mocked. Lets say you wanted to make sure a command was resolved correctly in that table.

```
&amp; <span>(</span><span>gmo </span>Pester<span>)</span> <span>{</span> <span>$SafeCommands</span><span>[</span><span>'New-Object'</span><span>]</span> <span>}</span>

<span># CommandType     Name           Version    Source</span>
<span># -----------     ----           -------    ------</span>
<span># Cmdlet          New-Object     3.1.0.0    Microsoft.PowerShell.Utility</span>
```

You can also call functions, change the value of script scope variables, and even return classes without having to use the `using module` syntax.

#### Vessels for State

Here’s a fun fact, the `SessionState` property on `PSModuleInfo` is _writeable_. This means you can throw any old `SessionState` into the module and you now have a portable, invokeable link to that state. Even if the state isn’t from a module.

```
<span>$globalState</span> <span>=</span> <span>[</span>PSModuleInfo]::new<span>(</span><span>$false</span><span>)</span>
<span>$globalState</span>.SessionState <span>=</span> <span>$ExecutionContext</span>.SessionState

<span>$myGlobalVar</span> <span>=</span> <span>'Hello from global!'</span>
<span>$myGlobalVar</span>
<span># Hello from global!</span>

<span>$null</span> <span>=</span> <span>[</span>PSModuleInfo]::new<span>({</span>
    <span>$myGlobalVar</span> <span>=</span> <span>'Hello from a module!'</span>
<span>})</span>
<span>$myGlobalVar</span>
<span># Hello from global!</span>

<span>$null</span> <span>=</span> <span>[</span>PSModuleInfo]::new<span>({</span>
    . <span>$globalState</span> <span>{</span> <span>$myGlobalVar</span> <span>=</span> <span>'Hello from a module!'</span> <span>}</span>
<span>})</span>
<span>$myGlobalVar</span>
<span># Hello from a module!</span>
```

In the first example, the variable changed in the module, but it didn’t change the original because of the different `SessionState`.

#### Enter a Modules Scope

Have you ever been troubleshooting a module and wished you could just enter the scope of the module, and run commands from the prompt like you were in the `psm1`?

```
. <span>(</span><span>gmo </span>Pester<span>)</span> <span>{</span> <span>$Host</span>.EnterNestedPrompt<span>()</span> <span>}</span>
```

There you go, you’re now in the `psm1`. Run `exit` when you want to return to the global scope. Do you instead wish that it worked more like you were in a function? Switch the `.` with `&`.

Some of you may have read that last sentence and thought “Wait what? That’s not how I thought dot sourcing worked…” Keep reading, because that’s why I want to talk about what I call the “PowerShell State Tree”.

## The PowerShell State Tree

Alright so I just made up the name “State Tree”, I don’t think there is an actual term that refers to the whole thing. The rest _are_ real terms though :)

```
PowerShell Process
   |------ ExecutionContext
   |      |------ SessionStateInternal
   |      |      |------ SessionStateScope
   |      |             |------ SessionStateScope
   |      |             |      |------ SessionStateScope
   |      |             |------ SessionStateScope
   |      |
   |      |------ SessionStateInternal
   |             |------ SessionStateScope
   |
   |------ ExecutionContext
          |------ SessionStateInternal
                 |------ SessionStateScope

```

### ExecutionContext

For every runspace in a process, there is an `ExecutionContext`. This holds instances of a lot of high level features you don’t ever need to worry about, like the help system, the parser, and most importantly, all of our `SessionState` objects.

The public facing version of this object is `EngineIntrinsics` which is confusingly returned from the variable `$ExecutionContext`.

### SessionStateInternal

For every module in a runspace, there is a `SessionStateInternal`. Plus one “Top Level” or “Global” `SessionStateInternal`. These internally hold references to several `SessionStateScope` objects.

-   **Global** - Typically this scope is the link back to the top level state.
-   **Script** - Typically the psm1 file in a module or the first child scope otherwise. If no child scopes are created (like when running commands from the console) this scope is the same as global.
-   **Current** - The newest child scope, can be the same as script or global.

The public facing version of this object is `SessionState`. It is the object returned from `$ExecutionContext.SessionState`, `PSModuleInfo.SessionState` and pretty much anything else that calls itself “SessionState”.

### SessionStateScope

I could probably write a whole post on scopes alone. Scopes are like a moment in time during the invocation of a script. Many scopes are created during a single script execution.

At the very least, any time a `scriptblock` is invoked, a new scope is created by default. Keep in mind, almost everything is boiled down or brought up to a `scriptblock` at some point in the invocation cycle. Functions, PowerShell class methods, modules, scripts, even the text you type at the prompt is or will be a `scriptblock` at some point. Cmdlets (compiled commands like `Get-ChildItem`) do **not** create scopes.

When a scope is created, it is added as a child to the `Current` scope of the **session state** the command **belongs to**. This small detail causes a lot of common misconceptions about how scopes work. When you first hear of scopes, you initially picture something more like the call stack. You assume that if you call a function from a module then the scope that gets created will be a child of the scope you are calling it in. But instead, it’s a part of it’s own separate tree of scopes entirely.

There is no public facing version of this object.

### What is Dot Sourcing Really

Towards the start of this post, when describing the dot source operator I described it as “a way to invoke a command without creating a new scope”. The phrasing used was very specific and purposeful.

When you dot source something it runs in the scope that is marked as the current scope in the session state the command is from. That part is very important. It means that you aren’t creating a new scope, **but** you may still **change** scopes. Thankfully, invoking modules provides a very easy way to demonstrate this.

```
<span>$pester</span> <span>=</span> Get-Module Pester
<span># Creates a new scope in the Pester module.  This is the same context</span>
<span># a function from the module would run in.</span>
&amp; <span>$pester</span> <span>{</span> <span>$test</span>; <span>$test</span> <span>=</span> <span>'test'</span> <span>}</span>
&amp; <span>$pester</span> <span>{</span> <span>$test</span>; <span>$test</span> <span>=</span> <span>'test'</span> <span>}</span>
```

Both of the above calls return nothing because test was defined in a child scope that stops existing as soon as the command finishes.

```
<span>$pester</span> <span>=</span> Get-Module Pester
<span># What happens if we add another in the middle that is dot sourced?</span>
&amp; <span>$pester</span> <span>{</span> <span>$test</span>; <span>$test</span> <span>=</span> <span>'test'</span> <span>}</span> <span># Nothing</span>
. <span>$pester</span> <span>{</span> <span>$test</span>; <span>$test</span> <span>=</span> <span>'test'</span> <span>}</span> <span># Nothing</span>
&amp; <span>$pester</span> <span>{</span> <span>$test</span>; <span>$test</span> <span>=</span> <span>'test'</span> <span>}</span> <span># test</span>
<span>$test</span> <span># Nothing</span>
```

The first two still return nothing, but the third returns the value we set. This is because we dot sourced the second, so no new scope was created, therefore `$test` was defined in the current scope of the session state. This is just like if the code in the `scriptblock` was placed in the `psm1` file directly.

The last line doesn’t return anything because it runs in the top level session state. Remember, dot sourcing runs the command in what is marked as the current scope of the session state for the command, it does _not_ run the _literal_ current scope.

### Show-PSStateTree

One of the most challenging things when you are trying to learn about scopes is how difficult it is to pin down exactly when one is being created. First, there is no public facing interface for scopes, so you are limited to using a ton of reflection to even get to a representation of them. Second, almost all of the things you do in PowerShell create a new scope, so how do you really know how many scopes you created just trying to figure out if a scope was created?

I mentioned cmdlets don’t create a scope, so I made a small cmdlet to help track scopes. It will return the hash code of several parts of the state tree. This won’t tell you much, but you can compare them to see when they change, which ones stick around, etc.

Below is the same example as above, with this cmdlet added.

```
<span>$pester</span> <span>=</span> Get-Module Pester

&amp; <span>$pester</span> <span>{</span> Show-PSStateTree; <span>$test</span>; <span>$test</span> <span>=</span> <span>'test'</span> <span>}</span>

<span># ExecutionContext     : 56919981</span>
<span># TopLevelSessionState : 3678064</span>
<span># EngineSessionState   : 49566835</span>
<span># GlobalScope          : 62978787</span>
<span># ModuleScope          : 22936020</span>
<span># ScriptScope          : 22936020</span>
<span># ParentScope          : 22936020</span>
<span># CurrentScope         : 23035345</span>

. <span>$pester</span> <span>{</span> Show-PSStateTree; <span>$test</span>; <span>$test</span> <span>=</span> <span>'test'</span> <span>}</span>

<span># ExecutionContext     : 56919981</span>
<span># TopLevelSessionState : 3678064</span>
<span># EngineSessionState   : 49566835</span>
<span># GlobalScope          : 62978787</span>
<span># ModuleScope          : 22936020</span>
<span># ScriptScope          : 22936020</span>
<span># ParentScope          : 62978787</span>
<span># CurrentScope         : 22936020</span>

&amp; <span>$pester</span> <span>{</span> Show-PSStateTree; <span>$test</span>; <span>$test</span> <span>=</span> <span>'test'</span> <span>}</span>

<span># ExecutionContext     : 56919981</span>
<span># TopLevelSessionState : 3678064</span>
<span># EngineSessionState   : 49566835</span>
<span># GlobalScope          : 62978787</span>
<span># ModuleScope          : 22936020</span>
<span># ScriptScope          : 22936020</span>
<span># ParentScope          : 22936020</span>
<span># CurrentScope         : 42591724</span>
<span># test</span>

Show-PSStateTree; <span>$test</span>

<span># ExecutionContext     : 56919981</span>
<span># TopLevelSessionState : 3678064</span>
<span># EngineSessionState   : 3678064</span>
<span># GlobalScope          : 62978787</span>
<span># ModuleScope          : 62978787</span>
<span># ScriptScope          : 62978787</span>
<span># ParentScope          : 0</span>
<span># CurrentScope         : 62978787</span>
```

[Here’s the Gist](https://gist.github.com/SeeminglyScience/fc64a6228c115768926b13617c5f56d8) if you want to play around with it. Copy and paste it into the console, save it or save it as a file and run it, then test away.

```
<span>$typeDefinition</span> <span>=</span> @<span>'
using System;
using System.Management.Automation;
using System.Reflection;

namespace PSStateTree.Commands
{
    [OutputType(typeof(StateTreeInfo))]
    [Cmdlet(VerbsCommon.Show, "PSStateTree")]
    public class ShowPSStateTreeCommand : PSCmdlet
    {
        private struct StateTreeInfo
        {
            public int ExecutionContext;
            public int TopLevelSessionState;
            public int EngineSessionState;
            public int GlobalScope;
            public int ModuleScope;
            public int ScriptScope;
            public int ParentScope;
            public int CurrentScope;
        }

        private const BindingFlags BINDING_FLAGS = BindingFlags.Instance | BindingFlags.NonPublic;

        protected override void ProcessRecord()
        {
            StateTreeInfo result;
            EngineIntrinsics engine = GetVariableValue("ExecutionContext") as EngineIntrinsics;
            var context = engine
                .GetType()
                .GetTypeInfo()
                .GetField("_context", BINDING_FLAGS)
                .GetValue(engine);

            var stateInternal = GetProperty("Internal", SessionState);
            var currentScope = GetProperty("CurrentScope", stateInternal);
            var parent = GetProperty("Parent", currentScope);
            
            result.ParentScope = 0;
            if (parent != null)
            {
                result.ParentScope = parent.GetHashCode();
            }

            result.ExecutionContext = context.GetHashCode();
            result.EngineSessionState = GetProperty("EngineSessionState", context).GetHashCode();
            result.TopLevelSessionState = GetProperty("TopLevelSessionState", context).GetHashCode();
            result.CurrentScope = currentScope.GetHashCode();
            result.ScriptScope = GetProperty("ScriptScope", stateInternal).GetHashCode();
            result.ModuleScope = GetProperty("ModuleScope", stateInternal).GetHashCode();
            result.GlobalScope = GetProperty("GlobalScope", stateInternal).GetHashCode();

            WriteObject(result);
        }

        private object GetProperty(string propertyName, object source)
        {
            if (string.IsNullOrEmpty(propertyName))
            {
                throw new ArgumentNullException("propertyName");
            }

            if (source == null)
            {
                throw new ArgumentNullException("source");
            }

            return source
                .GetType()
                .GetTypeInfo()
                .GetProperty(propertyName, BINDING_FLAGS)
                .GetValue(source);
        }
    }
}
'</span>@

<span>if</span> <span>(</span>-not <span>(</span><span>'PSStateTree.Commands.ShowPSStateTreeCommand'</span> -as <span>[</span><span>type</span><span>]))</span> <span>{</span>
    <span>$module</span> <span>=</span> New-Module -Name PSStateTree -ScriptBlock <span>{</span>
        <span>$types</span> <span>=</span> Add-Type -TypeDefinition <span>$typeDefinition</span> -PassThru
        Import-Module -Assembly <span>$types</span><span>[</span>0].Assembly
        Export-ModuleMember -Cmdlet Show-PSStateTree
    <span>}</span>
    Import-Module <span>$module</span>
<span>}</span>
```

Find-Member
-----------

### Synopsis
Find properties, methods, fields, etc that fit specific criteria.

---

### Description

The Find-Member cmdlet searches the process for type members that fit specified criteria. You can search in any loaded assemblies, specific types, or filter an existing list of members.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/ClassExplorer/blob/master/docs/en-US/Find-Member.md)

* [Find-Type](Find-Type)

* [Get-Assembly](Get-Assembly)

* [Get-Parameter](Get-Parameter)

* [Format-MemberSignature](Format-MemberSignature)

---

### Examples
> EXAMPLE 1

```PowerShell
Find-Member GetPowerShell

#    ReflectedType: System.Management.Automation.ScriptBlock
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# GetPowerShell         Method       public PowerShell GetPowerShell(object[] args);
# GetPowerShell         Method       public PowerShell GetPowerShell(bool isTrustedInput, object[]…
# GetPowerShell         Method       public PowerShell GetPowerShell(Dictionary<string, object> va…
# GetPowerShell         Method       public PowerShell GetPowerShell(Dictionary<string, object> va…
# GetPowerShell         Method       public PowerShell GetPowerShell(Dictionary<string, object> va…
Find all members in the AppDomain with the name "GetPowerShell"
```
> EXAMPLE 2

```PowerShell
[System.IO.Stream] | Find-Member -ParameterType { [anyof[Span[any], Memory[any]]] }

#    ReflectedType: System.IO.Stream
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# ReadAsync             Method       public virtual ValueTask<int> ReadAsync(Memory<byte> buffer, …
# Read                  Method       public virtual int Read(Span<byte> buffer);
Find all members that take a `Span<>` or a `Memory<>` as a parameter.
```
> EXAMPLE 3

```PowerShell
Find-Member -ParameterCount 0 -GenericParameter { [T[new]] }

#    ReflectedType: Markdig.Parsers.InlineParserList
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# AddIfNotAlready       Method       public void AddIfNotAlready<TItem>();
#
#    ReflectedType: Markdig.Parsers.ParserList<T, TState>
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# AddIfNotAlready       Method       public void AddIfNotAlready<TItem>();
#
#    ReflectedType: Markdig.Parsers.OrderedList<T>
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# AddIfNotAlready       Method       public void AddIfNotAlready<TItem>();
Find all methods with no parameters and with a generic parameter with the `new` constraint.
```
> EXAMPLE 4

Find-Member Emit -ParameterCount ..1, 7..8, 10..

#    ReflectedType: System.Reflection.Emit.ILGenerator
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# Emit                  Method       public virtual void Emit(OpCode opcode);
#
#    ReflectedType: Microsoft.CodeAnalysis.Compilation
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# Emit                  Method       public EmitResult Emit(Stream peStream, St…
# Emit                  Method       public EmitResult Emit(Stream peStream, St…
# Emit                  Method       public EmitResult Emit(Stream peStream, St…
# Emit                  Method       public EmitResult Emit(Stream peStream, St…
#
#    ReflectedType: Microsoft.CodeAnalysis.FileSystemExtensions
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# Emit                  Method       public static EmitResult Emit(this Compila…
Find all methods named `Emit` whose parameter count is any of the following:

1. `..1`: Less than or equal to 1 2. `7..8`: Between 7 and 8 inclusive 3. `10..`: Greater than or equal to 10
> EXAMPLE 5

```PowerShell
Find-Member -ReturnType System.Management.Automation.Language.Ast -Static

#    ReflectedType: System.Management.Automation.CommandCompletion
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# MapStringInputToPars… Method       public static Tuple<Ast, Token[], IScriptPosition> MapStringI…
#
#    ReflectedType: System.Management.Automation.Language.UsingExpressionAst
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# ExtractUsingVariable  Method       public static VariableExpressionAst ExtractUsingVariable(Usin…
#
#    ReflectedType: System.Management.Automation.Language.Parser
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# ParseFile             Method       public static ScriptBlockAst ParseFile(string fileName, out T…
# ParseInput            Method       public static ScriptBlockAst ParseInput(string input, out Tok…
# ParseInput            Method       public static ScriptBlockAst ParseInput(string input, string …
Find all static members in the AppDomain that return any type of AST.
```
> EXAMPLE 6

```PowerShell
Find-Member -ParameterType runspace -Virtual

#    ReflectedType: System.Management.Automation.Host.IHostSupportsInteractiveSession
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# PushRunspace          Method       public abstract void PushRunspace(Runspace runspace);
#
#    ReflectedType: Microsoft.PowerShell.Internal.IPSConsoleReadLineMockableMethods
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# RunspaceIsRemote      Method       public abstract bool RunspaceIsRemote(Runspace runspace);
Find all virtual members in the AppDomain that take any runspace type as a parameter.
```
> EXAMPLE 7

```PowerShell
Find-Member Parse* -ParameterType System.Management.Automation.Language.Token

#    ReflectedType: System.Management.Automation.Language.Parser
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# ParseFile             Method       public static ScriptBlockAst ParseFile(string fileName, out T…
# ParseInput            Method       public static ScriptBlockAst ParseInput(string input, out Tok…
# ParseInput            Method       public static ScriptBlockAst ParseInput(string input, string …
Find all members that start with the word Parse and take Token as a parameter. This example also demonstrates how this will even match the element of a type that is both an array and ByRef type.
```
> EXAMPLE 8

```PowerShell
[runspace] | Find-Member -Force -Abstract | Find-Member -Not -AccessView Child

#    ReflectedType: System.Management.Automation.Runspaces.Runspace
#
# Name                  MemberType   Definition
# ----                  ----------   ----------
# GetCurrentlyRunningP… Method       internal abstract Pipeline GetCurrentlyRunningPipeline();
# SetApplicationPrivat… Method       internal abstract void SetApplicationPrivateData(PSPrimitiveD…
# GetSessionStateProxy  Method       internal abstract SessionStateProxy GetSessionStateProxy();
# HasAvailabilityChang… Property     internal abstract bool HasAvailabilityChangedSubscribers { ge…
# GetExecutionContext   Property     internal abstract ExecutionContext GetExecutionContext { get;…
# InNestedPrompt        Property     internal abstract bool InNestedPrompt { get; }
Find all members that are required to be implemented (abstract) but cannot be implemented outside of the origin assembly.
```
> EXAMPLE 9

```PowerShell
$members = Find-Member -Force
$members.Count
# 286183
Find all members in the AppDomain including non-public.
```

---

### Parameters
#### **Abstract**
If specified only abstract members will be matched.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |a      |

#### **FilterScript**
Specifies a ScriptBlock to invoke as a filter. The variable "$_" or "$PSItem" contains the current member to evaluate.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |named   |False        |

#### **Force**
If specified non-public members will also be matched.

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[Switch]`|false   |named   |False        |IncludeNonPublic<br/>F|

#### **IncludeSpecialName**
If specified "SpecialName" members will also be matched. This most commonly applies to accessors methods such as "get_PropertyName" or "set_PropertyName".

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |isn    |

#### **InputObject**
Specifies the current object to evaluate.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |True (ByValue)|

#### **Instance**
If specified only members visible on an instance of a class will be matched.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |i      |

#### **MemberType**
Specifies the type of member to return. You can specify multiple member types.
Valid Values:

* Constructor
* Event
* Field
* Method
* Property
* TypeInfo
* Custom
* NestedType
* All

|Type           |Required|Position|PipelineInput|Aliases|
|---------------|--------|--------|-------------|-------|
|`[MemberTypes]`|false   |named   |False        |mt     |

#### **Name**
Specifies the pattern that a member's name must match in order to be returned.
This parameter uses smart casing. If the pattern specified includes any capital letters, the pattern becomes case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Not**
Specifies that this cmdlet should only return object that do not match the criteria.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ParameterCount**
Specifies the amount of parameters a method must accept to match. This requirement can be expressed in the following ways:
* `1`: Count must be exactly `1`
* `..3`: Can be `3` or less to match
* `2..5`: Can be between `2` and `5` inclusive to match
* `3..`: Can be `3` or greater to match
Multiple range expressions can be specified by separating with `,`. The member will fit the criteria as long at least one range expression matches.

|Type                 |Required|Position|PipelineInput|Aliases|
|---------------------|--------|--------|-------------|-------|
|`[RangeExpression[]]`|false   |named   |False        |pc     |

#### **GenericParameterCount**
Specifies the amount of generic parameters a method must accept to match. This requirement can be expressed in the following ways:
* `1`: Count must be exactly `1`
* `..3`: Can be `3` or less to match
* `2..5`: Can be between `2` and `5` inclusive to match
* `3..`: Can be `3` or greater to match
Multiple range expressions can be specified by separating with `,`. The member will fit the criteria as long at least one range expression matches.

|Type                 |Required|Position|PipelineInput|Aliases|
|---------------------|--------|--------|-------------|-------|
|`[RangeExpression[]]`|false   |named   |False        |gpc    |

#### **ParameterType**
Specifies a type that a member must accept as a parameter to be matched. This parameter will also match base types, implemented interfaces, and the element type of array, byref, pointer and generic types.
This can also be a type signature (see about_Type_Signatures (https://seemingly.dev/about-type-signatures)).

|Type                       |Required|Position|PipelineInput|Aliases|
|---------------------------|--------|--------|-------------|-------|
|`[ScriptBlockStringOrType]`|false   |named   |False        |pt     |

#### **GenericParameter**
Specifies a type that a member must accept as a generic type parameter to be matched. This parameter will also match base types, implemented interfaces and other generic constraints.
This can also be a type signature (see about_Type_Signatures (https://seemingly.dev/about-type-signatures)).

|Type                       |Required|Position|PipelineInput|Aliases|
|---------------------------|--------|--------|-------------|-------|
|`[ScriptBlockStringOrType]`|false   |named   |False        |gp     |

#### **RegularExpression**
If specified any parameter that accepts wildcards will switch to matching regular expressions.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Switch]`|false   |named   |False        |Regex<br/>re|

#### **ReturnType**
Specifies a type that a member must return to match. This includes property types, field types, and method return types. This parameter will also match base types, implemented interfaces, and the element type of array, byref, pointer and generic types.
This can also be a type signature (see about_Type_Signatures (https://seemingly.dev/about-type-signatures)).

|Type    |Required|Position|PipelineInput|Aliases   |
|--------|--------|--------|-------------|----------|
|`[Type]`|false   |named   |False        |ret<br/>rt|

#### **Decoration**
Specifies that a member must be decorated with this attribute for it to be included in results. This search will be done based on type name rather than strict type identity so it is safe to use for embedded attributes.
This can also be a type signature (see about_Type_Signatures (https://seemingly.dev/about-type-signatures)).

|Type    |Required|Position|PipelineInput|Aliases         |
|--------|--------|--------|-------------|----------------|
|`[Type]`|false   |named   |False        |HasAttr<br/>attr|

#### **Static**
If specified only static members will be matched.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |s      |

#### **Virtual**
If specified only virtual members will be matched.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |v      |

#### **Declared**
If specified only members that were declared or overriden by the reflected type will be returned.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |d      |

#### **IncludeObject**
By default any member that is declared by `object` and not overriden by the reflected (or other base but non-`object`) type will be hidden. This includes members like `ToString()`, `GetHashCode()`, and `Equals()`.
Specifying this parameter will include these members in the results.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |io     |

#### **RecurseNestedType**
Nested types will by default be treated as members other members. When piping a nested type to this command, if you want to retrieve the members of the nested type can specify this parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |r      |

#### **Extension**
When specified, members must be decorated with `ExtensionAttribute` to match. This is how the C# compiler marks extension methods like those found in `System.Linq.Enumerable`.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |ext    |

#### **ResolutionMap**
Specifies a hashtable of `name` to `ScriptBlockStringOrType` to create your own keywords and/or override type resolution for any signature in this command.

|Type         |Required|Position|PipelineInput|Aliases|
|-------------|--------|--------|-------------|-------|
|`[hashtable]`|false   |named   |False        |map    |

#### **AccessView**
Specifies the access perspective (`External`, `SameAssembly`, `Child` and/or `This`) or specific modifier (`Public`, `Internal`, `Protected`, `Private`) to filter results for.
Valid Values:

* Default
* External
* External
* Protected
* Child
* Internal
* SameAssembly
* Private
* This

|Type                        |Required|Position|PipelineInput|Aliases|
|----------------------------|--------|--------|-------------|-------|
|`[ClassExplorer.AccessView]`|false   |named   |False        |as     |

---

### Inputs
System.Type, System.Reflection.MemberInfo, PSObject

If you pass Type objects to this cmdlet it will match members from that type.

If you pass MemberInfo objects as input this cmdlet will return the input if it matches the specified criteria.  You can use this to chain Find-Member commands to filter output.

If you pass any other type to this cmdlet it will match members from that object's type.

---

### Outputs
* [Reflection.MemberInfo](https://learn.microsoft.com/en-us/dotnet/api/System.Reflection.MemberInfo)

---

### Notes

---

### Syntax
```PowerShell
Find-Member [-Abstract] [-FilterScript <ScriptBlock>] [-Force] [-IncludeSpecialName] [-InputObject <PSObject>] [-Instance] [-MemberType {Constructor | Event | Field | Method | Property | TypeInfo | Custom | NestedType | All}] [-Not] [-ParameterCount <RangeExpression[]>] [-GenericParameterCount <RangeExpression[]>] [-ParameterType <ScriptBlockStringOrType>] [-GenericParameter <ScriptBlockStringOrType>] [-RegularExpression] [-ReturnType <Type>] [-Decoration <Type>] [-Static] [-Virtual] [-Declared] [-IncludeObject] [-RecurseNestedType] [-Extension] [-ResolutionMap <hashtable>] [-AccessView <ClassExplorer.AccessView>] [<CommonParameters>]
```
```PowerShell
Find-Member [-Abstract] [-Force] [-IncludeSpecialName] [-InputObject <PSObject>] [-Instance] [-MemberType {Constructor | Event | Field | Method | Property | TypeInfo | Custom | NestedType | All}] [-Name <String>] [-Not] [-ParameterCount <RangeExpression[]>] [-GenericParameterCount <RangeExpression[]>] [-ParameterType <ScriptBlockStringOrType>] [-GenericParameter <ScriptBlockStringOrType>] [-RegularExpression] [-ReturnType <Type>] [-Decoration <Type>] [-Static] [-Virtual] [-Declared] [-IncludeObject] [-RecurseNestedType] [-Extension] [-ResolutionMap <hashtable>] [-AccessView <ClassExplorer.AccessView>] [<CommonParameters>]
```

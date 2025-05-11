Format-MemberSignature
----------------------

### Synopsis
Generate reference library style C# code of a member's metadata.

---

### Description

The Format-MemberSignature cmdlet uses the input reflection objects to generate reference library style C# pseudo code. Use this cmdlet to get a more in depth look at specific member including attribute decorations, generic type constraints, and more.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/ClassExplorer/blob/master/docs/en-US/Format-MemberSignature.md)

* [Find-Type](Find-Type)

* [Find-Member](Find-Member)

* [Get-Assembly](Get-Assembly)

* [Get-Parameter](Get-Parameter)

---

### Examples
> EXAMPLE 1

```PowerShell
[datetime] | Format-MemberSignature

# [Serializable]
# [NullableContext(1)]
# [Nullable(0)]
# [TypeForwardedFrom("mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")]
# [StructLayout(LayoutKind.Auto)]
# public readonly struct DateTime : IComparable, ISpanFormattable, IFormattable, IConvertible, IComparable<DateTime>, IEquatable<DateTime>, ISerializable;
Format the signature for the type `datetime`.
```
> EXAMPLE 2

```PowerShell
[Reflection.Metadata.ReservedBlob`1] | Format-MemberSignature -Recurse

# public readonly struct ReservedBlob<THandle>
#     where THandle : struct
# {
#     public THandle Handle { get; }
#
#     public Blob Content { get; }
#
#     public BlobWriter CreateWriter();
#
#     [UnconditionalSuppressMessage("ReflectionAnalysis", "IL2075:UnrecognizedReflectionPattern", Justification = "Trimmed fields don't make a difference for equality")]
#     public override bool Equals([NotNullWhen(true)] object obj);
#
#     [MethodImpl(MethodImplOptions.InternalCall)]
#     public override int GetHashCode();
#
#     public override string ToString();
#
#     [NullableContext(1)]
#     [Intrinsic]
#     [MethodImpl(MethodImplOptions.InternalCall)]
#     public Type GetType();
# }
Format the signature for the type `PowerShell`.
```

---

### Parameters
#### **Force**
When used with `-Recurse`, all members will be printed regardless of accessibility. This is the same as passing `-View All`.
This parameter is ignored when `-Recurse` is not specified.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

#### **IncludeSpecial**
When `-Recurse` is specified, members marked as "special" will not be excluded. This includes property or event accessor methods (e.g. `get_Value()`) and members decorated with the `CompilerGenerated` attribute.
This parameter is ignored when `-Recurse` is not specified.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

#### **InputObject**
The member to be formatted.

|Type                            |Required|Position|PipelineInput |
|--------------------------------|--------|--------|--------------|
|`[System.Reflection.MemberInfo]`|false   |named   |True (ByValue)|

#### **Recurse**
Specifies that the class passed to `-InputObject` should have their members enumerated and formatted as well.
This parameter is ignored if the value of `-InputObject` is not a `System.Type` object.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

#### **Simple**
When specified attribute decorations will not be included and new lines will not be inserted.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

#### **NoColor**
When specified ANSI escape sequences used to add syntax highlighting to the signature will be omitted.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

#### **View**
Specifies the access perspective that members are enumerated as when the `-Recurse` parameter is specified.
This parameter is ignored when `-Recurse` is not specified.
Valid Values:

* External
* Child
* Internal
* All
* ChildInternal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[System.String]`|false   |named   |False        |

---

### Inputs
System.Reflection.MemberInfo

Any `System.Reflection.MemberInfo` objects passed to this object will be formatted.

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
Format-MemberSignature [-Force] [-IncludeSpecial] [-InputObject <System.Reflection.MemberInfo>] [-Recurse] [-Simple] [-NoColor] [-View {External | Child | Internal | All | ChildInternal}] [<CommonParameters>]
```

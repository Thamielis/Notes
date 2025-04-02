TOPIC
    about_Type_Signatures

SHORT DESCRIPTION
    CLR query language built into type expressions.

LONG DESCRIPTION
    Type signatures are a custom query language built into PowerShell type
    expressions to enable complex searches of the environment. Originally built
    to more easily search for generic types, but allows for very precise
    exploration of currently loaded assemblies.

    See https://seemingly.dev/about-type-signatures for a markdown version of
    this document.

  ASSIGNABLE

    By default all type expressions are implicitly interpreted as assignable.
    Meaning if you enter `[IO.FileSystemInfo]` then it will also match
    `[IO.FileInfo]` and `[IO.DirectoryInfo]`.

    PS> Find-Member -ParameterType { [IO.FileSystemInfo] }
    PS> # You can also be explicit about assignable:
    PS> Find-Member -ParameterType { [assignable[IO.FileSystemInfo]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(FileInfo file);
    --------------------------------------------------
      ✓   | void Example(FileSystemInfo fso);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------

  EXACT

    Sometimes you may want to only match a specific type and not any of it's
    subclasses or implementees.

    PS> Find-Member -ParameterType { [exact[IO.FileSystemInfo]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(FileSystemInfo fso);
    --------------------------------------------------
      x   | void Example(FileInfo file);
    --------------------------------------------------

  CONTAINS

    Recurses a type's elements and generic arguments for a match.

    PS> Find-Member -ParameterType { [contains[int]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(int value);
    --------------------------------------------------
      ✓   | void Example(IList<int[]> values);
    --------------------------------------------------
      x   | void Example(IList<long> values);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [contains[exact[IO.FileSystemInfo]]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(IList<FileSystemInfo> fsos);
    --------------------------------------------------
      x   | void Example(IList<FileInfo> files);
    --------------------------------------------------

  ANY

    Matches anything. It's main purpose is as a stand in for generic arguments
    e.g. `[Span[any]]` to match any type of `Span<>`.

    PS> Find-Member -ParameterType { [Span[any]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(Span<int> values);
    --------------------------------------------------
      ✓   | void Example(Span<DateTime> dates);
    --------------------------------------------------
      x   | void Example(ReadOnlySpan<int> values);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [any] }

          | Signature
    --------------------------------------------------
      ✓   | all the things
    --------------------------------------------------

  REF

    An argument passed by `ref`, excludes `out` and `in`.

    PS> Find-Member -ParameterType { [ref] [any] }
    PS> Find-Member -ParameterType { [ref[any]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(ref int value);
    --------------------------------------------------
      ✓   | void Example(ref string value);
    --------------------------------------------------
      x   | void Example(out long value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [ref] [DateTime] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(ref DateTime date);
    --------------------------------------------------
      x   | void Example(in DateTime date);
    --------------------------------------------------
      x   | void Example(out int value);
    --------------------------------------------------

  OUT

    An argument passed by `out`, excludes standard `ref` and `in`.

    PS> Find-Member -ParameterType { [out] [any] }
    PS> Find-Member -ParameterType { [out[any]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(out int value);
    --------------------------------------------------
      ✓   | void Example(out string value);
    --------------------------------------------------
      x   | void Example(ref long value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [out] [DateTime] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(out DateTime date);
    --------------------------------------------------
      x   | void Example(in DateTime date);
    --------------------------------------------------
      x   | void Example(ref int value);
    --------------------------------------------------

  IN

    An argument passed by `in`, excludes standard `ref` and `out`.

    PS> Find-Member -ParameterType { [in] [any] }
    PS> Find-Member -ParameterType { [in[any]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(out int value);
    --------------------------------------------------
      ✓   | void Example(out string value);
    --------------------------------------------------
      x   | void Example(ref long value);
    --------------------------------------------------

    PS> Find-Member -ReturnType { [in] [any] }

          | Signature
    --------------------------------------------------
      ✓   | ref readonly int Example();
    --------------------------------------------------
      ✓   | ref readonly string Example();
    --------------------------------------------------
      x   | ref int Example();
    --------------------------------------------------

  ANYOF

    Return true if **any** of it's arguments match.

    PS> Find-Member -ParameterType { [anyof[int, double]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(int value);
    --------------------------------------------------
      ✓   | void Example(double value);
    --------------------------------------------------
      x   | void Example(long value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [anyof[bool, contains[int]]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(bool value);
    --------------------------------------------------
      ✓   | void Example(IList<int> values);
    --------------------------------------------------
      x   | void Example(long value);
    --------------------------------------------------

  ALLOF

    Return true if **all** of it's arguments match.

    PS> Find-Member -ParameterType { [allof[primitive, [not[anyof[bool, char]]]]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(int value);
    --------------------------------------------------
      ✓   | void Example(long value);
    --------------------------------------------------
      x   | void Example(bool value);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------

  NOT

    Returns true if it's argument does **not** match.

    PS> Find-Member -ParameterType { [not[int]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(bool value);
    --------------------------------------------------
      x   | void Example(int value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [not[contains[int]]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(IList<bool> values);
    --------------------------------------------------
      x   | void Example(IList<int> values);
    --------------------------------------------------
      x   | void Example(int value);
    --------------------------------------------------

  CLASS

    Only match concrete classes (not an interface or `ValueType`).

    PS> Find-Member -ParameterType { [class] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(object value);
    --------------------------------------------------
      x   | void Example(int value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [Collections.Generic.List[class]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(List<string> values);
    --------------------------------------------------
      x   | void Example(List<int> values);
    --------------------------------------------------
      x   | void Example(List<IDisposable> values);
    --------------------------------------------------

  STRUCT

    Only match `ValueType` types that are not exactly `ValueType` or `Enum`.

    PS> Find-Member -ParameterType { [struct] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(int value);
    --------------------------------------------------
      ✓   | void Example(DateTime date);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------
      x   | void Example(Enum value);
    --------------------------------------------------
      x   | void Example(ValueType value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [Collections.Generic.List[class]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(List<string> values);
    --------------------------------------------------
      x   | void Example(List<int> values);
    --------------------------------------------------
      x   | void Example(List<DateTime> values);
    --------------------------------------------------

  RECORD

    Only match types defined with the `record` keyword in C#.

    PS> Find-Member -ParameterType { [record] }

          | Signature
    --------------------------------------------------
      ✓   | public record Person(string Name);
          |
          | void Example(Person person);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------

  READONLYSTRUCT

    Only match structs defined with the `readonly` keyword in C#.

    PS> Find-Member -ParameterType { [readonlystruct] }

          | Signature
    --------------------------------------------------
      ✓   | public readonly struct Person
          | {
          |     public readonly string Name;
          | }
          |
          | void Example(Person person);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------

  READONLYREFSTRUCT

    Only match structs defined with the `readonly` and `ref` keywords in C#.

    PS> Find-Member -ParameterType { [readonlyrefstruct] }

          | Signature
    --------------------------------------------------
      ✓   | public readonly ref struct Person
          | {
          |     public readonly ReadOnlySpan<char> Name;
          | }
          |
          | void Example(Person person);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------

  REFSTRUCT

    Only match structs defined with the `ref` keyword in C#.

    PS> Find-Member -ParameterType { [refstruct] }

          | Signature
    --------------------------------------------------
      ✓   | public ref struct Person
          | {
          |     public ReadOnlySpan<char> Name;
          | }
          |
          | void Example(Person person);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------

  ENUM

    Only concrete `Enum` types.

    PS> Find-Member -ParameterType { [enum] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(BindingFlags flags);
    --------------------------------------------------
      x   | void Example(Enum value);
    --------------------------------------------------
      x   | void Example(object value);
    --------------------------------------------------

  REFERENCETYPE

    Any reference type including classes, interfaces, and boxed value types.

    PS> Find-Member -ParameterType { [referencetype] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(object value);
    --------------------------------------------------
      ✓   | void Example(Enum value);
    --------------------------------------------------
      x   | void Example(int value);
    --------------------------------------------------

  POINTERS

    References raw pointer types replacing C#'s `*` symbol with `+`.

    PS> Find-Member -ParameterType { [void++] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(void** ptr);
    --------------------------------------------------
      x   | void Example(void* ptr);
    --------------------------------------------------
      x   | void Example(int* ptr);
    --------------------------------------------------
      x   | void Example(object value);
    --------------------------------------------------

    PS> Find-Member -ReturnType { [pointer[any, a1..]] }

          | Signature
    --------------------------------------------------
      ✓   | void** Example();
    --------------------------------------------------
      ✓   | int* Example();
    --------------------------------------------------
      x   | void Example();
    --------------------------------------------------
      x   | object Example();
    --------------------------------------------------

    PS> Find-Member -ReturnType { [pointer[any, a2..3]] }

          | Signature
    --------------------------------------------------
      ✓   | void** Example();
    --------------------------------------------------
      x   | int* Example();
    --------------------------------------------------
      ✓   | void*** Example();
    --------------------------------------------------
      x   | void**** Example();
    --------------------------------------------------

  GENERIC PARAMETERS (T, TT, AND TM)

    References a generic parameter. `T` matches any kind, `TT` matches generic
    type parameters and `TM` matches generic method parameters. Optionally add
    a number to indicate generic parameter position (e.g. `T0`). Add generic
    arguments to indicate required generic constraints (e.g. `[T[unmanaged]]`).

    PS> Find-Member -ParameterType { [T] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(T value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [TM] }

          | Signature
    --------------------------------------------------
      ✓   | void Example<TM>(TM value);
    --------------------------------------------------
      x   | void Example(T value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [TM0] }

          | Signature
    --------------------------------------------------
      ✓   | void Example<TM>(TM value);
    --------------------------------------------------
      x   | TM0 Example<TM0, TM1>(TM0 value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [T[unmanaged]] }

          | Signature
    --------------------------------------------------
      ✓   | public class MyClass<T> where T : unmanaged
          | { }
          |
          | void Example(T value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [T[new]] }

          | Signature
    --------------------------------------------------
      ✓   | public class MyClass<T> where T : new()
          | { }
          |
          | void Example(T value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [T[Collections.IList]] }

          | Signature
    --------------------------------------------------
      ✓   | public class MyClass<T> where T : IList
          | { }
          |
          | void Example(T value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [T[struct]] }

          | Signature
    --------------------------------------------------
      ✓   | public class MyClass<T> where T : struct
          | { }
          |
          | void Example(T value);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [T[class]] }

          | Signature
    --------------------------------------------------
      ✓   | public class MyClass<T> where T : class
          | { }
          |
          | void Example(T value);
    --------------------------------------------------

  PRIMITIVE

    Matches bool, byte, char, double, short, int, long, IntPtr, sbyte, float,
    ushort, uint, ulong, or UIntPtr.

    PS> Find-Member -ParameterType { [primitive] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(char value);
    --------------------------------------------------
      ✓   | void Example(float value);
    --------------------------------------------------
      x   | void Example(string value);
    --------------------------------------------------

  INTERFACE

    Matches only interfaces, does not match concrete types.

    PS> Find-Member -ParameterType { [interface] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(IDisposable disposable);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------
      x   | void Example(int value);
    --------------------------------------------------

  ABSTRACT

    Matches only abstract types.

    PS> Find-Member -ParameterType { [abstract] }

          | Signature
    --------------------------------------------------
      x   | void Example(IDisposable disposable);
    --------------------------------------------------
      x   | void Example(object obj);
    --------------------------------------------------
      x   | void Example(int value);
    --------------------------------------------------
      x   | void Example(T value);
    --------------------------------------------------
      ✓   | void Example(FileSystemInfo value);
    --------------------------------------------------
      ✓   | void Example(FileInfo value);
    --------------------------------------------------

  CONCRETE

    Matches only concrete types. No abstract classes, interfaces, or generic
    parameters.

    PS> Find-Member -ParameterType { [abstract] }

          | Signature
    --------------------------------------------------
      x   | void Example(IDisposable disposable);
    --------------------------------------------------
      ✓   | void Example(object obj);
    --------------------------------------------------
      ✓   | void Example(int value);
    --------------------------------------------------
      x   | void Example(T value);
    --------------------------------------------------
      x   | void Example(FileSystemInfo value);
    --------------------------------------------------
      ✓   | void Example(FileInfo value);
    --------------------------------------------------

  INDEX

    Matches only parameters in at a specific index in the method.

    PS> Find-Member -ParameterType { [allof[index0, string]] }

          | Signature
    --------------------------------------------------
      x   | void Example(IDisposable disposable);
    --------------------------------------------------
      ✓   | void Example(string str);
    --------------------------------------------------
      x   | void Example(int value, string str);
    --------------------------------------------------

    PS> Find-Member -ParameterType { [allof[index1.., string]] }

          | Signature
    --------------------------------------------------
      x   | void Example(IDisposable disposable);
    --------------------------------------------------
      x   | void Example(string str);
    --------------------------------------------------
      ✓   | void Example(int value, string str);
    --------------------------------------------------
      ✓   | void Example(int value, object obj, string str);
    --------------------------------------------------
      ✓   | void Example(string value, object obj, string str);
    --------------------------------------------------

    PS> # You can also use `i`
    Find-Member -ParameterType { [allof[i0..1, string]] }

          | Signature
    --------------------------------------------------
      x   | void Example(IDisposable disposable);
    --------------------------------------------------
      ✓   | void Example(string str);
    --------------------------------------------------
      ✓   | void Example(int value, string str);
    --------------------------------------------------
      x   | void Example(int value, object obj, string str);
    --------------------------------------------------
      ✓   | void Example(string value, object obj, string str);
    --------------------------------------------------

  NUMBER

    Matches a hard coded list of types representing numbers.

    PS> Find-Type -Signature { [number] }

          | Signature
    --------------------------------------------------
      ✓   | public readonly struct SByte
    --------------------------------------------------
      ✓   | public readonly struct Byte
    --------------------------------------------------
      ✓   | public readonly struct Int16
    --------------------------------------------------
      ✓   | public readonly struct UInt16
    --------------------------------------------------
      ✓   | public readonly struct Int32
    --------------------------------------------------
      ✓   | public readonly struct UInt32
    --------------------------------------------------
      ✓   | public readonly struct Int64
    --------------------------------------------------
      ✓   | public readonly struct UInt64
    --------------------------------------------------
      ✓   | public readonly struct Single
    --------------------------------------------------
      ✓   | public readonly struct Double
    --------------------------------------------------
      ✓   | public readonly struct Half
    --------------------------------------------------
      ✓   | public readonly struct IntPtr
    --------------------------------------------------
      ✓   | public readonly struct UIntPtr
    --------------------------------------------------
      ✓   | public readonly struct BigInteger
    --------------------------------------------------
      x   | public class Object
    --------------------------------------------------
      x   | public readonly struct DateTime
    --------------------------------------------------

  HASDEFAULT

    Matches only parameters with a default value.

    PS> Find-Member -ParameterType { [hasdefault] }

          | Signature
    --------------------------------------------------
      x   | void Example(string str);
    --------------------------------------------------
      ✓   | void Example(string str = "something");
    --------------------------------------------------
      ✓   | void Example(CancellationToken token = default);
    --------------------------------------------------

  DECORATION, HASATTR

    Matches parameters or types decorated with this attribute.

    PS> Find-Member -ParameterType { [hasattr[ParamArrayAttribute]] }

          | Signature
    --------------------------------------------------
      ✓   | void Example(params object[] args);
    --------------------------------------------------
      x   | void Example(object[] args);
    --------------------------------------------------

    PS> Find-Member -ParameterType {
        [hasattr[Management.Automation.CmdletAttribute]]
    }

          | Signature
    --------------------------------------------------
      ✓   | void Example(OutStringCommand command);
    --------------------------------------------------

  GENERIC

    Provides a way to specify a signature that takes arguments for a generic
    type definition.

    PS> Find-Member -ParameterType {
        [generic[exact[Collections.Generic.IList`1], args[struct]]]
    }

          | Signature
    --------------------------------------------------
      ✓   | void Example(IList<DateTime> values);
    --------------------------------------------------
      x   | void Example(List<DateTime> values);
    --------------------------------------------------
      x   | void Example(IList<object> values);
    --------------------------------------------------

  RESOLUTION MAPS

    You can provide a hashtable of `name` to `Signature`/`Type` to the
    `-ResolutionMap` parameter to create your own keywords or override type
    resolution.

    PS> $map = @{
        number = {
            [anyof[bigint, [allof[primitive, [not[anyof[bool, char]]]]]]]
        }

        anymemory = {
            [anyof[Span[any], ReadOnlySpan[any], Memory[any], ReadOnlyMemory[any]]]
        }

        LocalRunspace = (Find-Type LocalRunspace -Force)
    }

    PS> Find-Type -Force -ResolutionMap $map -Signature {
        [anyof[number, anymemory, LocalRunspace]]
    }

          | Signature
    --------------------------------------------------
      ✓   | public struct Byte { }
    --------------------------------------------------
      ✓   | public struct Double { }
    --------------------------------------------------
      ✓   | public struct Int16 { }
    --------------------------------------------------
      ✓   | public struct Int32 { }
    --------------------------------------------------
      ✓   | public struct Int64 { }
    --------------------------------------------------
      ✓   | public struct IntPtr { }
    --------------------------------------------------
      ✓   | public struct Memory<T> { }
    --------------------------------------------------
      ✓   | public struct ReadOnlyMemory<T> { }
    --------------------------------------------------
      ✓   | public struct ReadOnlySpan<T> { }
    --------------------------------------------------
      ✓   | public struct SByte { }
    --------------------------------------------------
      ✓   | public struct Single { }
    --------------------------------------------------
      ✓   | public struct Span<T> { }
    --------------------------------------------------
      ✓   | public struct UInt16 { }
    --------------------------------------------------
      ✓   | public struct UInt32 { }
    --------------------------------------------------
      ✓   | public struct UInt64 { }
    --------------------------------------------------
      ✓   | public struct UIntPtr { }
    --------------------------------------------------
      ✓   | private class LocalRunspace { }
    --------------------------------------------------
      ✓   | public struct BigInteger { }
    --------------------------------------------------

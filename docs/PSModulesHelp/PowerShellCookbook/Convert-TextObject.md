Convert-TextObject
------------------

### Synopsis
Convert a simple string into a custom PowerShell object.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
"Hello World" | Convert-TextObject
Generates an Object with "P1=Hello" and "P2=World"
```
> EXAMPLE 2

```PowerShell
"Hello World" | Convert-TextObject -Delimiter "ll"
Generates an Object with "P1=He" and "P2=o World"
```
> EXAMPLE 3

```PowerShell
"Hello World" | Convert-TextObject -Pattern "He(ll.*o)r(ld)"
Generates an Object with "P1=llo Wo" and "P2=ld"
```
> EXAMPLE 4

"Hello World" | Convert-TextObject -PropertyName FirstWord,SecondWord
Generates an Object with "FirstWord=Hello" and "SecondWord=World
> EXAMPLE 5

```PowerShell
"123 456" | Convert-TextObject -PropertyType $([string],[int])
Generates an Object with "Property1=123" and "Property2=456"
The second property is an integer, as opposed to a string
```
> EXAMPLE 6

```PowerShell
$ipAddress = (ipconfig | Convert-TextObject -Delim ": ")[2].P2
PS > $ipAddress
192.168.1.104
```

---

### Parameters
#### **Delimiter**
If specified, gives the .NET Regular Expression with which to
split the string. The script generates properties for the
resulting object out of the elements resulting from this split.
If not specified, defaults to splitting on the maximum amount
of whitespace: "\s+", as long as Pattern is not
specified either.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Pattern**
If specified, gives the .NET Regular Expression with which to
parse the string. The script generates properties for the
resulting object out of the groups captured by this regular
expression.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **PropertyName**
If specified, the script will pair the names from this object
definition with the elements from the parsed string.  If not
specified (or the generated object contains more properties
than you specify,) the script uses property names in the
pattern of P1,P2,...,PN

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |2       |false        |PN     |

#### **PropertyType**
If specified, the script will pair the types from this list with
the properties from the parsed string.  If not specified (or the
generated object contains more properties than you specify,) the
script sets the properties to be of type [string]

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Type[]]`|false   |3       |false        |PT     |

#### **InputObject**
The input object to process

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |named   |true (ByValue)|

---

### Syntax
```PowerShell
Convert-TextObject [[-Delimiter] <String>] [[-PropertyName] <String[]>] [[-PropertyType] <Type[]>] [-InputObject <String>] [<CommonParameters>]
```
```PowerShell
Convert-TextObject [-Pattern] <String> [[-PropertyName] <String[]>] [[-PropertyType] <Type[]>] [-InputObject <String>] [<CommonParameters>]
```

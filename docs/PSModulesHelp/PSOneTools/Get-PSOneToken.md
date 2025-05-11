Get-PSOneToken
--------------

### Synopsis
Parses a PowerShell Script (*.ps1, *.psm1, *.psd1) and returns the token

---

### Description

Invokes the advanced PowerShell Parser and returns tokens and syntax errors

---

### Related Links
* [https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Get-PSOneToken.ps1](https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Get-PSOneToken.ps1)

* [https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Get-PSOneToken.ps1](https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Get-PSOneToken.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSOneToken -Path c:\test.ps1
Parses the content of c:\test.ps1 and returns tokens and syntax errors
```
> EXAMPLE 2

```PowerShell
Get-ChildItem -Path $home -Recurse -Include *.ps1,*.psm1,*.psd1 -File |
Get-PSOneToken |
Out-GridView
parses all PowerShell files found anywhere in your user profile
```
> EXAMPLE 3

```PowerShell
Get-ChildItem -Path $home -Recurse -Include *.ps1,*.psm1,*.psd1 -File |
Get-PSOneToken |
Where-Object Errors
parses all PowerShell files found anywhere in your user profile
and returns only those files that contain syntax errors
```

---

### Parameters
#### **Path**
Path to PowerShell script file
can be a string or any object that has a "Path" 
or "FullName" property:

|Type      |Required|Position|PipelineInput |Aliases |
|----------|--------|--------|--------------|--------|
|`[String]`|true    |named   |true (ByValue)|FullName|

#### **ScriptBlock**
PowerShell Code as ScriptBlock

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[ScriptBlock]`|true    |named   |true (ByValue)|

#### **Code**
PowerShell Code as String

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

#### **TokenKind**
the kind of token requested. If neither TokenKind nor TokenFlag is requested, 
a full tokenization occurs
Valid Values:

* Unknown
* Variable
* SplattedVariable
* Parameter
* Number
* Label
* Identifier
* Generic
* NewLine
* LineContinuation
* Comment
* EndOfInput
* StringLiteral
* StringExpandable
* HereStringLiteral
* HereStringExpandable
* LParen
* RParen
* LCurly
* RCurly
* LBracket
* RBracket
* AtParen
* AtCurly
* DollarParen
* Semi
* AndAnd
* OrOr
* Ampersand
* Pipe
* Comma
* MinusMinus
* PlusPlus
* DotDot
* ColonColon
* Dot
* Exclaim
* Multiply
* Divide
* Rem
* Plus
* Minus
* Equals
* PlusEquals
* MinusEquals
* MultiplyEquals
* DivideEquals
* RemainderEquals
* Redirection
* RedirectInStd
* Format
* Not
* Bnot
* And
* Or
* Xor
* Band
* Bor
* Bxor
* Join
* Ieq
* Ine
* Ige
* Igt
* Ilt
* Ile
* Ilike
* Inotlike
* Imatch
* Inotmatch
* Ireplace
* Icontains
* Inotcontains
* Iin
* Inotin
* Isplit
* Ceq
* Cne
* Cge
* Cgt
* Clt
* Cle
* Clike
* Cnotlike
* Cmatch
* Cnotmatch
* Creplace
* Ccontains
* Cnotcontains
* Cin
* Cnotin
* Csplit
* Is
* IsNot
* As
* PostfixPlusPlus
* PostfixMinusMinus
* Shl
* Shr
* Colon
* QuestionMark
* QuestionQuestionEquals
* QuestionQuestion
* QuestionDot
* QuestionLBracket
* Begin
* Break
* Catch
* Class
* Continue
* Data
* Define
* Do
* Dynamicparam
* Else
* ElseIf
* End
* Exit
* Filter
* Finally
* For
* Foreach
* From
* Function
* If
* In
* Param
* Process
* Return
* Switch
* Throw
* Trap
* Try
* Until
* Using
* Var
* While
* Workflow
* Parallel
* Sequence
* InlineScript
* Configuration
* DynamicKeyword
* Public
* Private
* Static
* Interface
* Enum
* Namespace
* Module
* Type
* Assembly
* Command
* Hidden
* Base
* Default
* Clean

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[TokenKind[]]`|false   |named   |false        |

#### **TokenFlag**
the kind of token requested. If neither TokenKind nor TokenFlag is requested, 
a full tokenization occurs
Valid Values:

* None
* BinaryPrecedenceLogical
* BinaryPrecedenceBitwise
* BinaryPrecedenceComparison
* BinaryPrecedenceCoalesce
* BinaryPrecedenceAdd
* BinaryPrecedenceMultiply
* BinaryPrecedenceFormat
* BinaryPrecedenceRange
* BinaryPrecedenceMask
* Keyword
* ScriptBlockBlockName
* BinaryOperator
* UnaryOperator
* CaseSensitiveOperator
* TernaryOperator
* SpecialOperator
* AssignmentOperator
* ParseModeInvariant
* TokenInError
* DisallowedInRestrictedMode
* PrefixOrPostfixOperator
* CommandName
* MemberName
* TypeName
* AttributeName
* CanConstantFold
* StatementDoesntSupportAttributes

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[TokenFlags[]]`|false   |named   |false        |

#### **IncludeNestedToken**
include nested token that are contained inside 
ExpandableString tokens

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-PSOneToken -Path <String> [-TokenKind {Unknown | Variable | SplattedVariable | Parameter | Number | Label | Identifier | Generic | NewLine | LineContinuation | Comment | EndOfInput | StringLiteral | StringExpandable | HereStringLiteral | HereStringExpandable | LParen | RParen | LCurly | RCurly | LBracket | RBracket | AtParen | AtCurly | DollarParen | Semi | AndAnd | OrOr | Ampersand | Pipe | Comma | MinusMinus | PlusPlus | DotDot | ColonColon | Dot | Exclaim | Multiply | Divide | Rem | Plus | Minus | Equals | PlusEquals | MinusEquals | MultiplyEquals | DivideEquals | RemainderEquals | Redirection | RedirectInStd | Format | Not | Bnot | And | Or | Xor | Band | Bor | Bxor | Join | Ieq | Ine | Ige | Igt | Ilt | Ile | Ilike | Inotlike | Imatch | Inotmatch | Ireplace | Icontains | Inotcontains | Iin | Inotin | Isplit | Ceq | Cne | Cge | Cgt | Clt | Cle | Clike | Cnotlike | Cmatch | Cnotmatch | Creplace | Ccontains | Cnotcontains | Cin | Cnotin | Csplit | Is | IsNot | As | PostfixPlusPlus | PostfixMinusMinus | Shl | Shr | Colon | QuestionMark | QuestionQuestionEquals | QuestionQuestion | QuestionDot | QuestionLBracket | Begin | Break | Catch | Class | Continue | Data | Define | Do | Dynamicparam | Else | ElseIf | End | Exit | Filter | Finally | For | Foreach | From | Function | If | In | Param | Process | Return | Switch | Throw | Trap | Try | Until | Using | Var | While | Workflow | Parallel | Sequence | InlineScript | Configuration | DynamicKeyword | Public | Private | Static | Interface | Enum | Namespace | Module | Type | Assembly | Command | Hidden | Base | Default | Clean}] [-TokenFlag {None | BinaryPrecedenceLogical | BinaryPrecedenceBitwise | BinaryPrecedenceComparison | BinaryPrecedenceCoalesce | BinaryPrecedenceAdd | BinaryPrecedenceMultiply | BinaryPrecedenceFormat | BinaryPrecedenceRange | BinaryPrecedenceMask | Keyword | ScriptBlockBlockName | BinaryOperator | UnaryOperator | CaseSensitiveOperator | TernaryOperator | SpecialOperator | AssignmentOperator | ParseModeInvariant | TokenInError | DisallowedInRestrictedMode | PrefixOrPostfixOperator | CommandName | MemberName | TypeName | AttributeName | CanConstantFold | StatementDoesntSupportAttributes}] [-IncludeNestedToken] [<CommonParameters>]
```
```PowerShell
Get-PSOneToken -ScriptBlock <ScriptBlock> [-TokenKind {Unknown | Variable | SplattedVariable | Parameter | Number | Label | Identifier | Generic | NewLine | LineContinuation | Comment | EndOfInput | StringLiteral | StringExpandable | HereStringLiteral | HereStringExpandable | LParen | RParen | LCurly | RCurly | LBracket | RBracket | AtParen | AtCurly | DollarParen | Semi | AndAnd | OrOr | Ampersand | Pipe | Comma | MinusMinus | PlusPlus | DotDot | ColonColon | Dot | Exclaim | Multiply | Divide | Rem | Plus | Minus | Equals | PlusEquals | MinusEquals | MultiplyEquals | DivideEquals | RemainderEquals | Redirection | RedirectInStd | Format | Not | Bnot | And | Or | Xor | Band | Bor | Bxor | Join | Ieq | Ine | Ige | Igt | Ilt | Ile | Ilike | Inotlike | Imatch | Inotmatch | Ireplace | Icontains | Inotcontains | Iin | Inotin | Isplit | Ceq | Cne | Cge | Cgt | Clt | Cle | Clike | Cnotlike | Cmatch | Cnotmatch | Creplace | Ccontains | Cnotcontains | Cin | Cnotin | Csplit | Is | IsNot | As | PostfixPlusPlus | PostfixMinusMinus | Shl | Shr | Colon | QuestionMark | QuestionQuestionEquals | QuestionQuestion | QuestionDot | QuestionLBracket | Begin | Break | Catch | Class | Continue | Data | Define | Do | Dynamicparam | Else | ElseIf | End | Exit | Filter | Finally | For | Foreach | From | Function | If | In | Param | Process | Return | Switch | Throw | Trap | Try | Until | Using | Var | While | Workflow | Parallel | Sequence | InlineScript | Configuration | DynamicKeyword | Public | Private | Static | Interface | Enum | Namespace | Module | Type | Assembly | Command | Hidden | Base | Default | Clean}] [-TokenFlag {None | BinaryPrecedenceLogical | BinaryPrecedenceBitwise | BinaryPrecedenceComparison | BinaryPrecedenceCoalesce | BinaryPrecedenceAdd | BinaryPrecedenceMultiply | BinaryPrecedenceFormat | BinaryPrecedenceRange | BinaryPrecedenceMask | Keyword | ScriptBlockBlockName | BinaryOperator | UnaryOperator | CaseSensitiveOperator | TernaryOperator | SpecialOperator | AssignmentOperator | ParseModeInvariant | TokenInError | DisallowedInRestrictedMode | PrefixOrPostfixOperator | CommandName | MemberName | TypeName | AttributeName | CanConstantFold | StatementDoesntSupportAttributes}] [-IncludeNestedToken] [<CommonParameters>]
```
```PowerShell
Get-PSOneToken -Code <String> [-TokenKind {Unknown | Variable | SplattedVariable | Parameter | Number | Label | Identifier | Generic | NewLine | LineContinuation | Comment | EndOfInput | StringLiteral | StringExpandable | HereStringLiteral | HereStringExpandable | LParen | RParen | LCurly | RCurly | LBracket | RBracket | AtParen | AtCurly | DollarParen | Semi | AndAnd | OrOr | Ampersand | Pipe | Comma | MinusMinus | PlusPlus | DotDot | ColonColon | Dot | Exclaim | Multiply | Divide | Rem | Plus | Minus | Equals | PlusEquals | MinusEquals | MultiplyEquals | DivideEquals | RemainderEquals | Redirection | RedirectInStd | Format | Not | Bnot | And | Or | Xor | Band | Bor | Bxor | Join | Ieq | Ine | Ige | Igt | Ilt | Ile | Ilike | Inotlike | Imatch | Inotmatch | Ireplace | Icontains | Inotcontains | Iin | Inotin | Isplit | Ceq | Cne | Cge | Cgt | Clt | Cle | Clike | Cnotlike | Cmatch | Cnotmatch | Creplace | Ccontains | Cnotcontains | Cin | Cnotin | Csplit | Is | IsNot | As | PostfixPlusPlus | PostfixMinusMinus | Shl | Shr | Colon | QuestionMark | QuestionQuestionEquals | QuestionQuestion | QuestionDot | QuestionLBracket | Begin | Break | Catch | Class | Continue | Data | Define | Do | Dynamicparam | Else | ElseIf | End | Exit | Filter | Finally | For | Foreach | From | Function | If | In | Param | Process | Return | Switch | Throw | Trap | Try | Until | Using | Var | While | Workflow | Parallel | Sequence | InlineScript | Configuration | DynamicKeyword | Public | Private | Static | Interface | Enum | Namespace | Module | Type | Assembly | Command | Hidden | Base | Default | Clean}] [-TokenFlag {None | BinaryPrecedenceLogical | BinaryPrecedenceBitwise | BinaryPrecedenceComparison | BinaryPrecedenceCoalesce | BinaryPrecedenceAdd | BinaryPrecedenceMultiply | BinaryPrecedenceFormat | BinaryPrecedenceRange | BinaryPrecedenceMask | Keyword | ScriptBlockBlockName | BinaryOperator | UnaryOperator | CaseSensitiveOperator | TernaryOperator | SpecialOperator | AssignmentOperator | ParseModeInvariant | TokenInError | DisallowedInRestrictedMode | PrefixOrPostfixOperator | CommandName | MemberName | TypeName | AttributeName | CanConstantFold | StatementDoesntSupportAttributes}] [-IncludeNestedToken] [<CommonParameters>]
```

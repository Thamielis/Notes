Get-VEToken
-----------

### Synopsis

---

### Description

---

### Related Links
* [https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer
https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer](https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer
https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer)

* [https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer
https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer](https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer
https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer)

---

### Parameters
#### **Path**

|Type      |Required|Position|PipelineInput |Aliases |
|----------|--------|--------|--------------|--------|
|`[String]`|true    |named   |true (ByValue)|FullName|

#### **ScriptBlock**

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[ScriptBlock]`|true    |named   |true (ByValue)|

#### **Code**

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

#### **TokenKind**

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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-VEToken -Path <String> [-TokenKind {Unknown | Variable | SplattedVariable | Parameter | Number | Label | Identifier | Generic | NewLine | LineContinuation | Comment | EndOfInput | StringLiteral | StringExpandable | HereStringLiteral | HereStringExpandable | LParen | RParen | LCurly | RCurly | LBracket | RBracket | AtParen | AtCurly | DollarParen | Semi | AndAnd | OrOr | Ampersand | Pipe | Comma | MinusMinus | PlusPlus | DotDot | ColonColon | Dot | Exclaim | Multiply | Divide | Rem | Plus | Minus | Equals | PlusEquals | MinusEquals | MultiplyEquals | DivideEquals | RemainderEquals | Redirection | RedirectInStd | Format | Not | Bnot | And | Or | Xor | Band | Bor | Bxor | Join | Ieq | Ine | Ige | Igt | Ilt | Ile | Ilike | Inotlike | Imatch | Inotmatch | Ireplace | Icontains | Inotcontains | Iin | Inotin | Isplit | Ceq | Cne | Cge | Cgt | Clt | Cle | Clike | Cnotlike | Cmatch | Cnotmatch | Creplace | Ccontains | Cnotcontains | Cin | Cnotin | Csplit | Is | IsNot | As | PostfixPlusPlus | PostfixMinusMinus | Shl | Shr | Colon | QuestionMark | QuestionQuestionEquals | QuestionQuestion | QuestionDot | QuestionLBracket | Begin | Break | Catch | Class | Continue | Data | Define | Do | Dynamicparam | Else | ElseIf | End | Exit | Filter | Finally | For | Foreach | From | Function | If | In | Param | Process | Return | Switch | Throw | Trap | Try | Until | Using | Var | While | Workflow | Parallel | Sequence | InlineScript | Configuration | DynamicKeyword | Public | Private | Static | Interface | Enum | Namespace | Module | Type | Assembly | Command | Hidden | Base | Default | Clean}] [-TokenFlag {None | BinaryPrecedenceLogical | BinaryPrecedenceBitwise | BinaryPrecedenceComparison | BinaryPrecedenceCoalesce | BinaryPrecedenceAdd | BinaryPrecedenceMultiply | BinaryPrecedenceFormat | BinaryPrecedenceRange | BinaryPrecedenceMask | Keyword | ScriptBlockBlockName | BinaryOperator | UnaryOperator | CaseSensitiveOperator | TernaryOperator | SpecialOperator | AssignmentOperator | ParseModeInvariant | TokenInError | DisallowedInRestrictedMode | PrefixOrPostfixOperator | CommandName | MemberName | TypeName | AttributeName | CanConstantFold | StatementDoesntSupportAttributes}] [-IncludeNestedToken] [<CommonParameters>]
```
```PowerShell
Get-VEToken -ScriptBlock <ScriptBlock> [-TokenKind {Unknown | Variable | SplattedVariable | Parameter | Number | Label | Identifier | Generic | NewLine | LineContinuation | Comment | EndOfInput | StringLiteral | StringExpandable | HereStringLiteral | HereStringExpandable | LParen | RParen | LCurly | RCurly | LBracket | RBracket | AtParen | AtCurly | DollarParen | Semi | AndAnd | OrOr | Ampersand | Pipe | Comma | MinusMinus | PlusPlus | DotDot | ColonColon | Dot | Exclaim | Multiply | Divide | Rem | Plus | Minus | Equals | PlusEquals | MinusEquals | MultiplyEquals | DivideEquals | RemainderEquals | Redirection | RedirectInStd | Format | Not | Bnot | And | Or | Xor | Band | Bor | Bxor | Join | Ieq | Ine | Ige | Igt | Ilt | Ile | Ilike | Inotlike | Imatch | Inotmatch | Ireplace | Icontains | Inotcontains | Iin | Inotin | Isplit | Ceq | Cne | Cge | Cgt | Clt | Cle | Clike | Cnotlike | Cmatch | Cnotmatch | Creplace | Ccontains | Cnotcontains | Cin | Cnotin | Csplit | Is | IsNot | As | PostfixPlusPlus | PostfixMinusMinus | Shl | Shr | Colon | QuestionMark | QuestionQuestionEquals | QuestionQuestion | QuestionDot | QuestionLBracket | Begin | Break | Catch | Class | Continue | Data | Define | Do | Dynamicparam | Else | ElseIf | End | Exit | Filter | Finally | For | Foreach | From | Function | If | In | Param | Process | Return | Switch | Throw | Trap | Try | Until | Using | Var | While | Workflow | Parallel | Sequence | InlineScript | Configuration | DynamicKeyword | Public | Private | Static | Interface | Enum | Namespace | Module | Type | Assembly | Command | Hidden | Base | Default | Clean}] [-TokenFlag {None | BinaryPrecedenceLogical | BinaryPrecedenceBitwise | BinaryPrecedenceComparison | BinaryPrecedenceCoalesce | BinaryPrecedenceAdd | BinaryPrecedenceMultiply | BinaryPrecedenceFormat | BinaryPrecedenceRange | BinaryPrecedenceMask | Keyword | ScriptBlockBlockName | BinaryOperator | UnaryOperator | CaseSensitiveOperator | TernaryOperator | SpecialOperator | AssignmentOperator | ParseModeInvariant | TokenInError | DisallowedInRestrictedMode | PrefixOrPostfixOperator | CommandName | MemberName | TypeName | AttributeName | CanConstantFold | StatementDoesntSupportAttributes}] [-IncludeNestedToken] [<CommonParameters>]
```
```PowerShell
Get-VEToken -Code <String> [-TokenKind {Unknown | Variable | SplattedVariable | Parameter | Number | Label | Identifier | Generic | NewLine | LineContinuation | Comment | EndOfInput | StringLiteral | StringExpandable | HereStringLiteral | HereStringExpandable | LParen | RParen | LCurly | RCurly | LBracket | RBracket | AtParen | AtCurly | DollarParen | Semi | AndAnd | OrOr | Ampersand | Pipe | Comma | MinusMinus | PlusPlus | DotDot | ColonColon | Dot | Exclaim | Multiply | Divide | Rem | Plus | Minus | Equals | PlusEquals | MinusEquals | MultiplyEquals | DivideEquals | RemainderEquals | Redirection | RedirectInStd | Format | Not | Bnot | And | Or | Xor | Band | Bor | Bxor | Join | Ieq | Ine | Ige | Igt | Ilt | Ile | Ilike | Inotlike | Imatch | Inotmatch | Ireplace | Icontains | Inotcontains | Iin | Inotin | Isplit | Ceq | Cne | Cge | Cgt | Clt | Cle | Clike | Cnotlike | Cmatch | Cnotmatch | Creplace | Ccontains | Cnotcontains | Cin | Cnotin | Csplit | Is | IsNot | As | PostfixPlusPlus | PostfixMinusMinus | Shl | Shr | Colon | QuestionMark | QuestionQuestionEquals | QuestionQuestion | QuestionDot | QuestionLBracket | Begin | Break | Catch | Class | Continue | Data | Define | Do | Dynamicparam | Else | ElseIf | End | Exit | Filter | Finally | For | Foreach | From | Function | If | In | Param | Process | Return | Switch | Throw | Trap | Try | Until | Using | Var | While | Workflow | Parallel | Sequence | InlineScript | Configuration | DynamicKeyword | Public | Private | Static | Interface | Enum | Namespace | Module | Type | Assembly | Command | Hidden | Base | Default | Clean}] [-TokenFlag {None | BinaryPrecedenceLogical | BinaryPrecedenceBitwise | BinaryPrecedenceComparison | BinaryPrecedenceCoalesce | BinaryPrecedenceAdd | BinaryPrecedenceMultiply | BinaryPrecedenceFormat | BinaryPrecedenceRange | BinaryPrecedenceMask | Keyword | ScriptBlockBlockName | BinaryOperator | UnaryOperator | CaseSensitiveOperator | TernaryOperator | SpecialOperator | AssignmentOperator | ParseModeInvariant | TokenInError | DisallowedInRestrictedMode | PrefixOrPostfixOperator | CommandName | MemberName | TypeName | AttributeName | CanConstantFold | StatementDoesntSupportAttributes}] [-IncludeNestedToken] [<CommonParameters>]
```

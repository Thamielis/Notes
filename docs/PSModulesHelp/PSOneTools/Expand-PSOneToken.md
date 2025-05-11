Expand-PSOneToken
-----------------

### Synopsis
Expands all nested token from a token of type "StringExpandable"

---

### Description

Recursively emits all tokens embedded in a token of type "StringExpandable"
The original token is also emitted.

---

### Related Links
* [https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Expand-PSOneToken.ps1](https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Expand-PSOneToken.ps1)

* [https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Expand-PSOneToken.ps1](https://powershell.one/powershell-internals/parsing-and-tokenization/advanced-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Expand-PSOneToken.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSOneToken -Code '"Hello $host"' -TokenKind StringExpandable | Expand-PSOneToken 
Emits all tokens, including the embedded (nested) tokens
```

---

### Parameters
#### **StringExpandable**
binds a token of type "StringExpandableToken"

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[StringExpandableToken]`|true    |1       |true (ByValue)|

#### **Token**
binds all tokens

|Type     |Required|Position|PipelineInput |
|---------|--------|--------|--------------|
|`[Token]`|true    |1       |true (ByValue)|

---

### Syntax
```PowerShell
Expand-PSOneToken [-StringExpandable] <StringExpandableToken> [<CommonParameters>]
```
```PowerShell
Expand-PSOneToken [-Token] <Token> [<CommonParameters>]
```

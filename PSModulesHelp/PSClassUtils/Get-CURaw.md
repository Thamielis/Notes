Get-CURaw
---------

### Synopsis
Return the raw content of a ps1 or psm1 file as a AST scriptblock type.

---

### Description

Return the raw content of a ps1 or psm1 file as a AST scriptblock type.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-CURaw -Path .\Classes\Private\01_ClassProperty.ps1
Attributes         : {}
UsingStatements    : {}
ParamBlock         :
BeginBlock         :
ProcessBlock       :
EndBlock           : Class ClassProperty {
                        [String]$Name
                        [String]$Type
ClassProperty([String]$Name,[String]$Type){

                            $this.Name = $Name
                            $This.Type = $Type

                        }
                    }
DynamicParamBlock  :
ScriptRequirements :
Extent             : Class ClassProperty {
                        [String]$Name
                        [String]$Type

                        ClassProperty([String]$Name,[String]$Type){

                            $this.Name = $Name
                            $This.Type = $Type

                        }
                    }
Parent             :

The cmdlet return an AST type representing the content of the 01_ClassProperty.ps1 file
```

---

### Parameters
#### **Path**

|Type          |Required|Position|PipelineInput                 |Aliases |
|--------------|--------|--------|------------------------------|--------|
|`[FileInfo[]]`|false   |named   |true (ByValue, ByPropertyName)|FullName|

---

### Inputs
Path of a ps1 or psm1 file

---

### Outputs
* ScriptBlockAST

---

### Notes
Ref: https://mikefrobbins.com/2018/09/28/learning-about-the-powershell-abstract-syntax-tree-ast/ for implementing -raw AST

---

### Syntax
```PowerShell
Get-CURaw [-Path <FileInfo[]>] [<CommonParameters>]
```

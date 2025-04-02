Add-ExcelDataValidationRule
---------------------------

### Synopsis
Adds data validation to a range of cells

---

### Description

Excel supports the validation of user input, and ranges of cells can be marked to only contain numbers, or date, or Text up to a particular length, or selections from a list. This command adds validation rules to a worksheet.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

PS\>Add-ExcelDataValidationRule -WorkSheet $PlanSheet -Range 'E2:E1001' -ValidationType Integer -Operator between -Value 0 -Value2 100 \`
     -ShowErrorMessage -ErrorStyle stop -ErrorTitle 'Invalid Data' -ErrorBody 'Percentage must be a whole number between 0 and 100'
This defines a validation rule on cells E2-E1001; it is an integer rule and requires a number between 0 and 100. If a value is input with a fraction, negative number, or positive number &gt; 100 a stop dialog box appears.
> EXAMPLE 2

PS\>Add-ExcelDataValidationRule -WorkSheet $PlanSheet -Range 'B2:B1001' -ValidationType List  -Formula 'values!$a$2:$a$1000'
       -ShowErrorMessage -ErrorStyle stop -ErrorTitle 'Invalid Data' -ErrorBody 'You must select an item from the list'
This defines a list rule on Cells B2:1001, and the posible values are in a sheet named "values" at cells A2 to A1000 Blank cells in this range are ignored.

If $ signs were left out of the fomrmula B2 would be checked against A2-A1000, B3, against A3-A1001, B4 against A4-A1002 up to B1001 beng checked against A1001-A1999
> EXAMPLE 3

```PowerShell
PS\>Add-ExcelDataValidationRule -WorkSheet $PlanSheet -Range 'I2:N1001' -ValidationType List    -ValueSet @('yes','YES','Yes')
        -ShowErrorMessage -ErrorStyle stop -ErrorTitle 'Invalid Data' -ErrorBody "Select Yes or leave blank for no"
Similar to the previous example but this time provides a value set; Excel comparisons are case sesnsitive, hence 3 versions of Yes.
```

---

### Parameters
#### **Range**
The range of cells to be validate, for example, "B2:C100"

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[Object]`|false   |1       |True (ByValue)|Address|

#### **WorkSheet**
The worksheet where the cells should be validated

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|false   |named   |False        |

#### **ValidationType**
An option corresponding to a choice from the 'Allow' pull down on the settings page in the Excel dialog. "Any" means "any allowed" - in other words, no Validation
Valid Values:

* Any
* Custom
* DateTime
* Decimal
* Integer
* List
* TextLength
* Time

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Operator**
The operator to apply to Decimal, Integer, TextLength, DateTime and time fields, for example "equal" or "between"
Valid Values:

* between
* notBetween
* equal
* notEqual
* lessThan
* lessThanOrEqual
* greaterThan
* greaterThanOrEqual

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[ExcelDataValidationOperator]`|false   |named   |False        |

#### **Value**
For Decimal, Integer, TextLength, DateTime the [first] data value

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Value2**
When using the between operator, the second data value

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Formula**
The [first] data value as a formula. Use absolute formulas $A$1 if (e.g.) you want all cells to check against the same list

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Formula2**
When using the between operator, the second data value as a formula

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **ValueSet**
When using the list validation type, a set of values (rather than refering to Sheet!B$2:B$100 )

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **ShowErrorMessage**
Corresponds to the the 'Show Error alert ...' check box on error alert page in the Excel dialog

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ErrorStyle**
Stop, Warning, or Infomation, corresponding to to the style setting in the Excel dialog
Valid Values:

* undefined
* stop
* warning
* information

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[ExcelDataValidationWarningStyle]`|false   |named   |False        |

#### **ErrorTitle**
The title for the message box corresponding to to the title setting in the Excel dialog

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ErrorBody**
The error message corresponding to to the Error message setting in the Excel dialog

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ShowPromptMessage**
Corresponds to the the 'Show Input message ...' check box on input message page in the Excel dialog

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PromptBody**
The prompt message corresponding to to the Input message setting in the Excel dialog

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PromptTitle**
The title for the message box corresponding to to the title setting in the Excel dialog

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NoBlank**
By default the 'Ignore blank' option will be selected, unless NoBlank is sepcified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Add-ExcelDataValidationRule [[-Range] <Object>] [-WorkSheet <ExcelWorksheet>] [-ValidationType <Object>] [-Operator {between | notBetween | equal | notEqual | lessThan | lessThanOrEqual | greaterThan | greaterThanOrEqual}] [-Value <Object>] [-Value2 <Object>] [-Formula <Object>] [-Formula2 <Object>] [-ValueSet <Object>] [-ShowErrorMessage] [-ErrorStyle {undefined | stop | warning | information}] [-ErrorTitle <String>] [-ErrorBody <String>] [-ShowPromptMessage] [-PromptBody <String>] [-PromptTitle <String>] [-NoBlank <String>] [<CommonParameters>]
```

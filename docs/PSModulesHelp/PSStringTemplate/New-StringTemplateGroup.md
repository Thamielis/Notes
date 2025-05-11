New-StringTemplateGroup
-----------------------

### Synopsis
Define a group of templates.

---

### Description

The New-StringTemplateGroup cmdlet allows you to create a group of templates using the group definition syntax.  Templates within a group can reference other templates in the same group.

You can use this to enumerate arrays, call different templates based on conditions, or just for better organization.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/PSStringTemplate/blob/master/docs/en-US/New-StringTemplateGroup.md)

---

### Examples
> EXAMPLE 1

PS> $group = New-StringTemplateGroup -Definition @'

    memberTemplate(Name, Parameters, ReturnType) ::= <<
<Name><if(ReturnType)>(<Parameters:paramTemplate(); separator=", ">)<endif>
>>

    paramTemplate(param) ::= "$<param.Name>"
'@
PS> $group | Invoke-StringTemplate -Name memberTemplate ([string].GetProperty('Length'))
Length
PS> $group | Invoke-StringTemplate -Name memberTemplate ([string].GetMethod('Clone'))
Clone()
PS> $group | Invoke-StringTemplate -Name memberTemplate ([string].GetMethod('IsNullOrWhiteSpace'))
IsNullOrWhiteSpace($value)
PS> $group | Invoke-StringTemplate -Name memberTemplate ([string].GetMethod('Insert'))
Insert($startIndex, $value)
Create a template to generate different member expressions from MemberInfo objects.

---

### Parameters
#### **Definition**
The group definition string to use to compile a template group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* PSStringTemplate.TemplateGroupInfo

---

### Notes

---

### Syntax
```PowerShell
New-StringTemplateGroup -Definition <String> [<CommonParameters>]
```

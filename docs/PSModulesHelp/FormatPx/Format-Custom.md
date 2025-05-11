Format-Custom
-------------

### Synopsis
Uses a customized view to format the output.

---

### Description

The Format-Custom cmdlet formats the output of a command as defined in an alternate view. Format-Custom is designed to display views that are not just tables or just lists. You can use the views defined in the *format.PS1XML files in the Windows PowerShell directory, or you can create your own views in new PS1XML files and use the Update-FormatData cmdlet to add them to Windows PowerShell.

---

### Related Links
* [Format-Default](Format-Default)

* [Format-List](Format-List)

* [Format-Table](Format-Table)

* [Format-Wide](Format-Wide)

* [Out-Default](Out-Default)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-Command Start-Transcript | Format-Custom -View MyView
This command formats information about the Start-Transcript cmdlet in the format defined by the MyView view, a custom view created by the user. To run this command successfully, you must first create a new PS1XML file, define the MyView view, and then use the Update-FormatData command to add the PS1XML file to Windows PowerShell.
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-Process winlogon | Format-Custom
This command formats information about the Winlogon process in an alternate customized view. Because the command does not use the View parameter, Format-Custom uses a default custom view to format the data.
```

---

### Parameters
#### **Property**
Specifies the object properties that appear in the display and the order in which they appear. Wildcards are permitted.
If you omit this parameter, the properties that appear in the display depend on the object being displayed. The parameter name ("Property") is optional. You cannot use the Property and View parameters in the same command.
The value of the Property parameter can be a new calculated property. To create a calculated property, use a hash table. Valid keys are:
-- Expression <string> or <script block>
-- Depth <int32>

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |0       |false        |

#### **Depth**
Specifies the number of columns in the display.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **GroupBy**
Formats the output in groups based on a shared property or value. Enter an expression or a property of the output.
The value of the GroupBy parameter can be a new calculated property. To create a calculated, property, use a hash table. Valid keys are:
-- Name (or Label) <string>
-- Expression <string> or <script block>
-- FormatString <string>

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **View**
Specifies the name of an alternate format or "view." If you omit this parameter, Format-Custom uses a default custom view. You cannot use the Property and View parameters in the same command.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ShowError**
Sends errors through the pipeline. This parameter is rarely used, but can be used as a debugging aid when you are formatting expressions in a Format-Custom command, and the expressions do not appear to be working. The following shows an example of the results of adding the ShowError parameter with an expression.
PS > Get-Date | Format-Custom DayOfWeek,{ $_ / $null } -ShowError
DayOfWeek $_ / $null
--------- ------------
Wednesday
Failed to evaluate expression " $_ / $null ".
 + CategoryInfo : InvalidArgument: (10/30/2013 2:28:07 PM:PSObject) [], RuntimeException
 + FullyQualifiedErrorId : mshExpressionError

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisplayError**
Displays errors at the command line. This parameter is rarely used, but can be used as a debugging aid when you are formatting expressions in a Format-Custom command, and the expressions do not appear to be working. The following shows an example of the results of adding the DisplayError parameter with an expression.
PS > Get-Date | Format-Custom DayOfWeek,{ $_ / $null } -ShowError
DayOfWeek  $_ / $null
--------- ------------
Wednesday #ERR

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
Directs the cmdlet to display all of the error information. Use with the DisplayError or ShowError parameters. By default, when an error object is written to the error or display streams, only some of the error information is displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Expand**
Formats the collection object, as well as the objects in the collection. This parameter is designed to format objects that support the ICollection (System.Collections) interface. The default value is EnumOnly.
Valid values are:
-- EnumOnly: Displays the properties of the objects in the collection.
-- CoreOnly: Displays the properties of the collection object.
-- Both: Displays the properties of the collection object and the properties of objects in the collection.
Valid Values:

* CoreOnly
* EnumOnly
* Both

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InputObject**
Specifies the objects to be formatted. Enter a variable that contains the objects or type a command or expression that gets the objects.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

#### **PersistWhenOutput**
When formatting objects that are stored in a variable, persists the format information on those objects even after it is rendered in the console. By default, format information is removed from objects when it is rendered in the console.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Sticky |

---

### Inputs
PSObject

You can pipe any object to Format-Custom.

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
Format-Custom is designed to display views that are not just tables or just lists. To display an alternate table view, use Format-Table. To display an alternate 
list view, use Format-List.

You can also refer to Format-Custom by its built-in alias, "fc". For more information, see about_Aliases.

The GroupBy parameter assumes that the objects are sorted. Before using Format-Custom to group the objects, use Sort-Object to sort them.

---

### Syntax
```PowerShell
Format-Custom [[-Property] <Object[]>] [-Depth <Int32>] [-GroupBy <Object>] [-View <String>] [-ShowError <SwitchParameter>] [-DisplayError <SwitchParameter>] 
```
```PowerShell
[-Force <SwitchParameter>] [-Expand <String>] [-InputObject <PSObject>] [-PersistWhenOutput <SwitchParameter>] [<CommonParameters>]
```

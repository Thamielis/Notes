Request-CommandInput
--------------------

### Synopsis
Generates a form to collect input for a command

---

### Description

Generates a form to collect input for a PowerShell command.  
        

Get-WebInput is designed to handle the information submitted by the user in a form created with Request-CommandInput.

---

### Related Links
* [Get-WebInput](Get-WebInput)

---

### Examples
> EXAMPLE 1

```PowerShell
Request-CommandInput -CommandMetaData (Get-Command Get-Command) -DenyParameter ArgumentList
```

---

### Parameters
#### **CommandMetaData**
The metadata of the command.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[CommandMetadata]`|true    |named   |true (ByValue)|

#### **ScriptBlock**
A script block containing a PowerShell function.  Any code outside of the Powershell function will be ignored.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |named   |false        |

#### **ParameterSet**
The name of the parameter set to request input

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AllowedParameter**
Explicitly allowed parameters (by default, all are allowed unless they are explictly denied)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DenyParameter**
Explicitly denied parameters.

|Type        |Required|Position|PipelineInput|Aliases      |
|------------|--------|--------|-------------|-------------|
|`[String[]]`|false   |named   |false        |HideParameter|

#### **ButtonText**
The text on the request button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ButtonImage**
The url to a button image button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NoButton**
If set, does not display a button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Order**
The order of items

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Method**
The web method the form will use
Valid Values:

* POST
* GET

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Margin**
The css margin property to use for the form

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Action**
The action of the form

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Platform**
The platform the created input form will work.  
This is used to created an XML based layout for any device
Valid Values:

* Web
* Android
* AndroidBackend
* CSharpBackEnd
* iOS
* WindowsMobile
* WindowsMetro
* Win8
* WPF
* GoogleGadget
* TwilML
* PipeworksDirective

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TwoColumn**
If set, uses a Two column layout

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Focus**
If provided, focuses a given parameter's input

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParameterDefaultValue**
If provided, uses the supplied values as parameter defaults

|Type         |Required|Position|PipelineInput|Aliases               |
|-------------|--------|--------|-------------|----------------------|
|`[Hashtable]`|false   |named   |false        |ParameterDefaultValues|

#### **ParameterOption**
If provided, uses the supplied values as potential options for a parameter

|Type         |Required|Position|PipelineInput|Aliases         |
|-------------|--------|--------|-------------|----------------|
|`[Hashtable]`|false   |named   |false        |ParameterOptions|

#### **Ajax**
If set, will load the inner control with ajax

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Request-CommandInput -ScriptBlock <ScriptBlock> [-ParameterSet <String>] [-AllowedParameter <String[]>] [-DenyParameter <String[]>] [-ButtonText <String>] [-ButtonImage <String>] [-NoButton] [-Order <String[]>] [-Method <String>] [-Margin <String>] [-Action <String>] [-Platform <String>] [-TwoColumn] [-Focus <String>] [-ParameterDefaultValue <Hashtable>] [-ParameterOption <Hashtable>] [-Ajax] [<CommonParameters>]
```
```PowerShell
Request-CommandInput -CommandMetaData <CommandMetadata> [-ParameterSet <String>] [-AllowedParameter <String[]>] [-DenyParameter <String[]>] [-ButtonText <String>] [-ButtonImage <String>] [-NoButton] [-Order <String[]>] [-Method <String>] [-Margin <String>] [-Action <String>] [-Platform <String>] [-TwoColumn] [-Focus <String>] [-ParameterDefaultValue <Hashtable>] [-ParameterOption <Hashtable>] [-Ajax] [<CommonParameters>]
```

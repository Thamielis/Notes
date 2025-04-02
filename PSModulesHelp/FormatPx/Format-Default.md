Format-Default
--------------

### Synopsis
Formats the output using the default format.

---

### Description

The Format-Default cmdlet formats the output of a command using the default output as defined in the ps1xml files. The object type determines the default layout.

---

### Related Links
* [Format-Custom](Format-Custom)

* [Format-List](Format-List)

* [Format-Table](Format-Table)

* [Format-Wide](Format-Wide)

* [Out-Default](Out-Default)

---

### Examples
> EXAMPLE 1

PS C:\> Get-Service | Format-Default
This command formats service using the default output. By default, they are formatted in a table with three columns. The Get-Service cmdlet gets objects representing Windows services. The pipeline operator (|) passes the objects to the Format-Default cmdlet. Format-Default formats the objects in a table, list, wide table, or custom output, depending on what their default format is.

---

### Parameters
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

You can pipe any object to Format-Default.

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes

---

### Syntax
```PowerShell
Format-Default [-InputObject <PSObject>] [-PersistWhenOutput <SwitchParameter>] [<CommonParameters>]
```

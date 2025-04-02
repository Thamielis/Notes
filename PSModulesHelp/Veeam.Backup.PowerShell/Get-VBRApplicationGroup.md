Get-VBRApplicationGroup
-----------------------

### Synopsis
Returns VMware and Hyper-V application groups.

---

### Description

This cmdlet returns VMware and Hyper-V application groups.

---

### Examples
> Example 1. Getting all Application Groups

Get-VBRApplicationGroup
Name                 Description
----                 -----------
Exchange Group       AppGroup for Exchange verification
SQL Group            AppGroup for SQL verification
File Server Group    AppGroup for File Server verification
This command returns application groups that are added to the <%VBR%> infrastructure.
The cmdlet output will contain the details about the Name and the Description of application groups.
> Example 2. Getting Application Group by Name

Get-VBRApplicationGroup -Name "Exchange Application Group"
Name                 Description
----                 -----------
Exchange Group       AppGroup for Exchange verification
This command returns the AppGroup for SQL verification application group.
The cmdlet output will contain the details about the Name and the Description of an application group.

---

### Parameters
#### **Name**
Specifies a name of an application group. The cmdlet will return the application group with the specified name.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRApplicationGroup [-Name <String[]>] [<CommonParameters>]
```

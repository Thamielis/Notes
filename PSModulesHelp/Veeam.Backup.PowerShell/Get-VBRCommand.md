Get-VBRCommand
--------------

### Synopsis
Returns Veeam PowerShell module cmdlets.

---

### Description

This cmdlet returns the list of available Veeam PowerShell cmdlets.
If you run this cmdlet without parameters, it will return the list of all Veeam cmdlets in the current session.
NOTE: This cmdlet is available only for sessions started from Veeam Backup & Replication main menu.

---

### Examples
> Example 1. Getting list of Veeam cmdlets that perform remove operations.

```PowerShell
Get-VBRCommand Remove*
This command returns the list of Veeam cmdlets that perform remove operations.
```
> Example 2. Getting Veeam Cmdlets with Specific Names

```PowerShell
Get-VBRCommand -Name *Zip*
This command returns Veeam cmdlets with names containing "Zip".
```
> Example 3. Getting Veeam Cmdlets with cmdlets with Specific Verbs

```PowerShell
Get-VBRCommand -Verb Get, Set
```
> Example 4. Getting Veeam Cmdlets with Specific Names

```PowerShell
Get-VBRCommand -Noun *Job*, *Zip*
This command returns Veeam cmdlets with nouns containing "Job" and "Zip".
```

---

### Parameters
#### **Name**
Specifies the name of the command.
Lists the commands that match the specified name or regular name patterns.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |0       |True (ByPropertyName, ByValue)|

#### **Noun**
Specifies the noun.
Lists the commands using the specified noun name.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **V100**
Defines that the cmdlet will return cmdlets added in version 10 of Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **V110**
Defines that the cmdlet will return cmdlets added in version 11 of Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **V120**
Defines that the cmdlet will return cmdlets added in version 12 of Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **V80**
Defines that the cmdlet will return cmdlets added in version 8.0 of Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **V90**
Defines that the cmdlet will return cmdlets added in version 9.0 of Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **V95**
Defines that the cmdlet will return cmdlets added in version 9.5 of Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Verb**
Specifies the command verb.
Lists the commands using the specified verb name.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

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
Get-VBRCommand [[-Name] <String[]>] [-V100] [-V110] [-V120] [-V80] [-V90] [-V95] [<CommonParameters>]
```
```PowerShell
Get-VBRCommand [-Noun <String[]>] [-V100] [-V110] [-V120] [-V80] [-V90] [-V95] [-Verb <String[]>] [<CommonParameters>]
```

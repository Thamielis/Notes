Out-File
--------

### Synopsis
Sends output to a file.

---

### Description

The Out-File cmdlet sends output to a file. You can use this cmdlet instead of the redirection operator (>) when you need to use its parameters.

---

### Related Links
* [Out-Default](Out-Default)

* [Out-Host](Out-Host)

* [Out-Null](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Out-Null)

* [Out-Printer](Out-Printer)

* [Out-String](Out-String)

* [Tee-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Tee-Object)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-Process | Out-File -FilePath C:\Test1\process.txt
This command sends a list of processes on the computer to the Process.txt file. If the file does not exist, Out-File creates it. Because the name of the FilePath parameter is optional, you can omit it and submit the equivalent command "Get-Process | Out-File C:\Test1\process.txt".
```
> EXAMPLE 2

PS C:\> Get-Process | Out-File C:\Test1\process.txt -NoClobber
This command also sends a list of processes to the Process.txt file, but it uses the NoClobber parameter, which prevents an existing file from being overwritten. The output shows the error message that appears when NoClobber is used with an existing file.

Out-File : The file 'C:\Test1\process.txt' already exists.
At line:1 char:15
+ Get-Process | Out-File C:\Test1\process.txt -NoClobber
+               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ResourceExists: (C:\Test1\process.txt:String) [Out-File], IOException
    + FullyQualifiedErrorId : NoClobber,Microsoft.PowerShell.Commands.OutFileCommand

> EXAMPLE 3

```PowerShell
PS C:\> $a = Get-Process
PS C:\> Out-File -FilePath C:\Test1\process.txt -InputObject $a -Encoding ASCII -Width 50
These commands send a list of processes on the computer to the Process.txt file. The text is encoded in ASCII format so that it can be read by search programs like Findstr and Grep. By default, Out-File uses Unicode format.

The first command gets the list of processes and stores them in the $a variable. The second command uses the Out-File cmdlet to send the list to the Process.txt file.

The command uses the InputObject parameter to specify that the input is in the $a variable. It uses the Encoding parameter to convert the output to ASCII format. It uses the Width parameter to limit each line in the file to 50 characters. Because the lines of output are truncated at 50 characters, the rightmost column in the process table is omitted.
```
> EXAMPLE 4

```PowerShell
PS C:\> Set-Location HKLM:\Software
PS C:\> Get-Acl MyCompany\MyKey | Out-File -FilePath C:\PS\Acl.txt
PS C:\> Get-Acl MyCompany\MyKey | Out-File -FilePath FileSystem::C:\PS\Acl.txt
These commands show how to use the Out-File cmdlet when you are not in a FileSystem drive.

The first command sets the current location to the HKLM:\Software registry key.

The second and third commands have the same effect. They use the Get-Acl cmdlet to get the security descriptor of the MyKey registry subkey (HKLM\Software\MyCompany\MyKey). A pipeline operator passes the result to the Out-File cmdlet, which sends it to the Acl.txt file.

Because Out-File is not supported by the Windows PowerShell Registry provider, you must specify either the file system drive name, such as "C:", or the name of the provider followed by two colons as well as the file system drive name and path, "FileSystem::C:\PS", in the value of the FilePath parameter. The second and third commands demonstrate these methods.
```

---

### Parameters
#### **FilePath**
Specifies the path to the output file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **Encoding**
Specifies the type of character encoding used in the file. Valid values are "Unicode", "UTF7", "UTF8", "UTF32", "ASCII", "BigEndianUnicode", "Default", and "OEM". "Unicode" is the default.
"Default" uses the encoding of the system's current ANSI code page.
"OEM" uses the current original equipment manufacturer code page identifier for the operating system.
Valid Values:

* unknown
* string
* unicode
* bigendianunicode
* utf8
* utf7
* utf32
* ascii
* default
* oem

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Append**
Adds the output to the end of an existing file, instead of replacing the file contents.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
Allows the cmdlet to overwrite an existing read-only file. Even using the Force parameter, the cmdlet cannot override security restrictions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoClobber**
Will not overwrite (replace the contents) of an existing file. By default, if a file exists in the specified path, Out-File overwrites the file without warning. If both Append and NoClobber are used, the output is appended to the existing file.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |NoOverwrite|

#### **Width**
Specifies the number of characters in each line of output. Any additional characters are truncated, not wrapped. If you omit this parameter, the width is determined by the characteristics of the host. The default for the Windows PowerShell console is 80 (characters).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **InputObject**
Specifies the objects to be written to the file. Enter a variable that contains the objects or type a command or expression that gets the objects.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

#### **LiteralPath**
Specifies the path to the output file. Unlike FilePath, the value of the LiteralPath parameter is used exactly as it is typed. No characters are interpreted as wildcards. If the path includes escape characters, enclose it in single quotation marks. Single quotation marks tell Windows PowerShell not to interpret any characters as escape sequences.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |true (ByPropertyName)|PSPath |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Inputs
System.Management.Automation.PSObject

You can pipe any object to Out-File.

---

### Outputs
* None

---

### Notes
The Out cmdlets do not format objects; they just render them and send them to the specified display destination. If you send an unformatted object to an Out cmdlet, 
the cmdlet sends it to a formatting cmdlet before rendering it.

The Out cmdlets do not have parameters for names or file paths. To send data to a cmdlet that contains the Out verb (an Out cmdlet), use a pipeline operator (|) to 
send the output of a Windows PowerShell command to the cmdlet. You can also store data in a variable and use the InputObject parameter to pass the data to the 
cmdlet. For help, see the examples.

Out-File sends data, but it does not emit any output objects. If you pipe the output of Out-File to Get-Member, Get-Member reports that no objects have been 
specified.

---

### Syntax
```PowerShell
Out-File [-FilePath] <String> [[-Encoding] <String>] [-Append <SwitchParameter>] [-Force <SwitchParameter>] [-NoClobber <SwitchParameter>] [-Width <Int32>] 
```
```PowerShell
[-InputObject <PSObject>] [-WhatIf <SwitchParameter>] [-Confirm <SwitchParameter>] [<CommonParameters>]
```
```PowerShell
Out-File -LiteralPath <String> [[-Encoding] <String>] [-Append <SwitchParameter>] [-Force <SwitchParameter>] [-NoClobber <SwitchParameter>] [-Width <Int32>] 
```
```PowerShell
[-InputObject <PSObject>] [-WhatIf <SwitchParameter>] [-Confirm <SwitchParameter>] [<CommonParameters>]
```

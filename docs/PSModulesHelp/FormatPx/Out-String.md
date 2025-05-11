Out-String
----------

### Synopsis
Sends objects to the host as a series of strings.

---

### Description

The Out-String cmdlet converts the objects that Windows PowerShell manages into an array of strings. By default, Out-String accumulates the strings and returns them as a single string, but you can use the stream parameter to direct Out-String to return one string at a time. This cmdlet lets you search and manipulate string output as you would in traditional shells when object manipulation is less convenient.

---

### Related Links
* [Out-Default](Out-Default)

* [Out-File](Out-File)

* [Out-Host](Out-Host)

* [Out-Null](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Out-Null)

* [Out-Printer](Out-Printer)

---

### Examples
> EXAMPLE 1

PS C:\> Get-Content C:\Test1\Testfile2.txt | Out-String
This command sends the content of the Testfile2.txt file to the console as a single string. It uses the Get-Content cmdlet to get the content of the file. The pipeline operator (|) sends the content to Out-String, which sends the content to the console as a string.
> EXAMPLE 2

PS C:\> $c = Get-Culture | Select-Object *
PS C:\> Out-String -InputObject $c -Width 100
The first command uses the Get-Culture cmdlet to get the regional settings. The pipeline operator (|) sends the result to the Select-Object cmdlet, which selects all properties (*) of the culture object that Get-Culture returned. The command then stores the results in the $c variable.

The second command uses the Out-String cmdlet to convert the CultureInfo object to a series of strings (one string for each property). It uses the InputObject parameter to pass the $c variable to Out-String. The Width parameter is set to 100 characters per line to prevent truncation.

These commands get the regional settings for the current user and convert the data to strings.
> EXAMPLE 3

```PowerShell
PS C:\> Get-Alias | Out-String -Stream | Select-String 'Get-Command'
```

---

### Parameters
#### **Stream**
Sends the strings for each object separately. By default, the strings for each object are accumulated and sent as a single string.
To use the Stream parameter, type "-Stream" or its alias, "ost".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Width**
Specifies the number of characters in each line of output. Any additional characters are truncated, not wrapped. If you omit this parameter, the width is determined by the characteristics of the host program. The default value for the Windows PowerShell console is 80 (characters).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **InputObject**
Specifies the objects to be written to a string. Enter a variable that contains the objects, or type a command or expression that gets the objects.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

---

### Inputs
System.Management.Automation.PSObject

You can pipe objects to Out-String.

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
The cmdlets that contain the Out verb (the Out cmdlets) do not format objects; they just render them and send them to the specified display destination. If you send 
an unformatted object to an Out cmdlet, the cmdlet sends it to a formatting cmdlet before rendering it.

The Out cmdlets do not have parameters that take  names or file paths. To send data to an Out cmdlet, use a pipeline operator (|) to send the output of a Windows 
PowerShell command to the cmdlet. You can also store data in a variable and use the InputObject parameter to pass the data to the cmdlet. For more information, see 
the examples.

---

### Syntax
```PowerShell
Out-String [-Stream <SwitchParameter>] [-Width <Int32>] [-InputObject <PSObject>] [<CommonParameters>]
```

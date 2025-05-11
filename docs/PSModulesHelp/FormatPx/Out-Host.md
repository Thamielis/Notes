Out-Host
--------

### Synopsis
Sends output to the Windows PowerShell host.

---

### Description

The Out-Host cmdlet sends output to the Windows PowerShell host for display. The native Windows PowerShell host displays the output at the command line. Other Windows PowerShell hosts may behave differently. Because Out-Host is the default, you do not need to specify it unless you want to use its parameters to change the display.

---

### Related Links
* [Clear-Host](Clear-Host)

* [Out-Default](Out-Default)

* [Out-File](Out-File)

* [Out-Null](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Core/Out-Null)

* [Out-Printer](Out-Printer)

* [Out-String](Out-String)

* [Write-Host](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Write-Host)

---

### Examples
> EXAMPLE 1

PS C:\> Get-Process | Out-Host -Paging
This command displays the processes on the system one page at a time. It uses the Get-Process cmdlet to get the processes on the system. The pipeline operator (|) sends the results to Out-Host, which displays them at the console. The Paging parameter displays one page of data at a time.

The same command format is used for the Help function that is built into Windows PowerShell. That function gets data from the Get-Help cmdlet and then uses the Paging parameter of Out-Host to display the data one page at a time by using this command format: Get-Help $Args[0] | Out-Host -Paging.
> EXAMPLE 2

```PowerShell
PS C:\> $a = Get-History
PS C:\> Out-Host -InputObject $a
These commands display the session history at the command line. The first command uses the Get-History cmdlet to get the session history, and then it stores the history in the $a variable. The second command uses Out-Host to display the content of the $a variable, and it uses the InputObject parameter to specify the variable to Out-Host.
```

---

### Parameters
#### **Paging**
Displays one page of output at a time, and waits for user input before displaying the remaining pages, much like the traditional "more" command. By default, all of the output is displayed on a single page. The page size is determined by the characteristics of the host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InputObject**
Specifies the objects that are written to the console. Enter a variable that contains the objects, or type a command or expression that gets the objects.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

---

### Inputs
System.Management.Automation.PSObject

You can pipe any object to Out-Host.

---

### Outputs
* None

---

### Notes
The cmdlets that contain the Out verb (the Out cmdlets) do not format objects; they just render them and send them to the specified display destination. If you send 
an unformatted object to an Out cmdlet, the cmdlet sends it to a formatting cmdlet before rendering it.

The Out cmdlets do not have parameters for names or file paths. To send data to an Out cmdlet, use a pipeline operator (|) to send the output of a Windows 
PowerShell command to the cmdlet. You can also store data in a variable and use the InputObject parameter to pass the data to the cmdlet. For help, see the examples.

Out-Host sends data, but it does not emit any output objects. If you pipe the output of Out-Host to the Get-Member cmdlet, Get-Member reports that no objects have 
been specified.

---

### Syntax
```PowerShell
Out-Host [-Paging <SwitchParameter>] [-InputObject <PSObject>] [<CommonParameters>]
```

https://www.leeholmes.com/creating-an-easy-powershell-uptime-monitor/

> Precision Computing - Software Design and Development

# Creating an Easy PowerShell Uptime Monitor
### Creating an Easy PowerShell Uptime Monitor

Tue, Aug 5, 2014 2-minute read

In a [recent post](https://www.leeholmes.com/blog/2014/04/24/arvixe-status-report/), I blogged some data based on an uptime monitor I put together when I started having problems with my (then) web hosting platform.

Here’s how it works.

The first step is a script, Test-Uri. This essentially runs the Invoke-WebRequest cmdlet and captures the important details: Time, Uri, Status Code, Status Description, Response Length (so you can detect drastic content changes or incomplete responses), and Time Taken.

```powershell
############################################################################## ## ## Test-Uri ## ## From Windows PowerShell Cookbook (O'Reilly) ## by Lee Holmes (http://www.leeholmes.com/guide) ## ############################################################################## <# .SYNOPSIS Connects to a given URI and returns status about it: URI, response code, and time taken. .EXAMPLE PS > Test-Uri bing.com Uri : bing.com StatusCode : 200 StatusDescription : OK ResponseLength : 34001 TimeTaken : 459.0009 #> param( ## The URI to test $Uri ) $request = $null $time = try { ## Request the URI, and measure how long the response took. $result = Measure-Command { $request = Invoke-WebRequest -Uri $uri } $result.TotalMilliseconds } catch { ## If the request generated an exception (i.e.: 500 server ## error or 404 not found), we can pull the status code from the ## Exception.Response property $request = $_.Exception.Response $time = -1 } $result = [PSCustomObject] @{ Time = Get-Date; Uri = $uri; StatusCode = [int] $request.StatusCode; StatusDescription = $request.StatusDescription; ResponseLength = $request.RawContentLength; TimeTaken = $time; } $result
```

The second step automates the invocation of the Test-Uri command, sending its output into a CSV. To do this, you use the Register-ScheduleJob cmdlet. Here’s an example to test your blog every hour:

```powershell
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) ` -RepetitionInterval (New-TimeSpan -Hours 1) ` -RepetitionDuration ([TimeSpan]::MaxValue) Register-ScheduledJob -Name blogMonitor -Trigger $trigger -ScriptBlock { $myDocs = [Environment]::GetFolderPath("MyDocuments") $outputPath = Join-Path $myDocs blogMonitor.csv Test-Uri https://www.leeholmes.com/blog | Export-Csv -Append $outputPath }
```

As long as your computer has internet connectivity, this is a very reliable approach. And it’s not exactly “big data” – I’ve been monitoring my blog every hour since September 1, 2012 and the CSV is only 1.3MB.

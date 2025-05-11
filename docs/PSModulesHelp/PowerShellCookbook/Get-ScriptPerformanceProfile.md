Get-ScriptPerformanceProfile
----------------------------

### Synopsis
Computes the performance characteristics of a script, based on the transcript
of it running at trace level 1.

---

### Description

To profile a script:

   1) Turn on script tracing in the window that will run the script:
      Set-PsDebug -trace 1
   2) Turn on the transcript for the window that will run the script:
      Start-Transcript
      (Note the filename that PowerShell provides as the logging destination.)
   3) Type in the script name, but don't actually start it.
   4) Open another PowerShell window, and navigate to the directory holding
      this script.  Type in '.\Get-ScriptPerformanceProfile <transcript>',
      replacing <transcript> with the path given in step 2.  Don't
      press <Enter> yet.
   5) Switch to the profiled script window, and start the script.
      Switch to the window containing this script, and press <Enter>
   6) Wait until your profiled script exits, or has run long enough to be
      representative of its work.  To be statistically accurate, your script
      should run for at least ten seconds.
   7) Switch to the window running this script, and press a key.
   8) Switch to the window holding your profiled script, and type:
      Stop-Transcript
   9) Delete the transcript.

---

### Parameters
#### **Path**
The path of the transcript log file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Notes
You can profile regions of code (ie: functions) rather than just lines
by placing the following call at the start of the region:
      Write-Debug "ENTER <region_name>"
and the following call and the end of the region:
      Write-Debug "EXIT"
This is implemented to account exclusively for the time spent in that
region, and does not include time spent in regions contained within the
region.  For example, if FunctionA calls FunctionB, and you've surrounded
each by region markers, the statistics for FunctionA will not include the
statistics for FunctionB.

---

### Syntax
```PowerShell
Get-ScriptPerformanceProfile [-Path] <Object> [<CommonParameters>]
```

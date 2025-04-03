---
created: 2022-03-04T13:35:24 (UTC +01:00)
tags: []
source: https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/
author: Dr Scripto
---

# WorkFlow that is with Windows PowerShell

> ## Excerpt
> PowerShell Workflows - An Introduction to the use of Workflows in Windows PowerShell

---
![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2018/09/dr_scripto-102x150.gif)

Dr Scripto

December 18th, 2019

Doctor Scripto returns again with our good friend [Joel Vickery, PFE](https://social.msdn.microsoft.com/profile/Joel%20Vickery,%20PFE) who is going to touch on the use of Workflows In PowerShell.

Take it away Joel!

Following up on my original post [Parallel Processing with jobs in PowerShell](https://devblogs.microsoft.com/scripting/parallel-processing-with-jobs-in-powershell/), I wanted to go into another method of running parallel processes in PowerShell, namely WorkFlows. WorkFlow is very similar to using the **_Start-Job_**/**\-asJob** functionality but it has some distinct advantages that are fully covered in many other blog postings on TechNet.  I’ll mention them quickly below, but if you want deeper detail, see the [When Windows PowerShell Met WorkFlow](https://devblogs.microsoft.com/powershell/when-windows-powershell-met-workflow/) blog posting on MSDN. Finally, I wanted to focus on how PowerShell handles the activity of Workflow from a process/thread perspective so that you can factor in the way that processing workflows works into your decision to use it over other parallel and multi-threading methods. I started this set of posts with the thought “I wonder which one of these methods is the fastest?” so I will include that information as well.

### The Great Parts[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#the-great-parts)

#### (Not) Managing the Queue[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#not-managing-the-queue)

WorkFlow takes some of the overhead of managing the jobs away.  If you have worked with PowerShell Jobs, it doesn’t take long to realize that you have a lot of work to do to manage the submission, monitoring, retrieval, and removal of the jobs.

### Unique Processing Control[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#unique-processing-control)

WorkFlow also adds some unique controls for how commands within the workflow execute:

#### Parallel[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#parallel)

Commands that are contained within a Parallel block will run concurrently, meaning that each command does not wait until it is complete before running the next command in the Parallel Block.

#### Sequence[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#sequence)

Commands within a Sequence block will execute each command and wait for the command to complete before running the next command.

#### Checkpoints[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#checkpoints)

Workflow scripts that are interrupted can be resumed even through a reboot.

### The Tough Parts[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#the-tough-parts)

#### Restrictions[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#restrictions)

All good things come at a price.  With WorkFlows, there are [restrictions](https://blogs.technet.microsoft.com/heyscriptingguy/2013/01/02/powershell-workflows-restrictions/) that you need to be aware of that take this from a simple exercise to an intermediate-level development effort.  I struggled with issues like changing parameters and scoping of variables as well as the lack of support for **_invoke-command_**.  Like any learning experience, once you get the hang of it, you’ll be cranking out WorkFlow code like second nature.

#### Debugging[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#debugging)

Debugging WorkFlows in earlier releases of PowerShell was a challenge since the PowerShell\_ISE would lose insight into the processes when they would execute in parallel. This was corrected in PowerShell v4.0, which allows full control of the code within the WorkFlow block, to include setting breakpoints.

### Example Script[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#example-script)

The script below queries AD for all computers and then, using a WorkFlow, gets the most recent 4000 event 4624 events from the security event log.  Since I am using the “**_\-parallel_**” switch on the **_foreach_** loop, querying each of the computers will happen concurrently.  I will be adding more posts beyond this one and will use the exact same basic script in the future posts, just wrapped in a different parallel processing wrapper.

```powershell
workflow Test-WF
{
    param([array[]]$ServerList)

    $ReturnArr = @()
    foreach -parallel -ThrottleLimit 10 ($Server in $ServerList) {
        $returnName = $Server
        $strCompName = $Server.Name
        $Count = InlineScript { 
            ( Get-Eventlog Security -ComputerName $Using:returnName -Newest 4000 | Where-Object { $_.EventID -eq '4624' } ).count
        }
        $Workflow:ReturnArr += "$returnName,$Count"
    }
    $ReturnArr
}

$arrComputers = (get-adcomputer -filter * -server dc1.contoso.com:3268).Name
Get-date
$Stats = Measure-Command -Expression {$OutTest = Test-WF -ServerList $arrComputers}
Get-date
$outTest
$Stats
```

### Process Analysis[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#process-analysis)

I have to admit that I made a mistake here, but it turned out to be a good thing since it pointed out an efficiency and performance issue that you can encounter depending how you implement your script.  My initial script had an **_InlineScript_** Activity on the line of code that queries the event log and that turned out to be an important factor in how efficient and fast this script is. To get a good idea of what is happening behind the scenes, I’m using ProcMon from the Sysinternals Suite to record the process tree that results from the WorkFlow.  In my small test lab environment, I have 8 domain controllers and a general tools server, so 9 machines that are returned from the query against AD and then will each be contacted to parse the event logs. In the screen capture above, you will notice that the initial script was started in the PowerShell\_ISE, which then created several additional PowerShell.exe processes, each with their own Process ID.

In the screen capture below from ProcMon, you can see the PowerShell\_ISE.exe creating the final Processes and worker threads to go forth and get the information that we have requested.  It’s becoming very clear through this capture that WorkFlows, much like **_Start-Jobs_**/-**_asJob_** are “multi-process”, not truly multi-threaded.

It turns out that this is due to the fact that I used the **_InlineScript_** activity, which run in their own process.  Just something to keep in mind if resources are an issue and you cannot afford the overhead of multiple PowerShell.exe processes running.

Finally, in the screen capture below, the newly created processes are querying the security event logs in parallel. To be thorough, I went back and modified the script without the use of the **_InlineScript_** activity, instead using the direct **_Get-EventLog_** call against the remote servers.  I changed the line: 
```powershell
    $Count = InlineScript { 
        ( Get-Eventlog Security -ComputerName $Using:returnName -Newest 4000 | Where-Object { $_.EventID -eq '4624' } ).count
    }
```
to: 
```powershell
    $Count = ( 
        Get-Eventlog Security -ComputerName $Using:returnName -Newest 4000 | Where-Object { $_.EventID -eq '4624' } 
    ).count
```

Now I am seeing the single PowerShell.exe with multiple threads that I was expecting.

### Performance[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#performance)

To give a quick frame of reference, I ran a regular sequential **_ForEach_** loop against all of these same domain controllers and the sequential PowerShell loop took 1 minute and 23 seconds to complete the retrieval of events from the DCs. In the output below, you can see that WorkFlow with **_InlineScript_** beats that time by a considerable margin at 39 seconds.

Performance took a hit with the **InlineScript** activity removes when compared to the multi-process, dropping to 1 minute and 17 seconds.  It was still faster than the sequential loop but not by a lot.

### Conclusion[](https://devblogs.microsoft.com/scripting/just-go-with-the-flow-workflow-that-is-with-windows-powershell/#conclusion)

As you start using these parallel capabilities in PowerShell, it’s important to think about the correct use case for the particular parallel processing capability.  For WorkFlows using the **InlineScript** activity, you have to make sure that you have the resources to handle having multiple full PowerShell.exe environments running, including memory and CPU utilization.  Without **_InlineScript_**, resource consumption is less of an issue and the script will run in a true multithreading mode.   I tend to use Workflows when I have a decent amount of time to create a workable script, and I need the performance increase, and I know I’ll be collecting dividends on the time spent when compared to a simple sequential loop.

So that is all there is to with our quick introduction to PowerShell workflows!  Pop by next week as we look into PowerShell Workflows a little bit deeper with Joel !

I invite you to follow me on Twitter and Facebook. If you have any questions, send email to me at scripter@microsoft.com, or post your questions on the Official Scripting Forum. See you tomorrow. Until then, Keep on Scripting!

**Your good friend, Doctor Scripto**

PowerShell, Doctor Scripto, Joel Vickery, Workflows

![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2018/09/dr_scripto-102x150.gif)

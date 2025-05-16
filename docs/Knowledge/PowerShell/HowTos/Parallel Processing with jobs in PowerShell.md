---
created: 2022-03-04T13:47:07 (UTC +01:00)
tags: []
source: https://devblogs.microsoft.com/scripting/parallel-processing-with-jobs-in-powershell/
author: Dr Scripto
---

# Parallel Processing with jobs in PowerShell - Scripting Blog

> ## Excerpt
> PowerShell Jobs - Joel Vickery gives us an Introduction to basic use of PowerShell jobs

---
![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2018/09/dr_scripto-102x150.gif)

Dr Scripto

December 11th, 2019

Hello everyone!  Doctor Scripto is elated to present some more great content from [Joel Vickery, PFE](https://social.msdn.microsoft.com/profile/Joel%20Vickery,%20PFE) , today he discusses using jobs in PowerShell.   Stay tuned in the upcoming weeks for some amazing regular content.   Take it away Joel!

I have to be honest, back in 2010 I was firmly entrenched in VBScript and had no interest in learning anything new.  Then fate threw me a curve ball when I was presented with a task to fix over 9,000 workstations that had lost their “parent” antivirus server.  Each machine needed to have the exact same set of commands executed on it, a new file copied and service restarted, to fix them so I created a quick  VBScript to connect to each machine and perform the fix actions. The only bad part about this script was that it took days to run against the machines, processing each one sequentially in a For loop before moving on to the next. I did some research on multi-threading with VBScript and kept getting results that referred to PowerShell “jobs”, which gave me the motivation to start learning PowerShell.

For those of you who come from a Unix or Linux background, jobs will be a familiar concept since you can background any command by placing an “**_&_**” at the end of the command.  PowerShell Cmdlets sometimes include the “**_\-AsJob_**” parameter that will allow the command to submitted in the background, releasing the console to be used for other commands. Alternatively, you can use the **_Start-Job_** CmdLet to run commands as Jobs. This also means that you can submit multiple jobs in the background and continue processing without waiting for each job to complete.  Keep in mind that there are limits to everything so keep your machine’s resource consumption in mind as you test this concept out.  Submitting a large number of background commands could be resource intensive.

Below are two different ways to do a WMI Query as a job:

```powershell
Get-WMIObject Win32_OperatingSystem -AsJob
```

Or

```powershell
Start-Job {Get-WMIObject Win32_OperatingSystem}
```

These jobs do all of their processing in the background and store the output until you receive them.  You can check on the status of a job by running **_Get-Job_**, the status is in the “State” column, which will show if the command is Running, Completed, or Failed.  Also notice the **_HasMoreData_** column.  This indicates that there is output to be retrieved from the job.  In the example output below, notice that the job is still running.

[![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2019/12/jvicker1-runspace-scaled.png)](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2019/12/jvicker1-runspace-scaled.png)

After the job has been kicked off, you can check on the status of the job by running the **Get-Job** command, noting the **_State_** and **_HasMoreData_** values. The **_State_** will change to **_Completed_** when the job has finished and the  **_HasMoreData_** value will indicate if there is output.

```powershell
Get-Job
```

**[![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2019/12/jvicker2-runspace-scaled.png)](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2019/12/jvicker2-runspace-scaled.png)**

Once the job has completed, you can use the **_Receive-Job_** cmdLet to get the data from the command.

```powershell
Receive-Job -Id 3       # NOTE, you could also do -Name Job3 here, either will work
```

The output of the command is now delivered to the console:

**[![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2019/12/jvicker3-runspace.png)](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2019/12/jvicker3-runspace.png)**

Note that the **_HasMoreData_** value has now changed to **_False_** after running the **_Receive-Job_** command:

**[![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2019/12/jvicker4-runspace-scaled.png)](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2019/12/jvicker4-runspace-scaled.png)**

The important thing to remember here is that you have one chance to get the information from the job so make sure that you capture it in a variable if the output needs to be evaluated.

```powershell
$JobOutput = Receive-Job -Id 1
```

Once you are done getting the job’s output, the job will basically hang out there until you remove it by running the **_Remove-Job_** Cmdlet.

```powershell
Remove-Job -Id 1
```

As you can tell, there are a lot of moving parts to this.

The PowerShell script that I created to address the antivirus client remediation task had to have a mechanism to control how many jobs I could submit at a time, as well as constant monitoring of the queue to receive input from the completed jobs, remove them, and refill the queue with new jobs.

To top it off, once I finished processing the queue of items, I had to write some code to wait for the last batch of jobs was completed to make sure that I received the output from all of them.

That is a lot of overhead. Fast forward to today and we have PowerShell WorkFlows that make this process much easier to manage which I’ll cover in another post.

So that is all there is to with basic PowerShell jobs!  Pop by next week as we look into some introductory work with PowerShell Workflows!

I invite you to follow me on Twitter and Facebook. If you have any questions, send email to me at scripter@microsoft.com, or post your questions on the Official Scripting Forum. See you tomorrow. Until then, Keep on Scripting!

**Your good friend, Doctor Scripto**

PowerShell, Doctor Scripto, Joel Vickery, Jobs

![](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2018/09/dr_scripto-102x150.gif)

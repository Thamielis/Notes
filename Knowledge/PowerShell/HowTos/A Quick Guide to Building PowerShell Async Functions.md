# A Quick Guide to Building PowerShell Async Functions

Table of Contents

-   [Build the Code as Normal][9]
-   [Build the Function Parameters][10]
-   [Implement PowerShell Async Job Support][11]
-   [Provide Support for Synchronous Operation][12]

The most frequent kind of PowerShell function is a function that executes code and, when finished, returns control back to the console. This is called synchronous code or a PowerShell async function. This means further code execution will not continue until that function’s execution is complete.

There are those times when the code inside of your function may take a while, and you don’t feel like waiting around until it’s done. In this case, you need to build functions that immediately return control but continue running a thread in the background.

I use asynchronous functions to clean up Azure VMs, for example. The process takes up to 5 minutes because it must bring down the VM, remove the VM and clean up all of the attached disks. It’s much easier to simply have my custom function return a background job object and monitor that when I have time.

PowerShell async functions can be written in a few different ways; [workflows][17], parallel runspaces, and [jobs][18] to name a few. Each has its advantages and disadvantages. However, I typically use jobs to run asynchronous code. I do this because they’re typically easy to manage and are intuitive to me.

Let’s say I have a need for a function that removes an Azure virtual machine. Within this function, I need to remove the VM, which takes a few minutes and does some other cleanup tasks.

I want to build a function that allows me to return a background job object but also give the user the option to wait for the function if they need to.

Always give the option to wait just in case there might be a time when you develop a script that might require that functionality.

## Build the Code as Normal

To remove a VM in Azure is simple with the Azure PowerShell cmdlet `Remove-AzVM` which requires a few parameters; `Name` and `ResourceGroupName`.

This would remove an Azure VM of mine: `Remove-AzVM -Name MYVM -ResourceGroupName MYRG`.

Related:[How to Delete an Azure VM and Cleanup with PowerShell][23]

Done. I now have the “typical” code to remove an Azure VM.

## Build the Function Parameters

To build a function around this to run in the background, I’ll need to build it to support the parameters that `Remove-AzVm` needs so `Name` and `ResourceGroupName`.

```powershell
function Remove-MyAzureRmVM {
    param (
        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [string]$ResourceGroupName
    )
    Remove-AzureRmVm -Name $Name -ResourceGroupName $ResourceGroupName
}
```

I now have a simple proxy function that passes two parameters to the `Remove-AzVm` cmdlet. This works, but it’s not much good because it’s running synchronously. We need to make it into a PowerShell async function and implement PowerShell job support but also give the user the option to run it synchronously if they want.

## Implement PowerShell Async Job Support

To do this, we’ll need to put our code into a scriptblock. This allows us to not only pass it to `Start-Job` but also just to execute it if the user wants to wait for the operation to complete. Since `Remove-AzVm` requires some parameters from the function, we must also add these parameters to the scriptblock as well.

```powershell
$scriptBlock = {
    param ($Name,$ResourceGroupName)
    Remove-AzureRmVm -Name $Name -ResourceGroupName $ResourceGroupName
    ## Other stuff here
}
```

Once the code is in the scriptblock, you can then simply pass it to `Start-Job`, and you’re off to the races! Just be sure to pass in the arguments as necessary.

```powershell
Start-Job -ScriptBlock $scriptBlock -ArgumentList @($VMName,$ResourceGroupName)
```

## Provide Support for Synchronous Operation

Since the code is in a scriptblock, we can now also execute this on its own by using the ampersand and passing in the parameters again.

```powershell
& $scriptBlock -VMName $VMName -ResourceGroupName $ResourceGroupName
```

So we’ve now got both ways to execute the code. All we need to do now is provide a way for the function to specify which one we want.

By default, I want the code to be executed in a background job, but I want the option to execute it synchronously if need be. A great way to implement this functionality is to use the `Wait` parameter as a switch type. This allows me to quickly “turn on” synchronous behavior if I need to.

```powershell
Remove-MyAzVM -VMName MYVM -ResourceGroupName MYRG -Wait
```

[1]: https://adamtheautomator.com/tag/powershell/
[2]: https://adamtheautomator.com/author/adam-bertram/
[3]: https://adamtheautomator.com/author/adam-bertram/
[4]: https://adamtheautomator.com/author/adam-bertram/
[5]: https://adamtheautomator.com
[6]: https://twitter.com/adbertram
[7]: https://www.manageengine.com/products/active-directory-audit/sem/tp/active-directory-auditing.html?utm_source=ata&utm_medium=tpap&utm_campaign=ADAP_text
[8]: https://www.manageengine.com/products/active-directory-audit/sem/tp/active-directory-auditing.html?utm_source=ata&utm_medium=tpap&utm_campaign=ADAP_text
[9]: https://adamtheautomator.com/powershell-async//#Build_the_Code_as_Normal "Build the Code as Normal"
[10]: https://adamtheautomator.com/powershell-async//#Build_the_Function_Parameters "Build the Function Parameters"
[11]: https://adamtheautomator.com/powershell-async//#Implement_PowerShell_Async_Job_Support "Implement PowerShell Async Job Support"
[12]: https://adamtheautomator.com/powershell-async//#Provide_Support_for_Synchronous_Operation "Provide Support for Synchronous Operation"
[13]: https://twitter.com/intent/tweet?text=A%20Quick%20Guide%20to%20Building%20PowerShell%20Async%20Functions&url=https%3A%2F%2Fadamtheautomator.com%2Fpowershell-async%2F%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3Datawebsite&via=adbertram
[14]: https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fadamtheautomator.com%2Fpowershell-async%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3Datawebsite
[15]: https://www.linkedin.com/shareArticle?title=A%20Quick%20Guide%20to%20Building%20PowerShell%20Async%20Functions&url=https%3A%2F%2Fadamtheautomator.com%2Fpowershell-async%2F%3Futm_source%3Dlinkedin%26utm_medium%3Dsocial%26utm_campaign%3Datawebsite&mini=true
[16]: https://adamtheautomator.com/powershell-multithreading/
[17]: https://docs.microsoft.com/en-us/system-center/sma/overview-powershell-workflows
[18]: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_jobs
[23]: https://adamtheautomator.com/azure-vm-delete/
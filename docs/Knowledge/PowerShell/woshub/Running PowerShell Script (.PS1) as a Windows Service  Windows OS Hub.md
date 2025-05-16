Any PowerShell script can be transformed to a real Windows service that runs in the background and starts automatically during your server boot_._ You can create a Windows service using `srvany.exe` or `instsrv.exe` tools (from Windows Server Resource 2003 Kit) which allow you to run the `powershell.exe` process with a parameter that contains the path to your PS1 script file.

The main disadvantage of creating a service using this method is that srvany.exe does not control a PowerShell script execution state, and if the app crashes (hangs up), the service does not see it and goes on working. To create a Windows service from a file that contains a PowerShell script, in this article we will use the **NSSM** (Non-Sucking Service Manager) toolkit, which does not demonstrate the above mentioned disadvantages.

You can download and install NSSM manually or using Chocolatey. Firstly, install Choco itself:

``Set-ExecutionPolicy Bypass -Scope Process -Force; `   iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))``

Then install the NSSM package:

`choco install nssm`

In this example, we will track the changes in a specific Active Directory group in real time and inform a security administrator using a [pop-up notification](https://woshub.com/popup-notification-powershell/) and e-mail (the script is given in [this article](https://woshub.com/notify-admin-user-added-to-ad-group/)) .

So, we have a PowerShell code that needs to be saved as a PS1 file. Let’s add an infinite loop that performs a check every minute:

`while($true) {   #Your PS code   Start-Sleep –Seconds 60   }`

Of course, to implement such a scenario you can [create a separate task](https://woshub.com/how-to-create-scheduled-task-using-powershell/) in the Task Scheduler. But if you have to respond to changes in real time, the separate service method is better.

You can create a service from a PowerShell script using NSSM directly from PowerShell:

`$NSSMPath = (Get-Command "C:\ps\nssm\win64\nssm.exe").Source   $NewServiceName = “CheckADGroup”   $PoShPath= (Get-Command powershell).Source   $PoShScriptPath = “C:\ps\CheckADGroup\checkad.ps1”   $args = '-ExecutionPolicy Bypass -NoProfile -File "{0}"' -f $PoShScriptPath   & $NSSMPath install $NewServiceName $PoShPath $args   & $NSSMPath status $NewServiceName`

[Start your new service](https://woshub.com/manage-windows-services-powershell/):

`Start-Service $NewServiceName`

Check the service status in PowerShell:

`Get-Service $NewServiceName`

![[images/running-powershell-script-as-a-windows-service.png.webp]]

So you have created and started your new Windows service. Make sure that it has appeared in the services management console (services.msc).

CheckADGroup has appeared, it is configured to start automatically and is currently running. As you can see, your PowerShell script is running inside the nssm.exe process.

![[images/windows-service-from-a-powershell-script-using-nnm.png.webp]]

Please note that the service is running under the System account. If you use other modules in your PowerShell scripts (in my case, [Get-ADGroupMember](https://woshub.com/active-directory-group-management-using-powershell/) from Active Directory for Windows PowerShell is used to get the list of members in the domain security group), this account must have access to the PS module files and AD connection permissions (in my case). You can also start this service under another domain account (or a [gMSA](https://woshub.com/group-managed-service-accounts-in-windows-server-2012/) account) and [allow users to stop/restart the service](https://woshub.com/set-permissions-on-windows-service/) if they do not have local admin rights.

In order the service can show notifications in a user session enable the **Allow service to interact with desktop** option on the **Log on** tab.

To make it work in Windows 10 and Windows Server 2012 R2/2016, change the DWORD **NoInteractiveServices** parameter value in the registry key HKEY\_LOCAL\_MACHINE\\System\\CurrentControlSet\\Control\\Windows to **0** and run the **Interactive Services Detection Service**:

`Start-Service -Name ui0detect`

However, Interactive Services Detection Service has been completely removed from Windows 10 build 1803, and you won’t be able to switch to Session 0. So you won’t see the notification windows displayed under System account.

You can change the service description using this command:

`& $NSSMPath set $NewServiceName description “Monitoring of AD group changes”`

To remove the service you have created, use the `sc delete` command or:

`nssm remove CheckADGroup`

![[images/nssm-remove-powershell-service.png.webp]]
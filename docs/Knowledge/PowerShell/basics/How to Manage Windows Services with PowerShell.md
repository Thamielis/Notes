---
created: 2022-03-10T13:17:02 (UTC +01:00)
tags: []
source: https://adamtheautomator.com/powershell-start-service/
author: 
---

# How to Manage Windows Services with PowerShell

> ## Excerpt
> Need to know how to use PowerShell to restart a service? Maybe how to get service status? Find this and more in this informative tutorial.

---
Windows services is one of those topics nearly every Windows sysadmin has to work with. To manage Windows services you could fire up the _services.msc_ MMC snap-in for one-off tasks but what if you need to build some kind of automation with PowerShell? Learn how to use PowerShell to get a service, use PowerShell to start a service, use PowerShell to stop a service, and use PowerShell to restart a service in this tutorial!

It’s time to learn how to manage services with PowerShell.

In this tutorial, you’re going to learn all about the `*-Service` PowerShell cmdlets, how to use them and also build your own script to manage services on many computers at once.

-   [Prerequisites](https://adamtheautomator.com/powershell-start-service/#Prerequisites "Prerequisites")
-   [Using PowerShell to List Services with Get-Service](https://adamtheautomator.com/powershell-start-service/#Using_PowerShell_to_List_Services_with_Get-Service "Using PowerShell to List Services with Get-Service")
-   [Finding Remote Services](https://adamtheautomator.com/powershell-start-service/#Finding_Remote_Services "Finding Remote Services")
    -   [Get-Service and PowerShell Remoting](https://adamtheautomator.com/powershell-start-service/#Get-Service_and_PowerShell_Remoting "Get-Service and PowerShell Remoting")
-   [Finding Services with CIM/WMI](https://adamtheautomator.com/powershell-start-service/#Finding_Services_with_CIMWMI "Finding Services with CIM/WMI")
-   [Starting and Stopping Services](https://adamtheautomator.com/powershell-start-service/#Starting_and_Stopping_Services "Starting and Stopping Services")
    -   [Using PowerShell Start-Service and Stop-Service](https://adamtheautomator.com/powershell-start-service/#Using_PowerShell_Start-Service_and_Stop-Service "Using PowerShell Start-Service and Stop-Service")
    -   [Using PowerShell and CIM to Start/Stop Services](https://adamtheautomator.com/powershell-start-service/#Using_PowerShell_and_CIM_to_StartStop_Services "Using PowerShell and CIM to Start/Stop Services")
        -   [Starting/Stopping Remote Services with PowerShell](https://adamtheautomator.com/powershell-start-service/#StartingStopping_Remote_Services_with_PowerShell "Starting/Stopping Remote Services with PowerShell")
-   [Using PowerShell to Restart a Service](https://adamtheautomator.com/powershell-start-service/#Using_PowerShell_to_Restart_a_Service "Using PowerShell to Restart a Service")
    -   [Using Start and Stop-Service](https://adamtheautomator.com/powershell-start-service/#Using_Start_and_Stop-Service "Using Start and Stop-Service")
    -   [Using the PowerShell Restart-Service cmdlet](https://adamtheautomator.com/powershell-start-service/#Using_the_PowerShell_Restart-Service_cmdlet "Using the PowerShell Restart-Service cmdlet")
-   [Changing the Startup Type](https://adamtheautomator.com/powershell-start-service/#Changing_the_Startup_Type "Changing the Startup Type")
    -   -   [Using the Registry](https://adamtheautomator.com/powershell-start-service/#Using_the_Registry "Using the Registry")
-   [Next Steps](https://adamtheautomator.com/powershell-start-service/#Next_Steps "Next Steps")
-   [Further Reading](https://adamtheautomator.com/powershell-start-service/#Further_Reading "Further Reading")

## Prerequisites

This article is going to be a walkthrough for you to hands-on learning about how PowerShell can read and manipulate Windows services. If you’d like to follow along, please be sure you have the following prerequisites in place before starting this article.

1.  At least one Windows computer. It’ll help if you have more than one to learn how to manage multiple computers at once.
2.  [PowerShell 7](https://adamtheautomator.com/powershell-7-upgrade/) – Even though most of the concepts are the same as Windows PowerShell, you’re going to stick with the most recent version of PowerShell
3.  [PowerShell Remoting](https://adamtheautomator.com/psremoting/ "PowerShell Remoting") enabled on any remote computer you’d like to query.

## Using PowerShell to List Services with `Get-Service`

One of the most basic tasks you can accomplish with PowerShell and Windows services is simply enumerating what services exist on a local computer. For example, open up PowerShell and run `Get-Service` and observe the output.

Notice in the below screenshot running `Get-Service` by itself will list all services on the local computer and the `Status`, the `Name` and `DisplayName` of each service.

![Using Get-Service to find Windows services](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-50-1024x332.png)

Using Get-Service to find Windows services

Like many other cmdlets, PowerShell though doesn’t return _all_ of the properties for each service. If, for example, you’d like to see a service’s required services or perhaps the service description, you can find these properties by piping the output to `Select-Object` using `*` to represent all properties as shown in the following screenshot.

![Inspecting all properties for service objects](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-51-1024x642.png)

Inspecting all properties for service objects

## Finding Remote Services

Maybe you’re on a network and need to enumerate services across one or more remote Windows computers. In the Windows PowerShell days, this could have been done by using the `ComputerName` parameter but unfortunately that parameter doesn’t exist anymore.

With PowerShell Core though, finding remote services is still possible using two different methods; PowerShell Remoting CIM/WMI.

### `Get-Service` and PowerShell Remoting

One way to inspect Windows services remotely is by using PowerShell Remoting (PS Remoting). By using PS Remoting, you can encapsulate any local command and invoke it in a remote session just as you were doing it locally.

Assuming you have PowerShell Remoting enabled on a remote computer, you could, for example, use `Invoke-Command` to run `Get-Service` on a remote computer like below.

> _Note that you don’t need the `Credential` parameter in an Active Directory (AD) environment._

```
$cred = Get-Credential
Invoke-Command -ComputerName SRV1 -ScriptBlock { Get-Service } -Credential $
```

Once executed, `Invoke-Command` passes on all of the information that `Get-Service` returned and services would be returned to you as expected.

![Invoke Command](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-52-1024x143.png)

Invoke Command

Notice the extra `PSComputerName` property. This property is returned by `Invoke-Command`. You can also create a simple script to enumerate services across many remote computers too.

```
$cred = Get-Credential
 $computers = Get-Content -Path 'C:\computers.txt'
 foreach ($name in $computers) {
     $services = Invoke-Command -ComputerName $name -Credential $cred -ScriptBlock {Get-Service}
     [pscustomobject]@{
         ComputerName = $name
         Services = $services
     }
 }
```

## Finding Services with CIM/WMI

In some situations, using PowerShell and `Get-Service` may not be suitable. Instead, you can query CIM/WMI via a CIM session. If using a CIM session, you don’t have to use PowerShell Remoting.

To find manage services via CIM, you can:

1.  Create a PSCredential object. In the below example, the two computers are not in an AD environment so we’re required to use the `Credential` parameter.
2.  Create a CIM session providing the name of the computer and the credential to authenticate with.
3.  Use `Get-CimInstance` to make a query to the _Win32\_Service_ class.

```
$serverName = 'SRV1'
$cred = Get-Credential
$cimSession = New-CimSession -ComputerName $serverName -Credential $cred
Get-CimInstance -CimSession $cimSession -ClassName Win32_Service

## Don't forget to remove the CIM session when you're done
Remove-CimSession -CimSession $cimSession
```

You’ll see below that much of the same information is returned but is formatted a bit differently.

![CIM Session](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-53-1024x219.png)

CIM Session

## Starting and Stopping Services

You can also start and stop services with PowerShell. There are a couple of ways to make this happen.

### Using PowerShell `Start-Service` and `Stop-Service`

First, you can use the `Start-Service` and `Stop-Service` cmdlets. These cmdlets do exactly what you’d expect. To use them, you can either use the pipeline or use the `Name` parameter as shown below.

```
## Stop a service with the Name parameter
$serviceName = 'wuauserv'
Stop-Service -Name $serviceName

## Stop a service with the pipeline
Get-Service $wuauserv | Stop-Service
```

> _All of the `*-Service` cmdlets allow you to tab-complete service name values with the `Name` and `DisplayName` parameters. Just type `-Name` followed by a space and begin hitting the Tab key. You’ll see that it cycles through all of the services on the local computer._

The same concept applies to starting as service too.

```
## Stop a service with the Name parameter
$serviceName = 'wuauserv'
Start-Service -Name $serviceName

## Stop a service with the pipeline
Get-Service $wuauserv | Start-Service
```

> _Both the `Stop-Service` and `Start-Service` cmdlets are idempotent meaning if a service is either stopped or started and you attempt to stop or start the service when they are already in that state, the cmdlets will simply skip over the service._

To start and stop remote services with PowerShell, again, you’ll need to wrap these commands in a scriptblock and use PowerShell Remoting to invoke them remotely as shown below.

```
$cred = Get-Credential
$serviceName = 'wuauserv'
Invoke-Command -ComputerName SRV1 -ScriptBlock { Start-Service -Name $using:serviceName } -Credential $cred
```

> _Learn about the `$using` construct and how to pass local variables to remote scriptblocks in [this Invoke-Command post](https://adamtheautomator.com/invoke-command/)._

### Using PowerShell and CIM to Start/Stop Services

As with `Get-Service`, you can also use CIM to start and stop services. Although, you can’t directly use a cmdlet like `Stop-Service` and `Start-Service`. Instead, you have to invoke a method. Although a bit less intuitive, if you’re already managing some things with CIM, it might make sense to just manage service that way too.

If you’re working with local services, use `Get-CimInstance` again. This time though, you must limit the services down to only the services you’d like to stop or start using the `Filter` parameter. The `Filter` parameter (along with the `Query` parameter) is a great way to limit the results.

The below example is:

-   Querying the local computer’s CIM store’s _Win32\_Service_ class for all services that have a startup type set to automatic (`StartMode='Auto'`)
-   Querying the local computer’s CIM store’s _Win32\_Service_ class for all services that also are stopped (`State='Stopped'`)
-   Passing all of those objects to `Invoke-CimMethod` which then calls the `StartService` method on each of them.

```
Get-CimInstance -ClassName Win32_Service  -Filter "StartMode='Auto' And State='Stopped'" | Invoke-CimMethod -MethodName StartService
```

The same code above can also stop services too using the `StopService` method and perhaps changing the `State` in the query to `Started`.

> _The `Filter` parameter accept a language known as WQL. You can learn more about WQL in [PowerShell’s about\_WQL help topic](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_wql?view=powershell-5.1)._

#### Starting/Stopping Remote Services with PowerShell

So you know how to start and stop services locally, you can also extend that to remote computers too using similar code used to enumerate services.

> _Note that you can always use PowerShell Remoting to wrap any code in a scriptblock and execute it remotely. This tutorial will assume from here on out you are aware of this potential and will not cover this option for all scenarios._

To start and stop services remotely, you can use a CIM session again. You could either reuse the CIM session you created above or if you removed it, create another one as shown below.

```
$serverName = 'SRV1'
$cred = Get-Credential
$cimSession = New-CimSession -ComputerName $serverName -Credential $cred
```

Once you have created a CIM session, use the `Invoke-CimMethod` cmdlet and don’t forget to remove that CIM session when you’re done.

```
Get-CimInstance -CimSession $cimSession -ClassName Win32_Service  -Filter "StartMode='Auto' And State='Stopped'" | Invoke-CimMethod -MethodName StartService
Remove-CimSession -CimSession $cimSession
```

> _You don’t have to use a CIM session to manage remote Windows services. If both the local and remote computer are a member of an AD domain, you could use_ [Get-CimInstance and the ComputerName parameter.](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/get-ciminstance?view=powershell-7) _However, if you must pass a credential to the remote computer, you must use a CIM session._
> 
> _A CIM session also is a bit more efficient if you need to execute multiple CIM methods or perform CIM queries on the remote computer because it re-uses the same session instead of having to create a new one for each task._

## Using PowerShell to Restart a Service

Maybe you want to restart a service that’s already started. That’s not a problem with PowerShell. Again, you’ve got two ways.

### Using `Start` and `Stop-Service`

If you’d like to restart a started service, you _could_ just stop and start the service with the `Stop-Service` and `Start-Service` cmdlets a few different ways as shown below.

```
## Restart a service with the Name parameter
$serviceName = 'wuauserv'
Stop-Service -Name $serviceName
Start-Service -Name $serviceName

## Restart a service with the pipeline and PassThru parameter
$serviceName = 'wuauserv'
Stop-Service -Name $serviceName -Passthru | Start-Service
```

> _If you need to pass the service object that `Stop-Service` or `Start-Service` just ran on and you’d like to perform some other kind of action on that service via the pipeline, you can use the `PassThru` parameter. The `PassThru` parameter simply tells the cmdlet to return the object to the pipeline which then allows you to pipe that object to other cmdlets._

### Using the PowerShell `Restart-Service` cmdlet

To limit the code to restart a service with PowerShell, you’d be better off using the `Restart-Service` cmdlet. This cmdlet does exactly what you think and operates similarly to the othe service cmdlets.

For example, if you’d like to start the _wuauserv_ as shown in the example above, you could save some code by just piping the output of `Get-Service` directly to `Restart-Service` as shown below.

```
## Restart a service with the Name parameter
$serviceName = 'wuauserv'
Get-Service -Name $serviceName | Restart-Service
```

## Changing the Startup Type

Another popular task when managing services is changing the [startup type](https://en.wikipedia.org/wiki/Windows_service). The startup type is the attribute that dictates what the services do when Windows boots up. You have a few options.

-   Automatic (The service automatically starts when Windows does)
-   Disabled (The service will never start)
-   Manual (The service is available to start but must be done manually)
-   Automate – Delayed (The service starts automatically but is delayed once Windows boots)

Let’s say you first just need to know what a service’s startup type is. You can find this with `Get-Service` or CIM.

If you’re using `Get-Service` to find the startup type, you’ll find that `Get-Service` calls it _Status_ and is represented as the `Status` property.

```
(Get-Service -Name wuauserv).StartupType
Automatic
```

You can quickly get a glimpse on all of the services’ startuptype values by using `[Group-Object](https://adamtheautomator.com/powershell-group-object/ "Group-Object")` as you can see below. This screenshot shows all of the possible values (in the `Name` column) that a service’s startup type can be.

![Group-Object Command](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-54-1024x194.png)

Group-Object Command

Once you know the current startup type, you can then change it using `Set-Service`.

The below example is setting the startup type to `Disabled`.

```
Set-Service -Name <some service name> -StartupType Disabled
```

> _Like the `Name` and `DisplayName` parameters, the `StartupType` parameter allows you to tab-complete all of the available startup types to set a service too._

#### Using the Registry

You can also set the service startup type via the registry via PowerShell. All Windows services are stored in the _HKLM\\System\\CurrentControlSet\\Services_ registry key. Each service child key has a REG\_DWORD value called `Start` that represents the startup type (excluding delayed start).

To set the startup type for a service in the registry via PowerShell, use the `Set-ItemProperty` cmdlet. The below snippet is changing the startup type of the _wuauserv_ service to automatic.

```
$serviceName = 'wuauserv'
 Set-ItemProperty "HKLM:\System\CurrentControlSet\Services\$serviceName" -Name "Start" -Value 2 -Type DWORD
```

You will need a map to define each REG\_DWORD value to the startup type you expect. Below you’ll find a handy table.

<table><tbody><tr><td data-align="center">REG_DWORD Value</td><td>Startup Type</td></tr><tr><td data-align="center">0</td><td>Loaded (but not started) by the boot loader. Then started during kernel initialization.</td></tr><tr><td data-align="center">1</td><td>Started during kernel initialization after services whose start parameter is 0.</td></tr><tr><td data-align="center">2</td><td>Automatically. Started by smss.exe (session manager) or services.exe (services controller).</td></tr><tr><td data-align="center">3</td><td>Manually. Started by the Service Control Manager (SCM).</td></tr><tr><td data-align="center">4</td><td>Disabled</td></tr><tr><td data-align="center">5</td><td>Delayed start</td></tr></tbody></table>

REG\_DWORD Map

> __You may also set the startup type to delayed start by setting the DelayedAutoStart registry value to 1 via Set-ItemProperty -Path “HKLM:\\System\\CurrentControlSet\\Services\\<service name>” -Name “DelayedAutostart” -Value 1 -Type DWORD.__

## Next Steps

By now you should know the basics of restarting service with PowerShell along with managing them. If you’d like to learn more about managing services with PowerShell, be sure to check out PowerShell’s help content with `[Get-Help](https://adamtheautomator.com/powershell-get-help/) <cmdlet name>`.

There are a lot of parameters not covered in this article so don’t fret if you didn’t see your particular use case here. Always refer to the help content and verify a parameter isn’t already there for you.

## Further Reading

_Provide the reader with at least two external links to other sites where the reader could find more information._

-   [Set Service Logon Account with PowerShell](https://adamtheautomator.com/powershell-service-logon-account/)
-   [Back to Basics: The PowerShell ForEach Loop](https://adamtheautomator.com/powershell-foreach/) – This is great for managing services on many remote computers at once.

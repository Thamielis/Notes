# PowerShell Logging Recording and Auditing all the Things

IT professionals of all skill levels are using PowerShell daily to perform a wide variety of tasks. Everything from automation of systems & database administration to help desk troubleshooting, PowerShell logging and auditing has a role to play. All this activity generates security concerns for an organization. You may find yourself asking:

*   What are the commands being run during sessions?
*   Are unapproved scripts being executed from insecure local or network sources?
*   What modules are being used that could potentially harm?

In this article, you’ll learn about the options available for PowerShell logging and auditing. By the end of the article, you’ll be armed with enough knowledge to begin logging and auditing all the PowerShell actions occurring on the network. If this has you interested, keep reading!

*   [Prerequisites](https://adamtheautomator.com/powershell-logging-2/#Prerequisites "Prerequisites")
*   [Logging with Transcripts](https://adamtheautomator.com/powershell-logging-2/#Logging_with_Transcripts "Logging with Transcripts")
    *   [How to Turn on Transcripts with the Registry](https://adamtheautomator.com/powershell-logging-2/#How_to_Turn_on_Transcripts_with_the_Registry "How to Turn on Transcripts with the Registry")
    *   [Starting and Stopping Transcripts](https://adamtheautomator.com/powershell-logging-2/#Starting_and_Stopping_Transcripts "Starting and Stopping Transcripts")
    *   [Anatomy of a PowerShell Transcript](https://adamtheautomator.com/powershell-logging-2/#Anatomy_of_a_PowerShell_Transcript "Anatomy of a PowerShell Transcript")
    *   [Limitations of Transcripts](https://adamtheautomator.com/powershell-logging-2/#Limitations_of_Transcripts "Limitations of Transcripts")
*   [Script Block Logging](https://adamtheautomator.com/powershell-logging-2/#Script_Block_Logging "Script Block Logging")
    *   [Enable Script Block Logging Using Windows Registry](https://adamtheautomator.com/powershell-logging-2/#Enable_Script_Block_Logging_Using_Windows_Registry "Enable Script Block Logging Using Windows Registry")
*   [Module Logging](https://adamtheautomator.com/powershell-logging-2/#Module_Logging "Module Logging")
    *   [Enable Module Logging Using Windows Registry](https://adamtheautomator.com/powershell-logging-2/#Enable_Module_Logging_Using_Windows_Registry "Enable Module Logging Using Windows Registry")
*   [Enable Logging & Transcripts Using Group Policy](https://adamtheautomator.com/powershell-logging-2/#Enable_Logging_Transcripts_Using_Group_Policy "Enable Logging & Transcripts Using Group Policy")
*   [Conclusion](https://adamtheautomator.com/powershell-logging-2/#Conclusion "Conclusion")
*   [Additional Resources](https://adamtheautomator.com/powershell-logging-2/#Additional_Resources "Additional Resources")

Prerequisites
-------------

This article will be a hands-on tutorial. If you’d like to follow along, you’ll need a few things:

*   A basic familiarity with Powershell
*   Know how to access and edit registry entries
*   Basic [Group Policy](https://adamtheautomator.com/what-is-group-policy/ "Group Policy") knowledge

Non-Windows PowerShell logging is not covered in this article, but you can read about that topic [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logging_non-windows?view=powershell-7).

All examples are using PowerShell 5.1, Windows Server 2016, and Windows Server 2019.

Logging with Transcripts
------------------------

There are lots of claims on the Internet about PowerShell being insecure. This couldn’t be farther from the truth. PowerShell provides mechanisms which allow SysOps and SecOps alike, to audit and log PowerShell activity.

One of the simplest PowerShell logging techniques is _transcripts_. Transcripts are a great way to save a current host session. [This capability has been in PowerShell since 1.0](https://social.technet.microsoft.com/wiki/contents/articles/13769.powershell-1-0-cmdlets.aspx#All_Cmdlets) as part of the _[Microsoft.PowerShell.Host](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Host/?view=powershell-7)_ module.

With transcripts, you get all of the commands and output generated during a host session. Close the host session, and the transcript stops.

### How to Turn on Transcripts with the Registry

While transcripts can be enabled by Group Policy, you can also enable them by editing the Windows Registry. For example, on Windows Server 2016, the registry key is located at HKLM:_\\SOFTWARE\\WOW6432Node\\Policies\\Microsoft\\Windows\\PowerShell\\Transcription_ and can contain values such as the ones shown below:

![[images/Untitled-2020-09-14T231638.947.png]]

Sample registry values for Transcription logging and auditing

If you’d rather not open up _regedit_ and manually edit the registry, below you will find a [PowerShell function](https://adamtheautomator.com/powershell-functions/ "PowerShell function") that will do all of the hard work for you. This function will set all of the appropriate registry values for you.

```powershell
function Enable-PSTranscriptionLogging {
param(
[Parameter(Mandatory)]
[string]$OutputDirectory
)

     # Registry path
     $basePath = 'HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell\Transcription'

     # Create the key if it does not exist
     if(-not (Test-Path $basePath))
     {
         $null = New-Item $basePath -Force

         # Create the correct properties
         New-ItemProperty $basePath -Name "EnableInvocationHeader" -PropertyType Dword
         New-ItemProperty $basePath -Name "EnableTranscripting" -PropertyType Dword
         New-ItemProperty $basePath -Name "OutputDirectory" -PropertyType String
     }

     # These can be enabled (1) or disabled (0) by changing the value
     Set-ItemProperty $basePath -Name "EnableInvocationHeader" -Value "1"
     Set-ItemProperty $basePath -Name "EnableTranscripting" -Value "1"
     Set-ItemProperty $basePath -Name "OutputDirectory" -Value $OutputDirectory

}
```

### Starting and Stopping Transcripts

The easiest way to get started with transcripts is to use just two cmdlets; `Start-Transcript` and `Stop-Transcript`. These two simple commands are the easiest way to begin and stop recording PowerShell console activity.

To start a transcript or log of commands used during a host session, type the following code into the terminal and press **Enter**:

```powershell
# Works with Windows PowerShell 1.0 to 5.1 and PowerShell 7
Start-Transcript
```

Now enter a generic command to produce some verbose output in the session. Use the code below to get the current date-time:

You should have similar output as shown in the screenshot below:

![[images/Untitled-2020-09-14T231818.348-2.png]]

Get-Date Command

At this point, that command the output has been saved to the text file where you defined it in the registry. To end the transcript, close the host session or use the `Stop-Transcript` cmdlet.

> _Using the `Stop-Transcript` cmdlet shows intent. You can also “stop” a transcript by simply closing the PowerShell console._

The `Get-Date` cmdlet and the output were recorded in the background to a plain-text file, including the `Stop-Transcript` cmdlet.

By default, transcripts are saved in the _%userprofile%\\Documents_ folder and are named PowerShell\_transcript.\[hostname\].\[random\_characters\].\[timestamp\].txt . This naming convention becomes useful when transcripts are centrally stored as it prevents accidental overwrite and makes searching PowerShell logs easier.

### Anatomy of a PowerShell Transcript

Every transcript has a certain “schema” or way it is structured. Take a look at the PowerShell transcript file which was saved in using default parameters. You can see all of the common attributes you can expect from the transcript.

Each transcript created using default parameters will include host session information, start time, username, PowerShell and OS version, and machine name. Following this useful information, you see the commands that were run, the output generated, and the final command `Stop-Transcript`, which ends the transcript and writes a final timestamp to the transcript file.

![[images/Untitled-2020-09-14T231944.752.png]]

Example PowerShell transcript

When using the `Start-Transcript` cmdlet, there is no hard limit to only using the default naming convention or path. A transcript can be saved using any name to any writable location.

Try it now. Use the `-Path` parameter, as shown in the example below. This code snippet will create a folder at _C:\\My\_PowerShell\_Transcripts_ and immediately begin recording a transcript in the _Get-Date-Transcript.txt_ file.

```powershell
$null = New-Item -Path C:\My_PowerShell_Transcripts -ItemType Directory -ErrorAction Ignore
Start-Transcript -Path 'C:\My_PowerShell_Transcripts\Get-Date-Transcript.txt'
```

After running some commands, stop the transcript again (`Stop-Transcript`) and then navigate to the directory specified in the example above. You should now see your transcript, as shown below:

![[images/Untitled-2020-09-14T232034.649-1.png]]

Saved PowerShell transcript

**Adding Parameters to `Start-Transcript`**

Previously, you learned about using `Start-Transcript` with no parameters but this cmdlet also has some other handy parameters to customize the behavior such as:

*   `NoClobber` – prevents accidental overwrites
*   `Append` – allows PowerShell to write to an existing transcript file
*   `IncludeInvocationHeader` – adds the precise timestamp each command was run.
*   `UseMinimalHeader` – a v6.2 parameter that removes host session detail information included by default.

You can [Read the docs for a full list of optional parameters here.](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.host/start-transcript?view=powershell-7#parameters)

### Limitations of Transcripts

Transcripts are handy but you sometimes cannot see the end-to-end activity of what’s going on in a script. Let’s take a look at an example script called _Get-Date.ps1_.

The _Get-Date.ps1:_

*   Returns the current date/time with the `Get-Date` cmdlet
*   Prints network connectivity test results to the console with the `[Test-NetConnection](https://adamtheautomator.com/test-netconnection/)` cmdlet
*   Defines an array of numbers
*   Loops over each number in the array initiating a command that doesn’t produce any output and opening a new PowerShell process.

```powershell
# Run Get-Date as a script

# Produce date to host session
Get-Date

# Test network with some output to host session
Test-NetConnection localhost

#uh-oh
$numbers = 1..10

# What's this?
Foreach ($number in $numbers) {

    # Doing something that doesn't produce console output
    [System.Console]::Beep(6000,500)

    Start-Process pwsh.exe

    # host session runs this but it produces no output
    # and is not logged in the transcript!
}
```

Looking at the transcript just created, it’s not apparent that the _Get-Date.ps1_ script did extra stuff besides `Get-Date` and `Test-NetConnection`:

![[images/Untitled-2020-09-14T232226.096.png]]

Example PowerShell transcript

The downside to this PowerShell logging method is that it only works for the current user’s host session. If a script is executed produces no output to the host session, there’s no log of what actions the said script took. Transcripts, while providing some PowerShell logging capability, were never meant to encapsulate all PowerShell script activity.

PowerShell script block logging takes care of this issue and is the topic for the next section.

Script Block Logging
--------------------

When enabled, script block logging will record everything that PowerShell does. Script block logging is implemented using Group Policy or by editing the Windows Registry directly. Windows 10 adds new functionality called _[Protected Event Logging](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logging_windows?view=powershell-7#protected-event-logging),_ giving you the ability not to log sensitive information such as Personally Identifiable Information (PII) or other sensitive data such as credentials. Protected Event Logging is out of scope for this article, but [you can read more about it here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logging_windows?view=powershell-7#protected-event-logging).

> _Editing the registry directly is a good solution for standalone systems or workgroup settings. If you can use Group Policy, configure Script Block Logging and Protected Event Logging there._

### Enable Script Block Logging Using Windows Registry

To enable Script Block Logging using the Windows Registry, Copy the function below into your PowerShell session and press **Enter**:

```powershell
function Enable-PSScriptBlockLogging
 {
 # Registry key $basePath = 'HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' 

# Create the key if it does not exist if(-not (Test-Path $basePath)) 

{     

$null = New-Item $basePath -Force     

# Create the correct properties      New-ItemProperty $basePath -Name "EnableScriptBlockLogging" -PropertyType Dword 

} 

# These can be enabled (1) or disabled (0) by changing the value Set-ItemProperty $basePath -Name "EnableScriptBlockLogging" -Value "1"
 }
```

Now run the function like you would a normal cmdlet, type the function name and press **Enter**:

```powershell
Enable-PSScriptBlockLogging
```

Script Block Logging is enabled. Now let’s test it out. Try running some cmdlets or a few of your scripts. Once you’ve done that, use the following code to inspect the Script Block Logging events:

```powershell
# Viewing just the message which shows scripts, cmdlets run
Get-WinEvent Microsoft-Windows-PowerShell/Operational -MaxEvents 4 |
Where-Object Id -eq 4104 | Select-Object -ExpandProperty Message
```

Below is an example of what your output could look like. You may see much more information depending on what commands or scripts you ran. In this screenshot, you see a script I ran, and the above command to view the log entries:

![[images/Untitled-2020-09-14T232355.055.png]]

Recent Script Block Logging entries

You can still view and audit this information using the traditional Windows Event Viewer and navigating to **_Applications and Services Logs > Microsoft > PowerShell > Operational_**. Here’s an example of how the log appears in Windows Event Viewer:

![[images/Untitled-2020-09-14T232433.358.png]]

The value of ScriptBlock logging demonstrated.

The above example is from a system change that created a bad set of registry entries, leading to unexpected results. Luckily ScriptBlock logging had been turned on ahead of time. The issue was traced to a naming issue in some code that was run.

> _It’s a good idea to have a centralized log collection point or SIEM in place if this information will be used for auditing purposes._

Now that you are getting visibility into what PowerShell is processing on your system, it’s time to audit and log what modules PowerShell is using during processing commands and scripts in the next section.

Module Logging
--------------

When you need to audit specific PowerShell modules being used on a host, Module Logging is the answer. You enable Module Logging in much the same way as you allow Script Block Logging.

> _Module logging **will generate a lot more events** than ScriptBlock logging does. You will want to consider the implications and develop a strategy for its use._

### Enable Module Logging Using Windows Registry

Not every environment has a Group Policy available. So what do you do in these environments if you need to audit and log [PowerShell module](https://adamtheautomator.com/powershell-modules/) usage? You use the Windows Registry!

To enable Module Logging using the Windows Registry, use the following PowerShell function:

```powershell
# This function checks for the correct registry path and creates it
# if it does not exist, then enables it.
function Enable-PSModuleLogging
{

    # Registry path
    $basePath = 'HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging'
    
    # Create the key if it does not exist
    if(-not (Test-Path $basePath))
    {

        $null = New-Item $basePath -Force
        # Create the correct properties
        New-ItemProperty $basePath -Name "EnableModuleLogging" -PropertyType Dword

    }

    # These can be enabled (1) or disabled (0) by changing the value
    Set-ItemProperty $basePath -Name "EnableModuleLogging" -Value "1"

}
```

Next, run the PowerShell function:

When module logging is enabled, modules are not automatically monitored. You have to specify which modules to log. There are a couple of ways to do this. The adhoc way is to use the _Pipeline Execution Details_ property and the Windows Registry or Group Policy for more permanent scenarios.

> _You can do this for specific modules or for all modules. It is not recommended to only monitor specific modules._

To log module usage in a single session with PowerShell, you have first to import the module you wish to audit. Then, using the member property `LogPipelineExecutionDetails`, setting the value to `$True`. By default, this property is `$False` for all modules.

For example, let’s say you want to log the module `VMware.[PowerCLI](https://adamtheautomator.com/powercli-tutorial/)`. You’d do so by entering the following code and press **Enter**:

```powershell
# Assuming you have already imported a module
(Get-Module -Name VMware.PowerCLI).LogPipelineExecutionDetails = $true
```

After running the above command, each time you invoke the `VMware.PowerCLI` module in PowerShell, a log entry is created. However, this method is only valid for the current session. Once you close PowerShell, the logging stops until you start it again.

The pipeline execution details can be found in the _Windows PowerShell_ event log as _Event ID 800_.

Here’s what the log looks like when viewed using the Windows Event Viewer:

![[images/Untitled-2020-09-14T232616.343-1024x691.png]]

Window Event Viewer View

To view these log entries with PowerShell, you would run the following code:

```powershell
Get-EventLog 'Windows PowerShell' -EntryType Information -InstanceId 800
```

> _If you are logging all PowerShell modules, you are going to see a lot of entries. You can filter them down to your liking. However, that is out of the scope of this article._

If you prefer to log all the modules, for all the users, all the time, then you need to edit the Windows Registry once more to add a new key value to the Module Logging key that you created earlier in this section.

To add a new registry key value for _ModuleNames,_ use the PowerShell function below:

```powershell
# This function creates another key value to enable logging
# for all modules
Function Enable-AllModuleLogging
{
    # Registry Path     $basePath = 'HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames' 
    
    # Create the key if it does not exist
    if(-not (Test-Path $basePath))
    {
$null = New-Item $basePath -Force
    }
    # Set the key value to log all modules
    Set-ItemProperty $basePath -Name "*" -Value "*"
}
```

After you press **Enter**, you run the function just as you’ve done earlier in this section:

Press **Enter** once more, and now all PowerShell modules will be logged each time used.

Enable Logging & Transcripts Using Group Policy
-----------------------------------------------

You don’t have to edit the Windows Registry if you choose not to. If you have an environment where you can use Group Policy, it may be easier to use the following policy objects to implement logging and auditing.

Start by opening the Group Policy Management console and [create a new Group Policy Object (GPO)](https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-firewall/create-a-group-policy-object). Then edit the policy as follows:

1.  Navigate to _Computer Configuration > Administrative Templates > Windows Components > Windows PowerShell._ You should see the same settings as shown in the below example:

![[images/Group_Policy_Settings.png]]

View of Available GPO Settings

2\. Enable your choice of the following settings by changing their state:

![[images/module_logging_gpo_settings.png]]

Module Logging GPO Settings

*   Turn on Module Logging

Be sure to enable the logging of all modules by using an asterisk (\*) for the value. Alternatively, you could list out specific modules by their name too.

![[images/all_modules_gpo.png]]

Module Names contents

*   Turn on Transcripts

![[images/transcripts_gpo_settings.png]]

Transcripts GPO Settings

3\. Link the new GPO to the Organizational Unit (OU) that contains the computer accounts you want to monitor or audit.

> _Remember to reboot the computers this policy is applied too._

That’s all you have to do to begin auditing and logging your PowerShell environment using Group Policy.

Conclusion
----------

With this new knowledge, you’ve just upped your security game with PowerShell administration. PowerShell logging and auditing capabilities make using PowerShell a very poor choice for bad actors trying to do bad things. The methods discussed in this article enable you to master the art of PowerShell Logging and Auditing, making you a better SecOps or SysOps professional. You’ve learned how to create transcripts, log script block execution, and module details using the Windows Registry, Group Policy and through PowerShell itself. You are encouraged to look through the additional resource links below to further your PowerShell logging and auditing knowledge. Now go forth, and fortify your PowerShell environments by logging and recording all the PowerShell things!

Additional Resources
--------------------

[Start-Transcript](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.host/start-transcript?view=powershell-7)

[Stop-Transcript](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.host/stop-transcript?view=powershell-7)

[Enabling Script Block Logging](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logging_windows?view=powershell-7#enabling-script-block-logging)

[about\_Logging-Windows](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logging_windows?view=powershell-7&viewFallbackFrom=powershell-5.1)

[about\_EventLogs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_eventlogs?view=powershell-5.1#logging-module-events)

[New-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-7#description)

[New-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-itemproperty?view=powershell-7#description)

[Set-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-itemproperty?view=powershell-7#description)

[about\_Group\_Policy\_Settings-PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_group_policy_settings?view=powershell-5.1#long-description)

[Creating Group Policy Objects](https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-firewall/create-a-group-policy-object)

[Group Policy to Registry Reference](https://admx.help/)

[Threat Research – Greater Visibility Through PowerShell Logging (FireEye)](https://www.mandiant.com/resources/greater-visibilityt)
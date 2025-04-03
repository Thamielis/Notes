# PowerShell scripting template for SCCM packages

This article provides a PowerShell scripting template for SCCM and MDT packages. This template can also be used for stand-alone installations (without using SCCM or MDT)!

An SCCM package is basically a container with source files. I recommend using a wrapper (a script) to execute the installation files and for any configuration you may need. And that is exactly what the PowerShell template below offers!
Even better, the template in this article uses my PowerShell Function Library, which effectively turns it into a complete deployment framework.

---

- [Scripting Template][1]
- [How to use this template][2]

---

## Scripting Template

The scripting template below is an example that you can use for your installations and configurations. The functions in the template are imported from a PowerShell module for the [Dennis Span PowerShell Function Library][3]. The library offers more functions than included in the template (the template is only an example).

Please see the article [PowerShell Function Library][4] for detailed information how to install and use the library.

For a complete overview of all PowerShell functions included in the library, see the following articles on this website:

Windows functions: [PowerShell functions for Windows][5]
Citrix functions: [PowerShell functions for Citrix][6]

```powershell
#==========================================================================
#
# <APPLICATION NAME>
#
# AUTHOR: <AUTHOR>
# DATE  : <DATE>
#
# COMMENT: <COMMENT>
#
# Note: see the article 'https://dennisspan.com/powershell-scripting-template-for-sccm-packages/' for a detailed description how to use this template
#
# Note: for an overview of all functions in the PowerShell function library 'DS_PowerShell_Function_Library.psm1' see:
#       -Windows functions: https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/
#       -Citrix functions: https://dennisspan.com/powershell-function-library/powershell-functions-for-citrix/
#          
# Change log:
# -----------
# 29.12.2019 Dennis Span: the scope of the variables LogDir and LogFile is now set to "global". 
#                         This solves an issue when using the template in an MDT task sequence.
#==========================================================================

# Get the script parameters if there are any
param
(
    # The only parameter which is really required is 'Uninstall'
    # If no parameters are present or if the parameter is not
    # 'uninstall', an installation process is triggered
    [string]$Installationtype
)

# define Error handling
# note: do not change these values
$global:ErrorActionPreference = "Stop"
if($verbose){ $global:VerbosePreference = "Continue" }

############################
# Preparation              #
############################

# Disable File Security
$env:SEE_MASK_NOZONECHECKS = 1

# Custom variables [edit]
$BaseLogDir = "C:\Logs"               # [edit] add the location of your log directory here
$PackageName = "MyApp"                # [edit] enter the display name of the software (e.g. 'Acrobat Reader' or 'Microsoft Office')

# Global variables
$StartDir = $PSScriptRoot # the directory path of the script currently being executed
if (!($Installationtype -eq "Uninstall")) { $Installationtype = "Install" }
$global:LogDir = (Join-Path $BaseLogDir $PackageName).Replace(" ","_")
$LogFileName = "$($Installationtype)_$($PackageName).log"
$global:LogFile = Join-path $LogDir $LogFileName

# Create the log directory if it does not exist
if (!(Test-Path $LogDir)) { New-Item -Path $LogDir -ItemType directory | Out-Null }

# Create new log file (overwrite existing one)
New-Item $LogFile -ItemType "file" -force | Out-Null

# Import the Dennis Span PowerShell Function Library
Import-Module "C:\Scripts\DS_PowerShell_Function_Library.psm1"

DS_WriteLog "I" "START SCRIPT - $Installationtype $PackageName" $LogFile
DS_WriteLog "-" "" $LogFile

############################
# Pre-launch commands      #
############################

# Delete a registry value
DS_DeleteRegistryValue -RegKeyPath "hklm:\SOFTWARE\MyApp" -RegValueName "MyValue"

# Create a directory
DS_CreateDirectory -Directory "C:\Temp\MyNewFolder"

# Stop a service (+ dependencies)
DS_StopService -ServiceName "Spooler"

############################
# Installation             #
############################

# Install or uninstall software
$FileName = "MyApp.msi"                                                 # [edit] enter the name of the installation file (e.g. 'MyApp.msi' or 'setup.exe')
if ( $Installationtype -eq "Uninstall" ) {   
    $Arguments = ""                                                     # [edit] enter arguments (for MSI file the following arguments are added by default: /i #File# /qn /norestart / l*v #LogFile#)
} else {
    $Arguments = "Transforms=""MyApp.mst"" LANG_LIST=""en_US,de_DE"""   # [edit] enter arguments (for MSI file the following arguments are added by default: /i #File# /qn /norestart / l*v #LogFile#)
}
$FileSubfolder = "Files"                                                # [edit] enter the name of the subfolder which contains the installation file (e.g. 'Files' or 'MSI')
$FileFullPath = Join-Path $StartDir $FileSubfolder                      # Concatenate the two directories $StartDit and $InstallFileFolder
DS_InstallOrUninstallSoftware -File ( Join-Path $FileFullPath $FileName ) -InstallationType $Installationtype -Arguments $Arguments

############################
# Post-launch commands     #
############################

# Delete a registry key
DS_DeleteRegistryKey -RegKeyPath "hklm:\Software\MyApp"

# Start a service (+ dependencies)
DS_StartService -ServiceName "Spooler"

############################
# Finalize                 #
############################

# Enable File Security  
Remove-Item env:\SEE_MASK_NOZONECHECKS

DS_WriteLog "-" "" $LogFile
DS_WriteLog "I" "End of script" $LogFile
```

## How to use this template

First, copy the above code in your preferred editor (e.g. notepad) and save the file as a PowerShell script (*.PS1), for example MyAppInstaller.ps1. You can choose any file name you want of course.

You have to modify a couple of lines in the script to match your specific requirements. Enter your preferred log directory and package name in lines 44 and 45, for example:

```powershell
$BaseLogDir = "C:\Logs"
$PackageName = "Adobe Acrobat Reader"
```

Or

```powershell
$BaseLogDir = "C:\Script\Logs"
$PackageName = "Environment_Config"
```

```powershell
# Custom variables [edit]
$BaseLogDir = "C:\Logs"               # [edit] add the location of your log directory here
$PackageName = "Adobe Acrobat Reader" # [edit] enter the display name of the software (e.g. 'Acrobat Reader' or 'Microsoft Office')
```

When the log directory is created, spaces are automatically replaced with an underscore ("_"), for example: C:\Logs\Adobe_Acrobat_Reader.

> **Tip:**
> Changing the main log directory (e.g. C:\Logs) at a later time means that you have to change each script that contains the hard-coded path. There is another, more flexible way:
> * Create an environment variable using a Group Policy Preference called _GlobalLogPath_ (or use a different name). As a value enter your preferred log path, for example "C:\Logs".
> * In the script, add _$env:GlobalLogPath_ as a value to the PowerShell variable _$BaseLogDir:_ **$BaseLogDir = $env:GlobalLogPath**

> The PowerShell script now reads the log path from the environment variable _GlobalLogPath_. In case you ever want to change the log directory you simply change the path in the Group Policy Preference environment variable without having to change any of your scripts.

The section [How to use the library in a PowerShell script][7] in the article [PowerShell Function Library][8] describes how to use the library in a PowerShell script. In line 61, make sure to enter the correct path to the library.

In the script sections "Pre-launch commands", "Installation" and "Post-launch commands" make sure to enter the functions you require.



  [1]: #scripting-template
  [2]: #how-to-use-this-template
  [3]: https://dennisspan.com/powershell-function-library/
  [4]: https://dennisspan.com/powershell-function-library/
  [5]: https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/
  [6]: https://dennisspan.com/powershell-function-library/powershell-functions-for-citrix/
  [7]: https://dennisspan.com/powershell-function-library/#UsingTheLibraryInAScript
  [8]: https://dennisspan.com/powershell-function-library/

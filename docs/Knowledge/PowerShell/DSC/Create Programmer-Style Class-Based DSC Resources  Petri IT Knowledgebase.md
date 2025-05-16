With Windows Management Framework (WMF) 4.0, Microsoft introduced a new configuration management platform built on Windows PowerShell called Desired State Configuration (DSC/0. DSC evolved with new features in WMF 5.0, one of which introduced class-based DSC resources — a way for programmers familiar with object-oriented programming to use classes to create resources to configure systems. This article will get you started programming your own class-based resources.

Resources are the key building block to writing DSC configurations. As a result, some basic resources, such as files and registry settings, come built into PowerShell and reside in the PSDesiredStateConfiguration module. Beyond those basic items, you’ll need to rely on custom resources for configuring more advanced components or settings.

![[images/devolutions_logo_blue.png]]

Sponsored Content

Devolutions Remote Desktop Manager

Devolutions RDM centralizes all remote connections on a single platform that is securely shared between users and across the entire team. With support for hundreds of integrated technologies — including multiple protocols and VPNs — along with built-in enterprise-grade password management tools, global and granular-level access controls, and robust mobile apps to complement desktop clients.

[

Learn More

](https://remotedesktopmanager.com/?utm_source=sponsorship&utm_medium=ads&utm_campaign=bww)

The [PowerShell Gallery](https://www.powershellgallery.com/) contains Microsoft- and community-written DSC resources to cover a wide range of advanced configuration scenarios. This should be your first stop for a custom resource, after all, why reinvent the wheel?  However, if you find no custom resource for a configuration task, then it’s on to writing your own.

**Custom Resources in a Nutshell**
----------------------------------

You can build custom resources using one of two programming styles — function-based resources and class-based resources. Each has its own benefits and shortcomings, and it’s important to understand the differences between the two to decide which to use for your resources.

Function-based DSC resources require a set folder structure and set of files. In order for the resource to work correctly, the files and folders must be named exactly as the Microsoft [documentation](https://msdn.microsoft.com/en-us/powershell/dsc/authoringresourcemof) states. Creating a schema.mof file defines the list of properties that the resource can configure.  In addition, you must include the 3 required functions — get-TargetResource, test-TargetResource, and set-TargetResource. Lastly, you also need to version function-based resources, and the version folders are part of the folder structure.

Class-based DSC resources, on the other hand, are simply organized just like a regular PowerShell module. First, a folder with the name of the resource contains two files — a PowerShell module (.psm1) and a module manifest (.psd1). Second, similar to the function-based resource, it also contains 3 methods — get(), set(), and test(). There are no other folders or files, which is a benefit. When WMF 5.0 was first released, class-based resources did not support versioning for use on a pull server, but that shortcoming appears to be resolved in newer versions of WMF 5.1.

**Class-Based Resources**
-------------------------

WMF 5.0 first introduced PowerShell classes, so if you’re still running WMF4.0, you won’t be able to use class-based DSC resources.  If you’re familiar with object-oriented programming and the concept of classes, class-based resources may be easier for you to develop than function-based ones.  In addition, it’s easier to read and understand a class-based resource.

A function-based module uses input parameters to pass information and functions for the code execution.  The class-based resource instantiates an instance of the class (also known as an object) that is defined by its parameters and uses methods against that class instance to execute the code.  You can find more information about PowerShell classes [here](https://blogs.technet.microsoft.com/heyscriptingguy/2015/08/31/introduction-to-powershell-5-classes/).

This example will demonstrate a class-based resource that sets a simple network share named “SMBShareClass”.  The entire code is below, and I’ll walk through each section.

$Share = get-SMBShare -name $This.Name -ErrorAction Stop

If (($This.Ensure -eq \[Ensure\]::Present) -and ($Share.Path -eq $This.path)) {

if ($This.Ensure -eq \[Ensure\]::Absent) {return $True}

If ($This.Ensure -eq \[Ensure\]::Absent) {

remove-SMBShare -name $This.Name -Force

get-SMBShare -name $This.name -ErrorAction Stop

remove-SMBShare -name $This.Name -Force

new\-SMBShare -Name $This.Name -Path $This.Path

new\-SMBShare -name $This.Name -path $This.Path

$Share = get-smbshare -name $This.Name -ErrorAction SilentlyContinue

enum Ensure { Absent Present } \[DSCResource()\] Class SMBShareClass { \[DSCProperty(Key)\] \[string\]$Name \[DSCProperty(Mandatory)\] \[string\]$Path \[DscProperty(Mandatory)\] \[Ensure\]$Ensure \[bool\] Test() { try { $Share = get-SMBShare -name $This.Name -ErrorAction Stop If (($This.Ensure -eq \[Ensure\]::Present) -and ($Share.Path -eq $This.path)) { return $True } else { return $False } } catch { if ($This.Ensure -eq \[Ensure\]::Absent) {return $True} else {return $False} } } \[void\] Set() { If ($This.Ensure -eq \[Ensure\]::Absent) { remove-SMBShare -name $This.Name -Force } else { try { get-SMBShare -name $This.name -ErrorAction Stop remove-SMBShare -name $This.Name -Force new-SMBShare -Name $This.Name -Path $This.Path } catch { new-SMBShare -name $This.Name -path $This.Path } } } \[SMBShareClass\] Get() { $Share = get-smbshare -name $This.Name -ErrorAction SilentlyContinue if ($Share) { $This.Name = $Share.Name $This.Path = $Share.Path $This.Ensure = 'Present' } else { $This.Name = $null $This.Path = $Null $This.Ensure = 'Absent' } return $This } }

```
enum Ensure {
     Absent
     Present
}

[DSCResource()]
Class SMBShareClass {

     [DSCProperty(Key)]
     [string]$Name

     [DSCProperty(Mandatory)]
     [string]$Path

     [DscProperty(Mandatory)]
     [Ensure]$Ensure

     [bool] Test() {
          try {
               $Share = get-SMBShare -name $This.Name -ErrorAction Stop
               If (($This.Ensure -eq [Ensure]::Present) -and ($Share.Path -eq $This.path)) {
                    return $True
               }
               else {
                    return $False
               }
          }
          catch {
               if ($This.Ensure -eq [Ensure]::Absent) {return $True}
               else {return $False}
          }
     }

      [void] Set() {
          If ($This.Ensure -eq [Ensure]::Absent) {
               remove-SMBShare -name $This.Name -Force
          }
          else {
               try {
                    get-SMBShare -name $This.name -ErrorAction Stop
                    remove-SMBShare -name $This.Name -Force
                    new-SMBShare -Name $This.Name -Path $This.Path
               }
                    catch {
                         new-SMBShare -name $This.Name -path $This.Path
                    }
          }
     }

     [SMBShareClass] Get() {
          $Share = get-smbshare -name $This.Name -ErrorAction SilentlyContinue
          if ($Share) {
               $This.Name = $Share.Name
               $This.Path = $Share.Path
               $This.Ensure = 'Present'
          }
          else {
               $This.Name = $null
               $This.Path = $Null
               $This.Ensure = 'Absent'
          }
      return $This
      }
}
```

#### **Class-Based DSC Resource Properties**

The \[DSCResource()\] keyword designates that the class is a DSC resource.  The Class keyword defines the class.  In the example, the resource contains 3 properties, and I need to use the DSCProperty keyword and another keyword where necessary to define the type of property (Key, Mandatory, or NotConfigurable).  In the example, I have a key property called Name and two mandatory properties, Path and Ensure.

\[DSCResource()\] Class SMBShareClass { \[DSCProperty(Key)\] \[string\]$Name \[DSCProperty(Mandatory)\] \[string\]$Path \[DscProperty(Mandatory)\] \[Ensure\]$Ensure

```
[DSCResource()]
Class SMBShareClass {

     [DSCProperty(Key)]
     [string]$Name

     [DSCProperty(Mandatory)]
     [string]$Path
     [DscProperty(Mandatory)]
     [Ensure]$Ensure
```

Notice that the property type is a property type “Ensure” for the Ensure property.  With classes, I can use an Enum type, which is used to define a set of pre-defined constants. The constant values are either Present or Absent. I’ll add an Enum declaration that contains these values, but it must be located **before** the class declaration.

enum Ensure { Absent Present } \[DSCResource()\] Class SMBShareClass { ...

```
enum Ensure {
     Absent
     Present
}

[DSCResource()]
Class SMBShareClass {

...
```

**Syntax Differences**
----------------------

There are two other noteworthy constructs used in class-based resources.  When the class-based DSC resource is called, it instantiates an object with the properties of the class, and the properties contain the settings that you want to be set.  The **$this** keyword is a reference to the currently instantiated object. If the Get-SMBShare PowerShell cmdlet was part of the class resource, it would look like:

get-SMBShare -name $This.Name -ErrorAction Stop

get-SMBShare -name $This.Name -ErrorAction Stop

```
get-SMBShare -name $This.Name -ErrorAction Stop
```

The second is the :: construct.  This is used to call a static method.  I am using it in this example for comparison against one of the constant Ensure values.

if ($This.Ensure -eq \[Ensure\]::Absent

if ($This.Ensure -eq \[Ensure\]::Absent

```
if ($This.Ensure -eq [Ensure]::Absent
```

The get(), set(), and test() methods are functionally the same as get-TargetResource, set-TargetResource, and test-TargetResource in a function-based resource. Test() determines whether the system is in compliance with the desired settings, and returns True or False based on the system’s setting.  Set() sets the desired state if the system is not already in desired state. Get() returns an instance of SMBShareClass, the instance will contain the current values set on the system.

**Module Manifest and Using the Resource**
------------------------------------------

Once written, save the class-based DSC resource to a folder in the module path (typically %systemdrive%\\Program Files\\WindowsPowerShell\\Modules) as a .psd1 file, in a subfolder named the same as the class (SMBShareClass). If you are planning to deploy from a pull server or wish to version the module, you may want to include a version folder (e.g.,  …\\Modules\\1.0.0.0\\SMBShareClass).  Finally, create a module manifest with the -DSCResourcesToExport parameter included.

\-Path "C:\\Program Files\\WindowsPowerShell\\Modules\\SMBShareClass\\1.0.0.0\\SMBShareClass.psd1" \`

\-ModuleVersion 1.0.0.0 -DscResourcesToExport SMBShareClass \`

\-RootModule "C:\\Program Files\\WindowsPowerShell\\Modules\\SMBShareClass\\1.0.0.0\\SMBShareClass.psm1"

New-ModuleManifest \` -Path "C:\\Program Files\\WindowsPowerShell\\Modules\\SMBShareClass\\1.0.0.0\\SMBShareClass.psd1" \` -ModuleVersion 1.0.0.0 -DscResourcesToExport SMBShareClass \` -RootModule "C:\\Program Files\\WindowsPowerShell\\Modules\\SMBShareClass\\1.0.0.0\\SMBShareClass.psm1"

```
New-ModuleManifest `
     -Path "C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\1.0.0.0\SMBShareClass.psd1" `
     -ModuleVersion 1.0.0.0 -DscResourcesToExport SMBShareClass `
     -RootModule "C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\1.0.0.0\SMBShareClass.psm1"
```

Now the class-based DSC resource is ready to be used in a DSC configuration.  To use it, it still needs to be imported just like a function-based resource using Import-DSCResource.

Configuration SMBShareTest {

Import-DscResource -ModuleName SMBShareClass -ModuleVersion 1.0.0.0

Path = "C:\\Autolab\\NNDTest"

Configuration SMBShareTest { Import-DscResource -ModuleName SMBShareClass -ModuleVersion 1.0.0.0 Node localhost { SMBShareClass NNDTest { Name = "NNDTest" Path = "C:\\Autolab\\NNDTest" Ensure = "Present" } } } SMBShareTest

```
Configuration SMBShareTest {
     Import-DscResource -ModuleName SMBShareClass -ModuleVersion 1.0.0.0

     Node localhost {
          SMBShareClass NNDTest {
          Name = "NNDTest"
          Path = "C:\Autolab\NNDTest"
          Ensure = "Present"
          }
     }
}
SMBShareTest
```

**Pull Server Packaging for Versioning**
----------------------------------------

Packaging a class-based DSC resource for use on a pull server is similar to packaging for a function-based resource.  Using compress-archive, compress everything below the version folder into a file.

Compress-Archive 'C:\\Program Files\\WindowsPowerShell\\Modules\\SMBShareClass\\1.0.0.0\\\*'\`

\-DestinationPath "C:\\Powershell\\pullsvrtest\\SMBShareClass\_1.0.0.0.zip"

Compress-Archive 'C:\\Program Files\\WindowsPowerShell\\Modules\\SMBShareClass\\1.0.0.0\\\*'\` -DestinationPath "C:\\Powershell\\pullsvrtest\\SMBShareClass\_1.0.0.0.zip"

```
Compress-Archive 'C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\1.0.0.0\*'`
     -DestinationPath "C:\Powershell\pullsvrtest\SMBShareClass_1.0.0.0.zip"
```

After zipping the resource**,** use new-DSCChecksum to create a new checksum file for the resource, and then copy both the Zip file and the checksum to the pull server’s resource repository folder.

New\-DscChecksum -Path 'C:\\Powershell\\PullSvrTest\\SMBShareClass\_1.0.0.0.zip' -Force

New-DscChecksum -Path 'C:\\Powershell\\PullSvrTest\\SMBShareClass\_1.0.0.0.zip' -Force

```
New-DscChecksum -Path 'C:\Powershell\PullSvrTest\SMBShareClass_1.0.0.0.zip' -Force
```

copy-item -Path "C:\\Powershell\\PullSvrTest\\\*" \`

\-Destination "\\\\Pull\\C$\\Program Files\\WindowsPowershell\\DSCService\\Modules" \`

copy-item -Path "C:\\Powershell\\PullSvrTest\\\*" \` -Destination "\\\\Pull\\C$\\Program Files\\WindowsPowershell\\DSCService\\Modules" \` -Recurse

```
copy-item -Path "C:\Powershell\PullSvrTest\*" `
     -Destination "\\Pull\C$\Program Files\WindowsPowershell\DSCService\Modules" `
     -Recurse
```

**You Have the Tools**
----------------------

Using class-based DSC resources is a great way to create custom resources without some of the packaging overhead of the function-based resource.  In addition, class-based DSC resources also look cleaner and more professional-looking. If you’re already familiar with how classes work, you now have the syntax needed to create these resources. However, if this was all new to you, you now have an overview of how class-based resources work and enough information to create your own.  Happy coding!
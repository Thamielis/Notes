Desired State Configuration (DSC) allows server administrators to harness the power of PowerShell to manage the configuration of servers. It’s no longer necessary to manually configure a server once you are familiar with DSC for configuration management. There are many DSC resources at your disposal, and determining which resources to use for your configurations requires some up-front planning. At times, though, you may find settings that can’t be configured using traditional built-in resources, which then becomes a problem that requires some PowerShell coding to solve — using a script resource.

![[images/devolutions_logo_blue.png]]

Sponsored Content

Devolutions Remote Desktop Manager

Devolutions RDM centralizes all remote connections on a single platform that is securely shared between users and across the entire team. With support for hundreds of integrated technologies — including multiple protocols and VPNs — along with built-in enterprise-grade password management tools, global and granular-level access controls, and robust mobile apps to complement desktop clients.

[

Learn More

](https://remotedesktopmanager.com/?utm_source=sponsorship&utm_medium=ads&utm_campaign=bww)

#### **Comparing Script Resource vs. Custom Resources**

The Script resource is a great stepping stone for quickly experimenting with the capabilities of DSC. If it’s possible to configure an item with a PowerShell script, then configuring the item with a script resource is also possible. However, the script resource isn’t the best solution for a production environment since it can quickly become very complex to debug and maintain. Luckily, the transition from a script resource to a custom resource doesn’t require too much extra effort once you have the script resource code written.

#### **Defining the Script Resource**

The example focuses on installing Windows Server Backup and configuring a system state backup. While installing the Windows-Server-Backup feature is easy enough to do using the WindowsFeature resource, no DSC resource exists to configure the backup. Because no DSC resource exists, I’ll create a script resource. First, the script resource contains 3 properties — **testScript**, **setScript**, and **getScript** — at a minimum. In addition, the script resource also includes the ability to specify alternate credentials for the scripts to run using the PsDscRunAsCredential property. To start, create a blank shell for your script resource and fill it in as you go.

Script NewSSBUPolicy { TestScript = { } SetScript = { } GetScript = { } }

```
Script NewSSBUPolicy {
            TestScript = {
                }
            SetScript = {
                }
            GetScript = {
                }
        }
```

#### **Starting with a Set Function**

Think about the item you are trying to configure in DSC and how you would solve the problem of configuring it with PowerShell alone. While developing the example, I discovered PowerShell cmdlets that come with the Windows Server Backup feature (woohoo!) but they aren’t very intuitive to use. Because I wasn’t familiar with the cmdlets, I explored the cmdlets in the module and started out by thinking about how I would test if a system state backup existed (get-WBPolicy), and how I would set one if it didn’t (probably set-WBPolicy, or new-WBPolicy). This code will set a backup policy to back up the system state at 9:00 PM. First, I create a new, empty policy object using New-WBPolicy. Next, I add my options –backup time, system state, and disk, and set the policy. Last, the -force parameter suppresses the confirmation prompts.

$BackupTime = \[datetime\]::today.AddHours(21)

Set-WBSchedule -Policy $Policy -Schedule $BackupTime

$Target = New\-WBBackupTarget -Disk (get-wbdisk | Where-Object {$\_.DiskNumber -eq 1})

Add-WBBackupTarget -Policy $Policy -Target $Target -force

Add-WBSystemState -Policy $Policy

Set-WBPolicy -AllowDeleteOldBackups -Policy $Policy -force

$BackupTime = \[datetime\]::today.AddHours(21) $Policy = New-WBPolicy Set-WBSchedule -Policy $Policy -Schedule $BackupTime $Target = New-WBBackupTarget -Disk (get-wbdisk | Where-Object {$\_.DiskNumber -eq 1}) Add-WBBackupTarget -Policy $Policy -Target $Target -force Add-WBSystemState -Policy $Policy Set-WBPolicy -AllowDeleteOldBackups -Policy $Policy -force

```
$BackupTime = [datetime]::today.AddHours(21)
$Policy = New-WBPolicy
Set-WBSchedule -Policy $Policy -Schedule $BackupTime
$Target = New-WBBackupTarget -Disk (get-wbdisk | Where-Object {$_.DiskNumber -eq 1})
Add-WBBackupTarget -Policy $Policy -Target $Target -force
Add-WBSystemState -Policy $Policy
Set-WBPolicy -AllowDeleteOldBackups -Policy $Policy -force
```

#### **Add Test and Get Functions**

The Test function needs to return True if the system is already in the desired state.  For the example, I’m going to describe the desired state as one in which the system state backup policy exists and is at the desired time. I’m purposely ignoring the disk target for determining desired state in this example.

$BackupTime = \[datetime\]::today.AddHours(21)

if (($Policy -ne $Null) -and ($Policy.SystemState -eq $True) -and ($Policy.schedule -eq $BackupTime)) {return $True}

 TestScript = { $BackupTime = \[datetime\]::today.AddHours(21) $policy = get-wbPolicy if (($Policy -ne $Null) -and ($Policy.SystemState -eq $True) -and ($Policy.schedule -eq $BackupTime)) {return $True} else {return $False} }

```
    TestScript = {
        $BackupTime = [datetime]::today.AddHours(21)
        $policy = get-wbPolicy
        if (($Policy -ne $Null) -and ($Policy.SystemState -eq $True) -and ($Policy.schedule -eq $BackupTime)) {return $True}
        else {return $False}
        }
```

The Get function needs to return a single-value hash table with the name “Result” and a value as the value. In this case, I’d like to know the time of the backup when I retrieve the current DSC Configuration.

return @{Result = $policy.Schedule}

 GetScript = { $Policy = get-wbPolicy return @{Result = $policy.Schedule} }

```
   GetScript = {
        $Policy = get-wbPolicy
        return @{Result = $policy.Schedule}
        }
```

#### **Defining Parameters in Configuration Data**

To this point, I’ve hard-coded all the items I want set, such as Backup Time, and Disk Number, which isn’t a realistic production scenario. It was acceptable for that initial development stage, but now that the code is in a working state, I want to parameterize the backup time to configure. To demonstrate the use of parameters inside script resources, I’m going to put $BackupTime in a configuration data block.

BackupTime = \[datetime\]::today.AddHours(21)

$ConfigData = @{ AllNodes = @( @{ NodeName = '\*' } @{ NodeName = 'DC1' BackupTime = \[datetime\]::today.AddHours(21) } ) }

```
$ConfigData = @{
     AllNodes = @(
          @{
            NodeName = '*'
           }
          @{
            NodeName = 'DC1'
            BackupTime = [datetime]::today.AddHours(21)
           }
    )
}
```

#### Using Parameters in Script Resources

A MOF declares the desired state and does not typically contain executable code — except in the case in whic a script resource is used. Since the script will be executed when applying the configuration to the server and not when the MOF is compiled, both the script and the parameters required to execute the script need to be available in the MOF file. I need to use $Using to address the BackupTime parameter. $Using identifies a local variable (from the configuration data) in the remote command that will run when the DSC configuration is applied. The syntax for $Using is $Using:BackupTime (instead of $BackupTime). I’ve modified the lines where $BackupTime was used to now use $Using:BackupTime, and the complete configuration is listed below.

BackupTime = \[datetime\]::today.AddHours(21)

Import-DscResource -ModuleName PSDesiredStateConfiguration

WindowsFeature Windows-Server-Backup {

Name = 'Windows-Server-Backup'

if (($Policy -ne $Null) -and ($Policy.SystemState -eq $True) -and \`

($Policy.schedule -eq $Using:Node.BackupTime)) {return $True}

$BackupTime = \[datetime\]::today.AddHours(21)

Set-WBSchedule -Policy $Policy -Schedule $Using:Node.BackupTime

$Target = New\-WBBackupTarget -Disk (get-wbdisk | Where-Object {$\_.DiskNumber -eq 1})

Add-WBBackupTarget -Policy $Policy -Target $Target -force

Add-WBSystemState -Policy $Policy

Set-WBPolicy -AllowDeleteOldBackups -Policy $Policy -force

return @{Result = $policy.Schedule}

Backup -ConfigurationData $ConfigData

$ConfigData = @{ AllNodes = @( @{ NodeName = '\*' } @{ NodeName = 'DC1' BackupTime = \[datetime\]::today.AddHours(21) } ) } configuration Backup { Import-DscResource -ModuleName PSDesiredStateConfiguration Node DC1 { WindowsFeature Windows-Server-Backup { Name = 'Windows-Server-Backup' Ensure = 'Present' } Script NewSSBUPolicy { TestScript = { $policy = get-wbPolicy if (($Policy -ne $Null) -and ($Policy.SystemState -eq $True) -and \` ($Policy.schedule -eq $Using:Node.BackupTime)) {return $True} else {return $False} } SetScript = { $BackupTime = \[datetime\]::today.AddHours(21) $Policy = New-WBPolicy Set-WBSchedule -Policy $Policy -Schedule $Using:Node.BackupTime $Target = New-WBBackupTarget -Disk (get-wbdisk | Where-Object {$\_.DiskNumber -eq 1}) Add-WBBackupTarget -Policy $Policy -Target $Target -force Add-WBSystemState -Policy $Policy Set-WBPolicy -AllowDeleteOldBackups -Policy $Policy -force } GetScript = { $Policy = get-wbPolicy return @{Result = $policy.Schedule} } } } } Backup -ConfigurationData $ConfigData

```
$ConfigData = @{
    AllNodes = @(
        @{
            NodeName = '*'
           }
     @{
            NodeName = 'DC1'
            BackupTime = [datetime]::today.AddHours(21)
        }
    )
}

configuration Backup {
    
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Node DC1 {

        WindowsFeature Windows-Server-Backup {
            Name = 'Windows-Server-Backup'
            Ensure = 'Present'
            }

        Script NewSSBUPolicy {
            TestScript = {
                $policy = get-wbPolicy
                if (($Policy -ne $Null) -and ($Policy.SystemState -eq $True) -and `
                     ($Policy.schedule -eq $Using:Node.BackupTime)) {return $True}
                else {return $False}
                }
            SetScript = {
                $BackupTime = [datetime]::today.AddHours(21)
                $Policy = New-WBPolicy
                Set-WBSchedule -Policy $Policy -Schedule $Using:Node.BackupTime
                $Target = New-WBBackupTarget -Disk (get-wbdisk | Where-Object {$_.DiskNumber -eq 1})
                Add-WBBackupTarget -Policy $Policy -Target $Target -force
                Add-WBSystemState -Policy $Policy
                Set-WBPolicy -AllowDeleteOldBackups -Policy $Policy -force
                }
            GetScript = {
                $Policy = get-wbPolicy
                return @{Result = $policy.Schedule}
                }
        }
    }            
}

Backup -ConfigurationData $ConfigData
```

#### **Looking at the MOF File**

The MOF file contains all code within the script resource when the configuration is compiled. The compilation inserts ALL parameters passed in from the configuration’s param() block or from configuration data, not just the ones used by the script resource.  In addition, the parameters are inserted 3 times — in the TestScript, GetScript, and SetScript blocks. The parameters from the parameter block or configuration data are deserialized into XML and stored in the MOF file so that the script resource can use them. This is a distinct difference between a script resource and a custom resource. If you have many script resources and a lot of configuration data, MOF files can grow very large. This is a good reason to shy away from long-term use of script resources.

#### **Moving the Script Resource to a Custom Resource**

You’ve already completed 75 percent of the development required to create a custom resource once you have a working script resource. To convert a script resource into a custom resource, you’ll need to identify the properties needed in the schema.mof, such as an Ensure property, and also any parameters used in the script resource. Because much of the module is already written, it’s easy to change TestScript, SetScript, and GetScript into Test-TargetResource, Set-TargetResource, and Get-TargetResource functions. Since you’ve already covered the “Ensure = Present” portion of the resource with the existing code, you’ll need to add a test and set portion to cover the “Ensure = Absent” condition. Finally, package it all up as described in the [Microsoft documentation](https://msdn.microsoft.com/en-us/powershell/dsc/authoringresourcemof), and you now have your very own custom resource.

#### **It All Starts with the Script Resource**

As a result, the script resource can help to quickly determine if it is possible to do something with DSC without adding the packaging overhead of a custom resource. Most of all, it’s a great stepping stone if you’re just learning DSC, but you don’t have to stop there. Because you’ve used the script resource to determine that something is possible to accomplish with DSC, the script resource can quickly and easily be turned into a reusable custom resource that can be shared with others.
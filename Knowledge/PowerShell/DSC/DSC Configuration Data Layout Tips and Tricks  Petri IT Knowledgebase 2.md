Change is constant. IT shops have tons of moving parts as new servers are built and old servers are decommissioned. Is your PowerShell DSC configuration management design resilient enough to handle the constant change? This article will show you some tips and tricks for designing your DSC configuration and configuration data to reliably handle the growth in your environment.

![[images/devolutions_logo_blue.png]]

Sponsored Content

Devolutions Remote Desktop Manager

Devolutions RDM centralizes all remote connections on a single platform that is securely shared between users and across the entire team. With support for hundreds of integrated technologies — including multiple protocols and VPNs — along with built-in enterprise-grade password management tools, global and granular-level access controls, and robust mobile apps to complement desktop clients.

[

Learn More

](https://remotedesktopmanager.com/?utm_source=sponsorship&utm_medium=ads&utm_campaign=bww)

#### Separating Code from Environment

You might already know that it’s good practice to separate your configuration code from your configuration data into separate files. But why? Once the configuration code is developed and tested, it shouldn’t change unless there are changes to the server configuration – how a specific role is being built. When the code has gone through its testing cycle, there’s a level of confidence in the quality of the configuration. If you successfully build servers with a config for a specific role, but later have an issue with building a different server, you know to begin by investigating the piece that changed – what is being built – in the environmental data. Separating the how from the what allows you to keep that level of confidence in the configuration.

Once that configuration is completely developed – and checked into source control, it should only change when the code (a role’s build process) is changing. Adding a new server should not require you to change your code.  It only requires a change to the parameters being passed to the code. When the configuration is fully tested, and you’ve deployed servers using it, you develop a level of confidence when using it. If you later add a new server and have issues, the separation can narrow down where to look and how many lines of code you need to go through to find the problem.

#### Configuration Data the Typical Way

Once the configuration and configuration data have been separated, you might notice something about your config data – as your environment grows, so does your config data. Keeping the config data organized will help keep it maintainable as the environment grows, and it will also lessen the number of errors that are made as the configuration grows.

Many DSC config data examples focus on two sections, the AllNodes section and the node-specific section. You might even see configuration information jammed into the AllNodes section that doesn’t pertain to all nodes. But there’s also a third section which is often glossed over, called the “NonNodeData” section – and using this section can go a long way to keeping the config data clean and maintainable. Consider the following example:

#Common data for all nodes

PSDscAllowPlainTextPassword = $True

PSDscAllowDomainUser = $true

DomainDN = "DC=Test,DC=Pri"

DCDatabasePath = "C:\\NTDS"

DHCPIPStartRange = '192.168.3.200'

DHCPIPEndRange = '192.168.3.250'

DHCPSubnetMask = '255.255.255.0'

DHCPAddressFamily = 'IPv4'

DHCPLeaseDuration = '00:08:00'

DHCPScopeID = '192.168.3.0'

DHCPDnsServerIPAddress = '192.168.3.10'

DHCPRouter = '192.168.3.1'

$ConfigData=@{ # Node specific data AllNodes = @( @{ #Common data for all nodes NodeName = '\*' PSDscAllowPlainTextPassword = $True PSDscAllowDomainUser = $true DomainName = "Test.Pri" DomainDN = "DC=Test,DC=Pri" DCDatabasePath = "C:\\NTDS" DCLogPath = "C:\\NTDS" SysvolPath = "C:\\Sysvol" DHCPFeatures = @('DHCP') DHCPName = 'DHCP1' DHCPIPStartRange = '192.168.3.200' DHCPIPEndRange = '192.168.3.250' DHCPSubnetMask = '255.255.255.0' DHCPState = 'Active' DHCPAddressFamily = 'IPv4' DHCPLeaseDuration = '00:08:00' DHCPScopeID = '192.168.3.0' DHCPDnsServerIPAddress = '192.168.3.10' DHCPRouter = '192.168.3.1' } @{ # Node Specific Data NodeName = 's1' Role = @('DC', 'DHCP') } ) }

```
$ConfigData=@{
     # Node specific data
     AllNodes = @(
         @{
         #Common data for all nodes
         NodeName = '*'
         PSDscAllowPlainTextPassword = $True
         PSDscAllowDomainUser = $true
         DomainName = "Test.Pri"
         DomainDN = "DC=Test,DC=Pri"
         DCDatabasePath = "C:\NTDS"
         DCLogPath = "C:\NTDS"
         SysvolPath = "C:\Sysvol"
         DHCPFeatures = @('DHCP')
         DHCPName = 'DHCP1'
         DHCPIPStartRange = '192.168.3.200'
         DHCPIPEndRange = '192.168.3.250'
         DHCPSubnetMask = '255.255.255.0'
         DHCPState = 'Active'
         DHCPAddressFamily = 'IPv4'
         DHCPLeaseDuration = '00:08:00'
         DHCPScopeID = '192.168.3.0'
         DHCPDnsServerIPAddress = '192.168.3.10'
         DHCPRouter = '192.168.3.1'
         }
    @{
         # Node Specific Data
         NodeName = 's1'
         Role = @('DC', 'DHCP')
         }
     )
 }
```

This config data example contains data for one server, S1, which is a server with Active Directory (AD) and DHCP. And since there’s only one node, it’s appropriate to list all the properties in AllNodes – because AllNodes is for all machines. However, if a second server S2 is added and that server only has AD, suddenly not all the properties in AllNodes pertain to all nodes.

#### Organizing Configuration Data by Role with NonNodeData

There are two important things to note about NonNodeData. First, it doesn’t have to be called NonNodeData. It can be called just about anything that would be useful to a person reading or maintaining it. In the example below, I’m going to use it to define a role-specific section and call it DCData. Second, there can be multiple NonNodeData sections. I can use NonNodeData sections to logically separate role-specific properties, so I’ll have a DCData section and a DHCPData section. This is the exact same configuration data as shown in the first example, just more logically separated.

#Common data for all nodes

PSDscAllowPlainTextPassword = $True

PSDscAllowDomainUser = $true

DomainDN = "DC=Test,DC=Pri"

DCDatabasePath = "C:\\NTDS"

DHCPIPStartRange = '192.168.3.200'

DHCPIPEndRange = '192.168.3.250'

DHCPSubnetMask = '255.255.255.0'

DHCPAddressFamily = 'IPv4'

DHCPLeaseDuration = '00:08:00'

DHCPScopeID = '192.168.3.0'

DHCPDnsServerIPAddress = '192.168.3.10'

DHCPRouter = '192.168.3.1'

$ConfigData=@{ # Node specific data AllNodes = @( @{ #Common data for all nodes NodeName = '\*' PSDscAllowPlainTextPassword = $True PSDscAllowDomainUser = $true } @{ # Node Specific Data NodeName = 's1' Role = @('DC', 'DHCP') } @{ NodeName = 's2' Role = @('DC') } ) DCData = @{ DomainName = "Test.Pri" DomainDN = "DC=Test,DC=Pri" DCDatabasePath = "C:\\NTDS" DCLogPath = "C:\\NTDS" SysvolPath = "C:\\Sysvol" } DHCPData = @{ DHCPFeatures = @('DHCP') DHCPName = 'DHCP1' DHCPIPStartRange = '192.168.3.200' DHCPIPEndRange = '192.168.3.250' DHCPSubnetMask = '255.255.255.0' DHCPState = 'Active' DHCPAddressFamily = 'IPv4' DHCPLeaseDuration = '00:08:00' DHCPScopeID = '192.168.3.0' DHCPDnsServerIPAddress = '192.168.3.10' DHCPRouter = '192.168.3.1' } }

```
$ConfigData=@{
     # Node specific data
     AllNodes = @(
     @{
          #Common data for all nodes
          NodeName = '*'
          PSDscAllowPlainTextPassword = $True
          PSDscAllowDomainUser = $true
          }
     @{
          # Node Specific Data
          NodeName = 's1'
          Role = @('DC', 'DHCP')
          }
     @{
          NodeName = 's2'
          Role = @('DC')
          }
   )

     DCData = @{
          DomainName = "Test.Pri"
          DomainDN = "DC=Test,DC=Pri"
          DCDatabasePath = "C:\NTDS"
          DCLogPath = "C:\NTDS"
          SysvolPath = "C:\Sysvol"
          }

     DHCPData = @{
          DHCPFeatures = @('DHCP')
          DHCPName = 'DHCP1'
          DHCPIPStartRange = '192.168.3.200'
          DHCPIPEndRange = '192.168.3.250'
          DHCPSubnetMask = '255.255.255.0'
          DHCPState = 'Active'
          DHCPAddressFamily = 'IPv4'
          DHCPLeaseDuration = '00:08:00'
          DHCPScopeID = '192.168.3.0'
          DHCPDnsServerIPAddress = '192.168.3.10'
          DHCPRouter = '192.168.3.1'
          }
 }
```

#### Using NonNodeData in the Configuration

After separating out the config data into AllNodes, node-specific, and role-specific sections, you need to be able to retrieve those role-specific properties for use in the configuration. A configuration using the first example with all the settings in the AllNodes section would have used the special variable $Node to address the properties in the AllNodes section, for example:

xWaitForADDomain DscForestWait {

DomainName = $Node.DomainName

xWaitForADDomain DscForestWait { DomainName = $Node.DomainName RetryCount = '20' RetryIntervalSec = '60' }

```
xWaitForADDomain DscForestWait {
      DomainName = $Node.DomainName
      RetryCount = '20'
      RetryIntervalSec = '60'
      }
```

To use settings in NonNodeData sections, you use a different special variable: $ConfigurationData. This special variable addresses the entire configuration data hash table. Next comes the role-specific section DCData, and last, the property name. In a domain controller configuration, it would look like the following example:

DomainName = $ConfigurationData.DCData.DomainName

DomainAdministratorCredential = $Credential

SafemodeAdministratorPassword = $Credential

DatabasePath = $ConfigurationData.DCData.DCDatabasePath

LogPath = $ConfigurationData.DCData.DCLogPath

SysvolPath = $ConfigurationData.DCData.SysvolPath

DependsOn = '\[WindowsFeature\]AD-Domain-Services'

xADDomain 'FirstDC' { DomainName = $ConfigurationData.DCData.DomainName DomainAdministratorCredential = $Credential SafemodeAdministratorPassword = $Credential DatabasePath = $ConfigurationData.DCData.DCDatabasePath LogPath = $ConfigurationData.DCData.DCLogPath SysvolPath = $ConfigurationData.DCData.SysvolPath DependsOn = '\[WindowsFeature\]AD-Domain-Services' }

```
xADDomain 'FirstDC' {
     DomainName = $ConfigurationData.DCData.DomainName
     DomainAdministratorCredential = $Credential
     SafemodeAdministratorPassword = $Credential
     DatabasePath = $ConfigurationData.DCData.DCDatabasePath
     LogPath = $ConfigurationData.DCData.DCLogPath
     SysvolPath = $ConfigurationData.DCData.SysvolPath
     DependsOn = '[WindowsFeature]AD-Domain-Services'
     }
```

At this point, the configuration data is nice and organized, but the configuration code itself is now a little messy. It was much easier to type $Node.DomainName than $ConfigurationData.DCData.DomainName. $Node.DomainName is easier to read, too. You might see examples that look like this in DSC documentation, so it’s important to understand what it looks like, but there’s an easier way. With one simple change, this config can be brought back to looking just as familiar as using $Node.

$DCData = $ConfigurationData.DCData

DomainName = $DCData.DomainName

DomainAdministratorCredential = $Credential

SafemodeAdministratorPassword = $Credential

DatabasePath = $DCData.DCDatabasePath

LogPath = $DCData.DCLogPath

SysvolPath = $DCData.SysvolPath

DependsOn = '\[WindowsFeature\]AD-Domain-Services'

$DCData = $ConfigurationData.DCData xADDomain 'FirstDC' { DomainName = $DCData.DomainName DomainAdministratorCredential = $Credential SafemodeAdministratorPassword = $Credential DatabasePath = $DCData.DCDatabasePath LogPath = $DCData.DCLogPath SysvolPath = $DCData.SysvolPath DependsOn = '\[WindowsFeature\]AD-Domain-Services' }

```
$DCData = $ConfigurationData.DCData

xADDomain 'FirstDC' {
      DomainName = $DCData.DomainName
      DomainAdministratorCredential = $Credential
      SafemodeAdministratorPassword = $Credential
      DatabasePath = $DCData.DCDatabasePath
      LogPath = $DCData.DCLogPath
      SysvolPath = $DCData.SysvolPath
      DependsOn = '[WindowsFeature]AD-Domain-Services'
      }
```

By adding a variable $DCData and assigning it to $ConfigurationData.DCData, $DCData now contains the entry point into the DC-specific properties in the hash table. As a result, this configuration now looks more familiar and less confusing.

#### The Importance of Organization Strategies

In conclusion, separating the configuration and the config data helps with troubleshooting as the config and environment grow larger. If you’ve ever had to try to find a missing bracket in 500 lines of code, you know how time-consuming troubleshooting simple things can be. By keeping the config and config data separate (and therefore shorter) you can save yourself a lot of grief.

Organizing the config data into role-specific NonNodeData sections also helps with maintainability – it is easy to figure out which properties go with which roles, and it becomes much easier to make changes as you add roles.

Finally, using NonNodeData sections in the configuration doesn’t have to be a tedious typing exercise, and adding some simple PowerShell code allows for easier readability of the configuration code.
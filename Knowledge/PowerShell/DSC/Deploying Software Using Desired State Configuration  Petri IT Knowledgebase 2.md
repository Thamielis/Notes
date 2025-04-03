Desired State Configuration (DSC) is an awesome configuration management tool that is built into Windows on top of PowerShell. It allows administrators to declare what the state of a server should look like. The DSC agent, known as the Local Configuration Manager, will check for compliance with the desired state. If necessary, it will correct.

![[images/devolutions_logo_blue.png]]

Sponsored Content

Devolutions Remote Desktop Manager

Devolutions RDM centralizes all remote connections on a single platform that is securely shared between users and across the entire team. With support for hundreds of integrated technologies — including multiple protocols and VPNs — along with built-in enterprise-grade password management tools, global and granular-level access controls, and robust mobile apps to complement desktop clients.

[

Learn More

](https://remotedesktopmanager.com/?utm_source=sponsorship&utm_medium=ads&utm_campaign=bww)

**Configuration Management or Software Deployment?**
----------------------------------------------------

Throughout the PowerShell community, many administrators want to use DSC as a software deployment mechanism. While this is possible, DSC should not take the place of System Center Configuration Manager (SCCM) or any other third-party software deployment product. There are a couple of options for DSC configurations to deploy software. You may find as you navigate down this path that there are other less cumbersome options.

**The Package Resource**
------------------------

The first option is to deploy software using the built-in Package Resource. The package resource deploys software contained in MSI files. It requires:

*   Name: This is the name of the software package.
*   Path: This is the path to the MSI file.
*   Product ID: This is the GUID of the version of the software to install.

Finding the Product ID from an MSI is fairly easy. I found the Product ID of my sample MSI file on the properties of the file itself. It was under the Details tab of the Origin section. I did not find a PowerShell command to retrieve it from the MSI file itself. If you install the software on a test machine, Get-CIMInstance can also return the product ID via WMI.

**Optional Arguments for the Package Resource**
-----------------------------------------------

Like most built-in resources, the package resource contains an Ensure property. This is used to determine if the software should be present/installed or absent/uninstalled. Next, it also contains an Arguments property. This is where you specify other install parameters. Finally, it also contains a ReturnCode property, which specifies acceptable return codes. See below for an example of a DSC configuration that is using a package resource.

```
Configuration Test {
    Node localhost {
        Package SevenZip {
            Name = "7-Zip 16.04 (x64 Edition)"
            Path = "C:\Users\majst\downloads\7z1604-x64.MSI"
            Arguments = 'INSTALLDIR="C:\Tools\7Zip"'
            Ensure    = "Present"
            ProductID = '23170F69-40C1-2702-1604-000001000000'
            ReturnCode = 0
            }
        }
    }
Test
```

**What If I Do Not Have an MSI?**
---------------------------------

At times, you may have an EXE available to you instead of an MSI package. While you may have some success installing it using the Package resource, do not do it. You will be better off for long-term maintainability if you can find an MSI package for your installation. This might be a quick internet search.

**Newly Released — the MSIPackage Resource**
--------------------------------------------

While all the in-box DSC resources are still available in your initial OS installation from the PSDesiredStateConfiguration module, Microsoft is slowly moving all these resources to a new module. This is available from the PowerShell Gallery, [PSDSCResources](https://www.powershellgallery.com/packages/PSDscResources/2.4.0.0). PSDSCResources is only available for WMF 5.1 and it overwrites the current in-box resources. There has not been a Package resource included in this module to date but it now contains the MSIPackage resource. My interpretation of this change is that this resource should only be used to install MSIs. This is based on the naming convention and it is not intended for other package formats, such as .EXEs.

**Exploring Other PowerShell Gallery Options**
----------------------------------------------

Yes, there are some community-based resources for installing common software but there are not many. Some examples of packages already on the gallery are Firefox using the xFireFox resource and xChrome. Glancing at the xChrome resource code, it appears to download Chrome MSI from the internet. It installs it using the Package resource but the Product ID in the Package resource definition is blank.

**Another Option — Chocolatey Goodness**
----------------------------------------

The collection of resources in the Gallery for deploying software is not very robust. There is another community-based solution called [Chocolatey](https://chocolatey.org/). The folks over at Chocolatey maintain a very large repository of software packages that can be used with PowerShell or DSC to deploy software. Chocolatey is a package manager similar to Yum or Apt-get for Linux.

**Discovering Chocolatey**
--------------------------

I do not work for Chocolatey but I was at the PowerShell and DevOps Global Summit last week. I was able to see some of the presentation on Chocolatey and it inspired me to research more. The awesome thing about Chocolatey is the number of packages available. At this writing, there are approximately 4800 software packages available on Chocolatey. However, there were only a few options available on the Gallery.

**Chocolatey in the Enterprise**
--------------------------------

Chocolatey has a [community feed](https://chocolatey.org/packages) for development and other non-production scenarios. Alternatively, there are commercial options available, such as Chocolatey for Business. In an enterprise production environment, the Business option appears to be the best option. Rather than trusting an entire repository of community-built packages, you can support a private internal Chocolatey repository. An internal repository allows installation of only trusted packages that you have approved for production use. Depending on your deployment design, it would not require internet connectivity, which is prohibited in some production environments.

**Installing Chocolatey and Chocolatey Packages with Desired State Configuration**
----------------------------------------------------------------------------------

There is already a DSC module named cChoco in the PowerShell Gallery. This is for installing Chocolatey and Chocolatey packages. The (c) prefix in cChoco does mean that someone in the PowerShell community, not Microsoft, wrote this module. You need to ensure that this module, as well as any packages you may install with it, have been vetted according to your company’s policies for open-source software. To install Chocolatey and subsequently Chocolatey packages, use the DSC resources contained in the cChoco module. cChocoInstaller installs the Chocolatey package and cChocoPackageInstaller installs any Chocolatey package from the repository.

 Configuration packageDemo {

Import-DscResource -ModuleName cChoco

cChocoinstaller Install {

cChocoPackageInstaller Install7Zip {

DependsOn = '\[cChocoInstaller\]Install'

 Configuration packageDemo { Import-DscResource -ModuleName cChoco Node TgtPull { cChocoinstaller Install { InstallDir = "C:\\Choco" } cChocoPackageInstaller Install7Zip { Name = '7Zip.install' DependsOn = '\[cChocoInstaller\]Install' } } } PackageDemo

```
 Configuration packageDemo {
    Import-DscResource -ModuleName cChoco
    Node TgtPull {
        cChocoinstaller Install {
            InstallDir = "C:\Choco"
            }
        
        cChocoPackageInstaller Install7Zip {
            Name = '7Zip.install'
            DependsOn = '[cChocoInstaller]Install'
            }
        }
    }
PackageDemo
```

**Recap of Desired State Configuration Software Deployment Options**     
-------------------------------------------------------------------------

It is still possible to deploy software, especially those with MSIs, using the DSC built-in package resource. In addition, there are a limited number of PowerShell Gallery options for software deployment. However, if I were looking to perform complex software deployments in an enterprise setting using DSC, I would be looking at the commercial option for Chocolatey as a potential solution. The ability to secure my own repository with only trusted software would weigh heavily in its favor. Since there is already a resource in the PowerShell Gallery for DSC, this greatly simplifies the development of the DSC configuration.
---
created: 2022-03-04T12:32:02 (UTC +01:00)
tags: []
source: https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iv-understanding-and-building-the-autounattend-xml-file/
author: Published by feardamhan
---

# Part 04 Understanding and Building the autounattend.xml file

> ## Excerpt
> Typically, unattended windows installations are controlled using an autounattend.xml file stored at the root of the installation media. However, they can be stored at the root of any drive mounted …

---
Typically, unattended windows installations are controlled using an **autounattend.xml** file stored at the root of the installation media. However, they can be stored at the root of _any_ drive mounted to the machine during boot (Windows will search them all)

The installation itself uses several passes (consider these to be stages of installation). You can achieve several parts of the desired identity configuration during these passes and even install a few bits of software.

A good resource for understanding the order of passes and what each of them is intended for can be found here: [https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/how-configuration-passes-work](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/how-configuration-passes-work)

Within each pass you can add one or more ‘components’ which are categories of functionality that can be executed during those phases. A vital reference for that (in case you go beyond what I show in the posts) is this: [https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/](https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/)

### Sample autounattend.xml template file

With all that said, here’s a sample file with some key strings included so that our PowerShell can find and replace them with values from our JSON inputs. Note, this will not work if used directly, as those strings need to be replaced before it’s usable:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend">
   <settings pass="windowsPE">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-International-Core-WinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <SetupUILanguage>
            <UILanguage>en-US</UILanguage>
         </SetupUILanguage>
         <InputLocale>en-US</InputLocale>
         <SystemLocale>en-US</SystemLocale>
         <UILanguage>en-US</UILanguage>
         <UserLocale>en-US</UserLocale>
      </component>
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <ImageInstall>
            <OSImage>
               <InstallFrom>
                  <MetaData wcm:action="add">
                     <Key>/IMAGE/NAME</Key>
                     <Value>Windows Server 2016 SERVERDATACENTER</Value>
                  </MetaData>
               </InstallFrom>
               <InstallTo>
                  <DiskID>0</DiskID>
                  <PartitionID>4</PartitionID>
               </InstallTo>
            </OSImage>
         </ImageInstall>
         <UserData>
            <ProductKey>
               <Key><!--REPLACE WITH PRODUCTKEY--></Key>
               <WillShowUI>Never</WillShowUI>
            </ProductKey>
            <AcceptEula>true</AcceptEula>
         </UserData>
         <DiskConfiguration>
            <WillShowUI>OnError</WillShowUI>
            <Disk wcm:action="add">
               <DiskID>0</DiskID>
               <WillWipeDisk>true</WillWipeDisk>
               <CreatePartitions>
                  <CreatePartition wcm:action="add">
                     <Order>1</Order>
                     <Size>500</Size>
                     <Type>Primary</Type>
                  </CreatePartition>
                  <CreatePartition wcm:action="add">
                     <Order>2</Order>
                     <Size>100</Size>
                     <Type>EFI</Type>
                  </CreatePartition>
                  <CreatePartition wcm:action="add">
                     <Order>3</Order>
                     <Size>16</Size>
                     <Type>MSR</Type>
                  </CreatePartition>
                  <CreatePartition wcm:action="add">
                     <Order>4</Order>
                     <Extend>true</Extend>
                     <Type>Primary</Type>
                  </CreatePartition>
               </CreatePartitions>
               <ModifyPartitions>
                  <ModifyPartition wcm:action="add">
                     <Order>1</Order>
                     <PartitionID>1</PartitionID>
                     <Label>WinRE</Label>
                     <Format>NTFS</Format>
                     <TypeID>de94bba4-06d1-4d40-a16a-bfd50179d6ac</TypeID>
                  </ModifyPartition>
                  <ModifyPartition wcm:action="add">
                     <Order>2</Order>
                     <PartitionID>2</PartitionID>
                     <Label>System</Label>
                     <Format>FAT32</Format>
                  </ModifyPartition>
                  <ModifyPartition wcm:action="add">
                     <Order>3</Order>
                     <PartitionID>3</PartitionID>
                  </ModifyPartition>
                  <ModifyPartition wcm:action="add">
                     <Order>4</Order>
                     <PartitionID>4</PartitionID>
                     <Label>Windows</Label>
                     <Format>NTFS</Format>
                  </ModifyPartition>
               </ModifyPartitions>
            </Disk>
         </DiskConfiguration>
      </component>
   </settings>
   <settings pass="offlineServicing">
     <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <ComputerName><!--REPLACE WITH MACHINENAME--></ComputerName>
      </component>
   </settings>
   <settings pass="specialize">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-TCPIP" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <Interfaces>
            <Interface wcm:action="add">
               <Ipv4Settings>
                  <DhcpEnabled>false</DhcpEnabled>
               </Ipv4Settings>
               <Ipv6Settings>
                  <DhcpEnabled>false</DhcpEnabled>
               </Ipv6Settings>
               <Identifier>Ethernet0</Identifier>
               <UnicastIpAddresses>
                  <IpAddress wcm:action="add" wcm:keyValue="1"><!--REPLACE WITH IPCIDR--></IpAddress>
               </UnicastIpAddresses>
               <Routes>
                  <Route wcm:action="add">
                     <Identifier>1</Identifier>
                     <Prefix>0.0.0.0/0</Prefix>
                     <NextHopAddress><!--REPLACE WITH GATEWAY--></NextHopAddress>
                  </Route>
               </Routes>
            </Interface>
         </Interfaces>
      </component>
  <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State Jump " xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance Jump " name="Microsoft-Windows-DNS-Client" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
<DNSDomain><!--REPLACE WITH CHILD DOMAIN--></DNSDomain>
<DNSSuffixSearchOrder>
  <DomainName wcm:action="add" wcm:keyValue="1"><!--REPLACE WITH CHILD DOMAIN--></DomainName>
  <DomainName wcm:action="add" wcm:keyValue="2"><!--REPLACE WITH ROOT DOMAIN--></DomainName>
</DNSSuffixSearchOrder>
   <UseDomainNameDevolution>true</UseDomainNameDevolution> 
      </component>
   <component name="Networking-MPSSVC-Svc" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <DomainProfile_EnableFirewall>false</DomainProfile_EnableFirewall>
            <PrivateProfile_EnableFirewall>false</PrivateProfile_EnableFirewall>
            <PublicProfile_EnableFirewall>false</PublicProfile_EnableFirewall>
       </component>
   <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Deployment" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <RunSynchronous>
            <RunSynchronousCommand wcm:action="add">
               <Path>D:\Software\setup64.exe /s /v"/qn REBOOT=R"</Path>
               <Order>1</Order>
            </RunSynchronousCommand>
         </RunSynchronous>
      </component>  
   </settings>
      <settings pass="oobeSystem">
      <component xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
         <UserAccounts>
            <AdministratorPassword>
               <Value><!--REPLACE WITH ADMINISTRATOR PASSWORD--></Value>
               <PlainText>true</PlainText>
            </AdministratorPassword>
         </UserAccounts>
 <FirstLogonCommands>
<SynchronousCommand wcm:action="add">
<Order>1</Order>
<CommandLine>REG ADD &quot;HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff&quot; /F</CommandLine>
<Description>No New Network Block</Description>
<RequiresUserInput>true</RequiresUserInput>
</SynchronousCommand>
          </FirstLogonCommands>
      </component>
   </settings>
   <cpi:offlineImage xmlns:cpi="urn:schemas-microsoft-com:cpi" cpi:source="wim:c:/temp/2016/sources/install.wim#Windows Server 2016 SERVERDATACENTER" />
</unattend>
```

Things to note (if you poke around in all that XML)

-   You will find the below values. Our PowerShell Function will read in the basic template, search for and replace these strings with values from our inputs JSON before saving it to a working folder (the working folder will later be formed into a small ISO file that provides the configuration details for the VM we create).
    -   <!–REPLACE WITH PRODUCTKEY–>
    -   <!–REPLACE WITH MACHINENAME–>
    -   <!–REPLACE WITH IPCIDR–>
    -   <!–REPLACE WITH GATEWAY–>
    -   <!–REPLACE WITH ADMINISTRATOR PASSWORD–>
    -   <!–REPLACE WITH CHILD DOMAIN–>
    -   <!–REPLACE WITH ROOT DOMAIN–>
-   You will see a line like the below, which installs VMware Tools. When we created the combined binaries ISO in the previous post, we included a copy of VMware tools in the Software folder ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/1f642.svg)
    -   D:\\Software\\setup64.exe /s /v”/qn REBOOT=R”
-   This answer file disables the Windows Firewall
-   We’ve setup primary domain suffix and DNS search domains in preparation for when we join this to the domain

The above is more or less generic, designed to prep a VM for adding to a child domain, where we also have the root domain listed in the DNS search domains. Net result will be be a Windows VM deployed with the name and IP that we want associated with it.

### PowerShell Function

The PowerShell function(s) that creates this tailored version of the template file also creates the Configure-Host.ps1 file that further customizes the host once Windows setup is complete. Therefore I’ll just cover the little bit of that PowerShell that deals with the autounttend.xml customization, so that we can concentrate on the Configure-Host.ps1 content based on the type of host we are creating in subsequent posts.

```powershell
#create necessary folders
    LogMessage "Creating Temporary Folders"
    New-Item -ItemType Directory -Path $buildfolder | Out-Null
    New-Item -ItemType Directory -Path "$buildfolder\SupportingFiles" | Out-Null
    New-Item -ItemType File -Path "$buildfolder\SupportingFiles\configure-host.ps1" | Out-Null
    LogMessage "Creating and Injecting Windows Unattended Installation File"
    $DestinationAnswerFilesIsoPath = "$isosPath\$environment-$($machineObject.machinename)-answerfiles.iso"
    $AutoUnattendXml = Get-Content $iaasTemplateXml
    $AutoUnattendXml | ForEach-Object { $_ `
        -replace '<!--REPLACE WITH PRODUCTKEY-->',$commonJSON.isoGeneration.productKey `
        -replace '<!--REPLACE WITH MACHINENAME-->',$machineObject.machinename `
        -replace '<!--REPLACE WITH IPCIDR-->', $machineObject.ipCidr `
        -replace '<!--REPLACE WITH GATEWAY-->',$machineObject.gateway `
        -replace '<!--REPLACE WITH ADMINISTRATOR PASSWORD-->',$commonJson.environment.commonPassword `
        -replace '<!--REPLACE WITH CHILD DOMAIN-->',$sharedDetails.activeDirectory.childDomain `
        -replace '<!--REPLACE WITH ROOT DOMAIN-->',$commonJSON.activeDirectory.rootDomain `
    } | Set-Content "$buildfolder\SupportingFiles\autounattend.xml"
```

Now we need to create the other files needed to customize the VM and create an answer files ISO. Thats up next.

### Posts in this Series

-   [Part 1: Overview](https://feardamhan.com/2020/01/14/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-i-overview/)
-   [Part 2: Reading JSON](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ii-sample-json-and-reading-it/)
-   [Part 3: Creating a Single Binaries ISO](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iii-building-a-single-binaries-iso/)
-   [Part 4: Understanding the autoUnattend.xml](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iv-understanding-and-building-the-autounattend-xml-file/)
-   [Part 5: Creating a Configure-Host.ps1 and Building the Answerfiles ISO for SQL Server](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-v-build-a-configure-host-ps1-and-answer-files-iso-for-sql-server/)
-   [Part 6: Creating the VM](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-vi-creating-and-configuring-the-vm/)
-   [Part 7: Creating a New Active Directory Forest](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ix-build-a-configure-host-ps1-and-answer-files-iso-for-new-child-domain-in-an-existing-forest/)
-   [Part 8: Adding a Domain Controller to an Existing Domain](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-viii-build-a-configure-host-ps1-and-answer-files-iso-for-new-domain-controller-in-existing-domain/)
-   [Part 9: Adding a New Child Domain to an Existing Active Directory Forest](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ix-build-a-configure-host-ps1-and-answer-files-iso-for-new-child-domain-in-an-existing-forest/)

---
created: 2022-03-10T13:26:20 (UTC +01:00)
tags: []
source: https://adamtheautomator.com/active-directory-site/
author: 
---

# How to Manage Active Directory Sites with PowerShell

> ## Excerpt
> Understand how to manage Active Directory sites with PowerShell in this handy step-by-step tutorial.

---
As an administrator of Active Directory (AD), you’re probably managing users, computers, and organizational units (OUs) most of the time. Less frequently, you will need to manage Active Directory sites. But when you need to use the command line or automate AD site creation, PowerShell is a must.

In this tutorial, you will learn how to manage AD sites using PowerShell, so you never have to open a Windows MMC ever again!

-   [Prerequisites](https://adamtheautomator.com/active-directory-site/#Prerequisites "Prerequisites")
-   [Inspecting Active Directory Sites, Links, and Subnets with PowerShell](https://adamtheautomator.com/active-directory-site/#Inspecting_Active_Directory_Sites_Links_and_Subnets_with_PowerShell "Inspecting Active Directory Sites, Links, and Subnets with PowerShell")
    -   [Active Directory Sites](https://adamtheautomator.com/active-directory-site/#Active_Directory_Sites "Active Directory Sites")
    -   [Active Directory Site Links](https://adamtheautomator.com/active-directory-site/#Active_Directory_Site_Links "Active Directory Site Links")
    -   [Active Directory Subnets](https://adamtheautomator.com/active-directory-site/#Active_Directory_Subnets "Active Directory Subnets")
-   [Creating Active Directory Sites](https://adamtheautomator.com/active-directory-site/#Creating_Active_Directory_Sites "Creating Active Directory Sites")
-   [Inspecting Active Directory Sites, Links, and Subnets with Active Directory Sites and Services](https://adamtheautomator.com/active-directory-site/#Inspecting_Active_Directory_Sites_Links_and_Subnets_with_Active_Directory_Sites_and_Services "Inspecting Active Directory Sites, Links, and Subnets with Active Directory Sites and Services")
-   [Removing Active Directory Sites](https://adamtheautomator.com/active-directory-site/#Removing_Active_Directory_Sites "Removing Active Directory Sites")
-   [Conclusion](https://adamtheautomator.com/active-directory-site/#Conclusion "Conclusion")

## Prerequisites

This tutorial will have various demos. To follow along, be sure you have the following:

-   Windows PowerShell v5.1 or greater – This tutorial will PowerShell 5.1.

-   An AD domain – The examples will use a Windows Server 2019 domain controller (DC), but the commands will work for any version.
-   A domain-joined Windows 10 machine logged in as an AD user part of the Enterprise Admins group.
-   [Remote Server Administration Tools (RSAT)](https://adamtheautomator.com/powershell-import-active-directory/) installed on the AD-joined computer.

## Inspecting Active Directory Sites, Links, and Subnets with PowerShell

Let’s kick off this tutorial by first getting a lay of the land and inspecting what AD sites your environment has to work with.

> _Do you have compromised passwords in your Active Directory? Find out with [Specops Password Auditor Free](https://specopssoft.com/product/specops-password-auditor/?utm_source=ATA&utm_medium=referral&utm_campaign=ATA%20promo%202021&utm_content=SPA%20in-article%20link)._

Assuming you’re on a domain-joined Windows PC with the ActiveDirectory PowerShell module installed, open PowerShell to get started.

### Active Directory Sites

1\. Run the [`Get-AdReplicationSite` cmdlet](https://docs.microsoft.com/en-us/powershell/module/activedirectory/get-adreplicationsite) with no parameters. PowerShell will return the Active Directory site the computer you’re running the command from is in. In the screenshot below, the computer running `Get-ADReplicationSite` is in the `Washington` site.

> _To find all of the PowerShell commands to work with AD sites, run `Get-Command "*ADReplication*"`._

![Get-ADReplicationSite with no parameters only gives the current site.](https://adamtheautomator.com/wp-content/uploads/2021/05/Get-ADReplicationSite.png)

Get-ADReplicationSite with no parameters only gives the current site.

2\. To find all Active Directory sites for the entire domain, run `Get-AdReplicationSite` using the `Filter` parameter and an asterisk (`*`).

> _The `Filter` parameter allows you to filter sites in many different ways. For more information on how to build queries for the `Filter` parameter, run the command `Get-Help about_ActiveDirectory_Filter`._

![Show all sites with the "-Filter *" parameter.](https://adamtheautomator.com/wp-content/uploads/2021/05/Get-ADReplicationSiteAll.png)

Show all sites with the “-Filter \*” parameter.

### Active Directory Site Links

To find AD site links, the process is nearly identical to finding sites; just invoke the [`Get-ADReplicationSiteLink` command](https://docs.microsoft.com/en-us/powershell/module/activedirectory/get-adreplicationsitelink?view=windowsserver2019-ps) instead. But, unlike the `Get-ADReplicationSite` command, the `Get-ADReplicationSiteLink` command _requires_ you to specify the `Filter` parameter.

You can see below the tutorial environment has a single link called `Washington-MarylandLink` linking the `Maryland` and `Washington` sites.

![Get the Inter-Site link details.](https://adamtheautomator.com/wp-content/uploads/2021/05/Get-ADReplicationSiteLink.png)

Get the Inter-Site link details.

### Active Directory Subnets

Finally, you can find the subnets with the [`Get-ADReplicationSubnet` command](https://docs.microsoft.com/en-us/powershell/module/activedirectory/get-adreplicationsubnet), the same as inspecting Active Directory sites and links.

![Get Subnet details.](https://adamtheautomator.com/wp-content/uploads/2021/05/Get-ADReplicationSiteSubnet.png)

Get Subnet details.

## Creating Active Directory Sites

Now that you know how to view existing AD sites, let’s jump into a demo on creating new sites with PowerShell. An AD site consists of three components, all of which you can create with PowerShell:

-   The site
-   One or more subnets in the site
-   A replication link

To set up a new AD site assuming you still have PowerShell open:

1\. Create the new AD site using the [`New-ADReplicationSite` command](https://docs.microsoft.com/en-us/powershell/module/activedirectory/new-adreplicationsite?view=windowsserver2019-ps) and providing the `Name`. The command below creates a site named `Hawaii`.

```
New-ADReplicationSite -Name "Hawaii"
```

2\. Confirm you’ve created the site by running `Get-ADReplicationSite` using the `Filter` parameter to find all sites.

> _To limit output, the example below is piping output from `Get-AdReplicationSite` to the [`Select-Object` cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.1) to only display the `Name` property._

```
Get-AdReplicationSite Filter * | Select Name
```

You can see below; the tutorial environment has three sites available; Washington, Maryland, and Hawaii.

![Add a new Site in PowerShell.](https://adamtheautomator.com/wp-content/uploads/2021/05/New-ADReplicationSite.png)

Add a new Site in PowerShell.

3\. Next, create a subnet and assign it to the site with the [`New-ADReplicationSubnet` command](https://docs.microsoft.com/en-us/powershell/module/activedirectory/new-adreplicationsubnet?view=windowsserver2019-ps) providing the `Name`/network in [CIDR notation](https://www.keycdn.com/support/what-is-cidr#:~:text=CIDR%2C%20which%20stands%20for%20Classless,the%20growth%20of%20routing%20tables) followed by the `Site` name. The below command is creating a subnet for the 10.3.22.0/24 network attached to the Hawaii site.

```
New-ADReplicationSubnet -Name "10.3.22.0/24" -Site Hawaii
```

After you’ve created the site, run `Get-ADReplicationSubnet` to confirm you’ve created the subnet as expected. Notice that the site shows as Hawaii.

![Add a new Subnet to AD Sites.](https://adamtheautomator.com/wp-content/uploads/2021/05/New-ADReplicationSubnet.png)

Add a new Subnet to AD Sites.

4\. Finally, create a new site link with the [`New-ADReplicationSiteLink` command](https://docs.microsoft.com/en-us/powershell/module/activedirectory/new-adreplicationsitelink?view=windowsserver2019-ps) specifying the name of the link and the sites to link together. The below example is creating a site link called `Washington-Hawaii` linking the `Washington` and `Hawaii` sites together.

> _The site link name is completely customizable, but it’s common to include the sites included in the site link in the name._

```
New-ADReplicationSiteLink -Name "Washington-Hawaii" -SitesIncluded Washington,Hawaii
```

Once created, run the `Get-ADReplicationSiteLink` to confirm you’ve created the link as expected.

![Adding the replication link between sites. ](https://adamtheautomator.com/wp-content/uploads/2021/05/New-ADReplicationSiteLink.png)

Adding the replication link between sites.

> _To add sites to an existing Active Directory site link, invoke the [`Set-ADReplicationSiteLink` command](https://docs.microsoft.com/en-us/powershell/module/activedirectory/set-adreplicationsitelink?view=windowsserver2019-ps) a PowerShell hashtable and an `Add` key like `Set-ADReplicationSiteLink -Identity "Washington-MarylandLink" -SitesIncluded @{Add="Hawaii"}`._

## Inspecting Active Directory Sites, Links, and Subnets with Active Directory Sites and Services

Even though this tutorial is about PowerShell, it’s still important to understand how to inspect and manage AD sites via the GUI. You probably won’t be using PowerShell all of the time to manage AD sites.

Click on Start and type _Active Directory Sites_. The **Active Directory Sites and Services** open should appear in the **Windows Administrative Tools** program group.

![Opening Active Directory Sites and Services.](https://adamtheautomator.com/wp-content/uploads/2021/05/start-menu.png)

Opening Active Directory Sites and Services.

When you open _Active Directory Sites and Services_, you will see a screen like the one shown below. The AD Sites and Services tool has a few interesting areas:

1.  The DC the tool is currently connected to. Knowing the DC is helpful because it may take multiple hours to replicate between sites when you make a change.
2.  **Inter-Site Transports** – The protocols that the sites will use for replication.
3.  **Subnets** – The subnets that are assigned to each site.
4.  The list of sites – In a default domain, you will only see **Default-First-Site-Name** here, but the tutorial environment has a **Maryland** and **Washington** site created.

![Active Directory Sites and Services](https://adamtheautomator.com/wp-content/uploads/2021/05/Untitled-31-3.png)

Active Directory Sites and Services

If you expand the items in AD Sites and Services, you’ll see:

1.  An IP transport – The tutorial transport or site link is called **Washington-MaryandLink**.
2.  **Subnets** – The tutorial has two subnets of 10.1.22.0/24 for the Washington site and 10.2.22.0/24 for the Maryland site.
3.  The domain controller assigned to the **Maryland** site.
4.  The domain controller assigned to the **Washington** site.

![Fully expanded Sites and Services tool for the examples in the article.](https://adamtheautomator.com/wp-content/uploads/2021/05/Untitled-32-3.png)

Fully expanded Sites and Services tool for the examples in the article.

## Removing Active Directory Sites

So you’ve got some sites created but it’s time to decommission then. No problem. Removing an Active Directory site is simply a reversal of this process.

> _Before you remove a site, be sure that no client machines are using the site’s subnets any longer. Check out the [netlogon.log file](https://adamtheautomator.com/netlogon-log/) for information on how to discover clients in sites._

To remove an AD site with PowerShell:

1\. First, remove the site link with the `Set-ADReplicationSiteLink` command using the `Remove` key in the hashtable passed to the `SitesIncluded` parameter and verify the removal. The below example removes the `Maryland` site from the `Washington-MarylandLink` site.

```
Set-ADReplicationSiteLink -Identity "Washington-MarylandLink" -SitesIncluded @{Remove="MaryLand"}
 Get-ADReplicationSiteLink -Filter *
```

Notice that now both site links connect the same two sites (the `SitesIncluded` property).

![Using Set-ADReplicationSiteLink to remove a site from a link.](https://adamtheautomator.com/wp-content/uploads/2021/05/Set-ADReplicationSiteLink2.png)

Using Set-ADReplicationSiteLink to remove a site from a link.

2\. Remove the `Washington-Maryland` link entirely with the [`Remove-ADReplicationSiteLink` command](https://docs.microsoft.com/en-us/powershell/module/activedirectory/remove-adreplicationsitelink?view=windowsserver2019-ps) and verify the link is removed.

```
Remove-ADReplicationSiteLink -Identity "Washington-MarylandLink"
 hit y at the prompt
 Get-ADReplicationSiteLink
```

![Removing the Active Directory site link](https://adamtheautomator.com/wp-content/uploads/2021/05/Remove-ADReplicationSiteLink.png)

Removing the Active Directory site link

3\. Now, remove the links that were part of the site with the `[Remove-ADReplicationSubnet](https://docs.microsoft.com/en-us/powershell/module/activedirectory/remove-adreplicationsubnet?view=windowsserver2019-ps)` command and verify the removal.

```
Remove-ADReplicationSubnet -Identity "10.2.22.0/24"
 Get-ADReplicationSubnet -Filter *
```

![Removing the Active Directory Subnet associated with the Maryland site.](https://adamtheautomator.com/wp-content/uploads/2021/05/Remove-ADReplicationSubnet-1.png)

Removing the Active Directory Subnet associated with the Maryland site.

Finally, remove the site itself with the [`Remove-ADReplicationSite` command](https://docs.microsoft.com/en-us/powershell/module/activedirectory/remove-adreplicationsite?view=windowsserver2019-ps) and verify removal.

```
Remove-ADReplicationSite -Identity "Maryland"
 Get-ADReplicationSite -Filter *
```

![Removing the Active Directory site](https://adamtheautomator.com/wp-content/uploads/2021/05/Remove-ADReplicationSite-1.png)

Removing the Active Directory site

> _Do you have compromised passwords in your Active Directory? Find out with [Specops Password Auditor Free](https://specopssoft.com/product/specops-password-auditor/?utm_source=ATA&utm_medium=referral&utm_campaign=ATA%20promo%202021&utm_content=SPA%20in-article%20link)._

## Conclusion

In this tutorial, you’ve learned the basics of manage Active Directory sites with PowerShell. But, there’s still a lot you can do with AD sites and PowerShell.

Now that you have created your first Active Directory Sites, why not extend this in your home lab? Create some sites on different subnets and see how the replication time impacts Active Directory changes such as password resets and group policy updates.

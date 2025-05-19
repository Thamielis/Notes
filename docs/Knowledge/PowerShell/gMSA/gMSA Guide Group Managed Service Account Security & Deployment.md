---
created: 2025-05-19T17:13:59 (UTC +02:00)
tags: []
source: https://www.varonis.com/blog/gmsa
author: Josue Ledesma
---

# gMSA Guide: Group Managed Service Account Security & Deployment | Varonis

---
In any organization, there are a number of automated tasks, applications, or devices running in the [background of any device across a network](https://www.varonis.com/blog/data-security/?hsLang=en). One of the best ways to manage and secure these automated processes is to leverage group Managed Service Accounts or gMSAs.

In this article, we'll show you what a gMSA is, why it's important, and how to create a gMSA for your network and organization.

-   [What is gMSA?](https://www.varonis.com/blog/gmsa#what)
-   [Why are Service Accounts and gMSAs Important?](https://www.varonis.com/blog/gmsa#why)
-   [How to Find and Manage Group Managed Service Accounts](https://www.varonis.com/blog/gmsa#how)
-   [How to Set Up gMSAs](https://www.varonis.com/blog/gmsa#setup)
-   [Best Practices for Managing gMSAs](https://www.varonis.com/blog/gmsa#best)
-   [Why Use gMSAs](https://www.varonis.com/blog/gmsa#use)

## **What is gMSA?**

![](https://www.varonis.com/hubfs/what-is-azure-devops-2-1200x443-png.png)

Groups Managed Service Accounts, or gMSAs, are a type of managed service account that offers more security than traditional managed service accounts for automated, non-interactive applications, services, processes, or tasks that still require credentials.

### Get the Free PowerShell and Active Directory Essentials Video Course

Available on [computers running Windows Servers 2012](https://www.varonis.com/data-stores/office-365/?hsLang=en) or later, gMSAs have largely replaced sMSAs (single managed service account, also known as MSA, a managed service account) because they can be used across multiple servers and perform multiple automated tasks.

## **Why are Service Accounts and gMSAs Important?**

Service accounts are generally important because they provide a non-personal account to provide a security context for any number of background services for devices running on a Windows OS.

Without the right security, these background services can be exploited and targeted by hackers looking to get into your network via your devices. Using managed service accounts is helpful as a part of ongoing security management for your organization.

![](https://www.varonis.com/hubfs/gmsa-benefits-1200x692-png.png)

### **Benefits of Using gMSAs**

gMSAs provide a number of security benefits and give you more control over your service accounts.

-   **Multiple servers:** Unlike traditional MSAs or sMSAs, your services and tasks can be set and run across multiple servers, a necessity given the modern state of organizations today.

-   **Automated password management:** To put it simply, gMSAs cut out the middle-man (you) when it comes to passwords. They're automatically generated, handled by the OS, and even rotated on a regular basis.

-   **Passwords are handled by the OS:** When applications require a password, they query the [Active Directory](https://www.varonis.com/data-stores/active-directory-old/?hsLang=en), so you don't even have to know the password, making it much more difficult for the password to ever be compromised.

-   **You can delegate management to other administrators:** Having the flexibility to delegate management can be incredibly helpful for ensuring there isn't just a single admin responsible for your service account security.

## **How to Find and Manage Group Managed Service Accounts**

Your organization may have already created gMSAs that can give you a head start on your service account management. Locating your MSAs is a fairly simple process.

### **How to Locate gMSAs**

On the PowerShell Command, run the following prompts.

**Get-ADServiceAccount** 

**Install-ADServiceAccount** 

**New-ADServiceAccount** 

**Remove-ADServiceAccount** 

**Set-ADServiceAccount** 

**Test-ADServiceAccount** 

**Uninstall-ADServiceAccount**

You should be able to see any gMSAs in the Active Directory Users and Computers within the **Managed Service Accounts** folder or OU (organizational unit). Here's what you should see: 

![](https://www.varonis.com/hubfs/unnamed-png.png)

## **How to Set Up gMSAs**

There are a number of ways to set up a gMSA as well as a number of prerequisites. Here, we're sharing the method as [described by Microsoft](https://docs.microsoft.com/en-us/windows-server/security/group-managed-service-accounts/getting-started-with-group-managed-service-accounts#BKMK_gMSA_Req).

As mentioned before, gMSAs are only available to Windows Server 2012 or later versions. To administer gMSAs, you need to run Powershell commands which require a 64-bit architecture. MSAs are dependent upon Kerberos-supported encryption times and any encryption standards, like AES, should be configured for MSAs.

**Before you get started:** 

-   Ensure your forest schema is updated to Windows Server 2012
-   Make sure you have deployed a master root key for Active Directory
-   Have at least one Windows Server 2012 DC in your domain where you'll be creating the gMSA.

For a full list of requirements, pre-requisites, and additional steps, visit this [documentation page by Microsoft](https://docs.microsoft.com/en-us/windows-server/security/group-managed-service-accounts/getting-started-with-group-managed-service-accounts#BKMK_gMSA_Req).

You can create gMSAs via the New-ADServiceAccount cmdlet. If you don't have AD PowerShell installed, open Add Roles and Features in the Server Manager, go to Features, locate RSAT, and select the Active Directory module for Windows PowerShell.

**Step 1:** Run Windows Powershell from the Taskbar on your Windows Server 2012 domain controller

**Step 2:** On the command prompt, enter the following:

1.  _New-ADServiceAccount \[-Name\] <string> -DNSHostName <string> \[-KerberosEncryptionType <ADKerberosEncryptionType>\] \[-ManagedPasswordIntervalInDays <Nullable\[Int32\]>\] \[-PrincipalsAllowedToRetrieveManagedPassword <ADPrincipal\[\]>\] \[-SamAccountName <string>\] \[-ServicePrincipalNames <string\[\]>\]_

Here's how you should fill out each of the bracketed parameters:

**Name:** The name of your account

**DNS Host Name:** The DNS hostname of the service

**Kerberos Encryption Type:** The encryption type supported by the host servers

**Managed Password Internal In Days:** How often you want the password to be changed (by default this is 30 days -- remember, the change is handled by Windows)

\* note: This cannot be changed after the gMSA is created. To change the interval, you'll need to create a new gMSA and set a new interval.

**Principals Allowed To Retrieve Managed Password:** These can be the accounts of member hosts, or if there is a security group that member hosts are a part of, you would enter them here.

**Sam Account Name:** This is the NetBIOS name for the service if it's different from the account name.

**Service Principal Names:** This is a list of the Service Principal Names (SPNs) for the service)

If you've created a new server farm as a security group for the gMSA set up or if you've set up the gMSA in an existing server farm, you'll need to add the computer accounts for any new member hosts that will be managed by the gMSA.

To add members to this security object, you can use a number of methods depending on what you have access to (these are standard methods for adding computer accounts to a group -- the following method isn't specific to gMSAs).

**Active Directory:** You can open the Active Directory via the Control Panel's Admin tools or, if you're in Windows Server 2012, you can click **start**, then type **dsa.mcc**.

In the console tree, find **computers**, locate the account you want to add to a group, right-click and select **properties** then click **Add** in the **Member Of** tab.

Type the name of the security group managed by the gMSA and hit **Ok** to add the account to the group.

**Command-line:** To add an account to a group via the command line, open your command prompt and enter the following: 

1.  _dsmod group <GroupDN> -addmbr <ComputerDN>_

Here's how to fill out the command.

**GroupDN:** Refers to the group you want to add any number of accounts to.

**Addmbr:** This sets the <Computer DN>

**ComputerDN:** This is the name of the computer account added, identified by the name in the directory.

**Windows PowerShell Active Directory:** Run Windows PowerShell and type in the following: 

1.  _Get-ADServiceAccount \[-Identity\] <string> -Properties PrincipalsAllowedToRetrieveManagedPassword_

**<string>:** Refers to the name of the group you want members to be a part of

**Principals Allowed To Retrieve Managed Password:** The name of the accounts you want to add to the group.

To double-check you've created a gMSA, look for it in your Managed Service Accounts OU using the method described earlier.

## **Best Practices for Managing gMSAs**

To ensure gMSAs are securing your organization,  you have to ensure you're managing them appropriately. Here are a few tips.

### **Organize Them Appropriately**

All gMSAs should be in the Managed Service Account folder (or OU, organizational unit) but if you have several types of MSAs within that OU, you can make a sub-OU to have all your gMSAs in a different place so you can access them all easily. Keeping a consistent naming pattern can also help organize your gMSAs.

### **Keep An Inventory Of Your Service Accounts**

Your organization may have a number of active service accounts. Ensuring they're still valid, relevant, and which computers and workstations belong to each account can be difficult but it's important so you can still enforce a principle of least privilege and aren't running into any permission or authentication issues.

You can use the Get-ADService Account PowerShell cmdlet or leverage some [scanning or automated tools and solutions](https://www.varonis.com/blog/windows-file-system-auditing/?hsLang=en) from cybersecurity vendors and partners to support service account management and visibility.

### **Keep Appropriate Security Habits**

You should always try and minimize the risk service accounts are exposed to. This means you should prevent admins from using their personal accounts as service accounts and you should try to avoid interactive logins for services as much as possible.

A key benefit of gMSAs is automating password management and keeping any authentications within the OS. Adding human interaction only introduces another risk factor..

## **Why Use gMSAs**

Leveraging gMSAs is an easy way to manage your on-premise devices within your network in a secure way. It also helps keep your servers and hosts organized while minimizing any exposure to a would-be hacker trying to brute force their way into your organization.

If you're running a variety of managed service accounts, we recommend looking for a solution or service that will help increase your [visibility and management of these MSAs](https://www.varonis.com/solutions/data-protection/?hsLang=en).

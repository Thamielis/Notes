---
created: 2022-03-04T12:05:32 (UTC +01:00)
tags: []
source: https://feardamhan.com/2020/01/14/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-i-overview/
author: Published by feardamhan
---

# Part 01 Overview

> ## Excerpt
> As part of the work I do for VMware, I build and reset and build labs over and over again. As any engineer with a touch of OCD will attest to, gremlins get in somehow/somewhere, and after a few res…

---
As part of the work I do for VMware, I build and reset and build labs over and over again. As any engineer with a touch of OCD will attest to, gremlins get in somehow/somewhere, and after a few resets things start to look like the Stranger Things Upside-Down version of themselves. There is nothing quite like a fully fresh environment to allow you sleep at night.

When we build our VVD test labs, we need IaaS templates and a SQL Server for vRealize Automation. So I figured it was time to dust off the unattended installation part of my brain’s archive and see if I could get this to work in a fully automated fashion including all pre-requisites. Just for the fun of it I thought I’d automate the deployment of the supporting AD Forest/Domain structure too.

All via PowerShell, using JSON as the format for inputs.

### Pieces of the Puzzle

So there are several elements to an unattended Windows installation.

-   How are you going to bring all the required binaries and drivers together?
    -   **Answer: Windows 10 ADK**
-   How are you going to setup the basic machine identity
    -   **Answer: autounattend.xml**
-   How are you going to further customize it once Windows is installed
    -   **Answer: SetupComplete.cmd** to trigger a PowerShell script that does the rest

Overall, the goal is to create a VM Deployment flow like this:

![](https://feardamhancom.files.wordpress.com/2020/01/unattendedwindowsinstalls.png?w=741)

We are going to use the fact that Windows will search the root of _all_ mounted drives during installation of the OS to place this file _outside_ of the main binaries iso. This means each VM will use two ISOs when deploying. One large (and common) one with all the binaries, and one tiny on (about 2MB) that holds all the stuff that will make the VM unique.

In the next post in this series I’ll show you how to create the single binaries iso that can be leveraged by all the VMs we wish to deploy. Subsequent posts will take you through the theory of how the answer files and post-configuration files work and get created, and finally I’ll provide specific examples of those files for Root Domains, Child Domains, Additional Domain controllers, Member Servers and SQL Servers.

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

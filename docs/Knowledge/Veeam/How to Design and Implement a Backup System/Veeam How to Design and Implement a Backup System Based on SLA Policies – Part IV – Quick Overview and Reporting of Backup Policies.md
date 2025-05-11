---
created: 2025-03-21T11:30:53 (UTC +01:00)
tags: []
source: https://jorgedelacruz.uk/2020/03/12/veeam-how-to-design-and-implement-a-backup-system-based-on-sla-policies-part-iv-quick-overview-and-reporting-of-backup-policies/
author: jorgeuk
---

# Veeam: How to Design and Implement a Backup System Based on SLA Policies – Part IV – Quick Overview and Reporting of Backup Policies - The Blog of Jorge de la Cruz

---
[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-bannerEN4-1024x359.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-bannerEN4.png)Greetings friends, we arrive at the fourth installment of this interesting series that you are enjoying very much. We have already seen in previous posts all that is needed to deploy backups using SLA policies, and it is now time to generate different reports and different views so that the different owners and managers of each application can know if their VMs are protected.

## Using the Veeam Enterprise Manager Plugin with VMware vSphere Client (HTML5)

More than a year ago **[I wrote about how you could install the Veeam Enterprise Manager plugin on our VCSA to display information on the vSphere Web Client, and on the new vSphere Client (HTML5).](https://www.jorgedelacruz.es/2018/07/02/veeam-instalar-o-actualizar-el-plugin-de-veeam-para-vcenter-desde-enterprise-manager-novedad-soporte-para-html5/)**

Starting from the fact that we have already followed these simple steps, or if we were absent-minded, here is a screenshot where it is shown in a quick way:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-038-1024x260.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-038.png)When installing the plugin, the vSphere Client will tell us that we have to close the session and open it again:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-0390-1024x229.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-0390.png)If we already have our domain users or groups linked to Veeam, we’ll go to the Enterprise Manager – Roles:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-040-1024x368.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-040.png)We’ll add the user or group of users, with privileges only to the folder or tag that has access, with the roles that we want to give them: [![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-041-1024x522.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-041.png)We’ll see here the user or groups: [![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-042-1024x202.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-042.png)As users, we log in again to vSphere Client (HTML5) and we’ll be able to see in each VM if it has a backup or not, and how often.[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-043-1024x519.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-043.png)

## Troubleshooting and reporting using Veeam ONE Monitor Client

We will now open as the user or groups that have our Veeam ONE Monitor Client, we will be able to see that we access with the correct credentials:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-044.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-044.png)

Veeam ONE Monitor Client will show us a warning about the limited scope we have: [![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-045-1024x428.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-045.png)From the Infrastructure view we can see only the VMs we have access to, and it also shows us if the VMs have Backup or not: [![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-046-1024x563.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-046.png)In the Business View, we can see some categories, in my case the VMs with daily protection:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-047-1024x563.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-047.png)

## Troubleshooting and generating reports using Veeam ONE Reporter

We’ll open now Veeam ONE Reporter with the credentials of the user with limited access, we’ll go to Veeam Backup Monitoring – Protected VMs:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-048-1024x585.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-048.png)From there, we’ll select all the scope, which is limited to your VMs, and if we want we’ll touch the RPO, and other information, and click on Preview: [![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-049-1024x586.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-049.png)Now we’ll be able to see all the VMs we have access to, with their corresponding restore points, all in green/all good: [![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-050-1024x586.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-050.png)The report shows our VMs protected with other policies besides ours, remember that it was the so-called BACKUP-SLA-30-24, but the important thing is that our policy is in the report: [![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-051-1024x586.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-051.png)From here, we could save the report, and send it automatically by email as PDF or XLS.

That’s all for now in this first part of this blog series about SLA policies to create backups, I leave you with the complete series:

-   **[Veeam: How to Design and Implement a Backup System Based on SLA Policies – Part I – Design, Architecture, and Tagging in vSphere](https://jorgedelacruz.uk/2020/03/09/veeam-how-to-design-and-implement-a-backup-system-based-on-sla-policies-part-i-design-architecture-and-tagging-in-vsphere/)**
-   [**Veeam: How to Design and Implement a Policy-Based Backup System – Part II – Creating the Policies in Veeam Backup & Replication**](https://jorgedelacruz.uk/2020/03/10/veeam-how-to-design-and-implement-a-policy-based-backup-system-part-ii-creating-the-policies-in-veeam-backup-replication/)
-   [**Veeam: How to Design and Deploy a Backup System Based on SLA Policies – Part III – Assigning vSphere Tags to Application Groups**](https://jorgedelacruz.uk/2020/03/11/veeam-how-to-design-and-deploy-a-backup-system-based-on-sla-policies-part-iii-assigning-vsphere-tags-to-application-groups/)
-   [**Veeam: How to Design and Implement a Backup System Based on SLA Policies – Part IV – Quick Overview and Reporting of Backup Policies**](https://jorgedelacruz.uk/2020/03/12/veeam-how-to-design-and-implement-a-backup-system-based-on-sla-policies-part-iv-quick-overview-and-reporting-of-backup-policies/)
-   [**Veeam: How to design and implement a policy-based SLA backup system – Part V – Monitoring the Veeam Backup & Replication environment with Veeam ONE**](https://jorgedelacruz.uk/2020/03/13/veeam-how-to-design-and-implement-a-policy-based-sla-backup-system-part-v-monitoring-the-veeam-backup-replication-environment-with-veeam-one/)

## Reader Interactions

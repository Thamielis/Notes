---
created: 2025-03-21T11:29:27 (UTC +01:00)
tags: []
source: https://jorgedelacruz.uk/2020/03/11/veeam-how-to-design-and-deploy-a-backup-system-based-on-sla-policies-part-iii-assigning-vsphere-tags-to-application-groups/
author: jorgeuk
---

# Veeam: How to Design and Deploy a Backup System Based on SLA Policies – Part III – Assigning vSphere Tags to Application Groups - The Blog of Jorge de la Cruz

---
[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-bannerEN3-1024x359.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-bannerEN3.png)Greetings friends, we come to the third entry on this interesting topic on how to protect a vSphere environment using Veeam Backup & Replication with SLA policies, we have seen in previous entries, how to design and create SLA policies in vSphere, and how to create the entire Veeam Backup & Replication infrastructure, today we will see how the owners or managers of each department can assign the policies to their workloads.

## Create or Edit Roles in VMware vSphere

The first thing we will have to do is to grant the role of vSphere Tagging to the role that the different users or responsible of the workloads are using, for example, I have a very limited role, that only allows to do some operations in the VMs, and to this role, I have added the following permission:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-031-1024x522.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-031.png)Then what we would be interested in, if we don’t have it already created this way, is to assign to different VMs, or Folders, or Resource Pools, the user, or group we just created, with the role we just created too:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-032-1024x522.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-032.png)**Note: Besides adding the user with his role to the folder or VMs we want, we will have to assign him to the highest level of vCenter, without marking the option of propagating to children.[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-036-1024x288.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-036.png)**

## Overview as responsible for a small group of VMs – How to assign the SLA policy

If the user, or users, log in to vSphere Client they will be able to see only their resources, as expected:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-033-1024x522.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-033.png)We see in the previous image that the actions are very reduced, but among them, we have available the power to assign a policy of SLA using the vSphere Tags, we are going to add a policy to a VM, in the following way (let’s remember that this can be done by VM, or directly to the folder, so the person in charge is making sure that the present and future VMs assigned to this folder is protected):[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-034-1024x410.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-034.png)This would look like this if we look at the attributes of the VM or VMs:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-035-1024x522.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-035.png)With this, the application manager could already be at ease knowing that his VM will be protected according to the SLA policy he has just selected, a look at Veeam confirms this:[![](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-037-1024x536.png)](https://jorgedelacruz.uk/wp-content/uploads/2020/03/veeam-sla-037.png)Although it’s true that in future entries we’ll see how we can send notifications to this person in charge of your applications, as well as offering him the possibility to check it by himself from the vSphere Client.

That’s all for now in this first part of this blog series about SLA policies to create backups, I leave you with the complete series:

-   **[Veeam: How to Design and Implement a Backup System Based on SLA Policies – Part I – Design, Architecture, and Tagging in vSphere](https://jorgedelacruz.uk/2020/03/09/veeam-how-to-design-and-implement-a-backup-system-based-on-sla-policies-part-i-design-architecture-and-tagging-in-vsphere/)**
-   [**Veeam: How to Design and Implement a Policy-Based Backup System – Part II – Creating the Policies in Veeam Backup & Replication**](https://jorgedelacruz.uk/2020/03/10/veeam-how-to-design-and-implement-a-policy-based-backup-system-part-ii-creating-the-policies-in-veeam-backup-replication/)
-   [**Veeam: How to Design and Deploy a Backup System Based on SLA Policies – Part III – Assigning vSphere Tags to Application Groups**](https://jorgedelacruz.uk/2020/03/11/veeam-how-to-design-and-deploy-a-backup-system-based-on-sla-policies-part-iii-assigning-vsphere-tags-to-application-groups/)
-   [**Veeam: How to Design and Implement a Backup System Based on SLA Policies – Part IV – Quick Overview and Reporting of Backup Policies**](https://jorgedelacruz.uk/2020/03/12/veeam-how-to-design-and-implement-a-backup-system-based-on-sla-policies-part-iv-quick-overview-and-reporting-of-backup-policies/)
-   [**Veeam: How to design and implement a policy-based SLA backup system – Part V – Monitoring the Veeam Backup & Replication environment with Veeam ONE**](https://jorgedelacruz.uk/2020/03/13/veeam-how-to-design-and-implement-a-policy-based-sla-backup-system-part-v-monitoring-the-veeam-backup-replication-environment-with-veeam-one/)

## Reader Interactions

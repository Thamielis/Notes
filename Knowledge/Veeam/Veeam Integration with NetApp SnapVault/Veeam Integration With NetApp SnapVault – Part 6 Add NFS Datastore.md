---
created: 2024-09-19T16:36:57 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore

---
[Skip to content](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/#content)

Adding an NFS datastore to the production ESXi host is a simple process. We’ve already configured a separate network dedicated to NFS storage and created VMkernel ports on each of the ESXi hosts. We’ve also created export rules on the NetApp appliances to make the NFS volumes visible to any hosts on that network. So all we need to do now is mount the production NFS volume on the production ESXi host as a datastore.

Note: This is part 6 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

Log into the vSphere Web Client and go to the storage view. Right click on the **MYLAB Production** datacentre and select **Storage->New Datastore:**

![Add NFS Datastore 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/add-nfs-datastore-011.jpg?w=809)

Click **Next:**

![Add NFS Datastore 02](https://univirt.wordpress.com/wp-content/uploads/2017/05/add-nfs-datastore-021.jpg?w=809)

Set the storage type to **NFS** and click **Next:**

![Add NFS Datastore 03](https://univirt.wordpress.com/wp-content/uploads/2017/05/add-nfs-datastore-03.jpg?w=809)

Set the NFS version to **NFS 3** and click **Next:**

![Add NFS Datastore 04](https://univirt.wordpress.com/wp-content/uploads/2017/05/add-nfs-datastore-04.jpg?w=809)

Here we give the new datastore a name as it will appear in the vSphere inventory and provide folder and NFS server details. Note that since the NFS volume that we created is mounted directly at the root of the SVM namespace, the folder is simply **/NFSVOL1.** The server IP address is the address that we configured for the NFS data LIF when we created SVM1. Click **Next:**

![Add NFS Datastore 05a](https://univirt.wordpress.com/wp-content/uploads/2017/05/add-nfs-datastore-05a.jpg?w=809)

Set the host accessibility so that the datastore is only presented to the production ESXi host. Click **Next:**

![Add NFS Datastore 06](https://univirt.wordpress.com/wp-content/uploads/2017/05/add-nfs-datastore-06.jpg?w=809)

Review the settings and when you’re happy, click **Finish:**

![Add NFS Datastore 07](https://univirt.wordpress.com/wp-content/uploads/2017/05/add-nfs-datastore-071.jpg?w=809)

We should now see the new volume listed in the inventory as shown.

![Add NFS Datastore 09](https://univirt.wordpress.com/wp-content/uploads/2017/05/add-nfs-datastore-09.jpg?w=809)

As a final step, we can build a VM on this new volume to test backups and restores in Veeam. In my case I’ve provisioned a Windows Server 2003 VM due to resource constraints on my lab kit, but preferably this would be a Windows 2016 system running something like Active Directory so that we can experiment with application consistent backups and item-level restores.

![SnapVault Relationship 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-01.jpg?w=809)

In the next post we’ll be looking at setting up a cluster peer relationship between the production and DR NetApp appliances.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

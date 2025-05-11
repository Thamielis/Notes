---
created: 2024-09-19T16:38:22 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship

---
In the last blog we covered the first stage in joining the production and DR NetApp appliances which was to establish cluster peering between the two systems. The next stage will be to create a SnapVault/SnapMirror relationship between the NFS volume on the production system and the Data Protection volume on the DR system.

Note: This is part 8 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

We’ve deployed a Windows 2003 virtual machine on the production system that we’ll be using to test Veeam backup and recovery scenarios.

![SnapVault Relationship 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-01.jpg?w=809)

When setting up a SnapMirror/SnapVault protection relationship, all the configuration is done at the target i.e. on the DR NetApp appliance. Log into the DR appliance and select the drop-down menu item **Protection->Relationships:**

![SnapVault Relationship 13](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-13.jpg?w=809)

Initially no relationships will be listed. Click on the **Create** button:

![SnapVault Relationship 14](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-14.jpg?w=809)

All data-serving SVMs on the DR system will be listed as potential targets for the relationship. In our case we just have the one so we’ll highlight SVM1\_DR and click **Select:**

![SnapVault Relationship 15](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-15.jpg?w=809)

Select **Vault** as the relationship type. The source cluster is selected for us automatically as this system only peered with one other cluster. Click the **Browse** button to select a source Storage Virtual Machine:

![Capture 10](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-10.jpg?w=809)

In order to enumerate the available SVMs on the source cluster we will need to authenticate to it. Click the **Authenticate** link:

![SnapVault Relationship 17](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-17.jpg?w=809)

Enter the admin credentials for the source cluster and click **OK:**

![SnapVault Relationship 18](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-18.jpg?w=809)

You’ll get a warning message because the SSL certificate on the appliance is self signed and thus not trusted. Click **Yes** to continue with an untrusted connection:

![SnapVault Relationship 19](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-19.jpg?w=809)

Select the source SVM and click **Peer and Continue:**

![SnapVault Relationship 20](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-20.jpg?w=809)

Now we’ll need to select a source volume for the relationship. Click the **Browse** button:

![Capture 11](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-11.jpg?w=809)

Select the volume that we’ve used to create the source NFS datastore and click **Select:**

![SnapVault Relationship 22](https://univirt.wordpress.com/wp-content/uploads/2017/05/snapvault-relationship-22.jpg?w=809)

Now we’ll need to configure the destination volume. The destination SVM has already been selected for us. We’re going to allow the destination volume to be automatically created for us by the policy. This will ensure that all the correct policies are applied to this volume. Note that the Vault Policy is set to **XDPDefault.** This is important as any other policy will mean that Veeam will not be able to detect the SnapVault relationship. By default this volume will be created with the minimum size necessary and will autogrow in increments as the SnapVault storage requirements grow over time. We’ll use the automatically suggested volume name (SVM1\_NFSVOL1\_vault) and select the aggregate that we created earlier for this volume:

![Capture 12](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-12.jpg?w=809)

Finally, since we are going to rely on Veeam to manage SnapVault operations, we’ll set the schedule to **None** and click **Create**:

![Capture 13](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-13.jpg?w=809)

The wizard should now confirm creation of the protection relationship:

![Capture 14](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-14.jpg?w=809)

If we examine the status of the newly created relationship, we can see that the transfer status is **Transferring**. This indicates that the initial seeding of data from the source volume is in progress. This will need to complete before our first Veeam backup job leveraging SnapVault can be run:

![Capture 15](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-15.jpg?w=809)

When the initial transfer of data has completed you should see that the **Relationship State**  for this relationship has changed from **Uninitialized** to **Snapmirrored** with a **Lag Time** showing how long it has been since the transfer of data completed:

![Capture 18](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-18.jpg?w=809)

From the command line, we can see that although the SnapVault target volume has been created with a size just large enough to hold the data to be initially replicated (in this case 2.8GB), it can autogrow to a maximum size of 16TB:

![Capture 16](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-16.jpg?w=809)

![Capture 17](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-17.jpg?w=809)

In the next blog post we’ll integrate the storage systems into Veeam and create a backup job that leverages this SnapVault relationship.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

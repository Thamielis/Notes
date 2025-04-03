---
created: 2024-09-19T16:38:50 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration

---
Now that we have finished building out our production and DR infrastructure and establishing a SnapMirror/SnapVault relationship between the two NetApp appliances, let’s start integrating it all with Veeam.

Note: This is part 9 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

The first thing to make sure of is to make sure you’re running Veeam Backup and Replication v9.5 **Update 2**. Any lower than this and you may run into problems attempting to restore from SnapVault copies.

I’m going to assume at this stage that the initial configuration of Veeam has been completed, with a local repository for backup images and that the vCenter integration has been completed.

In addition I’ve ensured that the Veeam server has two network interfaces, one connected to the 10.0.0.0/24 network that I’m using for all management and VM networking traffic, and one attached to the 10.0.1.0/24 network that is dedicated to NFS storage traffic. If you’ll recall, this is in line with our original architecture:

![Introduction 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/introduction-011.jpg?w=809)

Here’s how the two network connections appear on the Veeam server, with Ethernet0 configured with an IP address in the 10.0.0.0/24 range and Ethernet1 with an address in the 10.0.1.0/24 range:

![Veeam Integration 00](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-00.jpg?w=809)

I’ve also edited the properties of the Veeam Proxy (in my case that’s the Veeam server itself) and created a traffic rule to set the 10.0.1.0/24 network as my preferred network for backup traffic:

![Veeam Integration 23](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-23.jpg?w=809)

The first thing we’ll do is to import the production NetApp appliance. Going to the **Storage Infrastructure** section of the Veeam console, we click **Add Storage:**

![Veeam Integration 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-01.jpg?w=809)

Click on **NETAPP DATA ONTAP:**

![Capture 09.JPG](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-09.jpg?w=809)

Enter the IP address of the cluster management interface and an optional description. Click **Next:**

![Veeam Integration 03](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-03.jpg?w=809)

Add admin credentials for the appliance and click **OK.** 

![Veeam Integration 04](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-04.jpg?w=809)

Click **Next:**

![Veeam Integration 05](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-05.jpg?w=809)

Specify what protocol Veeam should use to access the storage, in our case NFS.

![Veeam Integration 07](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-07.jpg?w=809)

Click on **Volumes to scan** and specify that Veeam should scan all volumes except the root volume of the SVM. Click **OK:**

![Veeam Integration 08](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-08.jpg?w=809)

Click **Next:**

![Veeam Integration 09](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-09.jpg?w=809)

Click **Finish:**

![Veeam Integration 10](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-10.jpg?w=809)

Veeam will now go through a process of scanning the NetApp appliance and cross-referencing the contents of the NFS share with the VMs listed by vCenter. When it is finished click **Close:**

![Veeam Integration 11](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-11.jpg?w=809)

Repeat the process above to import the DR NetApp appliance. If we drill down on each of the appliances we will see the initial SnapMirror snapshot on the production appliance with its equivalent copy on the DR appliance. You’ll notice that each snapshot also lists the virtual machines on the parent volume. Also note that they are listed as being **crash-consistent**. Once we have completed the integration work, we will be able to ensure that these are **application-consistent.** Application-consistent snapshots (and backups) ensure that the application data has been captured in such a way that all data is flushed from memory and committed to disk as part of the job, ensuring that the application can be recovered and restarted without any inconsistency in the data. For a full definition of what application consistency is and why it’s important, have a look at the Veeam notes [here](https://helpcenter.veeam.com/docs/backup/vsphere/transaction_consistency.html?ver=95).

![Veeam Integration 12](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-12.jpg?w=809)

If you go to the production NetApp appliance at this stage you’ll see that the default export policy has been edited by the process of adding the appliance to Veeam. It now includes rules that explicitly allow read-only access by the Veeam proxy to the NFS volume:

![Veeam Integration 34](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-341.jpg?w=809)

You’ll also notice that not only is NFS enabled as an access protocol but so is CIFS. This is OK since we don’t have CIFS enabled on the SVM anyway.

Now we’ll create a job that leverages the SnapVault relationship by triggering an application consistent snapshot on the production NetApp appliance, transferring that to the DR NetApp appliance as a SnapVault copy, and then using the SnapVault copy as the source for the backup. Start by launching the wizard to create a new backup job. Give it a name and description and click **Next:**

![Veeam Integration 13](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-13.jpg?w=809)

Add a virtual machine that resides on the production NFS datastore to the job and click **Next:**

![Veeam Integration 14](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-14.jpg?w=809)

Here I’ve chosen a local repository on a local ReFS volume as my backup repository and set a retention policy of 14 days. Make sure you check the box for **Configure secondary destinations for this job** and click **Next:**

![Veeam Integration 15](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-15.jpg?w=809)

In the **Jobs** drop-down menu select **NetApp SnapVault:**

![Veeam Integration 16](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-16.jpg?w=809)

Again I’ve chosen a retention policy of 14 days. This means that Veeam will retain 14 SnapVault copies on the DR NetApp appliance. Check the box for **Use as the data source.** This will instruct Veeam that it needs to orchestrate a workflow that creates an application consistent snapshot on the production appliance, copy it to the DR appliance as a SnapVault copy, and then use this copy as the data source for the backup job. Click **OK:**

![Veeam Integration 17](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-17.jpg?w=809)

Click **Next:**

![Veeam Integration 18](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-18.jpg?w=809)

Here I’ve chosen to enable application-aware processing and guest file system indexing. You’ll need to specify guest OS credentials to make this work. Click **Next:**

![Veeam Integration 19](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-19.jpg?w=809)

Set a schedule for the job and click **Apply:**

![Veeam Integration 20](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-20.jpg?w=809)

Check the box to the run the job now and click **Finish:**

![Veeam Integration 21](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-21.jpg?w=809)

As the backup job initialises, one of the first things it will do is to check that there is actually a SnapVault relationship for the volume where the VM to be backed up resides:

![Capture 19](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-19.jpg?w=809)

Once the SnapVault relationship has been verified, Veeam will coordinate the creation of a snapshot of the volume on the primary NetApp appliance:

![Capture 20](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-20.jpg?w=809)

When the snapshot has been created, Veeam then orchestrates the transfer of the snapshot to the DR NetApp appliance:

![Capture 22](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-22.jpg?w=809)

You can see below that the snapshot has been transferred. The backup job can now proceed to the next stage:

![Capture 24](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-24.jpg?w=809)

![Capture 25](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-25.jpg?w=809)

To verify that the backup traffic is only going over the preferred network link on the Veeam server, you can open Task Manager and observe the network traffic while the job is running:

![Veeam Integration 22](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-22.jpg?w=809)

After the backup job has run a few times, you will see that the number of snapshots on the DR appliance will increase in accordance with the SnapVault retention policy that we specified above. However, only one snapshot is retained on the production appliance, as shown below.

![Veeam Integration 29](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-29.jpg?w=809)

Ideally, we would like to have additional snapshots stored on the production appliance to give us more restore points. One way to do this is to add a NetApp SnapMirror secondary target to the backup job, as shown below:

![Capture 26](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-26.jpg?w=809)

Again, we can specify a retention policy for these snapshots:

![Veeam Integration 31](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-31.jpg?w=809)

Now you will see 2 secondary targets for the backup job, one of which is marked as the data source:

![Veeam Integration 32](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-32.jpg?w=809)

Over time, we will see that 14 snapshots will be stored on both the production and DR systems. One of the advantages of creating snapshots this way is that they will be application-consistent, meaning that they can be a trusted source for restoring application items, such as emails, database tables, etc.

![Veeam Integration 33](https://univirt.wordpress.com/wp-content/uploads/2017/05/veeam-integration-33.jpg?w=809)

Note that creating snapshots on the primary as shown above has one drawback – the snapshots will only be created when the backup job is run. For a guide on how to create a snapshot-only job in Veeam which can be run as often as you like, have a look at [this post](https://univirt.wordpress.com/2017/01/20/using-veeam-to-schedule-application-consistent-netapp-snapshots/) that I wrote previously.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

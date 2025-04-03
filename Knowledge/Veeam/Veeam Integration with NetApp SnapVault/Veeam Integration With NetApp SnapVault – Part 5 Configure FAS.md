---
created: 2024-09-19T16:36:31 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 5: Configure FAS

---
In my previous post, I did a basic deployment of 2 NetApp ONTAP simulators, one for my production environment and one for DR. In this post I’m going to login to the GUI of each simulator and configure the licensing, time keeping, aggregates, storage virtual machines (SVMs) and NFS volumes in preparation for setting up a SnapVault relationship.

Note: This is part 5 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

First, we’ll point a browser at the IP address of the cluster interface of the production system. You’ll need to use https (http will fail) and Internet Explorer works best. Login using the admin credentials that you created in the previous post:

![Configure FAS 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-01.jpg?w=809)

The dashboard should look like this, with 56 disks available for building aggregates. If you see less than 56 disks, you can run the **storage disk assign -all true -node _cluster\_node\_name_** command as described in the previous post.

![Configure FAS 02](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-02.jpg?w=809)

The first thing we need to do is to add the licenses to enable such things as NFS, SNapMirror, SnapVault, FlexClone, etc. If we go to the **Configurations** tab and look under **Licenses** we can see that, other than the cluster base license, no other features have been enabled. On the **Packages** tab click on the **Add** button:

![Configure FAS 03](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-03.jpg?w=809)

Here we can add all the licenses we need as a comma delimited list. The following list consists of a comprehensive bundle of all the licenses we will need:

CAYHXPKBFDUFZGABGAAAAAAAAAAA,  
APTLYPKBFDUFZGABGAAAAAAAAAAA,  
WSKTAQKBFDUFZGABGAAAAAAAAAAA,  
CGVTEQKBFDUFZGABGAAAAAAAAAAA,  
OUVWXPKBFDUFZGABGAAAAAAAAAAA,  
QFATWPKBFDUFZGABGAAAAAAAAAAA,  
UHGXBQKBFDUFZGABGAAAAAAAAAAA,  
GCEMCQKBFDUFZGABGAAAAAAAAAAA,  
KYMEAQKBFDUFZGABGAAAAAAAAAAA,  
SWBBDQKBFDUFZGABGAAAAAAAAAAA,  
YDPPZPKBFDUFZGABGAAAAAAAAAAA,  
INIIBQKBFDUFZGABGAAAAAAAAAAA

Cut and paste the licenses above into the dialog box as a comma-separated list and click **Add:**

![Configure FAS 04](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-04.jpg?w=809)

The licenses are recognised and assigned to the node as shown. Click **Close:**

![Configure FAS 05](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-05.jpg?w=809)

![Configure FAS 06](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-06.jpg?w=809)

Now we’ll configure the time on the appliance. Accurate timekeeping is very important as a timestamp will be placed on all snapshots and we’ll need to be able to track these. I’ve noticed that the time can drift considerably on these virtual appliances if this is not done. Here we can see that the GUI is reporting the time as 09:16. The actual time when I took this screenshot was 10:23, over an hour later.

![Configure FAS 07](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-07.jpg?w=809)

To change the time, go to the command line and enter the following command:

**cluster date modify -dateandtime ccyymmddhhmm.ss**

e.g.

![Configure FAS 09](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-09.jpg?w=809)

If we go back to the GUI and refresh the page using the **Refresh** button, we should now see the system reflecting the correct time. However, without a time source, time will start to drift again, so we’ll need to add one or more NTP servers. Click **Edit** and enter the IP addresses of one or more NTP time servers in your timezone. You can also use this opportunity to change your timezone setting:

![Configure FAS 10](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-102.jpg?w=809)

The next step is to create an aggregate to start building NFS volumes. Go to **Hardware and Diagnostics** and select **Aggregates:**

![Configure FAS 12](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-12.jpg?w=809)

We can see that there will be just one aggregate listed, aggr0. This is reserved for use by the system itself so we will click on the **Create** button to add another aggregate.

![Configure FAS 13](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-13.jpg?w=809)

Name the aggregate agg1 and set the number of disks to add. Here I’ve added 30 disks as this will give me a usable capacity of approximately 91GB which is the same as the spare capacity on the SSD where I’ve deployed the NetApp ONTAP appliance. Click **Create:**

![Configure FAS 14](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-14.jpg?w=809)

Now we’ll create our first SVM. Go to the **SVMs** tab and click on the **Create** button:

![Configure FAS 15](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-15.jpg?w=809)

Call the SVM **SVM1** and enable the NFS protocol. Click **Submit and Continue:**

![Configure FAS 16](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-16.jpg?w=809)

Configure an IP address for the NFS protocol to use. From the dropdown box select **Without a subnet:**

![Configure FAS 17](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-17.jpg?w=809)

Enter an IP address and subnet mask as shown. Note that I’ve entered an IP address from the 10.0.1.0/24 subnet which I’ve reserved for NFS traffic. Click **OK:**

![Configure FAS 18](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-18.jpg?w=809)

Next we’ll need to select a port for the protocol to use. Click on the **Browse** button:

![Configure FAS 19](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-19.jpg?w=809)

Highlight the e0d port. You’ll remember that we configured this port to connect to the VMnet2 network, corresponding to the 10.0.1.0/24 subnet in a previous post. Click **OK:**

![Configure FAS 20](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-20.jpg?w=809)

Review the settings and click **Submit and Continue:**

![Configure FAS 21](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-21.jpg?w=809)

Optionally, you can enter a password for SVM administration. Click **Submit and Continue:**

![Configure FAS 22](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-22.jpg?w=809)

You’ll see a popup box confirming that the SVM was created along with its settings. Click **OK** to close the box:

![Configure FAS 23](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-23.jpg?w=809)

Click on the name of the newly created SVM to get to its managment page. If we now go to the **Volumes** tab for the new SVM we’ll see the root volume has been created. To add a volume that we can use to deploy VMs, click on the **Create** button:

![Configure FAS 24](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-24.jpg?w=809)

Enter a name for the volume and select aggr1 as its aggregate. Here I’ve given the volume a size just under the total available space on the aggregate and reserved 10% of the space for snapshots. I’ve also set it as thin provisioned although this is optional. Click **Create:**

![Configure FAS 25](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-25.jpg?w=809)

Since we’ll be using Veeam to manage the snapshots on this volume, we’ll want to disable the default snapshot policy that has been applied to it. Highlight the volume and go to **Snapshot Copies->Configure:**

![Configure FAS 26](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-26.jpg?w=809)

We’re going to let Veeam manage all snapshot operations so uncheck the **Enable scheduled snapshot copies**  box and click **OK :**

![Configure FAS 27](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-27.jpg?w=809)

In order for the new NFS volume to be mounted on the nested ESXi host, we’ll need to create an export rule for it. Go to the **SVM Settings** tab for this SVM and select **Export Policies.** You’ll see that there is a single policy called **default.** This is the policy that would have been automatically assigned to the new NFS volume, but right now it has no rules, so no ESXi hosts would be able to mount the volume as a datastore. To add a rule, click on the **Add** button:

![Configure FAS 33](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-33.jpg?w=809)

Create an export rule that allows any system on the 10.0.1.0/24 network to see the volume and enable NFS as an access protocol. Click **OK:**

![Configure FAS 29c](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-29c.jpg?w=809)

You should now see the rule listed for this export policy:

![Configure FAS 34](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-34.jpg?w=809)

If we go to the Namespace tab, we should see the NFS volume mounted, with the default export policy applied:

![Configure FAS 35](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-35.jpg?w=809)

At this stage, we’ll turn our attention to the second NetApp FAS simulator. This is going to be our replication target system where we will be storing all the SnapVault copies. We will also be configuring Veeam so that the SnapVault copies will be the data source for backup jobs.

Follow the steps above to add the licenses to this second appliance – you can use the same license keys again.

Set the time and configure NTP as shown above.

Create an aggregate as before using the same settings.

Create a new SVM on the second appliance. You can call this one SVM1\_DR so that in your mind you are associating it with SVM1 on the source appliance. The only change you will need to make is that the IP address will of course be different.

![Capture 01](https://univirt.wordpress.com/wp-content/uploads/2017/07/capture-01.jpg?w=809)

At this stage we’ll create an export rule in the default export policy on the SVM so that when any volumes are mounted in the namespace of the DR SVM, they can be accessed both by the Veeam server and the DR ESXi host. You’ll recall that we have set aside the 10.0.1.0/24 network for NFS storage traffic. Go to the **SVM Settings** tab for SVM1\_DR and click on **Export Policies**. You’ll see that there is a default policy with no rules associated with it. Simply add a policy as before for SVM1 on the source production system.

![Configure FAS 32](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-fas-321.jpg?w=809)

In the next post I’ll be presenting the volume on the production NetApp appliance to the first ESXi host and building a test VM on it for testing purposes.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   Veeam Integration With NetApp SnapVault – Part 5: Configure FAS
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

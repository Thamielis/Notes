---
created: 2024-09-19T16:39:13 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores

---
In the last blog post we integrated our NetApp ONTAP appliances with Veeam and cretaed a backup job that leveraged the SnapVault relationship between the two appliances. In this post we’ll look at how we can use Veeam to recover individual files and folders from SnapVault.

Please note that I have experimented with Instant VM Recovery from a SnapVault volume and found that it fails due to space problems on the underlying volume. Basically, when the restored VM is powered on, vSphere attempts to create a swap file equal in size to the configured memory of the VM. This operation fails because the underlying volume doesn’t autogrow to accommodate the new swap file. If you’ve tried this and have got it to work, please let me know!

Note: This is part 10 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

In order to be able to use Veeam to recover files and application items from a SnapVault copy, Veeam first needs to be interrogate the NetApp appliance storing the copy and enumerate all the virtual machines that are protected on it. If we login to the DR appliance and go to the **Volumes** tab for the target SVM, we can see the volume where the SnapVault copies are stored:

![Veeam Restores 01](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-01.jpg?w=809)

However, if we look at the **Namespace** tab, only the root volume is mounted. We’ll need to mount the SnapVault volume in order for Veeam to be able to inspect it:

![Veeam Restores 02](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-02.jpg?w=809)

Click on the **Mount** button:

![Veeam Restores 03](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-03.jpg?w=809)

Select the SnapVault volume from the drop-down list and provide a junction name. The junction path will be the root (/). Click **Mount:**

![Veeam Restores 04](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-04.jpg?w=809)

We should now see the SnapVault volume listed in the namespace:

![Veeam Restores 05](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-05.jpg?w=809)

Next, we’ll need to mount the SnapVault volume as a datastore on an ESXi host. Going to the **Storage** view in the view in the vSphere Web Client, right click on the datacenter where you would like to create the new datastore and select **Storage->New Datastore:**

![Veeam Restores 06](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-06.jpg?w=809)

The **New Datastore** wizard will start. Click **Next:**

![Veeam Restores 07](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-07.jpg?w=809)

Select **NFS** as the datastore type and click **Next:**

![Veeam Restores 08](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-08.jpg?w=809)

Leave the NFS version as **NFS 3** and click **Next:**

![Veeam Restores 09](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-09.jpg?w=809)

Enter a name for the new datastore. Provide folder and server IP details – these will be the namespace details for the SnapVault volume and the IP address of the SVM. Click **Next:**

![Veeam Restores 10](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-10.jpg?w=809)

Select the host(s) where the new datastore will be mounted and click **Next:**

![Veeam Restores 11](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-11.jpg?w=809)

Review your settings and when happy, click **Finish:**

![Veeam Restores 12](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-12.jpg?w=809)

Pretty soon you should see the new datastore mounted and you’ll be able to travers the file system to see the virtual machine files that were replicated by the SnapVault job:

![Veeam Restores 13](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-13.jpg?w=809)

Now go to the Veeam console and navigate to the **Storage Infrastructure** section. Right-click on the DR NetApp appliance and select **Rescan storage:**

![Veeam Restores 14](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-14.jpg?w=809)

As the DR appliance is scanned it will identify all the SnapVault copies and the virtual machines that have been protected by them. Click **Close:**

![Veeam Restores 15](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-15.jpg?w=809)

Now we’ll try using Veeam to restore a file from one of the SnapVault images. Select one of the SnapVault images listed on the left. A list of all the VMs protected by the SnapVault job can be seen on the right. Here there is just one – WIN2003-01. Note also that it has been protected as an application-consistent snapshot:

![Veeam Restores 16](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-16.jpg?w=809)

Right click on the VM name and select R**estore guest files->Microsoft Windows:**

![Veeam Restores 17](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-17.jpg?w=809)

The File Level Restore (FLR) wizard will launch. As part of the FLR process, a temporary copy of the VM will be registered on vSphere so we will need to specify a location for that VM. Click on **Customize:**

![Veeam Restores 46](https://univirt.wordpress.com/wp-content/uploads/2017/08/veeam-restores-461.jpg?w=809)

Specify the new location settings and click **OK:**

![Veeam Restores 19](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-19.jpg?w=809)

Click **Next:**

![Veeam Restores 18](https://univirt.wordpress.com/wp-content/uploads/2017/08/veeam-restores-18.jpg?w=809)

Optionally, you can enter a restore reason. Click **Next:**

![Veeam Restores 20](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-20.jpg?w=809)

Click **Finish:**

![Veeam Restores 21](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-21.jpg?w=809)

A new FLR job will start. We’ll return to Veeam in a minute to complete the restore job. In the meantime, just to see what’s going on in ONTAP, let’s have a look in the **Volumes** tab for the DR SVM on the DR NetApp appliance. You’ll see that a new volume has been created by Veeam. This a snapshot clone volume created specifically for the purpose of presenting the temporary restore VM to the ESXi host:

![Veeam Restores 24](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-24.jpg?w=809)Over on the **Namespace** tab, we can see that the new volume has been mounted, ready to be used for creating a vSphere volume…

![Veeam Restores 23](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-23.jpg?w=809)

..and when we look in the vSphere Web Client we can see the new datastore:

![Veeam Restores 25](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-25.jpg?w=809)

Returning to Veeam, we can see the FLR wizard initialising. If you look closely at the log, you’ll be able to see all the actions it used to create the sbnapshot clone volume, use it to create a new vSphere datastore, and register the temporary restore VM:

![Veeam Restores 26](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-26.jpg?w=809)

Now we’re ready to restore a file. In the FLR browser navigate to the file or folder you want to restore, right click on it and select **Copy To:**

![Veeam Restores 27](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-27.jpg?w=809)

Choose a local folder where you would like to stage the restored files and click **OK**:

![Veeam Restores 28](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-28.jpg?w=809)

Here I’ve restored the files to a folder on my Veeam backup repository volume from where I can copy it to it’s final destination.

![Veeam Restores 29](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-29.jpg?w=809)

When we’re finished restoring files, we can simply close the FLR wizard. Veeam will now take care of cleaning up after itself. Over on the vSphere Web Client, we can see that the temporary VM has been unregistered and the datastore has been removed:

![Veeam Restores 30](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-30.jpg?w=809)

In OnCommand System Manager, we can see that the clone volume has been unmounted from the namespace and deleted:

![Veeam Restores 32](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-32.jpg?w=809)

![Veeam Restores 31](https://univirt.wordpress.com/wp-content/uploads/2017/07/veeam-restores-31.jpg?w=809)

So that’s it! hopefully you’ll get a chance to play around with this and see if it fits in with your data protection strategy.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores

---
created: 2024-09-19T16:35:52 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators

---
Now that we have two nested ESXi hosts deployed, representing our production and DR locations, we’re going to deploy two NetApp FAS simulators. You should have already downloaded an OVA file for deploying the appliances along with the necessary license keys, as described in Part 1.

Note: This is part 4 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

Right-click on the host where you want to deploy the simulator and select **Deploy OVF Template:**

![vFAS 00](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-00.jpg?w=809)

Select the local OVA file and click **Next:**

![vFAS 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-01.jpg?w=809)

Review the details of the OVF template and click **Next:**

![vFAS 02](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-02.jpg?w=809)

Select a datacenter where the appliance will appear in the inventory.  Here I’ve placed it in a default datacenter that I created when originally installing vCenter. Click **Next:**

![vFAS 03](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-031.jpg?w=809)

Select a storage location for the appliance. As this will be my primary storage node, I’ve chosen to install it on a local SSD drive. Click **Next:**

![vFAS 04](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-04.jpg?w=809)

At this point we need to assign two separate networks to the appliance, one for Management and NFS traffic and one for intracluster communications. In my design, I’ve set aside a network called VMnet1 for the management traffic, one called VMnet2 for NFS traffic and one called VMnet3 for cluster traffic. Although we have no need for cluster traffic in this lab, I have done it this way to avoid warnings during the next stage of the deployment. The effect of this will be to attach the first two NICs of the appliance (e0a and e0b) to VMnet1 and the second two (e0c and e0d) to VMnet3. In a later step we’ll be editing the VM after deployment so that e0d is attached to VMnet2.

Click **Next:**

![vFAS 05](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-05.jpg?w=809)

Click **Finish:**

![vFAS 06b](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-06b.jpg?w=809)

One the deployment has completed, we’ll need to edit the settings of the appliance. Change the network assignment for **Network adapter 4** to **VMnet2.** This will have the effect of attaching e0d to VMnet2. Click **OK.**

![vFAS 07](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-07.jpg?w=809)

Now we can power on the appliance. Open up a console for the appliance in the vSphere Web Client and press CTRL-C when prompted. After a little while you will be presented with the menu options seen below.

Select option 4 to initialise the system. Enter **Y** twice to confirm that you wish to proceed:

![vFAS 09](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-09.jpg?w=809)

The system will take some time to erase all the disks:

![vFAS 10](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-10.jpg?w=809)

Once the disks have been erased the system will reboot automatically and go into the **cluster setup wizard:**

![vFAS 11](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-11.jpg?w=809)

Enter **create** to create a new cluster and hit **Enter:**

![vFAS 12](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-12.jpg?w=809)

In this case we will be building a single node cluster so we will enter **yes** and hit **Enter:**

![vFAS 13](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-13.jpg?w=809)

Enter a secure password for the builtin admin account:

![vFAS 14](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-14.jpg?w=809)

Provide a cluster name and hit **Enter:**

![vFAS 15](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-15.jpg?w=809)

Enter the base license key.

Cluster Base license = SMKQROWJNQYQSDAAAAAAAAAAAAAA

Hit **Enter:**

![vFAS 16](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-16.jpg?w=809)

The cluster will now been created. This process may take a couple of minutes. When it has finished you will be asked to enter additional license keys. We’ll be entering these keys using the GUI at a later stage so just hit **Enter:**

![vFAS 17](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-17.jpg?w=809)

At this stage we will be asked to enter network information for the management ports. You’ll notice here that the default port is set to e0a. This will need to be changed as e0a is actually on the intercluster network (VMnet3) and not on the managment network (VMnet1). change the port to e0c and enter the rest of the IP addressing information as shown:

![vFAS 18](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-18.jpg?w=809)

Optionally you can enter some location information for this cluster:

![vFAS 19](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-19.jpg?w=809)

Now we will need to enter some network information for the node management port. We’re goinfg to share the same port (e0c) as the cluster management interface, and create an IP address, as shown.

You can hit **Enter** to skip setting up a system config backup destination:

![vFAS 20](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-20.jpg?w=809)

Again you can hit **Enter** to acknowledge that autosupport has been enabled:

![vFAS 21](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-21.jpg?w=809)

You will now be asked to login to perform any further configuration. In our case we just need to enter one last command to assign any unassigned disks to this node so that they will be available for creating aggregates. The command to enter is:

<cluster\_name>::>storage disk assign -all -true -node <node\_name>

Note that the ONTAP CLI allows you to use the tab key to autocomplete commands in case you forget the syntax or the names of variables (such as the node name).

![vFAS 22](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-22.jpg?w=809)

So that’s our first NetApp FAS simulator deployed. Now we just need to repeat the steps above to deploy the second one. This will be installed in an identical fashion – all you need to do is change the IP address information for the cluster and node management interfaces. The same cluster base license can be reused.

When we have finished we should see the two nested ESXi host VMs and two NetApp FAS simulators listed in the vCenter inventory like this:

![vFAS 23](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-23.jpg?w=809)

You’ll notice that there is an alarm on the host I’ve used to deploy all this. This is down to memory utilisation. The total allocation for the 4 VMs is 24GB whereas my server has just 16GB of physical RAM. This has lead to some swapping on my system, but not so much that I can’t run the tests that I want to. Ideally, a system with 32GB would be better.

![vFAS 24](https://univirt.wordpress.com/wp-content/uploads/2017/05/vfas-24.jpg?w=809)

In my next post, we’ll start configuring the NetApp FAS simulators via the GUI.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

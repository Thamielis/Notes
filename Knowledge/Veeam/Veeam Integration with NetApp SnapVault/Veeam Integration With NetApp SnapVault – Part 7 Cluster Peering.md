---
created: 2024-09-19T16:37:59 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering

---
In this post we’re going to move on to establishing a cluster peer relationship between the production and DR NetApp appliances. Peering is the process of establishing an IP connection between NetApp clusters that is dedicated sharing information between clusters for the purposes of creating SnapMirror and SnapVault relationships.

Note: This is part 7 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

The first step is to create an intercluster LIF (logical interface) on both the production and DR NetApp appliances. We’ll start by creating the intercluster LIF on the production side. Go to the **Network** section and click on the **Network Interfaces** tab. You’ll see existing LIFs for cluster management, node management and for NFS traffic. Click on the **Create** button:

![Cluster Peering 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-01.jpg?w=809)

Give the interface a helpful name such as ‘Intercluster’ and set the Interface Role to **Intercluster Connectivity.** Set the IPspace to **Default**. To assign an IP address, select **Without a subnet** from the drop-down menu.

![Cluster Peering 02](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-02.jpg?w=809)

Enter an IP address and network mask. In our case we’re replicating between clusters on the same IP network so there’s no need to specify a gateway. Click **OK:**

![Cluster Peering 03](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-03.jpg?w=809)

Select a port that the LIF will use. Here I’ve chosen port e0d. Click **Create:**

![Cluster Peering 04](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-04.jpg?w=809)

The new Intercluster LIF should not be visible in the list of Network Interfaces.

![Cluster Peering 05](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-05.jpg?w=809)

Now go to the DR NetApp appliance and repeat the process. You just need to make sure that your IP addressing and port assignments are chosen in such a way that the two appliances can communicate with each other. In my case I’ve chosen an IP address in the same address range (10.0.0.65/24) and again I’ve used port e0d:

![Cluster Peering 06](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-061.jpg?w=809)

Now we’ll set up the cluster peering. On the production NetApp appliance, go to the **Configurations** section and click on **Cluster Peers.** Click on the **Create** button:

![Cluster Peering 07](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-07.jpg?w=809)

The details for the local cluster will be automatically filled in for you. Choose a passphrase that will be used on both nodes to establish the peering and enter the IP address of the Intercluster LIF on the DR NetApp appliance. Click **Create:**

![Cluster Peering 08](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-08.jpg?w=809)

The confirmation dialog will remind you that there may be more work to do on the peer cluster i.e. the DR NetApp appliance. Click **OK:**

![Cluster Peering 09](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-09.jpg?w=809)

The peer information will be displayed but you’ll notice that right now it is listed as being **Unavailable** and with an Authentication Status of  **pending.** And it’ll stay that way until we complete the configuration on the DR side.

![Cluster Peering 10](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-10.jpg?w=809)

Going to the DR NetApp appliance, we repeat the process of creating a cluster peer, entering the same passphrase as before and the IP address of the intercluster LIF on the production NetApp appliance:

![Cluster Peering 11](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-11.jpg?w=809)

After a few minutes, both systems should show that the peer is available with an Authentication Status of **ok.** You may need to click the refresh button  a couple of times. Note that the GUI will show the IP address of the remote intercluster LIF that this appliance has connected to:

![Cluster Peering 12](https://univirt.wordpress.com/wp-content/uploads/2017/05/cluster-peering-12.jpg?w=809)

So that’s the cluster peering setup. But there are still 2 more levels of peering to be established – SVM to SVM and volume to volume. In the next post we’ll look at completing the peering configuration by creating a SnapMirror/SnapVault relationship between the NFS volumes on the production and DR NetApp appliances.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

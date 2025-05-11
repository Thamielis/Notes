---
created: 2024-09-19T16:35:25 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts

---
In the previous post we built two nested ESXi hosts and created a couple of Datacenter objects and cluster objects in vCenter, representing a production environment and a DR environment, as shown below:

![Nested 00c](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-00c.jpg?w=809)

Now we need to add the two nested ESXi hosts to the vCenter inventory.

Note: This is part 3 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

We’ll start by adding the host for production. Right-click on the **Production** cluster and click **Add Host:**

![Configure Hosts 22](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-22.jpg?w=809)

Enter the host name or IP address. I’ve already created DNS entries for both hosts so I’ve entered an FQDN, esxi-1.mylab.com. Click **Next:**

![Configure Hosts 03](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-03.jpg?w=809)

Provide root credentials for the host and click **Next:**

![Configure Hosts 04](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-04.jpg?w=809)

You’ll receive a warning that the host doesn’t have a certificate recognised by vCenter. Click **Yes** to replace the certificate with one signed by the vCenter Certificate Server.

![Configure Hosts 05](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-05.jpg?w=809)

Now you’ll be presented with a summary of the host we are about to add. Click **Next:**

![Configure Hosts 06](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-06.jpg?w=809)

If you have a license for the servers you can assign it to the new host now. Otherwise you can proceed with the 60 day evaluation license that gets installed with all new ESXi hosts. Click **Next:**

![Configure Hosts 07](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-07.jpg?w=809)

We’re going to stick with the default lockdown mode of **Disabled** here. Click **Next:**

![Configure Hosts 08](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-08.jpg?w=809)

Click **Finish** to complete the process.

![Configure Hosts 09](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-09.jpg?w=809)

You can now proceed to add the second nested ESXi host to the DR cluster. Once both hosts have been added the inventory should look something like this:

![Configure Hosts 21](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-21.jpg?w=809)

Now we’ll need to add a VMkernel adapter for NFS storage to each of these hosts. This will be on a separate IP subnet, otherwise ESXi will attempt to use the management VMkernel port, vmk0, to mount NFS datastores and we will will get errors. For a full description of why this is important, read this:

[https://blogs.vmware.com/kb/2013/02/challenges-with-multiple-vmkernel-ports-in-the-same-subnet.html](https://blogs.vmware.com/kb/2013/02/challenges-with-multiple-vmkernel-ports-in-the-same-subnet.html)

Start by selecting the production host and going to **Manage->Networking->VMkernel adapters** as show below. You’ll see the management network VMkernel port that was created automatically during the installation of ESXi. Click on the **Add Networking** button:

![Configure Hosts 23](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-23.jpg?w=809)

Select the connection type **VMkernel Networking Adapter** and click **Next:**

![Configure Hosts 12](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-12.jpg?w=809)

Choose the option to use a **New standard switch** and click **Next:**

![Configure Hosts 13](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-13.jpg?w=809)

Click on the plus symbol (+) to assign an adapter:

![Configure Hosts 14](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-14.jpg?w=809)

You’ll see one un-assigned adapter listed. This is the second adapter that we added to the nested ESXi host when we first created it. Highlight the adapter and click **OK:**

![Configure Hosts 15](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-15.jpg?w=809)

Make sure that the new adapter appers under the list of **Active adapters** and click **Next:**

![Configure Hosts 16](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-16.jpg?w=809)

For clarity, provide the VMkernel port with a descriptive label. This VMkernel port will not be used by any of the listed vSphere services so you should leave all the boxes unchecked. Click **Next:**

![Configure Hosts 17](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-17.jpg?w=809)

Set a static IP address on the 10.0.1.0/24 subnet and click **Next:**

![Configure Hosts 18](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-18.jpg?w=809)

Review the settings and, when you’re happy that everything is correct, click **Finish:**

![Configure Hosts 19](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-191.jpg?w=809)

You should now see the new adapter listed as shown below.

![Configure Hosts 20](https://univirt.wordpress.com/wp-content/uploads/2017/05/configure-hosts-201.jpg?w=809)

Now you’ll need to repeat the steps above to add the second nested nested ESXi host to vCenter and create another VMkernel adapter, again with an IP address in the 10.0.1.0/24 subnet.

In the next post we’ll deploy the two NetApp FAS simulators.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

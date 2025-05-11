---
created: 2024-09-19T16:34:54 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/
author: 
---

# Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts

---
In this post I’m going to deploy 2 nested ESXi hosts. Both will be installed on a single physical HP Microserver, also running ESXi6 and managed by vCenter 6.

(Note – due to changes in the way that vSphere deploys OVFs, vSphere 6.5 will not work with the NetApp OVF file, so make sure that you only use vCenter 6.0 and ESXi 6.0).

We’ll be installing two nested ESXi hosts to be configured as follows:

<table><tbody><tr><td>Hostname</td><td>FQDN</td><td>IP Address</td><td>Netmask</td><td>Default Gateway</td></tr><tr><td>esxi-1</td><td>esxi-1.mylab.com</td><td>10.0.0.50</td><td>255.255.255.0</td><td>10.0.0.254</td></tr><tr><td>esxi-2</td><td>esxi-2.mylab.com</td><td>10.0.0.60</td><td>255.255.255.0</td><td>10.0.0.254</td></tr></tbody></table>

Then we’ll import them into vCenter and create 2 separate datacenters for them for the purposes of clarity.

Note: This is part 2 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

My first task will be to login to vCenter using the vSphere Web Client and create some networks for my virtual machines. Below you can see that I have simply added 3 virtual machine port groups to vswitch0:

![Nested 00a](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-00a.jpg?w=809)

These segments will be used as follows:

<table><tbody><tr><td>VMnet1</td><td>Management and VM traffic</td><td>10.0.0.0/24</td></tr><tr><td>VMnet2</td><td>NFS Storage Traffic</td><td>10.0.1.0/24</td></tr><tr><td>VMnet3</td><td>NetApp Cluster Network</td><td>N/A</td></tr></tbody></table>

We’ll also need to make a change to the security settings of the vswitch itself by enabling Promiscuous Mode:

![Nested 00b](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-00b.jpg?w=809)

Now we can start deploying the Nested ESXi hosts. Right-click on the physical host and select the option to create a new virtual machine. Click **Next**:

![Nested 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-01.jpg?w=809)

Enter a name for the VM as it will appear in vCenter and select a location where it will appear in the inventory. Click **Next:**

![Nested 02](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-02.jpg?w=809)

Select the physical host that this VM will be deployed on and click **Next:**

![Nested 03](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-03.jpg?w=809)

Select a datastore where the VM files will reside. Here I’ve chosen a local hard drive. Click **Next:**

![Nested 04](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-04.jpg?w=809)

Select a a comparability level for the VM. Here I’ve selected the default for my environment, which in my case is ESXi 6.0 and later. Click **Next:**

![Nested 05](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-05.jpg?w=809)

Now I can choose **VMware ESXi 6.0** as my guest OS. You’ll notice that there is a warning that this is not officially supported by VMware, meaning “never do this in production”! Click **Next:**

![Nested 06](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-06.jpg?w=809)

Configure the VM with 2 vCPUs as a minimum – anything less and you won’t be able to install ESXi. **Important**– check the box marked **Hardware Virtualization.** 

![Nested 07](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-07.jpg?w=809)

Make sure that the VM has a minimum of 4GB of memory. Note that I’ve left the disk size at the default of 40GB but thin provisioned it. A disk size of 10GB or more will do.

![Nested 08](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-08.jpg?w=809)

Add a second E1000E network adapter to the VM – this will be used for NFS storage traffic. Make sure that the first NIC is connected to VMnet1 and the second is connected to VMnet2.

![Nested 09](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-09.jpg?w=809)

Connect the CD drive to an ISO copy of the ESXi installation CD and make sure that the “**Connect At Power On**” box is checked. Now click **Next:**

![Nested 10](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-10.jpg?w=809)

Review your settings and click **Finish:**

![Nested 11](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-11.jpg?w=809)

When the newly created VM appears in the inventory, right-click on it and click **Power->Power ON:**

![Nested 12](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-12.jpg?w=809)

On the VM console press **Enter** to continue with the installation:

![Nested 13](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-13.jpg?w=809)

Press **F11** to accept the EULA:

![Nested 14](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-14.jpg?w=809)

The installer will scan for available storage devices to install the operating system:

![Nested 15](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-15.jpg?w=809)

Soon we should see the virtual disk that we created with the VM. Press **Enter** to continue:

![Nested 16](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-16.jpg?w=809)

Elect a keyboard layout and press **Enter:**

![Nested 17](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-17.jpg?w=809)

Enter a root password and press **Enter:**

![Nested 18](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-18.jpg?w=809)

Press **F11** to confirm the install:

![Nested 19](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-19.jpg?w=809)

When the install has completed press **Enter** to reboot the VM:

![Nested 20](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-20.jpg?w=809)

When it boots, the ESXi host will atempt to use DHCP to configure itself. You can see below that in my case the hosts acquired a host name and IP address. We’re going to want to change this. Press **F2:**

![Nested 21](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-21.jpg?w=809)

Cursor down to **Configure Management Network** and press **Enter:**

![Nested 22](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-22.jpg?w=809)

Go down to **IPv4 Configuration** and press **Enter:**

![Nested 23](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-23.jpg?w=809)

Make sure that you select the option to **Select static IPv4 address and network configuration.** Enter your preferred values (here I am using 10.0.0.50/24 as my host IP address) and press **Enter.:**

![Nested 24](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-24.jpg?w=809)

Now go to **DNS Configuration** and press **Enter.** 

![Nested 25](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-25.jpg?w=809)

Set values for the primary DNS server and hostname and press **Enter:**

![Nested 26](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-26.jpg?w=809)

Go to **Custom DNS Suffixes** and press **Enter:**

![Nested 27](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-27.jpg?w=809)

Enter a suffix for your local DNS domain and press **Enter:**

![Nested 28](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-28.jpg?w=809)

Press **ESC** to exit the **Configure Management Network** page. You will be asked to confirm that you wish to apply the changes – press **Y:**

![Nested 29](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-29.jpg?w=809)

That’s the first nested ESXi host deployed. Now just repeat the steps above to deploy the second one, changing just the IP address and hostname information.

Going back to the vSphere Web Client we need to make some preparations for importing the 2 new nested ESXi hosts. For the sake of clarity, we’ll create 2 new Datacenter objects. In my case I’ve called them **MYLAB – DR** and **MYLAB – Production**. I’ve also created 2 cluster objects called **DR** and **Production.** This last step isn’t strictly necessary but it helps to emulate a realworld environment.

![Nested 00c](https://univirt.wordpress.com/wp-content/uploads/2017/05/nested-00c.jpg?w=809)

In the next post I’ll be importing the nested ESXi hosts into vCenter and configuring them for NFS storage.

-   [Veeam Integration With NetApp SnapVault – Part 1: Overview](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/)
-   Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

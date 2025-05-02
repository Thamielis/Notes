---
created: 2024-09-19T16:34:03 (UTC +02:00)
tags: []
source: https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-1-overview/
author: 
---

# A Step-by-Step Guide to Veeam Integration With NetApp SnapVault – Part 1: Overview

---
Since I started preparing for this series of posts, the world was hit by the WannaCry ransomware virus and now it feels like that the subject is more relevant than ever. This has suddenly become a very visible crime that previously went unreported. Last year, it is estimated that over 1 Billion dollars was paid over to cyber-criminals. With [EU GDPR](http://www.eugdpr.org/) rules looming, non-reporting of ransomware attacks will no longer be an option for anyone doing business in the EU, with [heavy penalties](http://www.eugdpr.org/key-changes.html) for any company that chooses not to disclose within 3 days of an attack occuring.

I had been thinking of ways to architect a data protection strategy that would make recovering from a ransomware attack as fast as possible and protecting backup sets from being encrypted by the bad guys. I’m not the only one who has been thinking along these lines but what I had trouble with was a guide that would show me how I could implement it in my Veeam Lab environment. One way to put data beyond the reach of the bad guys would be to use NetApp ONTAP’s SnapVault feature and integrate it with Veeam. This series of blogs records how I did it.

I’d like to give a big shout out to Neil Anderson over at [Flackbox](http://www.flackbox.com/) who peer-reviewed (and spell-checked!) this blog series.

Note: This is part 1 of a 10-part series. Links to the rest of the posts in this series can be found at the bottom of the page.

Any data that resides on a CIFS share is vulnerable, and that could include your Veeam repository. So what technologies can we leverage to mitigate the risk. The good news is, there are plenty of things we can do, some new and some surprisingly old-fashioned, such as:

-   Linux-based repositories
-   Storage snapshots, on primary and DR storage systems
-   Tape
-   Cloud repositories
-   Deduplication appliances that can use non-NAS protocols (e.g. Dell EMC Data Domain and HPE StoreOnce)

For an idea of what I’m trying to achieve have a look at the following schematic:

[![](https://univirt.wordpress.com/wp-content/uploads/2017/05/introduction-02.jpg?w=809&h=479)](https://univirt.wordpress.com/wp-content/uploads/2017/05/introduction-02.jpg)

While I intend to do some posts on dedup appliances at some time in the future, for this post, I’ll be using storage snapshots on NetApp ONTAP and tape.The parts of this architecture that I will be implementing are the Production and DR VMware hosts (nested ESXi 6), the NetApp Primary and Secondary storage systems (ONTAP 9 simulators) and the tape library (QuadStor VTL emulated tape library).

The network architecture will look as shown below, with separate subnets for the management and VM traffic (VMnet1) and the NFS storage traffic (VMnet2). There is also a third network for the NetApp cluster traffic which, although not needed for this lab, is a requirement for deploying the NetApp virtual appliance.

![Introduction 01](https://univirt.wordpress.com/wp-content/uploads/2017/05/introduction-011.jpg?w=809)

So lets get started. At this stage, I’m going to assume that you have installed Veeam Backup and Replication 9.5. I’ll be using local disk storage as my repository. I’m also going to assume that you have a system with sufficient resources to host everything. In my case I have 2 HP Microservers, each with a dual core processor and 16GB of memory. The first system hosts my vCenter server, my Veeam 9.5 (update 2) server, and my Quadstor VTL tape library.

I’ll be using the following IP addresses (all /24):

<table><tbody><tr><td>Veeam Server</td><td>Management NIC</td><td>10.0.0.27/24</td></tr><tr><td></td><td>Preferred Backup NIC</td><td>10.0.1.28/24</td></tr><tr><td>vFAS-01</td><td>Node Address</td><td>10.0.0.52/24</td></tr><tr><td></td><td>Cluster Address</td><td>10.0.0.53/24</td></tr><tr><td></td><td>SVM Data LIF</td><td>10.0.1.54/24</td></tr><tr><td></td><td>Intercluster</td><td>10.0.0.55/24</td></tr><tr><td>vFAS-02</td><td>Node Address</td><td>10.0.0.62/24</td></tr><tr><td></td><td>Cluster Address</td><td>10.0.0.63/24</td></tr><tr><td></td><td>SVM Data LIF</td><td>10.0.1.64/24</td></tr><tr><td></td><td>Intercluster</td><td>10.0.0.65/24</td></tr><tr><td>ESXi-1</td><td>Management VMkernel Port</td><td>10.0.0.50/24</td></tr><tr><td></td><td>NFS VMkernel Port</td><td>10.0.1.51/24</td></tr><tr><td>ESXi-1</td><td>Management vMkernel Port</td><td>10.0.0.60/24</td></tr><tr><td></td><td>NFS vMkernel Port</td><td>10.0.1.61/24</td></tr><tr><td>QuadStor VLT</td><td>iSCSI Target Address</td><td>10.0.0.100/24</td></tr></tbody></table>

You can download the Data ONTAP Simulator [here](http://mysupport.netapp.com/NOW/download/special/evaluation.cgi) (you’ll need a login to the NetApp Support site).

When you get to the downloads page, make sure that you download all the packages shown here. Note that version 9.1 of the ONTAP simulator became available towards the end of writing up this series. You can either proceed with the 9.0 version or use the newer version. Some steps described here will be slightly different but the overall implementation will yield the same results.

![downloads](https://univirt.wordpress.com/wp-content/uploads/2017/02/downloads.jpg?w=809&h=256)

You will also need to download the following software for the Quadstor VTL deployment:

-   [QuadStor VTL installer](http://www.quadstor.com/vtlextdownloads/quadstor-vtl-ext-3.0.8-rhel6.x86_64.rpm)
-   [CentOS 6.8 media](https://wiki.centos.org/Download)
-   [WinSCP](https://winscp.net/eng/download.php)
-   [PuTTY](http://www.putty.org/)

In my next post I’ll start preparing my physical ESXi host for deploying the nested ESXi and NetApp simulator VMs.

-   Veeam Integration With NetApp SnapVault – Part 1: Overview
-   [Veeam Integration With NetApp SnapVault – Part 2: Deploying the Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-2-deploying-the-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 3: Configure Nested ESXi Hosts](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-3-configure-nested-esxi-hosts/)
-   [Veeam Integration With NetApp SnapVault – Part 4: Deploy NetApp Simulators](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-4-deploy-netapp-simulators/)
-   [Veeam Integration With NetApp SnapVault – Part 5: Configure FAS](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-5-configure-fas/)
-   [Veeam Integration With NetApp SnapVault – Part 6: Add NFS Datastore](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-6-add-nfs-datastore/)
-   [Veeam Integration With NetApp SnapVault – Part 7: Cluster Peering](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-7-cluster-peering/)
-   [Veeam Integration With NetApp SnapVault – Part 8: SnapVault Relationship](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-8-snapvault-relationship/)
-   [Veeam Integration With NetApp SnapVault – Part 9: Veeam Integration](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-9-veeam-integration/)
-   [Veeam Integration With NetApp SnapVault – Part 10: Veeam Restores](https://univirt.wordpress.com/2017/08/03/veeam-integration-with-netapp-snapvault-part-10-veeam-restores/)

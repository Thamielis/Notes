https://www.checkyourlogs.net/how-to-add-the-network-attached-storage-smb-or-cifs-shares-as-a-backup-repository-at-veeam-backup-and-replication-v12/

> You can use network-attached storage (SMB or CIFS Shares) as backup repositories with Veeam Backup and Replication. A network-attached storage (NAS) device can be a shared folder on your computer o…

# How to add the Network Attached Storage (SMB or CIFS Shares) as a Backup Repository at Veeam Backup and Replication v12
![How to add the Network Attached Storage (SMB or CIFS Shares) as a Backup Repository at Veeam Backup and Replication v12](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe4.png?resize=916%2C640&quality=80&ssl=1)

You can use network-attached storage (SMB or CIFS Shares) as backup repositories with Veeam Backup and Replication. A network-attached storage (NAS) device can be a shared folder on your computer or any other physical device accessed via the Server Message Block (SMB) protocol.  

Note:  

-   You must deploy a gateway server because an SMB share cannot host Veeam Data Movers. Veeam Backup & Replication will automatically deploy a Veeam Data Mover on this gateway server.  
    
-   It is recommended that you deploy an additional gateway server in the remote site, closer to the SMB repository, if you plan to move VM data to an off-site SMB repository over a WAN link.  
    

1. Log in to the Veeam Backup and replication manager server.

2. Open the Veeam Backup & Replication Console and click Connect.

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe1.png?w=1080&quality=80&ssl=1)

3. Select Backup Infrastructure on the Home page.

4\. Select Backup Repositories on the Backup Infrastructure page.  

5\. Right-click Backup Repositories and select Add backup repository.  

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe2.png?w=1080&quality=80&ssl=1)

6. On the Add Backup Repository page, select Network attached storage.

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe3.png?w=1080&quality=80&ssl=1)

7. Select SMB share on the Network Attached Storage.

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe4.png?w=1080&quality=80&ssl=1)

8. On the Name page, specify a Backup Repository name.

9\. Give a brief description in the Description field for future reference and click Next.  

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe5.png?w=1080&quality=80&ssl=1)

10. On the Share page, enter the share folder name in the Share folder field.

11\. Select This share requires access credentials checkbox and select a credential from the drop-down list.  

12\. Select Automatic selection or click Choose to select the Gateway server.  

13\. Click Next.  

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe6.png?w=1080&quality=80&ssl=1)

14. Use the Load control settings to manage the load on the backup repository and avoid storage I/O timeouts.

15. Click Advanced.

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe7.png?w=1080&quality=80&ssl=1)

16. On the Storage Compatibility Settings, select Align backup file data blocks (recommended) checkbox.

17\. Select Use per-machine backup files and click OK.  

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe8.png?w=1080&quality=80&ssl=1)

Note:  

Select Decompress backup file data blocks before storing if you use a deduplicating storage feature or appliance.  

18\. Click Next on the Repository page.  

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe9.png?w=1080&quality=80&ssl=1)

19. Select a mount server from the Mount server drop-down list on the Mount Server page.

20\. Select a folder in the Instant recovery write cache folder field for writing cache during mount operations.  

21\. Unselect Enable vPower NFS service on the mount server because the vPower NFS service is not used for instant recovery to a Microsoft Hyper-V VM.  

22\. Click Next.  

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe10.png?w=1080&quality=80&ssl=1)

23. Click Apply on the Review page.

24\. Select the Search the repository for existing backups and import them automatically checkbox if the backup repository contains backups previously created with Veeam Backup & Replication.  

25\. Select the Import guest file system index data to the catalog checkbox if the backup repository contains guest file system index files previously created by Veeam Backup & Replication.  

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe11.png?w=1080&quality=80&ssl=1)

26. Click Next on the Apply page.

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe12.png?w=1080&quality=80&ssl=1)

27. Click Finish on the Summary page.

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe13.png?w=1080&quality=80&ssl=1)

28. Verify that the Backup Repository has been added.

![](https://i0.wp.com/www.checkyourlogs.net/wp-content/uploads/2023/08/082523_1816_Howtoaddthe14.png?w=1080&quality=80&ssl=1)

I hope you enjoy this post.

Cary Sun

Twitter: @SifuSun

Web Site: [carysun.com](https://carysun.com/)

Blog Site: [checkyourlogs.net](https://checkyourlogs.net/)

Blog Site: [gooddealmart.com](https://angussun.com/)

### *Related*

### About The Author

![Cary Sun](https://secure.gravatar.com/avatar/bb560111b603470f0dad925a6baa5969?s=170&d=mm&r=g)

#### [Cary Sun](https://www.checkyourlogs.net/author/carysun/ "View all posts by Cary Sun")

Cary Sun has a wealth of knowledge and expertise in data center and deployment solutions. As a Principal Consultant, he likely works closely with clients to help them design, implement, and manage their data center infrastructure and deployment strategies. With his background in data center solutions, Cary Sun may have experience in server and storage virtualization, network design and optimization, backup and disaster recovery planning, and security and compliance management. He holds CISCO CERTIFIED INTERNETWORK EXPERT (CCIE No.4531) from 1999. Cary is also a Microsoft Most Valuable Professional (MVP), Microsoft Azure MVP, Veeam Vanguard and Cisco Champion. He is a published author with several titles, including blogs on Checkyourlogs.net, and the author of many books. Cary is a very active blogger at checkyourlogs.net and is permanently available online for questions from the community. His passion for technology is contagious, improving everyone around him at what they do. Blog site: https://www.checkyourlogs.net Web site: https://carysun.com Blog site: https://gooddealmart.com Twitter: @SifuSun in: https://www.linkedin.com/in/sifusun/ Amazon Author: https://Amazon.com/author/carysun

-   [](http://sifusun/)
-   [](https://www.linkedin.com/in/sifusun/)

### Related Posts

### Leave a Reply

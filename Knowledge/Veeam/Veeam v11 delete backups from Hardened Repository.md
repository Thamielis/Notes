---
created: 2025-04-03T09:17:10 (UTC +02:00)
tags: []
source: https://nolabnoparty.com/en/veeam-v11-delete-backups-from-hardened-repository/
author: Paolo Valsecchi
---

# Veeam v11: delete backups from Hardened Repository • Nolabnoparty

---
29/03/2022 Reading Time: 3 minutes

![veeam-delete-backup-data-hardened-repository-01](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-01.jpg "veeam-delete-backup-data-hardened-repository-01")

During the administration of your Veeam Backup & Replication infrastructure you may need to delete backups from [Hardened Repository](https://nolabnoparty.com/en/veeam-v11-hardened-repository-immutability-pt-1/) to make some room.

The [Hardened Repository](https://nolabnoparty.com/en/veeam-v11-upgrade-the-hardened-repository/) is a feature provided in [Veeam Backup & Replication v11](https://nolabnoparty.com/en/veeam-v11a-released/) designed to **make backups immutable** protecting them from deletion, overwriting or changes.

There are multiple reasons **why you need to delete backups** from the repository:

-   Remove a backup chain **no longer required** but still immutable.
-   Make room in the storage because the **repository is full**.
-   When the retention expires it may happen that Veeam performs the deletion of restore points but for unknown reasons backup files **are not removed** from the Hardened Repository. This situation must be fixed because restore points left in the repository **consume space** and the repository has a **limited space capability**.

## Delete backups from Hardened Repository

If you try removing the backup from a Hardened Repository using the Veeam GUI, you will receive an **error message** and backup won't be deleted. This is an expected behavior since **backups are immutable**.

![veeam-delete-backup-data-hardened-repository-02](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-02-600x459.jpg "veeam-delete-backup-data-hardened-repository-02")

The only way to remove the backup is to access the Hardened Repository and **manually delete backups**.

#### Connect the repository to the LAN

If the **best practices have been applied** to the Hardened Repository, the iDRAC, iLO or similar remote access control must be **reconnected to the LAN** to enable the access to the console.

Access the remote console (iDRAC in the example), enter the correct credentials then click **Log in** button.

![veeam-delete-backup-data-hardened-repository-03](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-03-600x438.jpg "veeam-delete-backup-data-hardened-repository-03")

From the remote access console, open the **Virtual Console**.

![veeam-delete-backup-data-hardened-repository-04](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-04.jpg "veeam-delete-backup-data-hardened-repository-04")

Enter the account name created during the installation of the Hardened Repository (_locadmin_ in the example).

![veeam-delete-backup-data-hardened-repository-05](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-05-600x426.jpg "veeam-delete-backup-data-hardened-repository-05")

Run the following command and enter the password when requested.

\# sudo -i

![veeam-delete-backup-data-hardened-repository-06](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-06-600x55.jpg "veeam-delete-backup-data-hardened-repository-06")

Access the configured mount point (_/mnt/veeamrepo_ in the example) then list the existing folders. The **backups** folder is where **Veeam stores backups**.

\# cd /mnt/veeamrepo  
\# ll

![veeam-delete-backup-data-hardened-repository-06](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-07-600x108.jpg "veeam-delete-backup-data-hardened-repository-06")

With the _cd_ command, access the backup folder with the backup data to remove and **check the content** with the command _ll_. The folder name is the **same as the Backup Job** name configured in Veeam.

\# cd backups/Backup\\ Immutable\\ -\\ Test/  
\# ll -h

![veeam-delete-backup-data-hardened-repository-08](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-08-600x139.jpg "veeam-delete-backup-data-hardened-repository-08")

#### Delete the backup file

If you **try deleting the backup file**, you will receive an error. This is an expected behavior since the **file is still immutable**.

\# rm <backup\_file\_name>

![veeam-delete-backup-data-hardened-repository-09](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-09-600x66.jpg "veeam-delete-backup-data-hardened-repository-09")

To check **what files are immutable**, run the following command. In this example the _.vbk_ file (full backup) is still immutable.

\# lsattr -l

![veeam-delete-backup-data-hardened-repository-10](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-10-600x75.jpg "veeam-delete-backup-data-hardened-repository-10")

#### Remove the immutability attribute

To delete the file you must **remove the immutable attribute** first.

\# chattr -i <backup\_file\_name>

![veeam-delete-backup-data-hardened-repository-11](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-11-600x56.jpg "veeam-delete-backup-data-hardened-repository-11")

Check if the immutable attribute has been removed.

\# lsattr -l

![veeam-delete-backup-data-hardened-repository-12](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-12-600x72.jpg "veeam-delete-backup-data-hardened-repository-12")

When the file is **no longer immutable**, it can be deleted. Remove the backup file and check if the operation completes successfully.

\# rm <backup\_file\_name>  
\# ll -h

![veeam-delete-backup-data-hardened-repository-13](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-13-600x123.jpg "veeam-delete-backup-data-hardened-repository-13")

The file has been removed successfully.

#### Rescan the repository

Once the backup file has been removed, you need to **rescan the Hardened Repostory** in Veeam to update the available backups list.

![veeam-delete-backup-data-hardened-repository-14](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-14-600x406.jpg "veeam-delete-backup-data-hardened-repository-14")

From **Backup Repositories**, right click the Hardened Repository and select **Rescan** option.

![veeam-delete-backup-data-hardened-repository-15](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-15-600x364.jpg "veeam-delete-backup-data-hardened-repository-15")

Double check rescan completes successfully.

![veeam-delete-backup-data-hardened-repository-16](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-16-600x459.jpg "veeam-delete-backup-data-hardened-repository-16")

After the rescan, checking in the **Backup > Disk** section the recover point item has removed from the configuration.

![veeam-delete-backup-data-hardened-repository-17](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-17-600x405.jpg "veeam-delete-backup-data-hardened-repository-17")

From the repository, type the _exit_ command twice to **logoff from the console**.

\# exit

![veeam-delete-backup-data-hardened-repository-18](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-18-600x71.jpg "veeam-delete-backup-data-hardened-repository-18")

Before unplugging the network, make sure **no one is currently logged** to the console.

![veeam-delete-backup-data-hardened-repository-19](https://nolabnoparty.com/wp-content/uploads/2022/03/veeam-delete-backup-data-hardened-repository-19-600x83.jpg "veeam-delete-backup-data-hardened-repository-19")

Once the backups have been removed from the repository, make sure **SSH service is disabled** and the **network cable** unplugged from the server remote console (iDRAC, iLO, etc.). Bear in mind this is the key to ensure and keep the highest level of security for your backup repository.

[Veeam Backup & Replication v11](https://nolabnoparty.com/en/veeam-v11-configure-double-immutable-backups-on-prem-and-cloud-pt-1/) is available to download as [30-day trial](https://www.veeam.com/downloads.html) for testing purposes.

![signature](https://nolabnoparty.com/wp-content/uploads/images/firma.jpg "signature")

#### About The Author

![](https://secure.gravatar.com/avatar/5845a7a6aba7f186fd21f34ef179e074?s=100&r=g)

##### [Paolo Valsecchi](https://nolabnoparty.com/en/author/paolo-valsecchi/)

**System Engineer**, VCP-DCV, VCP-DM, vExpert, VMCE, VMCA, Veeam Vanguard. Working experience focused on VMware vSphere, Microsoft Active Directory, and backup/DR solutions.

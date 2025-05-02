---
created: 2025-05-02T10:04:26 (UTC +02:00)
tags: []
source: https://www.gable.it/nas-backup-gfs-to-tape-part-ii/
author: gabriele pelizzari
---

# NAS Backup - GFS to TAPE - Part II — Gabriele Pelizzari

---
In the [previous article](https://www.gable.it/nas-backup-gfs-su-tape/), we saw how to operate on backup jobs to obtain Fulls that can be used to create a GFS retention policy when the destination of the jobs is a tape.

In this second article, we find out how a similar result can be achieved by copying tapes.

**Note1**: A second tape library must be present in the DataCenter to pursue this protection process.

**Note2**: The most common use case for **Copy-Tape** is to migrate data contained on tapes from an old technology (LT06) to a new one (LTO9), since the new technology would not be able to natively read the data contained on the old tapes.

There are two steps that will enable us to achieve our goal:

-   **Step 1**: Creation of a tape pool afferent to the second library.
-   **Step 2**: Tape copy job.

**Stage 1**

The creation of the Media Pool (image 1), will need to be customized by setting:

-   -   The use of a new tape for each copy session (image 2).
    -   Setting a retention that for that tape group coincides with that required by the GFS policy (image 3).

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-01.png)Picture 1

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-02.jpg)picture 2

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-03.jpg)Picture 3

**Note3:** A 4-week retention was set in Image 3, which addresses the need to keep the full weekly for 1 month.

**Note4**: Image 4 highlights the possibility of implementing a [Vault](https://helpcenter.veeam.com/docs/backup/vsphere/tape_media_vaults.html?ver=120) policy for tape storage.

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-04.png)Picture 4

**PHASE 2**

From the VBR GUI by selecting the tape to be copied with the right mouse button (image 5), the copy command can be initiated.

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-06.jpg)Picture 5

The simple next steps shown by images 6,7,8 and 9 show how to complete the copying operation.

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-07.png)Picture 6

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-08.jpg)Picture 7

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-09.jpg)Image 8

![](https://www.gable.it/wp-content/uploads/2024/06/CopyTape-10.jpg)Image 9

_**Latest notes:**_

-   Documentation to refer to in order to know how many resources it is essential to allocate to the various components is available at the following [link](https://helpcenter.veeam.com/docs/backup/vsphere/copying_tapes.html?ver=120).
-   Automation of copying can be done through [scripts in powershell](https://helpcenter.veeam.com/docs/backup/powershell/start-vbrtapecopy.html?ver=120).
-   Copy to Tape does not consume capacitive licensing but refer to the following [link](https://helpcenter.veeam.com/docs/backup/vsphere/licensing.html?zoom_highlight=tape+licensing&ver=120), Capacity Licensing item to know all the details.

## Navigazione articoli

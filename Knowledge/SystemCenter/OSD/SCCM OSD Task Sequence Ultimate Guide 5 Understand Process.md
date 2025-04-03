Hello All, My name is Vishal Goyel, and this is my first post on this blog. I worked as a Microsoft support engineer specializing in SCCM Task Sequence and OSD for several years.

In this post, you will learn a step-by-step description of the S**CCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log**

The OSD is ConfigMgr’s (SCCM) most widely used feature**.** When troubleshooting OSD-related issues, only one file, **SMSTS.log,** can help.

However, the SMSTS.log file contains a lot of **redundant** information. Learning to read SMSTS.log is very important for **troubleshooting** OSD-related problems.

| Index |
| --- |
| [Following are the Main Outputs that you will get out of this Ultimate Guide][1] |
| [Basic SCCM OSD Task Sequence Structure][2] |
| [WinPE & PXE Boot Stage – SCCM OSD Task Sequence][3] |
| [Download Variable Files][4] |
| [NIC Card is Initialized – SCCM MP Communication][5] |
| [Time Zone Update][6] |
| [Connects with SCCM MP][7] |
| [Retrieving Policy Assignment from SCCM MP][8] |
| [List of Available SCCM OSD Task Sequence][9] |
| [Policy Download & Resolving Dependencies][10] |
| [Download SCCM OSD Task Sequence Content][11] |
| [Launch TSManager.EXE][12] |
| [OSD Diskpart][13] |
| [Apply the Operating System Image][14] |
| [Download OS WIM File][15] |
| [Wipes Primary Partition][16] |
| [Additional Windows Configurations][17] |
| [Apply Network Settings][18] |
| [Unattend.XML Injection][19] |
| [Windows and SCCM Client Setup][20] |
| [Reboot to Come Out of WinPE][21] |
| [Conclusion SCCM OSD Task Sequence][22] |
| [Bonus Tip][23] |

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Table.1

## **Following are the Main Outputs that you will get out of this Ultimate Guide**

-   Learn how to understand SCCM OSD Task Sequence Steps & Process
-   Learn how to read SMSTS.log effectively
-   Learn how to troubleshoot SCCM OSD Task Sequence

## **Basic SCCM OSD Task Sequence Structure**

In this post, I will explain all the steps in a basic Task Sequence and how to read **SMSTS.log.**

![SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log - Fig.1][fig1]

  
SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.1

## **WinPE & PXE Boot Stage – SCCM OSD Task Sequence**

The machine boots into **WinPE** and downloads the Boot Image. Once WinPE is initialized, **SMSTS.log** can be found at the location below.

**X:\\Windows\\Temp\\SMSTSLOG\\SMSTS.log**

If you check the logs, it will show the **Boot** Image files downloaded at the very **beginning**.

```
<strong>RAM Disk Boot Path</strong>: NET(0)\SMSIMAGES\LAB00005\BOOT.LAB00005.WIM    TSBootShell<br> <strong>Booted from network (PXE) </strong>   TSBootShell
```

![SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log - Fig.2][fig2]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.2

You can **confirm** from the logs if machine PXE **booted** or it booted using any media.

## **Download Variable Files**

The first thing that the machine does is to **Download** variable files from the **WDS server** from the **RemoteInstall\\SMSTemp\\** folder and store it as a V**ariable.dat** file locally on X drive under **X:\\SMS\\Data** folder.

```
<strong>Device has PXE booted   </strong>TSPxe<br><strong>Variable Path: \SMSTemp\</strong>2017.03.16.13.41.39.0002.{F4304B8E-9855-401C-8168-D6BAF045258A}<strong>.boot.var </strong>   TSPxe
```

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.3][fig3]

SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log – Fig.3

## **NIC Card is Initialized** – **SCCM MP Communication**

Once variable files are **downloaded**, the NIC card is **initialized** on the machine, and the I**P Address** assigned to the device is shown in the **logs** (shown below).

```
<strong>Loading Media Variables from "X:\sms\data\variables.dat</strong>"    TSPxe<br> <strong>Found network adapter "Intel 21140-Based PCI</strong> Fast Ethernet Adapter (Emulated)" with IP Address 192.168.1.32 TSPxe 
```

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.4][fig4]

SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log – Fig.4

## **Time Zone Update**

Then the SCCM TS engine updates the **Time** information on the **client** machine.

```
<strong>Time zone</strong>: 480,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,    TSPxe<br>.<br>.<br> <strong>New time</strong>: 2017-03-04 21:11:20:246    TSPxe<br> <strong>Current time</strong>: 2017-03-04 21:11:20.238 TZ: Bias:-0480
```

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.5][fig5]

SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log – Fig.5

## **Connects with SCCM MP**

The Machine then **connects** with **Management Point** to download the base policies deployed to the machine.

```
CLibSMSMessageWinHttpTransport::Send: URL: PR2LAB.lab.in:80 <strong>GET /SMS_MP/.sms_aut?MPKEYINFORMATIONMEDIA</strong> <br> Request was succesful.<br> <strong>New MP settings:</strong>    TSPxe<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;site=01P,01P, MP=http://PR2LAb.lab.in, ports: http=80,https=443    TSPxe<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;certificates are received from MP.    TSPxe<br> <strong>Unknown machine GUIDs</strong>: d1c4c682-cf2d-4245-af8d-20e9773f5f2d 0a156af7-e87d-4242-aa58-b3414486bd1c    TSPxe<br> <strong>Downloading policy</strong> from http://PR2LAb.lab.in    TSPxe<br> <strong>Initializing HTTP transport</strong>.    TSPxe<br> .<br> .<br> .<br>    <strong>Setting SMBIOS GUID</strong> = 7E25FE8F-F341-11E1-A20A-6C8447038046.    TSPxe<br>     <strong>Adding MAC Address</strong> A0:B3:CC:28:14:B7.    TSPxe
```

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.6][fig6]

SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log – Fig.6

## **Retrieving Policy Assignment from SCCM MP**

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.7][fig7]

SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log – Fig.7

## **List of Available SCCM OSD Task Sequence**

Once the **NIC Card** is initialized and communication with Management Point is **established**, we can see a list of deployed **Task Sequences** on the machine, as shown below.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.8][fig8]

SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log – Fig.8

## **Policy Download & Resolving Dependencies**

Once we select any specific **Task Sequence** from the above Wizard, the machine **downloads** the policy and resolves dependencies for all the **content associated** with the task sequence.

```
<strong>Downloading policy body</strong> LAB20000-PR100003-6F6BCC28. TSPxe<br> <strong>Preparing Policy Body Request</strong>. TSPxe<br>&nbsp; &nbsp; &nbsp; &nbsp;<strong> Setting transport</strong>. TSPxe<br>&nbsp; &nbsp; &nbsp; &nbsp; <strong>Setting policy location</strong> = http:///SMS_MP/.sms_pol?LAB20000-PR100003-6F6BCC28.1_00. TSPxe<br> Executing Policy Body Request. TSPxe<br> Using Authenticator for policy TSPxe<br> <strong>CLibSMSMessageWinHttpTransport</strong>::Send: URL: servername.fqdn.local:888  GET /SMS_MP/.sms_pol?LAB20000-PR100003-6F6BCC28.1_00 TSPxe
```

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.9][fig9]

SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log – Fig.9

```
Parsing Policy Body.......<br>Source version for package......<br>Getting network access account......<br>
```

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.10][fig10]

NSCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log – Fig.10

## **Download SCCM OSD Task Sequence Content**

**Before** the SCCM Task Sequence **execution** starts, the machine resolves the **dependencies**, which checks for the **Content-Location** for each package associated with the Task Sequence. It will proceed with the SCCM Task Sequence only if it can receive at least **one content location** for each package.

If it cannot find any packages on the **Distribution Points**, it will fail to resolve the dependencies. This is mostly due to **Boundary** issues or package distribution issues. (Content location for one package is shown below).

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.11][fig11]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.11

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.12][fig12]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.12

## **Launch TSManager.EXE**

Once the dependencies are resolved, it invokes **TSManager.exe,** which drives the entire Task Sequence.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.13][fig13]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.13

The first thing that **TSManager** does is parse all the steps in the Task Sequence. It reads through each step and checks its **associated conditions**.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.14][fig14]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.14

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.15][fig15]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.15

Once **parsing** the Task Sequence, it starts with **TS execution.**

It is beginning the **execution** of the First step, which is **Partition Disk 0 -BIOS**.

Before it executes the step, it **evaluates** the conditions attached to the step, if any, as shown below.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.16][fig16]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.16

## **OSD Diskpart**

The **OSDDiskpart.exe,** which is **injected** into the **Boot Image** once we update the boot image on the Distribution Point, takes care of **Disk Partitioning.** Based on the settings in the step, it creates the disk partitions.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.17][fig17]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.17

## **Apply the Operating System Image**

After partitioning the disk, the next step is **applying** the Operating System image using the S**CCM OSD Task Sequence.**

The **OSDApplyOS.exe** takes care of applying the OS to the **Primary Partition.**

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.18][fig18]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.18

## **Download OS WIM File**

Before applying the OS, it needs to download the **OS WIM file**; we can see from the screenshot below that it is working on downloading the WIM file from the Distribution Point. It uses the **Network Access Account**(NAA) to download the file.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.19][fig19]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.19

## **Wipes Primary Partition**

Once the image file is downloaded to the **C:\\\_SMSTaskSequence\\Packages** folder, before applying the OS, it again wipes the **Primary Partition,** where it is designed to skip certain folders, including **C:\\\_SMSTaskSequence** where all the contents are downloaded during the imaging process.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.20][fig20]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.20

It then copies the **Boot files** to the root of the drive, and BCD is written.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.21][fig21]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.21

## **Additional Windows Configurations**

During the process, it saves the initial Windows configuration to **C:\\windows\\panther\\unattend\\unaddend.XML** file, which will contain all the settings and will be **executed** at a later point in time when the machine boots into **Full OS** for the first time.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.22][fig22]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.22

Then, it proceeds with the Apply Windows Settings step. **OSDWinSettings.exe** takes care of this process. SCCM OSD Task Sequence Troubleshooting Steps by Step Ultimate Guide with **SMSTS.log.**

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.23][fig23]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.23

It loads the **Unattend.xml** and appends it with the settings specified in the Task Sequence step for Apply Windows Settings.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.24][fig24]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.24

## **Apply Network Settings**

The next step that it runs is Apply Network Settings; OSDNetSettings.exe takes care of this process.

![SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log - Fig.25][fig25]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.25

During this step as well, it appends the **Unattend.XML** file with the specified settings.

**NOTE!:** Settings specified in Apply Windows and Network settings are not **“actually”** applied on the machine when these steps are executed. The information is read from the Task Sequence step and written to Unattend. XML. We can find the file under the **C:\\Windows\\Panther\\Unattend** folder.

## **Unattend.XML Injection**

I am adding the sample **Unattend.XML** file below. We can see that settings for Time Zone, Local Admin Password, Computer Name, and Domain join are written to the file.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.26][fig26]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.26

## **Windows and SCCM Client Setup**

It now proceeds with the **Setup Windows** and Configuration Manager step. During this step, the client agent files are **downloaded** to the machine, and Boot Manager is updated to **Boot into Full OS**, which we just installed at the Apply Operating System Step. **OSDSetupWindows.exe** drives this process.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.27][fig27]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.27

We can see that it is downloading the Client Agent files locally to the machine.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.28][fig28]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.28

## **Reboot to Come Out of WinPE**

Now, the machine needs to **reboot** so that I can come out of WinPE and boot into the Full OS. Before the machine reboots, it creates **SetupComplete.CMD** file under **C:\\Windows\\Setup\\Scripts** folder.

If we check this file, we will see the following line:

**%windir%\\system32\\osdsetuphook.exe  
/execute**

The **SetupComplete.CMD** file is a Windows Setup file that is executed once Windows Setup completes. Due to this file, Task Sequence continues to **run** after the boot and booting into the **Full OS.**

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.29][fig29]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.29

We can see that before **Rebooting** into WinPE, the Setup Windows and Configuration Manager step requests for a retry.

During this reboot, Windows and Network Settings are **executed** from the **Unattend.XML** file created earlier.

Once it has applied the settings, it **deletes** this file as it contains the **Domain Join** account and Local Admin Account **password** in plain text.

Loading the Registry hives, applying the drivers, and setting up the entire OS are done during this phase.

![SCCM OSD Task Sequence Troubleshooting Step- by- Step Ultimate Guide with SMSTS.log - Fig.30][fig30]

SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log – Fig.30

## **Conclusion SCCM OSD Task Sequence**

After the **reboot**, once the Task Sequence is resumed, it completes the **Configuration Manager client** and continues with further steps like Application Installation or **Software Update installation**, if any.

It finally moves the **SMSTS.log** to the **C:\\Windows\\CCM\\Logs** folder. Once the installation is completed successfully, it **deletes the C:\\\_SMSTaskSeuquence folder.**

## **Bonus Tip**

Have you [upgraded to SCCM 1902][24] version yet? Have you started using PowerShell Scripts without a package or content?

If so, here is the [bonus tip][25] for finding out where the PowerShell script must be stored in the Windows 10 client machine.

**X:\\Windows\\Temp\\SMSTSPowerShellScripts**

## **Resources**

-   [Windows 10 OSD Best Practices with SCCM][26]
-   [Task sequence steps in Configuration Manager][27]

**We are on WhatsApp**. To get the latest step-by-step guides and news updates, Join our Channel. **Click here** –[**HTMD WhatsApp**][28].

## **Author**

**Vishal** **Goyal** has over several years of experience in the IT domain, specializing in System Center Configuration Manager. He has been working on designing, implementing, and managing a large-scale ConfigMgr environment.

[fig1]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/ts1.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 1"
[fig2]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/ts2.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 2"
[fig3]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/ts3.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 3"
[fig4]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/ts4.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 4"
[fig5]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/ts5.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 5"
[fig6]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/ts6.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 6"
[fig7]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/ts7.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 7"
[fig8]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/ts8.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 8"
[fig9]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/9.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 9"
[fig10]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/10.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 10"
[fig11]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/11.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 11"
[fig12]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/12.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 12"
[fig13]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/13.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 13"
[fig14]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/14.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 14"
[fig15]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/15.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 15"
[fig16]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/16.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 16"
[fig17]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/17.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 17"
[fig18]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/image-1.webp "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 18"
[fig19]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/19.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 19"
[fig20]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/20.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 20"
[fig21]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/21.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 21"
[fig22]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/22.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 22"
[fig23]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/24.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 23"
[fig24]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/25.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 24"
[fig25]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/26.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 25"
[fig26]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/27.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 26"
[fig27]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/28.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 27"
[fig28]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/29.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 28"
[fig29]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/31.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 29"
[fig30]: SCCM%20OSD%20Task%20Sequence%20Ultimate%20Guide%205%20Understand%20Process/33.png "SCCM OSD Task Sequence Troubleshooting Step-by-Step Ultimate Guide with SMSTS.log 30"

[1]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Following-are-the-Main-Outputs-that-you-will-get-out-of-this-Ultimate-Guide
[2]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Basic-SCCM-OSD-Task-Sequence-Structure
[3]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#WinPE-&-PXE-Boot-Stage---SCCM-OSD-Task-Sequence
[4]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Download-Variable-Files
[5]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#NIC-Card-is-Initialized---SCCM-MP-Communication
[6]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Time-Zone-Update
[7]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Connects-with-SCCM-MP
[8]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Retrieving-Policy-Assignment-from-SCCM-MP
[9]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#List-of-Available-SCCM-OSD-Task-Sequence
[10]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Policy-Download-&-Resolving-Dependencies-
[11]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Download-SCCM-OSD-Task-Sequence-Content
[12]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Launch-TSManager.EXE
[13]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#OSD-Diskpart
[14]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Apply-the-Operating-System-Image
[15]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Download-OS-WIM-File
[16]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Wipes-Primary-Partition
[17]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Additional-Windows-Configurations
[18]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Apply-Network-Settings
[19]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Unattend.XML-Injection
[20]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Windows-and-SCCM-Client-Setup
[21]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Reboot-to-Come-Out-of-WinPE
[22]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Conclusion-SCCM-OSD-Task-Sequence
[23]: https://www.anoopcnair.com/sccm-osd-task-sequence-ultimate-guide/#Bonus-Tip
[24]: https://www.anoopcnair.com/sccm-1902-upgrade-production-version-guide/
[25]: https://twitter.com/crock23a/status/1115287309405040640
[26]: https://www.anoopcnair.com/windows-10-osd-best-practices/
[27]: https://docs.microsoft.com/en-us/sccm/osd/understand/task-sequence-steps
[28]: https://chat.whatsapp.com/CeMXHSD61HtDBJwe78IZwV
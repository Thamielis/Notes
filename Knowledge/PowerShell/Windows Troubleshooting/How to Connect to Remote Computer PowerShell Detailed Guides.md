Enable PowerShell Remoting, and then you can connect to computer using PowerShell and manage the computer.

**Table of Contents**

1.  [How-to guide: Connect to remote computer PowerShell][1]
    1.  [PowerShell: Connect to remote computer with Credentials][2]
    2.  [PowerShell: Execute a single command on remote computer][3]
    3.  [PowerShell: Run Remote Desktop Connection to access remtoe PC][4]
2.  [AnyViewer: Empower you with stable and secure remote access][5]
3.  [Conclusion][6]

Can I connect to remote computer PowerShell?

Hi, everyone! Is it possible to use connect to a remote computer PowerShell and manage it with my local device? Can you tell me the detailed process? Please accept my heartfelt gratitude in advance!

\- Question from Tina

[![PowerShell Logo](How%20to%20Connect%20to%20Remote%20Computer%20PowerShell%20Detailed%20Guides/powershell-logo.png)][7]

## How-to guide: Connect to remote computer PowerShell

It's well-known that Windows Remote Desktop allows a computer to be accessed by Remote Desktop Connection ([MSTSC][8]). Actually, you can also use PowerShell Remoting to connect to a remote server and manage it. Before that, you should enable PowerShell Remoting on the computer to which you want to connect by following the steps below:

Step 1. On Windows 11/10, press **Windows** + **X**, and choose **PowerShell (Admin)** from the menu.

![Powershell](How%20to%20Connect%20to%20Remote%20Computer%20PowerShell%20Detailed%20Guides/windows-powershell.png)

Step 2. In the PowerShell window, input the following command and hit **Enter**.

**♦ Enable-PSRemoting -Force**

[![PowerShell Enable PSRemoting](How%20to%20Connect%20to%20Remote%20Computer%20PowerShell%20Detailed%20Guides/powershell-enable-psremoting.png)][9]

### PowerShell: Connect to remote computer with Credentials

You can start a remote session with PowerShell and then execute commands on the remote computer from your local device. See the detailed steps:

Step 1. On the local computer, run PowerShell as administrator.

Step 2. Enter the following command and hit **Enter**.

**♦ Enter-PSSession -ComputerName COMPUTER -Credential USER**

**► Note:** COMPUTER refers to the computer name or the IP address of the remote computer that you want to access; USER refers to the username of an account on remote computer.

Step 3. In the pop-up window, input the password of the account and click **OK**.

[![Windows PowerShell Credential Request](How%20to%20Connect%20to%20Remote%20Computer%20PowerShell%20Detailed%20Guides/windows-powershell-credential-request.png)][10]

### PowerShell: Execute a single command on remote computer

If you just need to run a command on the remote computer, refer to the steps:

Step 1. Run PowerShell as administrator.

Step 2. Run the command below and hit **Enter**.

**♦ Invoke-Command -ComputerName COMPUTER -ScriptBlock { COMMAND } -credential USERNAME**

**► Note:** COMPUTER is the [remote PC’s IP address][11] or computer name; COMMAND refers to the command that you want to run on the remote computer; USERNAME refers to the username of an account on the remote computer.

Step 3. In the pop-up window, input the password of the account and click **OK**.

### PowerShell: Run Remote Desktop Connection to access remtoe PC

You can also choose to run Remote Desktop Connection to access and control the remote desktop from PowerShell. What you need to pay attention to is that this requires you to [enable Remote Desktop][12] on the remote computer in advance.

Step 1. Run PowerShell as Administrator.

Step 2. Run either one of the following two commands:

**♦ mstsc /v:\[IP address of the remote PC\]:3389**

**♦ Start-Process "$env:windir\\system32\\mstsc.exe" -ArgumentList "/v:$\[the computer name of the remote computer\]"**

**************![MSTSC Server](How%20to%20Connect%20to%20Remote%20Computer%20PowerShell%20Detailed%20Guides/mstsc-server-3389.png)**************

Step 3. Now, input the username & password of the account that you want to log in to on the remote computer. After a while, you can see the desktop of the remote PC and use it.

## AnyViewer: Empower you with stable and secure remote access 

Now, you must know how to connect to a remote computer Powershell, run a PowerShell command on a remote PC, or launch RDC from PowerShell to access the remote PC. The precondition of those operations is that the remote computer and the local device should be on the same network. If not, you need to complete extra work, which can involve network and router configuration and are complicated to operate. Sometimes, errors like **connecting to the remote server failed** occur, and you can't connect to a remote computer with PowerShell. 

Here an overall, stable, and [secure remote desktop software][13], AnyViewer is recommended. It enables you to connect to remote computers over the same LAN or from a different network and execute kinds of operations, including running PowerShell commands. Free download it and see how it works.

► AnyViewer supports you to access Windows PC from Android or iOS device. To [access computer from phone][14], you need to download AnyViewer mobile app from Google Play or App Store. 

Step 1. Install and run AnyViewer on the to-be-accessed computer. Create an AnyViewer account and log into it on both devices. 

[![Free Editions ](How%20to%20Connect%20to%20Remote%20Computer%20PowerShell%20Detailed%20Guides/free-editions.png)][15]

Step 2. On your local machine, go to **Devices**, locate the remote computer, and click **[One-click control][16]**.  Immediately, you can take full control of the remote computer. 

********************[![Devices](How%20to%20Connect%20to%20Remote%20Computer%20PowerShell%20Detailed%20Guides/connect-to-my-devices.png)][17]********************

✍ Tips:  
✐ If you want to offer one-time remote support to your clients or customers, input the Device id of the remote computer, click Connect, [send a request control][18], and wait for access approval from your partner.   
✐ AnyViewer also offers [advanced plans][19], which enable users to manage more devices, control more computers at the same time, and with advanced features, like accessing in privacy mode. 

## Conclusion

It's not easy enough to connect to remote computer PowerShell and run commands on the remote machine.  To get a quick and fantastic remote access experience, it's recommended you switch to AnyViewer. During the remote session, you can [transfer files][20], change the resolution, hide wallpaper, and so on. 

[1]: https://www.anyviewer.com/how-to/connect-to-remote-computer-powershell-0007.html#h_0
[2]: https://www.anyviewer.com/how-to/connect-to-remote-computer-powershell-0007.html#h_1
[3]: https://www.anyviewer.com/how-to/connect-to-remote-computer-powershell-0007.html#h_2
[4]: https://www.anyviewer.com/how-to/connect-to-remote-computer-powershell-0007.html#h_3
[5]: https://www.anyviewer.com/how-to/connect-to-remote-computer-powershell-0007.html#h_4
[6]: https://www.anyviewer.com/how-to/connect-to-remote-computer-powershell-0007.html#h_5
[7]: https://www.anyviewer.com/screenshot/others/illustration/powershell-logo.png
[8]: https://www.anyviewer.com/how-to/what-is-mstsc-exe.html "MSTSC"
[9]: https://www.anyviewer.com/screenshot/windows/powershell-enable-psremoting.png
[10]: https://www.anyviewer.com/screenshot/windows/windows-powershell-credential-request.png
[11]: https://www.anyviewer.com/how-to/what-is-remote-ip-address-2578.html "Remote IP address"
[12]: https://www.anyviewer.com/how-to/setup-remote-desktop-windows-10-8657.html "Enable Remote Desktop"
[13]: https://www.anyviewer.com/ "Secure Remote Desktop Software"
[14]: https://www.anyviewer.com/solutions/ios.html "Access Computer from Mobile Phone"
[15]: https://www.anyviewer.com/screenshot/anyviewer/free-editions.png "Free Editions "
[16]: https://www.anyviewer.com/help/one-click-remote-control.html "One Click Control"
[17]: https://www.anyviewer.com/screenshot/anyviewer/connect-to-my-devices.png "Devices"
[18]: https://www.anyviewer.com/help/send-control-request.html "Send a Remote Control"
[19]: https://www.anyviewer.com/pricing.html "Buy Remote Desktop Software"
[20]: https://www.anyviewer.com/features/file-transfer.html "Remote File Transfer"
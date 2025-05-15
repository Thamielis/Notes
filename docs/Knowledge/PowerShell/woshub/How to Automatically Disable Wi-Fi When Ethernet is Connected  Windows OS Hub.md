If several Wi-Fi networks are available, Windows automatically selects a wireless network with better [signal strength](https://woshub.com/check-wi-fi-signal-strength-windows/) (no matter what the speed of this connection is and how many devices are connected to it). However, when you connect your computer (laptop) to a wired Ethernet network, Windows keeps on using a Wi-Fi network, though the Ethernet connection speed is significantly higher, and the connection is more stable and not subject to interference. To switch to the cable Ethernet connection, a Windows user has to manually disable the Wi-Fi connection each time. Let’s see how to automatically turn off Wi-Fi when the Ethernet LAN cable is connected on Windows 10 and 11.

Contents:

*   [WLAN Switching Options in BIOS/UEFI](https://woshub.com/disable-wi-fi-when-ethernet-cable-connected/#h2_1)
*   [Disable Wi-Fi Upon Wired Connect with Wireless Adapter Driver](https://woshub.com/disable-wi-fi-when-ethernet-cable-connected/#h2_2)
*   [Enable/Disable Wi-Fi Adapter When Connected to LAN with Task Scheduler](https://woshub.com/disable-wi-fi-when-ethernet-cable-connected/#h2_3)
*   [Turn Off Wi-Fi on Ethernet Connection Using WLAN Manager PowerShell Script](https://woshub.com/disable-wi-fi-when-ethernet-cable-connected/#h2_4)
*   [Disable Non-Domain Wireless Networks When Connected to LAN via GPO](https://woshub.com/disable-wi-fi-when-ethernet-cable-connected/#h2_5)

WLAN Switching Options in BIOS/UEFI
-----------------------------------

Many laptop/desktop vendors have their own implementations of the LAN/WLAN Switching technology (it can be called differently). This technology suggests that only one network adapter can simultaneously transmit data on a computer. If while using a Wi-Fi network, a higher priority Ethernet connection appears on a device, the Wi-Fi adapter should automatically go into standby mode. This saves battery life and reduces the load on the wireless network.

You can enable LAN/WLAN Switching option in the BIOS/UEFI settings or in the properties of your wireless network adapter driver (it depends on your hardware vendor).

Restart your computer to enter the UEFI/BIOS settings, then find and enable the **LAN/WLAN Switching option** (on HP devices) or **Wireless Radio Control** (on Dell devices).

![[images/enable-lan-wlan-switching-in-bios.png.webp]]

This feature may be called differently or completely absent in BIOS/UEFI of other manufacturers.

Disable Wi-Fi Upon Wired Connect with Wireless Adapter Driver
-------------------------------------------------------------

In the settings of some Wi-Fi adapter drivers, there is an option to automatically turn off the Wi-Fi if the high-speed Ethernet connection is available.

Open the Windows **Device Manager** (`devmgmt.msc`), find your Wireless network adapter in the **Network adapters** section and open its properties. Go to the **Advanced** tab.

Find the **Disabled Upon Wired Connect** item in the list of Wi-Fi adapter options. Change its value to **Enabled** and save the driver changes.

![[images/disabled-upon-wired-connect-802-11n-wireless-ada.png.webp]]

Thanks to this option, the wireless network driver will disconnect the adapter from the Wi-Fi network when an active Ethernet LAN connection is detected.

Not all Wi-Fi adapter models support this option. For other wireless network adapters, you can automate switching to Ethernet using a scheduler task or a PowerShell script.

Enable/Disable Wi-Fi Adapter When Connected to LAN with Task Scheduler
----------------------------------------------------------------------

Let’s look at how to automatically enable and disable Wi-Fi adapters in Windows using special Task Scheduler jobs that are bound to an Ethernet cable connection/disconnection event ( we will use Windows Scheduler event trigger).

The first step is to enable the Wired AutoConfig service (dot3svc) and set it to start automatically. You can [check the status of a service and change the startup mode using PowerShell](https://woshub.com/manage-windows-services-powershell/):

`Set-Service dot3svc -startuptype automatic -passthru   Start-Service dot3svc   Get-Service dot3svc`

[![[images/enable-Wired-AutoConfig-service-windows.jpg.webp]]](https://woshub.com/wp-content/uploads/2019/05/enable-Wired-AutoConfig-service-windows.jpg)

Now open the Event Viewer (`eventvwr.msc`) and go to Applications and Services Logs -> Windows -> Wired-AutoConfig -> Operational. Here we are interested in two following events:

*   Event ID **15501** — `The network adapter has been connected.`
*   Event ID **15500** — `The network adapter has been unplugged.`

[![[images/Wired-AutoConfig-EventID15500-network-adapter-unplugged.jpg.webp]]](https://woshub.com/wp-content/uploads/2019/05/Wired-AutoConfig-EventID15500-network-adapter-unplugged.jpg)

In previous versions of Windows, you need to use other IDs for the LAN link connection events (`EventID: 32 — Network link is established` ) and ( `EventID: 27 – Network link is disconnected` ).

We will bind PowerShell commands to these events in order to enable and disable the Wi-Fi adapter automatically. To do this, you need to get the name of your Wi-Fi network adapter in Windows. You can [list network adapters with PowerShell](https://woshub.com/powershell-configure-windows-networking/):

`Get-NetAdapter`

In our example, the adapter name is _TPLinkWiFi_.

[![[images/get-network-adapter-windows.jpg.webp]]](https://woshub.com/wp-content/uploads/2019/05/get-network-adapter-windows.jpg)

Click on event 15501 in the Event Viewer and select **Attach task to this event**.

[![[images/attach-task-to-event.jpg.webp]]](https://woshub.com/wp-content/uploads/2019/05/attach-task-to-event.jpg)

Specify the scheduler task name _DisableWiFi\_if\_Ethernet\_Connected-15501_. Select **Start a program** as the task action. To disable the Wi-Fi adapter, you need to run the following command:

Program: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`

Add arguments: `-NoProfile -WindowStyle hidden -ExecutionPolicy Bypass -Command &{Disable-NetAdapter -Name **TPLinkWiFi** -confirm:$False}`

[![[images/windows-task-enable-wifi-adapter.jpg.webp]]](https://woshub.com/wp-content/uploads/2019/05/windows-task-enable-wifi-adapter.jpg)

Create another scheduler task for Event ID 15500 in the same way.

1.  Set the task name: _EnableWiFi\_if\_Ethernet\_Disconnected-15500_
2.  Configure the task action:  
    Command: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`  
    Argument: `-NoProfile -WindowStyle hidden -ExecutionPolicy Bypass -Command &{Enable-NetAdapter -Name **TPLinkWiFi** -confirm:$False}`

In the properties of both tasks, go to the **Conditions** tab and uncheck the **Start the task only if the computer is on AC Power** option.

[![[images/task-disable-power-options.jpg.webp]]](https://woshub.com/wp-content/uploads/2019/05/task-disable-power-options.jpg)

Now try to connect the LAN cable. After a couple of seconds, your Wi-Fi adapter will be automatically disabled (Status=Dormant).

[![[images/turn-off-wifi-when-ethernet-cable-connected-via-task.jpg.webp]]](https://woshub.com/wp-content/uploads/2019/05/turn-off-wifi-when-ethernet-cable-connected-via-task.jpg)

When Ethernet is disconnected, the task enables the wireless adapter and Windows automatically connects to your [saved Wi-Fi network](https://woshub.com/view-saved-wi-fi-passwords-windows/).

Turn Off Wi-Fi on Ethernet Connection Using WLAN Manager PowerShell Script
--------------------------------------------------------------------------

To automatically disconnect the Wi-Fi adapter when a computer is connected to a wired Ethernet network, you can use the **WLAN Manager** PowerShell script. You can find a newer WLAN Manager version with enhanced Windows 10 support and correct detection of virtual adapters on GitHub: [https://github.com/jchristens/Install-WLANManager](https://github.com/jchristens/Install-WLANManager).

This [PowerShell script will create a new Scheduler task](https://woshub.com/how-to-create-scheduled-task-using-powershell/) that periodically checks for active network adapters. If the script detects any LAN (Ethernet) connection, the WLAN interface is automatically disabled. If the Ethernet network cable is disconnected, the script enables the wireless Wi-Fi adapter.

The script consists of two files:

*   PSModule-WLANManager.psm1
*   WLANManager.ps1

You can install **WLAN Manager** script on Windows. Open the elevated PowerShell prompt and [allow to run the PS1 scripts](https://woshub.com/configure-powershell-script-execution-policy/):

`Set-ExecutionPolicy RemoteSigned`

Install the script on Windows with the following command:

`.\WLANManager.ps1 -Install:System`

The script may be installed to [run as](https://woshub.com/run-program-as-different-user-windows/) a user account (`Install:User`) or [with a local system account priveleges](https://woshub.com/runas-localsystem-account-windows/) (`Install:System`).

![[images/installing-wlanmanager-powershell-script.png.webp]]

```
Verifying WLAN Manager version information… Missing
Writing WLAN Manager version information… Done
Verify WLAN Manager Files… Missing
Installing WLAN Manager Files… Done
Verify WLAN Manager Scheduled Task… Missing
Installing WLAN Manager Scheduled Task… Done
```

You can make the script notify a user with [a pop-up notification](https://woshub.com/popup-notification-powershell/) when switching between Wi-Fi and LAN networks:

`.\WLANManager.ps1 -Install:User -BalloonTip:$true`

Make sure that a new **WLAN Manager** task has appeared in the Task Scheduler.

![[images/wlan-manager-task-in-windows-10.png.webp]]

Restart your computer. After the startup, the Scheduler will start the C:\\Program Files\\WLANManager\\WLANManager.ps1 script that checks network connections every second, and if a LAN connection is detected, all available Wi-Fi adapters will be disabled. If the LAN cable is disconnected, the script will automatically enable wireless Wi-Fi adapters.

WLAN Manager script works well on Windows 11, 10, 8.1, and 7.

**Tip**. To remove the WLAN Manager script, run this command:

`.\WLANManager.ps1 Remove:System`

Disable Non-Domain Wireless Networks When Connected to LAN via GPO
------------------------------------------------------------------

There is a separate setting in GPO that allows you to disable the Wi-Fi connections when a computer is connected to a corporate domain network via LAN. This policy is located in the following GPO section **Computer Configuration -> Policies ->Administrative Templates -> Network ->Windows Connection Manager** and called “**Prohibit connection to non-domain networks when connected to domain authenticated network”**.

The policy prevents computers from connecting to both a domain network and an untrusted non-domain network at the same time.

![[images/gpo-prohibit-connection-to-non-domain-networks-wh.png.webp]]

However, when this policy is enabled, you may experience problems when connecting to a Wi-Fi network if the additional interfaces are present on your computer. For example, loopback interface or virtual network adapters from desktop hypervisors (VMware Workstation, Hyper-V, VirtualBox, etc.)

You can also disable the use of Wi-Fi if there is an active Ethernet connection to the domain LAN. You can configure this behavior using the GPO option **Minimize the number of simultaneous connections to the Internet or a Windows Domain** under Computer Configuration -> Administrative Templates -> Network -> Windows Connection Manager. Enable the policy and select **3=Prevent Wi-Fi when on Ethernet**.

[![[images/gpo-prevent-wifi-when-on-ethernet.jpg.webp]]](https://woshub.com/wp-content/uploads/2019/05/gpo-prevent-wifi-when-on-ethernet.jpg)
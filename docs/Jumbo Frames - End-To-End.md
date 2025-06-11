- [End-to-End Jumbo Frames Configuration Guide (VMware vSphere, Windows, Meraki, NetApp)](#end-to-end-jumbo-frames-configuration-guide-vmware-vsphere-windows-meraki-netapp)
  - [1. Enabling Jumbo Frames in VMware vSphere 8](#1-enabling-jumbo-frames-in-vmware-vsphere-8)
    - [**Steps to enable jumbo frames on a vSphere Standard Switch (vSS):**](#steps-to-enable-jumbo-frames-on-a-vsphere-standard-switch-vss)
    - [**Steps to enable jumbo frames on a vSphere Distributed Switch (VDS):**](#steps-to-enable-jumbo-frames-on-a-vsphere-distributed-switch-vds)
    - [**Verifying MTU on ESXi:** After configuration, verify the host settings via CLI or UI:](#verifying-mtu-on-esxi-after-configuration-verify-the-host-settings-via-cli-or-ui)
  - [2. Configuring Windows Server VM Network Adapters for Jumbo Frames](#2-configuring-windows-server-vm-network-adapters-for-jumbo-frames)
    - [**Steps to enable jumbo frames on a Windows VM NIC:**](#steps-to-enable-jumbo-frames-on-a-windows-vm-nic)
      - [1. **Check NIC support:**](#1-check-nic-support)
      - [2. **Enable Jumbo Frames via PowerShell:**](#2-enable-jumbo-frames-via-powershell)
      - [3. **(Optional) GUI method:**](#3-optional-gui-method)
      - [4. **Verify the Windows MTU:**](#4-verify-the-windows-mtu)
  - [3. Enabling Jumbo Frames on Cisco Meraki Switches](#3-enabling-jumbo-frames-on-cisco-meraki-switches)
    - [**Steps to verify/enable jumbo frames on Meraki switches:**](#steps-to-verifyenable-jumbo-frames-on-meraki-switches)
  - [4. Configuring Jumbo Frames on NetApp MetroCluster (ONTAP 9.14)](#4-configuring-jumbo-frames-on-netapp-metrocluster-ontap-914)
    - [**Steps to verify and enable jumbo frames on NetApp ONTAP:**](#steps-to-verify-and-enable-jumbo-frames-on-netapp-ontap)
      - [1. **Verify current MTU settings:**](#1-verify-current-mtu-settings)
      - [2. **Change the MTU to 9000 (if needed):**](#2-change-the-mtu-to-9000-if-needed)
      - [3. **Verify LIF settings:**](#3-verify-lif-settings)
      - [4. **Cluster Interconnect (if applicable):**](#4-cluster-interconnect-if-applicable)
      - [5. **Verify from the storage side:**](#5-verify-from-the-storage-side)
  - [5. Testing Jumbo Frame Connectivity End-to-End](#5-testing-jumbo-frame-connectivity-end-to-end)
      - [**Using Windows `ping`:**](#using-windows-ping)
      - [**Using PowerShell `Test-Connection`:**](#using-powershell-test-connection)
      - [**Other tools:**](#other-tools)
  - [6. Validation and Troubleshooting Across Devices](#6-validation-and-troubleshooting-across-devices)
    - [\* **VMware ESXi Logs/Stats:**](#-vmware-esxi-logsstats)
    - [\* **Windows VM verification:**](#-windows-vm-verification)
    - [\* **Cisco Meraki switch:**](#-cisco-meraki-switch)
    - [\* **NetApp ONTAP checks:**](#-netapp-ontap-checks)
    - [\* **Check for fragmentation/giants on intermediate devices:**](#-check-for-fragmentationgiants-on-intermediate-devices)
    - [**Summary:**](#summary)
  - [**References:**](#references)

# End-to-End Jumbo Frames Configuration Guide (VMware vSphere, Windows, Meraki, NetApp)

Enabling **jumbo frames** (9000-byte MTU) across an entire path—from VMware hosts and Windows VMs, through Cisco Meraki switches, to NetApp storage—requires consistent configuration on every component. All devices in the data path (initiators, switches, targets) **must support the larger MTU** for jumbo frames to work properly. This guide provides a detailed step-by-step approach to configure, test, and verify jumbo frame support in a VLAN spanning vSphere 8, Windows Server 2016-2022 VMs, Cisco Meraki switches, and a NetApp MetroCluster (ONTAP 9.14). We also include PowerShell commands and examples for automation and verification.

## 1. Enabling Jumbo Frames in VMware vSphere 8

In vSphere 8, you need to configure jumbo frames at the virtual switch level and on any VMkernel adapters used for storage or VM traffic in the jumbo frames VLAN. VMware supports up to 9000-byte MTU on ESXi hosts. **Both vSwitch/VDS and VMkernel interfaces must be set to 9000**; a VMkernel won't use jumbo frames if either it or the switch is still at 1500 MTU. The physical NICs (uplinks) will automatically use the higher MTU when the vSwitch is set, as long as the NIC and upstream switch support it.

### **Steps to enable jumbo frames on a vSphere Standard Switch (vSS):**

1. In the vSphere Client (HTML5 Web UI), navigate to the ESXi host > **Configure** > **Networking** > **Virtual Switches**.
2. Select the standard switch that the VM network or VMkernel resides on, and click **Edit** (or **Edit Settings**).
3. In the switch settings, set **MTU** to **9000** bytes, then **OK** to apply. This changes the MTU for all port groups on that vSwitch.
4. Next, navigate to **VMkernel Adapters** (still under **Networking** for the host). Select the VMkernel interface used for storage (iSCSI, NFS, etc.) or vMotion that should use jumbo frames, and click **Edit**.
5. Set the VMkernel **MTU** to **9000** and save. (By default, modifying the vSwitch MTU **does not** automatically update existing VMkernel interfaces, so this step ensures the VMkernel is also using 9000.)

### **Steps to enable jumbo frames on a vSphere Distributed Switch (VDS):**

1. In vCenter Server, go to **Networking** and select the distributed switch that the VLAN/port group uses.
2. Click **Actions** > **Settings** > **Edit Settings** for the VDS.
3. Under **Advanced**, set the **MTU** to **9000** (any value >1500 enables jumbo frames), and apply. This will configure all hosts on that VDS to support 9000 MTU.
4. Ensure any **VMkernel adapters** on the VDS that require jumbo frames (for example, an iSCSI VMkernel on a distributed port group) are also edited to MTU 9000 as in the standard switch steps above. In vCenter, go to each host > VMkernel Adapters, edit the adapter, and set MTU 9000.
5. If using a distributed Port Group for VM traffic, you generally do **not** need to set anything on the VM's port group specifically; it inherits the VDS MTU. (VM network port groups typically inherit the switch's MTU, and VMs will send larger frames if their OS is configured for it.)

### **Verifying MTU on ESXi:** After configuration, verify the host settings via CLI or UI:

* SSH into the ESXi host and run `esxcfg-nics -l` to list physical NICs. The output will show the **MTU** for each uplink (should show 9000 for 10GbE NICs if jumbo is active). For example:

```shell
esxcfg-nics -l

Name    PCI            Driver  Link  Speed    Duplex  MAC Address       MTU  
vmnic0  ...           ...     Up    1000Mbps  Full    XX:XX:XX:XX:XX:XX 1500  
vmnic1  ...           ...     Up    10Gbps    Full    YY:YY:YY:YY:YY:YY 9000  
```

  In this example, `vmnic1` is configured with MTU 9000.

* You can also run `esxcfg-vswitch -l` to list vSwitch configurations or `esxcli network ip interface list` to list VMkernel interfaces and confirm their MTU is 9000. Each VMkernel listed should show MTU 9000 if configured correctly.

* If needed, use the ESXi ping utility `vmkping` to test jumbo frames from the host. For instance, to test from an ESXi host's VMkernel to the NetApp interface, run: `vmkping -I <vmkX> -s 8972 -d <NetApp_IP>`. The **`-s 8972 -d`** options send a 8972-byte ICMP payload with the Don't Fragment flag (8972 bytes + 28 bytes IP/ICMP header ≈ 9000). A successful reply confirms that the path supports jumbo frames end-to-end for that host. If it fails with no response, try without `-d` to see if it fragments (if it works only without `-d`, some link is fragmenting the packets).

## 2. Configuring Windows Server VM Network Adapters for Jumbo Frames

Within each Windows Server VM (2016, 2019, 2022), the virtual NIC must be configured to use jumbo frames. By default, Windows NICs use MTU 1500. If the VM's OS is not set to a higher MTU, it will never send larger frames even if the virtual network allows them. Configuration involves enabling the **Jumbo Packet** option on the NIC to 9014 bytes (common value for 9000-byte MTU on Intel/vSphere vmxnet3 adapters) or using PowerShell to set the NIC MTU.

### **Steps to enable jumbo frames on a Windows VM NIC:**

#### 1. **Check NIC support:**

Ensure the VM's virtual NIC type (e.g., **vmxnet3** for vSphere) supports jumbo frames. Vmxnet3 does support 9000 MTU. Inside the VM, you can verify current MTU settings by running `netsh interface ipv4 show subinterfaces`. This command lists each interface and its MTU. Before changes, it will likely show **1500** for the VM's network adapter. For example:

```shell
C:\> netsh interface ipv4 show subinterfaces

MTU  MediaSenseState   Bytes In  Bytes Out  Interface
------ --------------- --------- ---------  -------------
1500  1                ...       ...       Ethernet0
```

   This confirms the interface is currently at 1500 MTU. You can also use PowerShell: `Get-NetAdapterAdvancedProperty -Name "<NICName>" -DisplayName "Jumbo Packet"` to see the jumbo frame setting (the **DisplayValue** might show "Disabled" or a size like 1514 bytes if off).

#### 2. **Enable Jumbo Frames via PowerShell:**

Use the `Set-NetAdapterAdvancedProperty` cmdlet to set the **Jumbo Packet** (or **JumboFrame** depending on driver terminology) value. The advanced property is identified by the registry keyword `*JumboPacket`. For example, to set a NIC named "Ethernet0" to 9014 bytes:

```powershell
Set-NetAdapterAdvancedProperty -Name "Ethernet0" -RegistryKeyword "*JumboPacket" -RegistryValue 9014
```

   This command configures the NIC to a jumbo frame size of 9014 bytes (which corresponds to a 9000 byte MTU plus 14 bytes Ethernet header). Alternatively, some drivers accept a DisplayName, e.g., `Set-NetAdapterAdvancedProperty -Name "Ethernet0" -DisplayName "Jumbo Packet" -DisplayValue "9014"` depending on the NIC. You should run `Get-NetAdapterAdvancedProperty -Name "Ethernet0" -RegistryKeyword "*JumboPacket"` again to confirm it now shows 9014.

#### 3. **(Optional) GUI method:**

As an alternative, you can enable jumbo frames via the Windows GUI by opening **Network Connections** > right-click the adapter > **Properties** > **Configure** > **Advanced** tab. Find **Jumbo Packet** (or **Large Send Offload settings**, depending on NIC), and set it to the maximum value (e.g., 9014 bytes). Apply the change.

#### 4. **Verify the Windows MTU:**

After enabling, verify the setting took effect. Run `netsh interface ipv4 show subinterfaces` again and confirm the interface's **MTU is 9000** (it may show 9000 or 9014 depending on how it's represented). For instance, after the change:

```shell
C:\> netsh interface ipv4 show subinterfaces

MTU    MediaSenseState   Bytes In   Bytes Out  Interface
------ ----------------- ---------  ---------  -------------
9000   1                 ...        ...        Ethernet0
```

   You can also use `ping` tests (next section) from within the VM to ensure it can send jumbo frames. PowerShell's `Test-Connection` cmdlet with `-BufferSize 8972 -DontFragment` is another way to test the VM's capability using PowerShell.

## 3. Enabling Jumbo Frames on Cisco Meraki Switches

Cisco Meraki MS-series switches support jumbo frames, but the configuration is managed through the Meraki cloud dashboard. **By default, Meraki MS switches use an MTU of 9578 bytes**, effectively enabling jumbo frames out-of-the-box. This default (9578) accommodates standard 9000-byte payloads plus overhead. You only need to adjust this if it was explicitly changed or if you want to enforce a different MTU.

&#x20;*Meraki dashboard MTU configuration:* The Meraki cloud interface allows setting a **default MTU** for all switches in a network and overrides per switch. By default it is 9578 bytes (Jumbo Frames enabled). In the example above, the network-wide MTU is 9578 bytes (supporting jumbo frames), and one switch is explicitly overridden to 1500 bytes (which would disable jumbo on that switch). If a switch does not have a custom MTU set, it inherits the network default.

### **Steps to verify/enable jumbo frames on Meraki switches:**

1. Log in to the Meraki Dashboard and navigate to your network containing the switches. Go to **Switch > Configure > Switch Settings**.

2. Scroll to the **MTU Configuration** section. Check the **Default MTU** value for the switch network. It should be **9578** (Meraki's default) unless changed. If it is 1500, jumbo frames are effectively disabled on the switches.

3. If needed, change the default MTU to **9578** (or an appropriate value). This will apply to all Meraki switches in the network. You can also set a per-switch MTU by editing the specific switch in the dashboard (for example, if you only want some switches or uplinks to use jumbo).

4. Save the settings. Meraki switches will automatically push the new MTU to all ports. There is no need to reboot the switches; the changes propagate via the cloud. (Meraki MS switches support up to MTU 9578, which covers typical 9000 byte frames. Note that some Meraki models or connected Cisco devices might quote MTU including headers differently, but using 9578 on Meraki ensures 9000-byte payloads are supported.)

5. **Verification:** Meraki's dashboard does not show per-port MTU in the GUI, since MTU is a network/switch-wide setting. However, you can use Meraki's **Packet Capture** tool (under **Switch > Monitor > Packet capture**) on a port to capture traffic and verify that large frames (around 9000 bytes) traverse without fragmentation. Additionally, ensure that connected devices (ESXi host NICs and NetApp ports) show an MTU of 9000, since Meraki will handle up to 9578 without issue. If there's a mismatch, you might see ping tests failing or performance issues.

## 4. Configuring Jumbo Frames on NetApp MetroCluster (ONTAP 9.14)

On the NetApp storage side, each network interface (LIF) used for data (iSCSI, NFS, CIFS, etc.) should be configured for 9000-byte MTU. In ONTAP 9 (including 9.14), MTU is managed per **broadcast domain** or per interface. Typically, all ports in a given broadcast domain share the same MTU setting. In a MetroCluster, you will have at least a data network broadcast domain spanning the cluster nodes. The management interfaces (e0M) usually remain at 1500 and are separate from data network MTU.

### **Steps to verify and enable jumbo frames on NetApp ONTAP:**

#### 1. **Verify current MTU settings:**

Use the ONTAP CLI to check the MTU on network ports. For example, log in to the cluster CLI and run:

```bash
network port show -ipspace Default -fields mtu
```

   (Replace `Default` with the name of the IPspace your data network is in, if different. Often, data LIFs are in the "Default" IPspace, while cluster interconnects use a "Cluster" IPspace.) This will list each port and its MTU. Alternatively, to get detailed info for a specific port, use `network port show -node <node_name> -port <interface> -instance`. Ensure that the data ports show **9000**. If they show 1500, jumbo frames are not yet enabled on the storage side.

#### 2. **Change the MTU to 9000 (if needed):**

In ONTAP 9, the recommended method is to modify the broadcast domain's MTU so that all member ports and LIFs are updated together. Use the command:

```bash
network port broadcast-domain modify -broadcast-domain <bd_name> -mtu 9000 [-ipspace <ipspace_name>]
```

   Here `<bd_name>` is the name of your broadcast domain (e.g., `Default-1` or `Cluster`, depending on your setup), and `<ipspace_name>` is usually `Default` for data or `Cluster` for cluster ports. This command will prompt for confirmation and then change the MTU for all ports in that broadcast domain to 9000. For example, to change a broadcast domain named "Default-1" in the Default IPspace:

```bash
cluster::> network port broadcast-domain modify -ipspace Default -broadcast-domain Default-1 -mtu 9000
Warning: Changing broadcast domain settings will cause a momentary data-serving interruption.
Do you want to continue? {y|n}: y
```

   After running this, ONTAP will update the MTU on all relevant interfaces. **No controller reboot is required** for the change to take effect.

#### 3. **Verify LIF settings:**

Once the ports are updated, verify that the LIFs (logical interfaces) inherited the new MTU. You can run: `network interface show -fields mtu` to list all LIFs and their MTU. Data LIFs on those ports should now show MTU 9000. If any LIF is in a different broadcast domain or IPspace, ensure you modify those as well.

#### 4. **Cluster Interconnect (if applicable):**

NetApp cluster interconnects typically use jumbo frames as well (but those are usually configured automatically in a MetroCluster). It's good to ensure the cluster broadcast domain (often named "Cluster") is also at MTU 9000. For example, NetApp's documentation shows using `network port broadcast-domain modify -ipspace Cluster -broadcast-domain Cluster -mtu 9000` to set the cluster ports to 9000. Verify with `network port show -ipspace Cluster -fields mtu` that the cluster ports are 9000, if your environment requires it.

#### 5. **Verify from the storage side:**

You can use the NetApp ping diagnostic to test connectivity with jumbo frames. For instance, ONTAP allows you to ping out from a LIF: `network ping -vserver <svm_name> -lif <lif_name> -packet-size 8972 -dont-fragment true -destination <host_ip>`. This sends a jumbo ping from the NetApp to a host (Windows or ESXi) with DF set. A success confirms end-to-end jumbo capability. (This step is optional; often testing from the host side is sufficient.)

## 5. Testing Jumbo Frame Connectivity End-to-End

After configuration, it's critical to test that jumbo frames are working **end-to-end** between the Windows VMs and the NetApp storage. The simplest test is using the ping command with a large payload and the "Don't Fragment" flag, which will indicate if a packet of that size can traverse the entire network without being broken up.

#### **Using Windows `ping`:**

On a Windows VM, open a command prompt (or PowerShell) and use the `ping` command with a large packet size. For example:

```shell
ping <NetApp_IP_or_VM_IP> -f -l 8972
```

Here, `-f` sets the *Don't Fragment (DF)* flag, and `-l 8972` specifies a 8972-byte ICMP payload. 8972 bytes of payload plus the 28-byte ICMP/IP header equals a 9000-byte packet, which is the target for jumbo frames.

* **Expected result if jumbo frames succeed:** You should see normal ping replies (e.g., "Reply from \<IP>: bytes=8972 time=\<x>ms TTL=\<y>"). This means the 9000-byte frame went through unfragmented.
* **If jumbo frames are not working:** The ping will fail with the message **"Packet needs to be fragmented but DF set."** This indicates that at some point in the path, a 9000-byte frame could not pass and was dropped due to the DF flag. If you see this, jumbo frames are *not* fully enabled end-to-end; double-check MTU settings on all components.

It's a good idea to test ping in both directions if possible (from the Windows VM to NetApp, and from NetApp to VM if NetApp allows, or from ESXi to NetApp using vmkping). Also test between multiple hosts or VMs in the VLAN to ensure the switch is handling jumbo frames for all devices.

#### **Using PowerShell `Test-Connection`:**

As an alternative, PowerShell's `Test-Connection` cmdlet can send pings with custom buffer sizes and DF flag. For example:

```powershell
Test-Connection -TargetName <NetApp_IP> -Count 2 -BufferSize 8972 -DontFragment
```

This will attempt two pings with 8972 bytes and DF set. The output will show if the ping was successful. This method can be used in scripts to automate MTU verification (it is essentially doing the same as the `ping` command above).

#### **Other tools:**

You may also use tools like **Wireshark** to capture network traffic on the VM or switch to verify the actual frame sizes. For instance, run a Wireshark capture on the Windows VM's interface while performing a jumbo ping; you should see ICMP Echo Request packets of length \~9000 bytes on the wire. If you see smaller fragments or no replies, that indicates an MTU issue. Another tool is **iperf** (set with `-M 9000` option for maximum segment size, or just observe throughput differences) to see if enabling jumbo improves throughput (though this is indirect, it can confirm performance gains when jumbo is properly configured).

## 6. Validation and Troubleshooting Across Devices

Finally, it's important to validate the configuration on each device and know where to check for issues:

### * **VMware ESXi Logs/Stats:**

Check the ESXi host **network adapter settings** and **VMkernel settings** via CLI as described earlier. Ensure all relevant VMkernels and vSwitches show MTU 9000. If using ESXi logs, you typically won't see explicit "MTU error" logs, but a misconfiguration can manifest as storage latency or network errors. VMware's guidance is to use `vmkping` to verify jumbo connectivity. If `vmkping -d -s 8972` fails but a normal ping succeeds, that pinpoints an MTU mismatch. Correct the configuration and test again.

### * **Windows VM verification:**

On Windows, run `Get-NetIPInterface` or `netsh interface ipv4 show subinterfaces` to confirm the interface MTU is 9000. Also, check the NIC's advanced settings to ensure **Jumbo Packet** is enabled. Windows event logs generally do not log MTU issues, so rely on testing (ping) and the NIC settings for verification. If a Windows VM still shows fragmentation needed, double-check that its vNIC is connected to the correct jumbo-enabled port group and that the VMXNet3 adapter is functioning with jumbo (VMXNet3 will handle jumbo frames as long as the guest OS is configured and the host supports it).

### * **Cisco Meraki switch:**

Since Meraki is cloud-managed, you won't have a CLI to show interface stats like a Catalyst switch. However, Meraki's dashboard provides some tools. In **Switch > Monitor > Switches**, you can click on a switch and go to the **Tools** section to use the ping tool from the switch to a host (this can verify connectivity, though it may not allow setting packet size). For more in-depth troubleshooting, you can open a **Support** case or use the Meraki API to fetch device statistics. In general, if the Meraki MTU is at default 9578, it is unlikely the switch is the limiting factor. If it was manually set to 1500, the switch would drop larger frames. Meraki switches count oversized packets as **giants**; although the web UI doesn't show these counters directly, you might infer an MTU issue if normal traffic flows but jumbo pings fail. In case of problems, verify the MTU setting in the dashboard again and ensure it's applied to all relevant switches.

### * **NetApp ONTAP checks:**

On the NetApp, use `network port show` and `network interface show` to ensure MTU is 9000 on all data ports and LIFs. NetApp does not usually log an error if MTUs are mismatched; instead, you would notice issues like dropped packets or decreased throughput. However, NetApp's **EMS logs** (Event Management System) might log warnings if a port is added to a broadcast domain with a different MTU or if there's a network connectivity issue. You can check `event log show` for any network MTU-related warnings after making changes. Additionally, run the ONTAP ping test (`network ping -dont-fragment true -packet-size 8972`) from the NetApp to a host IP to confirm the storage controller can send jumbo frames to the network without fragmentation. If this fails, the response (or lack thereof) pinpoints an issue in the path.

### * **Check for fragmentation/giants on intermediate devices:**

If there are routers or firewalls in between (not mentioned in this VLAN scenario, but worth noting), ensure they also support jumbo frames. A common practice on Cisco devices is to set an even higher MTU (like 9216 or 9000+ overhead) on switch uplinks. Meraki already uses 9578 bytes by default, which covers the overhead for 9000-byte payloads. If using any non-Meraki interconnects (e.g., routers), verify their MTU configs. On traditional Cisco switches, you could use commands like `show interface <port>` to see the MTU and any counters for **giants** (frames larger than MTU). Giants increasing would indicate frames are being dropped due to size. While Meraki abstracts this, on a Cisco Catalyst/Nexus you must manually set jumbo frames (e.g., `system mtu jumbo 9216` on Catalyst, or per interface MTU on Nexus) and you can then monitor counters. Ensure those are in place if applicable.

### **Summary:**

To fully validate, ensure that each layer (VM NIC, vSwitch, physical NIC, switch, storage NIC) is reporting the expected MTU, and use ping or similar tests to confirm that 9000-byte packets pass end-to-end without fragmentation. If any test fails, systematically check each hop's configuration. Often, a single overlooked setting (for example, a VMkernel left at 1500, or a switch port still at 1500, or the Windows NIC not set to jumbo) is the cause. Once corrected, repeat the jumbo ping tests until you consistently receive replies with large packet sizes. At that point, you can be confident that jumbo frames are enabled across the VLAN between the Windows VMs and the NetApp storage, likely improving throughput and reducing overhead for large transfers.

## **References:**

-   VMware KB: Enabling Jumbo Frames on standard and distributed switches
    -   [knowledge.broadcom.com](https://knowledge.broadcom.com/external/article?articleNumber=324494#:~:text=1,the%20MTU%20value%20to%209000)
    -   [knowledge.broadcom.com](https://knowledge.broadcom.com/external/article?articleNumber=324494#:~:text=1,the%20MTU%20value%20to%209000)
    
-   VMware KB: Jumbo frames on VMkernel ports and testing with vmkping
    -   [knowledge.broadcom.com](https://knowledge.broadcom.com/external/article?articleNumber=324494#:~:text=Note%3A%20You%20can%20increase%20the,on%20the%20VMkernel%20adapters%20automatically)
    -   [knowledge.broadcom.com](https://knowledge.broadcom.com/external/article?legacyId=2002197#:~:text=3,response%2C%20run%20the%20vmkping%20command)
    
-   Windows Server NIC Jumbo Frames PowerShell configuration
    -   [blog.workinghardinit.work](https://blog.workinghardinit.work/2012/06/11/configuring-jumbo-frames-with-powershell-in-windows-server-2012/#:~:text=As%20you%20can%20see%20Jumbo,you%20run%20the%20following%20command)
    
-   Cisco Meraki Documentation - Switch MTU Settings
    -   [documentation.meraki.com](https://documentation.meraki.com/MS/Other_Topics/Switch_Settings#:~:text=The%20Maximum%20Transfer%20Unit%20,Frames%20up%20to%209578%20bytes)
    -   [documentation.meraki.com](https://documentation.meraki.com/MS/Other_Topics/Switch_Settings#:~:text=You%20can%20can%20set%20the,turn%20off%20Jumbo%20Frames%20support)
    
-   NetApp ONTAP Networking Guide - Configuring MTU for broadcast domains
    -   [docs.netapp.com](https://docs.netapp.com/us-en/ontap/networking/change_the_mtu_value_for_ports_in_a_broadcast_domain.html#:~:text=network%20port%20broadcast,ipspace%20%3Cipspace_name)
    -   [docs.netapp.com](https://docs.netapp.com/us-en/ontap/performance-admin/check-network-settings-task.html#:~:text=%60network%20port%20show%20)
    
-   NetApp best practices - All devices must support jumbo frames
    -   [docs.netapp.com](https://docs.netapp.com/us-en/ontap/san-admin/configure-network-best-performance-task.html#:~:text=4,MTU%20of%209000)
    
-   ServerFault Q&A - Verifying jumbo frames with ping
    -   [serverfault.com](https://serverfault.com/questions/234311/testing-whether-jumbo-frames-are-actually-working#:~:text=To%20verify%20this%20has%20worked,Fragment%20flag%20in%20the%20packet)
    -   [serverfault.com](https://serverfault.com/questions/234311/testing-whether-jumbo-frames-are-actually-working#:~:text=ping%20my.test.host%20)

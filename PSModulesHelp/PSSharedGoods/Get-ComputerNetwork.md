Get-ComputerNetwork
-------------------

### Synopsis
Retrieves network information for specified computers.

---

### Description

This function retrieves network information for the specified computers, including details about network cards, firewall profiles, and connectivity status.

---

### Examples
> EXAMPLE 1

Get-ComputerNetworkCard -ComputerName AD1, AD2, AD3
Output

Name          NetworkCardName             NetworkCardIndex     FirewallProfile FirewallStatus IPv4Connectivity IPv6Connectivity Caption Description ElementName DefaultInboundAction DefaultOutboundAction AllowInboundRules AllowLocalFirewallRules AllowLocalIPsecRules AllowUserApps AllowUserPorts AllowUnicastResponseToMulticast NotifyOnListen EnableStealthModeForIPsec LogFileName                                           LogMaxSizeKilobytes LogAllowed LogBlo
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    cked
----          ---------------             ----------------     --------------- -------------- ---------------- ---------------- ------- ----------- ----------- -------------------- --------------------- ----------------- ----------------------- -------------------- ------------- -------------- ------------------------------- -------------- ------------------------- -----------                                           ------------------- ---------- ------
ad.evotec.xyz vEthernet (External Switch)               13 DomainAuthenticated           True         Internet        NoTraffic                                        NotConfigured         NotConfigured     NotConfigured           NotConfigured        NotConfigured NotConfigured  NotConfigured                   NotConfigured           True             NotConfigured %systemroot%\system32\LogFiles\Firewall\pfirewall.log                4096      False  False
Network  2    Ethernet 2                                 2             Private           True         Internet        NoTraffic                                                Block                 Allow     NotConfigured           NotConfigured        NotConfigured NotConfigured  NotConfigured                   NotConfigured          False             NotConfigured %systemroot%\system32\LogFiles\Firewall\pfirewall.log                4096      False  False
Network       Ethernet                                   2             Private           True     LocalNetwork        NoTraffic                                        NotConfigured         NotConfigured     NotConfigured           NotConfigured        NotConfigured NotConfigured  NotConfigured                   NotConfigured          False             NotConfigured %systemroot%\system32\LogFiles\Firewall\pfirewall.log                4096      False  False
ad.evotec.xyz Ethernet 5                                 3 DomainAuthenticated          False         Internet        NoTraffic                                        NotConfigured         NotConfigured     NotConfigured           NotConfigured        NotConfigured NotConfigured  NotConfigured                   NotConfigured          False             NotConfigured %systemroot%\system32\LogFiles\Firewall\pfirewall.log                4096      False  False
Network 2     Ethernet 4                                12             Private          False     LocalNetwork        NoTraffic                                        NotConfigured         NotConfigured     NotConfigured           NotConfigured        NotConfigured NotConfigured  NotConfigured                   NotConfigured          False             NotConfigured %systemroot%\system32\LogFiles\Firewall\pfirewall.log                4096      False  False
> EXAMPLE 2

Get-ComputerNetworkCard -ComputerName EVOWIN -NetworkFirewallOnly
PSComputerName Profile Enabled DefaultInboundAction DefaultOutboundAction AllowInboundRules AllowLocalFirewallRules AllowLocalIPsecRules AllowUserApps AllowUserPorts AllowUnicastResponseToMulticast NotifyOnListen EnableStealthModeForIPsec LogMaxSizeKilobytes LogAllowed LogBlocked    LogIgnored Caption Description ElementName InstanceID                      DisabledInterfaceAliases LogFileName                                           Name    CimClass
-------------- ------- ------- -------------------- --------------------- ----------------- ----------------------- -------------------- ------------- -------------- ------------------------------- -------------- ------------------------- ------------------- ---------- ----------    ---------- ------- ----------- ----------- ----------                      ------------------------ -----------                                           ----    --------
EVOWIN         Domain     True        NotConfigured         NotConfigured     NotConfigured           NotConfigured        NotConfigured NotConfigured  NotConfigured                   NotConfigured           True             NotConfigured                4096      False      False NotConfigured                                 MSFT|FW|FirewallProfile|Domain  {NotConfigured}          %systemroot%\system32\LogFiles\Firewall\pfirewall.log Domain  root/stand...
EVOWIN         Private    True        NotConfigured         NotConfigured     NotConfigured           NotConfigured        NotConfigured NotConfigured  NotConfigured                   NotConfigured           True             NotConfigured                4096      False      False NotConfigured                                 MSFT|FW|FirewallProfile|Private {NotConfigured}          %systemroot%\system32\LogFiles\Firewall\pfirewall.log Private root/stand...
EVOWIN         Public     True        NotConfigured         NotConfigured     NotConfigured           NotConfigured        NotConfigured NotConfigured  NotConfigured                   NotConfigured           True             NotConfigured                4096      False      False NotConfigured                                 MSFT|FW|FirewallProfile|Public  {NotConfigured}          %systemroot%\system32\LogFiles\Firewall\pfirewall.log Public  root/stand...

---

### Parameters
#### **ComputerName**
Specifies the name of the computer(s) for which to retrieve network information.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **NetworkFirewallOnly**
Indicates whether to retrieve only firewall information for the specified computers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NetworkFirewallSummaryOnly**
Indicates whether to retrieve a summary of firewall information for the specified computers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Splitter**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |false        |Joiner |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-ComputerNetwork [[-ComputerName] <String[]>] [-NetworkFirewallOnly] [-NetworkFirewallSummaryOnly] [[-Splitter] <String>] [<CommonParameters>]
```

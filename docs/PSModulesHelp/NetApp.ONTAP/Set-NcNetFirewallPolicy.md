Set-NcNetFirewallPolicy
-----------------------

### Synopsis
Modify an existing firewall policy.

---

### Description

Modify an existing firewall policy.

---

### Related Links
* [New-NcNetFirewallPolicy](New-NcNetFirewallPolicy)

* [Get-NcNetFirewallPolicy](Get-NcNetFirewallPolicy)

* [Remove-NcNetFirewallPolicy](Remove-NcNetFirewallPolicy)

---

### Examples
> Example 1

Set-NcNetFirewallPolicy -Name https_policy -Vserver pester -Service https -AllowAddress 10.63.176.0/24
Change the allowed address for the given firewall policy.

Policy               Service    Ipspace          AllowList                          Vserver
------               -------    -------          ---------                          -------
https_policy         https      Default          {10.63.176.0/24}                   pester

---

### Parameters
#### **Name**
The name of the firewall policy.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Policy |

#### **Vserver**
The name of the vserver on which the firewall policy is defined.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Service**
The network service that is associated with the firewall policy. A firewall policy can be associated with multiple services.
Possible values include:
'http:     - The HTTP protocol',
'https:    - The HTTPS protocol',
'ntp:      - The NTP protocol',
'rsh:      - The RSH protocol',
'snmp:     - The SNMP protocol',
'ssh:      - The SSH protocol',
'telnet:   - The Telnet protocol'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **AllowAddress**
The list of client IPs that are permitted to access the specified service running on LIFs with the specified policy.
Format: <IP Address/Mask>

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|true    |4       |true (ByPropertyName)|AllowList|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetFirewallPolicyInfo

---

### Notes
Category: net
API: net-firewall-policy-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcNetFirewallPolicy [-Name] <String> [-Vserver] <String> [-Service] <String> [-AllowAddress] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Remove-NcNetFirewallPolicy
--------------------------

### Synopsis
Destroy an existing firewall policy.

---

### Description

Destroy an existing firewall policy.

---

### Related Links
* [New-NcNetFirewallPolicy](New-NcNetFirewallPolicy)

* [Get-NcNetFirewallPolicy](Get-NcNetFirewallPolicy)

* [Set-NcNetFirewallPolicy](Set-NcNetFirewallPolicy)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetFirewallPolicy -Name https_policy -Vserver pester -Service https
Remove the given firewall policy.
```

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
* 

---

### Notes
Category: net
API: net-firewall-policy-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetFirewallPolicy [-Name] <String> [-Vserver] <String> [-Service] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

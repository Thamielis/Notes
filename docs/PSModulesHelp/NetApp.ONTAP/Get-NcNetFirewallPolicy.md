Get-NcNetFirewallPolicy
-----------------------

### Synopsis
Get the firewall policy objects.

---

### Description

Get the firewall policy objects.

---

### Related Links
* [Set-NcNetFirewallPolicy](Set-NcNetFirewallPolicy)

* [New-NcNetFirewallPolicy](New-NcNetFirewallPolicy)

* [Remove-NcNetFirewallPolicy](Remove-NcNetFirewallPolicy)

---

### Examples
> Example 1

Get-NcNetFirewallPolicy
Get the firewall policies for all the vservers in the cluster.

Policy               Service    Ipspace          AllowList                          Vserver
------               -------    -------          ---------                          -------
data                 ndmps      Default          {0.0.0.0/0}                        beam-fs-ps
data                 ndmp       Default          {0.0.0.0/0}                        beam-fs-ps
data                 dns        Default          {0.0.0.0/0}                        beam-fs-ps
intercluster         ndmps      Default          {0.0.0.0/0}                        beam-fs-ps
intercluster         ndmp       Default          {0.0.0.0/0}                        beam-fs-ps
intercluster         https      Default          {0.0.0.0/0}                        beam-fs-ps
mgmt                 ntp        Default          {0.0.0.0/0}                        beam-fs-ps
mgmt                 ndmps      Default          {0.0.0.0/0}                        beam-fs-ps
mgmt                 ssh        Default          {0.0.0.0/0}                        beam-fs-ps
mgmt                 snmp       Default          {0.0.0.0/0}                        beam-fs-ps
mgmt                 http       Default          {0.0.0.0/0}                        beam-fs-ps
mgmt                 dns        Default          {0.0.0.0/0}                        beam-fs-ps
mgmt                 ndmp       Default          {0.0.0.0/0}                        beam-fs-ps
mgmt                 https      Default          {0.0.0.0/0}                        beam-fs-ps

> Example 2

Get-NcNetFirewallPolicy -Query @{AllowList="0.0.0.0/0"}
Get the firewall policies that allow unrestricted access.

Policy               Service    Ipspace          AllowList                          Vserver
------               -------    -------          ---------                          -------
data                 ndmps      Default          {0.0.0.0/0}                        beam-fs-ps
data                 ndmp       Default          {0.0.0.0/0}                        beam-fs-ps
data                 dns        Default          {0.0.0.0/0}                        beam-fs-ps

---

### Parameters
#### **Name**
Name of one or more firewall policies to get.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Policy |

#### **Vserver**
One or more vservers containing firewall policy.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Service**
One or more network services associated with the firewall policy.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetFirewallPolicyInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetFirewallPolicy -Template" to get the initially empty NetFirewallPolicyInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[NetFirewallPolicyInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Template**
Specify to get an empty NetFirewallPolicyInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetFirewallPolicyInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetFirewallPolicy -Template" to get the initially empty NetFirewallPolicyInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[NetFirewallPolicyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetFirewallPolicyInfo

---

### Notes
Category: net
API: net-firewall-policy-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetFirewallPolicy [[-Name] <String[]>] [[-Vserver] <String[]>] [[-Service] <String[]>] [-Attributes <NetFirewallPolicyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetFirewallPolicy -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetFirewallPolicy -Query <NetFirewallPolicyInfo> [-Attributes <NetFirewallPolicyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

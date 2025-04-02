Get-NcNetFirewall
-----------------

### Synopsis
Get the firewall configuration.

---

### Description

Get the firewall configuration.

---

### Related Links
* [Enable-NcNetFirewall](Enable-NcNetFirewall)

* [Disable-NcNetFirewall](Disable-NcNetFirewall)

* [Enable-NcNetFirewallLogging](Enable-NcNetFirewallLogging)

* [Disable-NcNetFirewallLogging](Disable-NcNetFirewallLogging)

---

### Examples
> Example 1

```PowerShell
Get-NcNetFirewall
Get the firewall configuration for all nodes in the cluster.

IsEnabled          : True
IsLogging          : False
NcController       : 10.63.10.37
NodeName           : beam-fs-ps-01

```
> Example 2

```PowerShell
Get-NcNetFirewall -Query @{IsEnabled=$true} -Attributes @{IsLogging=""}
Get the IsLogging attribute for all enabled firewalls in the cluster.

IsEnabled          :
IsLogging          : False
NcController       : 10.63.10.37
NodeName           : beam-fs-ps-01

```

---

### Parameters
#### **Node**
One or more nodes to get firewall configuration.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Attributes**
For improved scalability in large clusters, provide a NetFirewallConfigInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetFirewall -Template" to get the initially empty NetFirewallConfigInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[NetFirewallConfigInfo]`|false   |named   |false        |

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
Specify to get an empty NetFirewallConfigInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetFirewallConfigInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetFirewall -Template" to get the initially empty NetFirewallConfigInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[NetFirewallConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetFirewallConfigInfo

---

### Notes
Category: net
API: net-firewall-config-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetFirewall [[-Node] <String[]>] [-Attributes <NetFirewallConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetFirewall -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetFirewall -Query <NetFirewallConfigInfo> [-Attributes <NetFirewallConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

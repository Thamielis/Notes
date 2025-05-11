Get-NcNameServiceIPFromHostname
-------------------------------

### Synopsis
Get the IP address information by using the host name.

---

### Description

Get the IP address information by using the host name. Can provide both IPv4 and IPv6 addresses.

---

### Related Links
* [Get-NcNameServiceHostnameFromIP](Get-NcNameServiceHostnameFromIP)

---

### Examples
> Example 1

```PowerShell
Get-NcNameServiceIPFromHostname -Node aparajir-vsim1 -Vserver pstk -Hostname dsg-sunx-100.lab.eng.btc.netapp.in
Get the IP Address(es) associated with dsg-sunx-100.lab.eng.btc.netapp.in

10.72.211.100

```

---

### Parameters
#### **Node**
Name of the node over which the command is to be run.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |1       |true (ByPropertyName)|Name<br/>NodeName|

#### **Vserver**
Vserver name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Hostname**
Name of the host to be resolved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **ShowSource**
Specify to view the source of the lookup result

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **IPv4Only**
Specify to restrict results to IPv4 Address only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IPv6Only**
Specify to restrict results to IPv6 Address only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: nameservice
API: nameservice-get-ip-from-hostname
Family: cluster

---

### Syntax
```PowerShell
Get-NcNameServiceIPFromHostname [[-Node] <String>] [[-Vserver] <String>] [[-Hostname] <String>] [-ShowSource] [-Controller <NcController[]>] [-IPv4Only] [-IPv6Only] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

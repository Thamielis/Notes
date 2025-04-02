Get-NcNameServiceHostnameFromIP
-------------------------------

### Synopsis
Get the host information from the IPv4 address.

---

### Description

Get the host information from the IP address. Works only with IPv4 addresses.

---

### Related Links
* [Get-NcNameServiceIPFromHostname](Get-NcNameServiceIPFromHostname)

---

### Examples
> Example 1

Get-NcNameServiceHostnameFromIP -Node aparajir-vsim1 -Vserver pstk -Address 10.72.211.100
Resolve 10.72.211.100 in to it's hostname according to ns-switch databases

dsg-sunx-100.lab.eng.btc.netapp.in

---

### Parameters
#### **Node**
Name of the node over which the command is to be run.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |1       |true (ByPropertyName)|Name<br/>NodeName|

#### **Vserver**
Vserver name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Address**
IPv4 address of the host to be resolved.

|Type      |Required|Position|PipelineInput        |Aliases                                        |
|----------|--------|--------|---------------------|-----------------------------------------------|
|`[String]`|false   |3       |true (ByPropertyName)|IPv4Address<br/>IPAddressToString<br/>IPAddress|

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
API: nameservice-get-hostname-from-ipv4
Family: cluster

---

### Syntax
```PowerShell
Get-NcNameServiceHostnameFromIP [[-Node] <String>] [[-Vserver] <String>] [[-Address] <String>] [-ShowSource] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

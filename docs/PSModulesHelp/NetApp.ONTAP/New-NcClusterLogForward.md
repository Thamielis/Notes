New-NcClusterLogForward
-----------------------

### Synopsis
Create a log forwarding configuration.

---

### Description

Create a log forwarding configuration.

---

### Related Links
* [Remove-NcClusterLogForward](Remove-NcClusterLogForward)

* [Set-NcClusterLogForward](Set-NcClusterLogForward)

* [Get-NcClusterLogForward](Get-NcClusterLogForward)

---

### Examples
> Example 1

```PowerShell
New-NcClusterLogForward -Destination 10.72.211.100 -Port 16745 -Force
Create a cluster log forwarding address and do not test connectivity to the destination

Destination    : 10.72.211.100
Facility       : user
Force          : True
NcController   : 10.238.49.117
Port           : 16745
ForceSpecified : True

```

---

### Parameters
#### **Destination**
Destination address that the log messages will be forwarded to. Can be a hostname or IP address.

|Type      |Required|Position|PipelineInput        |Aliases                       |
|----------|--------|--------|---------------------|------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Address<br/>DestinationAddress|

#### **Port**
The destination port used to forward the message.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[UInt16]`|false   |2       |true (ByPropertyName)|DestinationPort|

#### **Facility**
Specify one or more facilities to restrict results

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Force**
Specify to skip connectivity test.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Protocol**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsServerVerified**

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Cluster.ClusterLogForwardInfo

---

### Notes
Category: Cluster
API: cluster-log-forward-create
Family: cluster

---

### Syntax
```PowerShell
New-NcClusterLogForward [-Destination] <String> [[-Port] <UInt16>] [-Facility <String>] [-Force] [-Protocol <String>] [-IsServerVerified <Boolean>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

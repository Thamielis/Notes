Set-NcClusterLogForward
-----------------------

### Synopsis
Modify the log forwarding configuration

---

### Description

Modify the log forwarding configuration

---

### Related Links
* [Remove-NcClusterLogForward](Remove-NcClusterLogForward)

* [Get-NcClusterLogForward](Get-NcClusterLogForward)

* [New-NcClusterLogForward](New-NcClusterLogForward)

---

### Examples
> Example 1

```PowerShell
Set-NcClusterLogForward -Destination 10.72.211.100 -Port 16745 -Facility kern
Changing the facility value of cluster-log-forwarding (port can never be changed, but must always be specified to uniquely indentify a forwarding destination)

Destination    : 10.72.211.100
Facility       : kern
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
|`[UInt16]`|true    |2       |true (ByPropertyName)|DestinationPort|

#### **Facility**
Facility code used to indicate the type of software that generated the message.
Possible values: 
    'kern'      - kernel messages,
    'user'      - user-level messages,
    'local0'    - local use 0,
    'local1'    - local use 1,
    'local2'    - local use 2,
    'local3'    - local use 3,
    'local4'    - local use 4,
    'local5'    - local use 5,
    'local6'    - local use 6,
    'local7'    - local use 7

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
API: cluster-log-forward-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcClusterLogForward [-Destination] <String> [-Port] <UInt16> [-Facility <String>] [-IsServerVerified <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

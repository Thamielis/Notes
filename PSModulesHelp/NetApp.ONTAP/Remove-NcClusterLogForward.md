Remove-NcClusterLogForward
--------------------------

### Synopsis
Delete a log forwarding configuration

---

### Description

Delete a log forwarding configuration

---

### Related Links
* [Set-NcClusterLogForward](Set-NcClusterLogForward)

* [Get-NcClusterLogForward](Get-NcClusterLogForward)

* [New-NcClusterLogForward](New-NcClusterLogForward)

---

### Examples
> Example 1

```PowerShell
Remove-NcClusterLogForward -Destination 10.72.211.100 -Port 16745
Removes a cluster log forwarding destination
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
* 

---

### Notes
Category: Cluster
API: cluster-log-forward-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcClusterLogForward [-Destination] <String> [-Port] <UInt16> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

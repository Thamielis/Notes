Set-NcNetReceivedWindowSize
---------------------------

### Synopsis
Modify receive buffer size properties.

---

### Description

Modify receive buffer size properties.

---

### Related Links
* [Get-NcNetReceivedWindowSize](Get-NcNetReceivedWindowSize)

---

### Examples
> Example 1

```PowerShell
Set-NcNetReceivedWindowSize -Service ctlopcp -Protocol tcp -Network lan -ReceiveBuffer 512k
Set the receive buffer.

NcController               : 10.63.165.62
Network                    : lan
Protocol                   : tcp
ReceiveAutoTune            : False
ReceiveBufferSize          : 524288
Service                    : ctlopcp
ReceiveAutoTuneSpecified   : True
ReceiveBufferSizeSpecified : True

```

---

### Parameters
#### **Service**
Stream protocol connection classification.
Possible values: 
'mount'          - Mount stream protocol
'nfs'            - NFS stream protocol
'nfs_v2'         - NFS version 2 stream protocol
'nfs_v3'         - NFS version 3 stream protocol
'nlm_v4'         - Network lock manager stream protocol
'sm'             - Session Manager stream protocol
'ftp_ctrl'       - FTP control stream protocol
'ftp_data'       - FTP data stream protocol
'http_1_0'       - HTTP version 1 stream protocol
'http_1_1'       - HTTP version 1.1 stream protocol
'iscsi'          - ISCSI stream protocol
'cifs_srv'       - CIFS server stream protocol
'cifs_nam'       - CIFS name server stream protocol
'loopback'       - loopback stream protocol
'rf'             - RC stream protocol
'rawscp'         - Raw secure copy stream protocol
'discard'        - Descard stream protocol
'port_map'       - Port map stream protocol
'pass_thru'      - Passthru stream protocol
'rclopcp'        - Rc connection stream protocol
'nfs_v4'         - NFS version 4 stream protocol
'fcache'         - Flex cache stream protocol
'ctlopcp'        - Ct connection stream protocol
'rquota'         - Rquota stream protocol
'cifs_msrpc'     - CIFS MsRpc stream protocol
'unknown'        - unknown protocol

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Protocol**
Network layer 4 protocol type.
Possible values: 
'udp'  - UDP
'tcp'  - TCP
'na'   - not_available

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Network**
One or more network topology classifications.
Possible values: 'wan', 'lan', 'undefined'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **ReceiveBuffer**
Receive buffer size in kilobytes (1024).  The default value is 2048 for the ctlopcp service using the WAN network type, and 256 in other cases.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ReceiveAutoTune**
If specified, allow the system to automatically adjust the receive buffer size.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.ReceiveBuffer

---

### Notes
Category: net
API: net-connections-receive-window-size-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcNetReceivedWindowSize [-Service] <String> [-Protocol] <String> [-Network] <String> [-ReceiveBuffer <String>] [-ReceiveAutoTune] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Get-NcNetReceivedWindowSize
---------------------------

### Synopsis
Get the receive buffer size properties of a service.

---

### Description

Get the receive buffer size properties of a service.

---

### Related Links
* [Set-NcNetReceivedWindowSize](Set-NcNetReceivedWindowSize)

---

### Examples
> Example 1

```PowerShell
Get-NcNetReceivedWindowSize
Get all of the receive buffer size properties of a service.

NcController               : 10.63.165.62
Network                    : lan
Protocol                   : tcp
ReceiveAutoTune            : False
ReceiveBufferSize          : 262144
Service                    : ctlopcp
ReceiveAutoTuneSpecified   : True
ReceiveBufferSizeSpecified : True

NcController               : 10.63.165.62
Network                    : wan
Protocol                   : tcp
ReceiveAutoTune            : True
ReceiveBufferSize          : 2097152
Service                    : ctlopcp
ReceiveAutoTuneSpecified   : True
ReceiveBufferSizeSpecified : True

```

---

### Parameters
#### **Service**
One or more stream protocol connection classifications.  Data ONTAP wildcards are permitted.
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

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Protocol**
One or more network layer 4 protocol types.  Data ONTAP wildcards are permitted.
Possible values: 
'udp'  - UDP
'tcp'  - TCP
'na'   - not_available

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Network**
One or more network topology classifications.  Data ONTAP wildcards are permitted.
Possible values: 'wan', 'lan', 'undefined'

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ReceiveBuffer object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetReceivedWindowSize -Template" to get the initially empty ReceiveBuffer object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ReceiveBuffer]`|false   |named   |false        |

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
Specify to get an empty ReceiveBuffer object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ReceiveBuffer object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetReceivedWindowSize -Template" to get the initially empty ReceiveBuffer object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ReceiveBuffer]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.ReceiveBuffer

---

### Notes
Category: net
API: net-connections-receive-window-size-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetReceivedWindowSize [[-Service] <String[]>] [[-Protocol] <String[]>] [[-Network] <String[]>] [-Attributes <ReceiveBuffer>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetReceivedWindowSize -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetReceivedWindowSize -Query <ReceiveBuffer> [-Attributes <ReceiveBuffer>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

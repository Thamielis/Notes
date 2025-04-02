Move-NcNetInterface
-------------------

### Synopsis
Migrate a Logical Interface between nodes and ports.

---

### Description

Migrate a Logical Interface between nodes and ports.

---

### Related Links
* [Invoke-NcNetInterfaceRevert](Invoke-NcNetInterfaceRevert)

---

### Examples
> Example 1

Move-NcNetInterface -Name beam_vsim01_data1 -Vserver beam_vsim01 -SourceNode vsim_cluster1-01 -DestinationNode vsim_cluster1-02 -DestinationPort e0d
Move the 'beam_vsim01_data1' LIF from node 'vsim_cluster1-01' to node 'vsim_cluster1-02'.

InterfaceName        OpStatus DataProtocols        FirewallPolicy Vserver              Address
-------------        -------- -------------        -------------- -------              -------
beam_vsim01_data1       up    {cifs}                    mgmt      beam_vsim01          10.63.58.222

---

### Parameters
#### **Name**
The logical interface that is to be migrated.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Lif    |

#### **Vserver**
Specifies the Vserver that owns the logical interface that is to be migrated.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **SourceNode**
Specifies the node from which the logical interface is to be migrated. If not specifed, this field will be set to the node on which the LIF currently resides.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DestinationNode**
Specifies the node to which the logical interface is to be migrated.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **DestinationPort**
Specifies the port or interface group to which the logical interface is to be migrated. If not specified, this field will be set to the port name of the port on which the LIF currently resides.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Force**
If specified, force the migration operation. If specified, migrating a LIF whos 'sticky' field is set to true, or whose current node is sick will be allowed. Otherwise they will not be permitted.

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
* DataONTAP.C.Types.Net.NetInterfaceInfo

---

### Notes
Category: net
API: net-interface-migrate
Family: cluster

---

### Syntax
```PowerShell
Move-NcNetInterface [-Name] <String> [-Vserver] <String> [-SourceNode <String>] [-DestinationNode] <String> [-DestinationPort <String>] [-Force] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

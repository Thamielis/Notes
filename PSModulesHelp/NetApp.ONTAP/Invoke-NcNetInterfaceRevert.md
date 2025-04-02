Invoke-NcNetInterfaceRevert
---------------------------

### Synopsis
Revert a logical interface back to its home port following a deliberate migration or failover.

---

### Description

Revert a logical interface back to its home port following a deliberate migration or failover.

---

### Related Links
* [Move-NcNetInterface](Move-NcNetInterface)

---

### Examples
> Example 1

Invoke-NcNetInterfaceRevert -Name beam_vsim01_data1 -Vserver beam_vsim01
Revert LIF 'beam_vsim01_data1' back to its home node and port.

InterfaceName        OpStatus DataProtocols        FirewallPolicy Vserver              Address
-------------        -------- -------------        -------------- -------              -------
beam_vsim01_data1      down   {cifs}                    mgmt      beam_vsim01          10.63.58.222

---

### Parameters
#### **Name**
Specifies the logical interface that is to be reverted.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |1       |true (ByPropertyName)|InterfaceName|

#### **Vserver**
Specifies the Vserver that owns the logical interface that is to be reverted.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
API: net-interface-revert
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcNetInterfaceRevert [-Name] <String> [-Vserver] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

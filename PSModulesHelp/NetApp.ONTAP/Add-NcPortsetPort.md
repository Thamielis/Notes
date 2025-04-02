Add-NcPortsetPort
-----------------

### Synopsis
Add a port to an existing port set.

---

### Description

Add a port to an existing port set.

---

### Related Links
* [Get-NcPortset](Get-NcPortset)

* [Remove-NcPortsetPort](Remove-NcPortsetPort)

---

### Examples
> Example 1

```PowerShell
Add-NcPortsetPort portset_iscsi1 costea01_lif_data3
Add iscsi LIF 'costea01_lif_data3' to portset 'portset_iscsi1'.

NcController       : costea01
InitiatorGroupInfo :
PortsetName        : portset_iscsi1
PortsetPortInfo    : {costea01_lif_data3}
PortsetPortTotal   : 1
PortsetType        : iscsi
Vserver            : costea01

```

---

### Parameters
#### **Name**
Name of port set to modify.

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Portset<br/>PortsetName|

#### **Port**
This is the name of the port that is to be added to the portset.  The port name is the name of either an FCP data LIF or an iSCSI target portal group.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |2       |true (ByPropertyName)|PortName|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
* DataONTAP.C.Types.Portset.PortsetInfo

---

### Notes
Category: portset
API: portset-add
Family: vserver

---

### Syntax
```PowerShell
Add-NcPortsetPort [-Name] <String> [-Port] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

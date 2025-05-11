Add-NcIscsiInterfaceAccess
--------------------------

### Synopsis
Add the iSCSI LIF to the accesslist of the specified initiator.

---

### Description

Add the iSCSI LIF to the accesslist of the specified initiator.

---

### Related Links
* [Remove-NcIscsiInterfaceAccess](Remove-NcIscsiInterfaceAccess)

* [Get-NcIscsiInterfaceAccess](Get-NcIscsiInterfaceAccess)

---

### Examples
> Example 1

Add-NcIscsiInterfaceAccess (Get-NaHostIscsiAdapter).Iqn costea01_lif_data3
Give the host iSCSI adapter access to the interface costea01_lif_data3.

Initiator                                                    InterfaceName              Vserver
---------                                                    -------------              -------
iqn.1991-05.com.microsoft:win2k8devrre0.rtprre.testdomain    costea01_lif_data3         costea01

---

### Parameters
#### **Initiator**
Initiator that can access the iSCSI LIF.

|Type      |Required|Position|PipelineInput        |Aliases                  |
|----------|--------|--------|---------------------|-------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|InitiatorNodename<br/>Iqn|

#### **Interface**
iSCSI LIF Name.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |2       |true (ByPropertyName)|InterfaceName|

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
* DataONTAP.C.Types.Iscsi.IscsiInterfaceAccesslistEntryInfo

---

### Notes
Category: iscsi
API: iscsi-interface-accesslist-add
Family: vserver

---

### Syntax
```PowerShell
Add-NcIscsiInterfaceAccess [-Initiator] <String> [-Interface] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

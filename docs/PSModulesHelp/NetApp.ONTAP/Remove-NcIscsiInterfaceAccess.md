Remove-NcIscsiInterfaceAccess
-----------------------------

### Synopsis
Remove the iSCSI LIF from the accesslist of the specified initiator.

---

### Description

Remove the iSCSI LIF from the accesslist of the specified initiator.

---

### Related Links
* [Get-NcIscsiInterfaceAccess](Get-NcIscsiInterfaceAccess)

* [Add-NcIscsiInterfaceAccess](Add-NcIscsiInterfaceAccess)

---

### Examples
> Example 1

```PowerShell
Remove-NcIscsiInterfaceAccess iqn.1991-05.com.microsoft:win2k8devrre0.rtprre.testdomain costea01_lif_data3
Remove access to the given data LIF from the given initiator.
```
> Example 2

```PowerShell
Get-NcIscsiInterfaceAccess iqn.1991-05.com.microsoft:win2k8devrre0.rtprre.testdomain | Remove-NcIscsiInterfaceAccess
Remove all access to data LIFs for the initiator iqn.1991-05.com.microsoft:win2k8devrre0.rtprre.testdomain.
```

---

### Parameters
#### **Initiator**
The name of the initiator that can access the iSCSI LIF.

|Type      |Required|Position|PipelineInput        |Aliases                  |
|----------|--------|--------|---------------------|-------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|InitiatorNodename<br/>Iqn|

#### **Interface**
The iSCSI LIF name.

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
* 

---

### Notes
Category: iscsi
API: iscsi-interface-accesslist-remove
Family: vserver

---

### Syntax
```PowerShell
Remove-NcIscsiInterfaceAccess [-Initiator] <String> [-Interface] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

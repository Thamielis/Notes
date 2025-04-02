Set-NcIscsiInterface
--------------------

### Synopsis
Modify the attributes of an iSCSI interface object.

---

### Description

Modify the attributes of an iSCSI interface object.

---

### Related Links
* [Get-NcIscsiInterface](Get-NcIscsiInterface)

---

### Examples
> Example 1

Set-NcIscsiInterface -LIF data2 -SendTargetsFqdn rtp.netapp.com -VserverContext primary1
Modify the SendTargetsFqdn of Lif data2

InterfaceName                        IpAddress   IpPort  IsInterfaceEnabled  Vserver
-------------                        ---------   ------  ------------------  -------
data2                            10.224.116.95     3260         True         primary1

---

### Parameters
#### **InterfaceName**
The logical interface (LIF) name, which is to be modified.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|LIF<br/>Interface|

#### **SendTargetsFqdn**
The Fully Qualified Domain Name (FQDN) of the LIF to be returned in iSCSI SendTargets Discovery.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|FQDN   |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiInterfaceListEntryInfo

---

### Notes
Category: iscsi
API: iscsi-interface-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcIscsiInterface [-InterfaceName] <String> [-SendTargetsFqdn <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Add-NcIgroupPortset
-------------------

### Synopsis
Bind an existing igroup to a given portset.

---

### Description

Bind an existing igroup to a given portset.

---

### Related Links
* [Remove-NcIgroupPortset](Remove-NcIgroupPortset)

* [Get-NcIgroup](Get-NcIgroup)

---

### Examples
> Example 1

```PowerShell
Add-NcIgroupPortset x3550rre7 portset_iscsi1
Add portset 'portset_iscsi1' to igroup 'x3550rre7'.

Name            : x3550rre7
Type            : hyper_v
Protocol        : mixed
Portset         : portset_iscsi1
ALUA            : True
ThrottleBorrow  : False
ThrottleReserve : 0
Partner         : True
VSA             : False
Initiators      : {iqn.1991-05.com.microsoft:x3550rre7.rtprre.testdomain}
Vserver         : costea01

```

---

### Parameters
#### **Name**
The name of the igroup to modify.

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Igroup<br/>InitiatorGroupName|

#### **Portset**
The name of the portset to add.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |2       |true (ByPropertyName)|PortsetName|

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
* DataONTAP.C.Types.Igroup.InitiatorGroupInfo

---

### Notes
Category: igroup
API: igroup-bind-portset
Family: vserver

---

### Syntax
```PowerShell
Add-NcIgroupPortset [-Name] <String> [-Portset] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

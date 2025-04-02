Get-NcLunByIgroup
-----------------

### Synopsis
Find the path to the LUN mapped at a given LUN ID for a given initiator group.

---

### Description

Find the path to the LUN mapped at a given LUN ID for a given initiator group.

---

### Related Links
* [Get-NcIgroup](Get-NcIgroup)

* [Get-NcLun](Get-NcLun)

---

### Examples
> Example 1

Get-NcLunByIgroup x3550rre7 -Id 0
Find the LUN mapped to initiator group 'x3550rre7' on LUN ID 0.

Path                        Size Protocol Online Mapped Thin  Vserver  Comment
----                        ---- -------- ------ ------ ----  -------  -------
/vol/testvol/exchangeLun 54.0 GB hyper_v   True   True  False costea01

---

### Parameters
#### **Name**
Name of initiator group to search.

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Igroup<br/>InitiatorGroupName|

#### **Id**
LUN ID (Logical Unit Number) to search for.

|Type     |Required|Position|PipelineInput        |Aliases            |
|---------|--------|--------|---------------------|-------------------|
|`[Int32]`|true    |2       |true (ByPropertyName)|Attribute<br/>LunID|

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
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: igroup
API: igroup-lookup-lun
Family: vserver

---

### Syntax
```PowerShell
Get-NcLunByIgroup [-Name] <String> [-Id] <Int32> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

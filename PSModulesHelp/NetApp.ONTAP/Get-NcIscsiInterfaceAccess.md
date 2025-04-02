Get-NcIscsiInterfaceAccess
--------------------------

### Synopsis
Get a list of iSCSI Interface Accesslist objects.

---

### Description

Get a list of iSCSI Interface Accesslist objects.

---

### Related Links
* [Add-NcIscsiInterfaceAccess](Add-NcIscsiInterfaceAccess)

* [Remove-NcIscsiInterfaceAccess](Remove-NcIscsiInterfaceAccess)

---

### Examples
> Example 1

Get-NcIscsiInterfaceAccess
Get the interface access list for the current cluster.

Initiator                                                    InterfaceName              Vserver
---------                                                    -------------              -------
iqn.1998-01.com.vmware:rre-x3550-115-79773d65                costea01_lif_data3         costea01
iqn.1998-01.com.vmware:x3550rre14-203659c5                   costea01_lif_data3         costea01
iqn.1998-01.com.vmware:x3550rre16-462f4c93                   costea01_lif_data3         costea01

---

### Parameters
#### **Initiator**
The name of the initiator that can access the iSCSI LIF.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|InitiatorNodename|

#### **Interface**
The iSCSI LIF name.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|InterfaceName|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiInterfaceAccesslistEntryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiInterfaceAccess -Template" to get the initially empty IscsiInterfaceAccesslistEntryInfo object.  If not specified, all data is returned for each object.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[IscsiInterfaceAccesslistEntryInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty IscsiInterfaceAccesslistEntryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiInterfaceAccesslistEntryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiInterfaceAccess -Template" to get the initially empty IscsiInterfaceAccesslistEntryInfo object.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[IscsiInterfaceAccesslistEntryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiInterfaceAccesslistEntryInfo

---

### Notes
Category: iscsi
API: iscsi-interface-accesslist-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiInterfaceAccess [[-Initiator] <String[]>] [[-Interface] <String[]>] [-Attributes <IscsiInterfaceAccesslistEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiInterfaceAccess -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiInterfaceAccess -Query <IscsiInterfaceAccesslistEntryInfo> [-Attributes <IscsiInterfaceAccesslistEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Get-NcCifsPreferredDcStatus
---------------------------

### Synopsis
Display the Status of the Preferred-DCs configured for the Given Vserver

---

### Description

Display the Status of the Preferred-DCs configured for the Given Vserver

---

### Examples
> Example 1

Get-NcCifsPreferredDcStatus -VserverName vs0 -DcIpAddr 10.60.56.21, 10.60.56.22
Display the Status of the Preferred-DCs "10.60.56.21, 10.60.56.22" configured for the Vserver vs0

DcIpAddr      : {10.60.56.21, 10.60.56.22}
DomainName    : {ctl.gdl.englab.netapp.com, ctl.gdl.englab.netapp.com}
NcController  : 10.236.44.243
Status        : {up, up}
StatusDetails : {Response time (msec):1, Response time (msec):0}
VserverName   : vs0

---

### Parameters
#### **VserverName**
Vserver

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **DcIpAddr**
DC Address

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsPreferredDcCheckInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsPreferredDcStatus -Template" to get the initially empty CifsPreferredDcCheckInfo object.  If not specified, all data is returned for each object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CifsPreferredDcCheckInfo]`|false   |named   |false        |

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

#### **Query**
For advanced queries, provide a CifsPreferredDcCheckInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsPreferredDcStatus -Template" to get the initially empty CifsPreferredDcCheckInfo object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CifsPreferredDcCheckInfo]`|true    |named   |false        |

#### **Template**
Specify to get an empty PreferredDcCheckInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsPreferredDcCheckInfo

---

### Notes
Category: cifs
API: cifs-preferred-dc-check-get-iter
Family: ontap-cluster,ontap-vserver

---

### Syntax
```PowerShell
Get-NcCifsPreferredDcStatus [-VserverName] <String> [[-DcIpAddr] <String[]>] [-Attributes <CifsPreferredDcCheckInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsPreferredDcStatus [-VserverName] <String> -Query <CifsPreferredDcCheckInfo> [-Attributes <CifsPreferredDcCheckInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsPreferredDcStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

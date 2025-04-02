Get-NcCifsServerStatus
----------------------

### Synopsis
Display the Status of Connectivity from Each Node to the CIFS Server for the Given Vserver

---

### Description

Display the Status of Connectivity from Each Node to the CIFS Server for the Given Vserver

---

### Examples
> Example 1

```PowerShell
Get-NcCifsServerStatus -VserverName vs0 -NodeName sti32-vsim-ucs480e
Display the Status of Connectivity from Each Node to the CIFS Server for the Given Vserver

CifsDomainIpAddr : 10.60.56.21
CifsDomainName   : ctl.gdl.englab.netapp.com
CifsNetbiosName  : 71FD00E630D3114
CifsServerSite   :
CifsServerStatus : Running
NcController     : 10.236.44.243
NodeName         : sti32-vsim-ucs480e
Status           : up
StatusDetails    : Response time (msec): 20
VserverName      : vs0

```

---

### Parameters
#### **VserverName**
Vserver For Checking the CIFS Server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **NodeName**
The Node on Which the Command Will Be Run.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsCheckInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsServerStatus -Template" to get the initially empty CifsCheckInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CifsCheckInfo]`|false   |named   |false        |

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
For advanced queries, provide a CifsCheckInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsServerStatus -Template" to get the initially empty CifsCheckInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CifsCheckInfo]`|true    |2       |false        |

#### **Template**
Specify to get an empty CifsServerConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsCheckInfo

---

### Notes
Category: cifs
API: cifs-check-server-get-iter
Family: ontap-cluster,ontap-vserver

---

### Syntax
```PowerShell
Get-NcCifsServerStatus [-VserverName] <String> [[-NodeName] <String[]>] [-Attributes <CifsCheckInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsServerStatus [-VserverName] <String> [-Query] <CifsCheckInfo> [-Attributes <CifsCheckInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsServerStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```

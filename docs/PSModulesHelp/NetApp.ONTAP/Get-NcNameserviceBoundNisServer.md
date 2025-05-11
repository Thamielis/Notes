Get-NcNameserviceBoundNisServer
-------------------------------

### Synopsis
Iterate over a list of bound nis servers

---

### Description

Iterate over a list of bound nis servers

---

### Related Links
* [Get-NcNamseserviceNisStatistics](Get-NcNamseserviceNisStatistics)

---

### Examples
> Example 1

Get-NcNameserviceBoundNisServer
Get unrestricted details about

BoundServers                  NcController                  NisDomain                     Vserver
------------                  ------------                  ---------                     -------
{10.72.136.21, 10.72.136.23}  10.238.49.117                 eng.btc.netapp.in             pstk

---

### Parameters
#### **NisDomain**
Specifies the NIS domain. For example: 'example.com'

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Domain |

#### **Vserver**
The vservers(s) which has the NIS domain configuration..

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[NisDomainShowBound]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[NisDomainShowBound]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NisDomainShowBound

---

### Notes
Category: nameservice
API: name-service-nis-show-bound-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNameserviceBoundNisServer [[-NisDomain] <String[]>] [-Vserver <String[]>] [-Attributes <NisDomainShowBound>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameserviceBoundNisServer -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameserviceBoundNisServer -Query <NisDomainShowBound> [-Attributes <NisDomainShowBound>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

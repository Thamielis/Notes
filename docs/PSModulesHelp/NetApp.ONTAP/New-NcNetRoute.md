New-NcNetRoute
--------------

### Synopsis
Create a new network route.

---

### Description

Create a new network route.

---

### Related Links
* [Get-NcNetRoute](Get-NcNetRoute)

* [Remove-NcNetRoute](Remove-NcNetRoute)

---

### Examples
> Example 1

New-NcNetRoute -Destination 10.61.167.0/24 -Gateway 10.61.167.1 -VserverContext pester
Create the given net route for the given vserver.

Destination          Gateway              Metric Vserver
-----------          -------              ------ -------
10.61.167.0/24       10.61.167.1            20   pester

---

### Parameters
#### **Destination**
Specify the route destination.
Example: 10.7.125.5/20, fd20:13::/64

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Gateway**
Specify the route gateway.
Example: 10.7.125.1, fd20:13::1

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Metric**
Specify the route metric. If this field is not provided the default will be set to 30.  This parameter is supported with Rest only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **IpSpace**
Applies to both SVM and cluster-scoped objects. This parameter is supported with Rest only.

|Type                             |Required|Position|PipelineInput        |
|---------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Net.Ipspace]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Net.NetVsRoutesInfo

---

### Notes
Category: net
API: net-routes-create
Family: vserver

---

### Syntax
```PowerShell
New-NcNetRoute [-Destination] <String> [-Gateway] <String> [-Metric <Int32>] [-VserverContext <String>] [-IpSpace <DataONTAP.C.Types.Net.Ipspace>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

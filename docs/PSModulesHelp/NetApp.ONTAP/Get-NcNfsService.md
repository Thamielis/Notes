Get-NcNfsService
----------------

### Synopsis
Get the NFS server configuration.

---

### Description

Get the NFS server configuration.

In ONTAP 8.1.1 and later, the cmdlet is available in both the vserver and cluster contexts.  Prior to Data ONTAP 8.1.1, the cmdlet parameter is available in the vserver context.

---

### Related Links
* [Add-NcNfsService](Add-NcNfsService)

* [Set-NcNfsService](Set-NcNfsService)

* [Remove-NcNfsService](Remove-NcNfsService)

---

### Examples
> Example 1

```PowerShell
Get-NcNfsService
Get the NFS service running on the current vserver.
```
> Example 2

```PowerShell
Get-NcNfsService -Default
Get the default configuration for an NFS service.
```

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a NfsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "GetNcNfsService -Template" to get the initially empty NfsInfo object.  If not specified, all data is returned for each object.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[NfsInfo]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a NfsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNfsService -Template" to get the initially empty NfsInfo object.
This parameter is available in ONTAP 8.1.1 and later.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[NfsInfo]`|false   |named   |false        |

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

#### **Default**
Specify to get an NfsInfo object with the default configuration filled in.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Template**
Specify to get an empty NfsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nfs.NfsInfo

---

### Notes
Category: nfs
API: nfs-service-get,nfs-service-get-iter
Family: vserver,cluster

---

### Syntax
```PowerShell
Get-NcNfsService [-Attributes <NfsInfo>] [-Query <NfsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNfsService [-Attributes <NfsInfo>] -Default [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNfsService -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

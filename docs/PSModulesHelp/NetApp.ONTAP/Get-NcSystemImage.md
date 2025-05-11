Get-NcSystemImage
-----------------

### Synopsis
Display software image information.

---

### Description

Display software image information.

---

### Related Links
* [Set-NcSystemImage](Set-NcSystemImage)

---

### Examples
> Example 1

```PowerShell
Get-NcSystemImage -Current
List the images currently running on the cluster nodes.

NcController       : 10.61.172.155
Name               : fas3070cluster01-01
Image              : image2
InstallTime        : 1305307946
InstallTimeDT      : 5/13/2011 5:32:26 PM
IsCurrent          : True
IsDefault          : True
KernelPath         : /cfcard/x86_64/freebsd/image2/kernel
Node               : fas3070cluster01-01
RootfsPath         : /cfcard/x86_64/freebsd/image2/rootfs.img
Version            : RollingRock__8.1.0
IsCurrentSpecified : True
IsDefaultSpecified : True

NcController       : 10.61.172.155
Name               : fas3070cluster01-02
Image              : image2
InstallTime        : 1305308410
InstallTimeDT      : 5/13/2011 5:40:10 PM
IsCurrent          : True
IsDefault          : True
KernelPath         : /cfcard/x86_64/freebsd/image2/kernel
Node               : fas3070cluster01-02
RootfsPath         : /cfcard/x86_64/freebsd/image2/rootfs.img
Version            : RollingRock__8.1.0
IsCurrentSpecified : True
IsDefaultSpecified : True

```

---

### Parameters
#### **Name**
The name of one or more nodes to query.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Node<br/>SystemName|

#### **Default**
Restrict results to default images.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[Switch]`|false   |named   |true (ByPropertyName)|IsDefault|

#### **Current**
Restrict results to current images.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[Switch]`|false   |named   |true (ByPropertyName)|IsCurrent|

#### **Attributes**
For improved scalability in large clusters, provide a SystemImageAttributes object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSystemImage -Template" to get the initially empty SystemImageAttributes object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SystemImageAttributes]`|false   |named   |false        |

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
Specify to get an empty SystemImageAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SystemImageAttributes object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSystemImage -Template" to get the initially empty SystemImageAttributes object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SystemImageAttributes]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.SystemImageAttributes

---

### Notes
Category: system
API: system-image-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSystemImage [[-Name] <String[]>] [-Default] [-Current] [-Attributes <SystemImageAttributes>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemImage -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcSystemImage -Query <SystemImageAttributes> [-Attributes <SystemImageAttributes>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

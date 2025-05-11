Set-NcSystemImage
-----------------

### Synopsis
Modify software image configuration.

---

### Description

Modify software image configuration.

---

### Related Links
* [Get-NcSystemImage](Get-NcSystemImage)

---

### Examples
> Example 1

```PowerShell
Set-NcSystemImage fas3070cluster01-01 image2 -Default
Set image 'image2' on node 'fas3070cluster01-01' to be the default.

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

```

---

### Parameters
#### **Name**
The name of the node to modify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Node   |

#### **Image**
The name of the image to modify.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Default**
Set the image to be the default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* DataONTAP.C.Types.System.SystemImageAttributes

---

### Notes
Category: system
API: system-image-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcSystemImage [-Name] <String> [-Image] <String> [-Default] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Set-NcCifsSymlink
-----------------

### Synopsis
Set a CIFS symbolic link path mapping parameters.

---

### Description

Set a CIFS symbolic link path mapping parameters.

---

### Related Links
* [Add-NcCifsSymlink](Add-NcCifsSymlink)

* [Get-NcCifsSymlink](Get-NcCifsSymlink)

* [Remove-NcCifsSymlink](Remove-NcCifsSymlink)

---

### Examples
> Example 1

Set-NcCifsSymlink /usr/cifs/ -CifsPath /cifsvol1/folder/
Set the CIFS path for the CIFS symlink with Unix Path /usr/cifs/.

CifsServer           ShareName            UnixPath                       CifsPath                       Locality
----------           ---------            --------                       --------                       --------
CIFS01               cifsvol1             /usr/cifs/                     /cifsvol1/folder/              local

---

### Parameters
#### **UnixPath**
The UNIX path prefix to be matched for the mapping of the CIFS symlink to modify.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **ShareName**
The CIFS share name on the destination CIFS server to which the symbolic link is mapped. This is a UTF-8 string and supports localization.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|false   |2       |true (ByPropertyName)|CifsShare<br/>Share|

#### **CifsPath**
The CIFS path on the destination to which the symbolic link maps.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **CifsServer**
The destination CIFS server name for the mapping to which the symbolic link is mapped. The default is the local CIFS server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Locality**
The CIFS symbolic link is a local link or wide link.  Possible values: "local", "widelink".

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **HomeDirectory**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsSymlink

---

### Notes
Category: cifs
API: cifs-symlink-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcCifsSymlink [-UnixPath] <String> [[-ShareName] <String>] [[-CifsPath] <String>] [-CifsServer <String>] [-Locality <String>] [-HomeDirectory] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

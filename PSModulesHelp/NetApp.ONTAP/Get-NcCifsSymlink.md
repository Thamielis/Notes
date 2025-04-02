Get-NcCifsSymlink
-----------------

### Synopsis
Get a list of CIFS symbolic link path mappings.

---

### Description

Get a list of CIFS symbolic link path mappings.

---

### Related Links
* [Add-NcCifsSymlink](Add-NcCifsSymlink)

* [Remove-NcCifsSymlink](Remove-NcCifsSymlink)

* [Set-NcCifsSymlink](Set-NcCifsSymlink)

---

### Examples
> Example 1

Get-NcCifsSymlink
Get all the CIFS symlinks on the current cluster or vserver.

CifsServer           ShareName            UnixPath                       CifsPath                       Locality
----------           ---------            --------                       --------                       --------
CIFS01               cifsvol1             /usr/user/                     /cifsvol1/user/                local

---

### Parameters
#### **CifsServer**
The destination CIFS server name for the mapping to which the symbolic link is mapped. The default is the local CIFS server.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Share**
The CIFS share name on the destination CIFS server to which the symbolic link is mapped. This is a UTF-8 string and supports localization.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |2       |true (ByPropertyName)|ShareName|

#### **UnixPath**
The UNIX path prefix to be matched for the mapping. If the prefix of the target path in the symbolic link matches against this field, this entry of symbolic link path mapping would be used. The path is a UTF-8 string and supports localization. The path must start and end with a forward slash ('/'). For example '/usr/local/'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Locality**
This field specifies whether the CIFS symbolic link is a local link or wide link. A local symbolic link maps to the local CIFS share, whereas a wide symbolic link maps to any CIFS share on the network. If the CIFS server matches the VServer's NetBIOS name then the default value is local otherwise widelink.  Possible values:
"local"     - Share On This VServer
"widelink"  - Share On Another CIFS Server

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsSymlink object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsSymlink -Template" to get the initially empty CifsSymlink object.  If not specified, all data is returned for each object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CifsSymlink]`|false   |named   |false        |

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
Specify to get an empty CifsSymlink object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsSymlink object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsSymlink -Template" to get the initially empty CifsSymlink object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CifsSymlink]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsSymlink

---

### Notes
Category: cifs
API: cifs-symlink-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsSymlink [[-CifsServer] <String[]>] [[-Share] <String[]>] [[-UnixPath] <String[]>] [[-Locality] <String[]>] [-Attributes <CifsSymlink>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsSymlink -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsSymlink -Query <CifsSymlink> [-Attributes <CifsSymlink>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

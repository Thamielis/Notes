Get-NcCifsShare
---------------

### Synopsis
Get a list of CIFS shares.

---

### Description

Get a list of CIFS shares.

---

### Related Links
* [Add-NcCifsShare](Add-NcCifsShare)

* [Remove-NcCifsShare](Remove-NcCifsShare)

* [Set-NcCifsShare](Set-NcCifsShare)

---

### Examples
> Example 1

Get-NcCifsShare
Get all of the CIFS shares on the current cluster or vserver.

CifsServer                ShareName       Path                                Comment
----------                ---------       ----                                -------
CIFS01                    admin$          /
CIFS01                    cifsvol1        /cifsvol1
CIFS01                    ipc$            /

> Example 2

$query = Get-NcCifsShare -Template
$query.ShareProperties = "browsable"
Get-NcCifsShare -Query $query
Get all the CIFS shares with the "browsable" share property.

CifsServer                 : CIFS01
ShareName                  : admin$
Acl                        :
AttributeCacheTtl          :
Comment                    :
DirUmask                   :
FileUmask                  :
Path                       : /
ShareProperties            : {browsable}
SymlinkProperties          :
AttributeCacheTtlSpecified : False
DirUmaskSpecified          : False
FileUmaskSpecified         : False

CifsServer                 : CIFS01
ShareName                  : cifsvol1
Acl                        : {Everyone / Full Control, Users / Read}
AttributeCacheTtl          :
Comment                    :
DirUmask                   :
FileUmask                  :
Path                       : /cifsvol1
ShareProperties            : {oplocks, browsable, changenotify}
SymlinkProperties          :
AttributeCacheTtlSpecified : False
DirUmaskSpecified          : False
FileUmaskSpecified         : False

CifsServer                 : CIFS01
ShareName                  : ipc$
Acl                        :
AttributeCacheTtl          :
Comment                    :
DirUmask                   :
FileUmask                  :
Path                       : /
ShareProperties            : {browsable}
SymlinkProperties          :
AttributeCacheTtlSpecified : False
DirUmaskSpecified          : False
FileUmaskSpecified         : False

---

### Parameters
#### **Name**
The name of one or more CIFS shares to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                |
|------------|--------|--------|---------------------|-----------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|CifsShare<br/>ShareName|

#### **CifsServer**
Restrict results to the specified CIFS server(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a CifsShare object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsShare -Template" to get the initially empty CifsShare object.  If not specified, all data is returned for each object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CifsShare]`|false   |named   |false        |

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
Specify to get an empty CifsShare object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsShare object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsShare -Template" to get the initially empty CifsShare object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CifsShare]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsShare

---

### Notes
Category: cifs
API: cifs-share-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsShare [[-Name] <String[]>] [[-CifsServer] <String[]>] [-VserverContext <String>] [-Attributes <CifsShare>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsShare [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsShare [-VserverContext <String>] -Query <CifsShare> [-Attributes <CifsShare>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

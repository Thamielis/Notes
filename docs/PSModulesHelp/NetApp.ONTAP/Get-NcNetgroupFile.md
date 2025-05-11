Get-NcNetgroupFile
------------------

### Synopsis
Get a list of netgroups file configurations.

---

### Description

Get a list of netgroups file configurations.

---

### Related Links
* [Remove-NcNetgroupFile](Remove-NcNetgroupFile)

---

### Examples
> Example 1

Get-NcNetgroupFile -Vserver pstk_cifs
Get netgroup information from pstk_cifs server

Vserver              Netgroup             Domain                         Host       User
-------              --------             ------                         ----       ----
pstk_cifs            trusted_hosts        -                              thor       -
pstk_cifs            trusted_hosts        -                              minerva    -
pstk_cifs            trusted_hosts        -                              adminhost  -
pstk_cifs            trusted_hosts        -                              zeus       -
pstk_cifs            untrusted_hosts      -                              grumpy     -
pstk_cifs            untrusted_hosts      -                              sneezy     -
pstk_cifs            untrusted_hosts      -                              sleepy     -
pstk_cifs            untrusted_hosts      -                              dopey      -

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[NetgroupsFileConfigInfo]`|false   |named   |false        |

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

#### **Vserver**
Specifies the Vserver for the local netgroup file

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|VserverName|

#### **NetgroupName**
Specifies the name of a netgroup within the Vserver's local netgroup file.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Netgroup|

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
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[NetgroupsFileConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Netgroup.NetgroupsFileConfigInfo

---

### Notes
Category: netgroup
API: netgroups-file-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetgroupFile [-Attributes <NetgroupsFileConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [[-Vserver] <String[]>] [[-NetgroupName] <String[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetgroupFile -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetgroupFile -Query <NetgroupsFileConfigInfo> [-Attributes <NetgroupsFileConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

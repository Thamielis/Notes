Set-NcVserverLoginBanner
------------------------

### Synopsis
Modify the login banner message.

---

### Description

Modify the login banner message. This message is displayed during SSH and console device login, just before the password prompt is, or would be, displayed. There is a cluster-wide default login banner that is used for every incoming connection regardless of LIF type. Each data Vserver can over-ride this default. To restore the default for a data Vserver, set the message to '-'.

---

### Related Links
* [Get-NcVserverLoginBanner](Get-NcVserverLoginBanner)

---

### Examples
> Example 1

```PowerShell
Set-NcVserverLoginBanner "Are you sure you want to log in to vserver 'pstk'?"
Set a login banner for the vserver you are currently connected to.

Vserver : pstk
Message : Are you sure you want to log in to vserver 'pstk'?

```
> Example 2

```PowerShell
Set-NcVserverLoginBanner "welcome to the vserver" pstk_san,pstk
Set the same login banner for multiple vservers

Vserver : pstk
Message : welcome to the vserver

Vserver : pstk_san
Message : welcome to the vserver

```
> Example 3

Set-NcVserverLoginBanner "This is the login banner" -Query $query
Using a query. The query object is created as
PS> $query = Set-NcVserverLoginBanner -Template
PS> $query.Vserver="pstk_san|pstk"

Vserver : pstk
Message : This is the login banner

Vserver : pstk_san
Message : This is the login banner

---

### Parameters
#### **Message**
The message you want to set.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |true (ByPropertyName)|Banner |

#### **SvmMessage**
The Message text. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ShowClusterMessage**
Specifies whether to show a cluster-level message. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **Vservers**
The name of one or more servers for which you want to set the login banner.

|Type        |Required|Position|PipelineInput        |Aliases                                |
|------------|--------|--------|---------------------|---------------------------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|Vserver<br/>VseverName<br/>VserverNames|

#### **ContinueOnFailure**
Specify to continue with the next matching vserver even when the operation fails for the current vserver. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
Can be used alongwith ContinueOnFailure to limit maximum number of acceptable failures. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Query**
Specify to query using a object with restricting fields set.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VserverLoginBannerInfo]`|true    |2       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverLoginBannerInfo

---

### Notes
Category: Vserver
API: vserver-login-banner-modify, vserver-login-banner-modify-iter,
Family: cluster, vserver

---

### Syntax
```PowerShell
Set-NcVserverLoginBanner [[-Message] <String>] [-SvmMessage <String>] [-ShowClusterMessage <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVserverLoginBanner [[-Message] <String>] [-Vservers] <String[]> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-SvmMessage <String>] [-ShowClusterMessage <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVserverLoginBanner [[-Message] <String>] [-Query] <VserverLoginBannerInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-SvmMessage <String>] [-ShowClusterMessage <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVserverLoginBanner [[-Message] <String>] [-Controller <NcController[]>] -Template [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

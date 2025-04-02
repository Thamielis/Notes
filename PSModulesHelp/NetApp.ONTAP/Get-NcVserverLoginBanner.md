Get-NcVserverLoginBanner
------------------------

### Synopsis
Return the specified login banner.

---

### Description

Return the specified login banner. This message is displayed during SSH and console device login, just before the password prompt is,  or would be, displayed. There is a cluster-wide default login banner that is used for every incoming connection regardless of  LIF type. 

Each data Vserver can over-ride this default.

---

### Related Links
* [Set-NcVserverLoginBanner](Set-NcVserverLoginBanner)

---

### Examples
> Example 1

```PowerShell
Get-NcVserverLoginBanner
Getting the login banner from all vservers

Vserver: pstk                         
Message: You are logging in to vserver 'pstk'

Vserver : pstk_san
Message : welcome to the vserver

```
> Example 2

```PowerShell
Get-NcVserverLoginBanner pstk_san
To get login banner of specific vservers

Vserver : pstk_san
Message : welcome to the vserver

```

---

### Parameters
#### **Vservers**
The name of one or more servers from which to retrive message of the day.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                                |
|------------|--------|--------|---------------------|---------------------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Vserver<br/>VseverName<br/>VserverNames|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VserverLoginBannerInfo]`|false   |named   |false        |

#### **Scope**
Specify the scope to fetch records supported by REST. Possible values: 'svm', 'cluster', 'all'. This parameter is supported with Rest only.
Valid Values:

* svm
* all
* cluster

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VserverLoginBannerInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverLoginBannerInfo

---

### Notes
Category: Vserver
API: vserver-login-banner-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVserverLoginBanner [[-Vservers] <String[]>] [-Attributes <VserverLoginBannerInfo>] [-VserverContext <String>] [-Scope <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverLoginBanner -Template [-VserverContext <String>] [-Scope <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverLoginBanner -Query <VserverLoginBannerInfo> [-Attributes <VserverLoginBannerInfo>] [-Scope <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

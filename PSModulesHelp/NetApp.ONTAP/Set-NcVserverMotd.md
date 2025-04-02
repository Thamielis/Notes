Set-NcVserverMotd
-----------------

### Synopsis
Modify the message of the day (MOTD).

---

### Description

Modify the message of the day (MOTD). This message appears just before the clustershell prompt. The cluster Admin Vserver message will appear, then if the user is logging in as a Data Vserveradmin, that Vserver's message will be printed.

---

### Related Links
* [Get-NcVserverMotd](Get-NcVserverMotd)

---

### Examples
> Example 1

```PowerShell
Set-NcVserverMotd "Hello World!"
Set MOTD for the vserver you are currently connected to.

Vserver                 : pstk
Message                 : Hello World!
                          
IsClusterMessageEnabled : True

```
> Example 2

```PowerShell
Set-NcVserverMotd "Hey there!!" -Vservers pstk,pstk_san
Setting MOTD for multiple vservers

Vserver                 : pstk
Message                 : Hey there!!
                          
IsClusterMessageEnabled : True

Vserver                 : pstk_san
Message                 : Hey there!!

```
> Example 3

```PowerShell
Set-NcVserverMotd "Message of the day!!" -Query $query IsClusterMessageEnabled $true
Setting MOTD through a query. Query object obtained as under
$query = Set-NcVserverMotd -Template
$query.Vserver = "pstk|pstk_san"

Vserver                 : pstk
Message                 : Message of the day!!
                          
IsClusterMessageEnabled : True

Vserver                 : pstk_san
Message                 : Message of the day!!
                          
IsClusterMessageEnabled : True

```

---

### Parameters
#### **Message**
The message you want to set.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **IsClusterMessageEnabled**
Set true to enable display of cluster message of the day for this vserver.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Banner**
Specifies Banner. This parameter is supported with Rest only.

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
The name of one or more servers for which you want to set the message of the day.

|Type        |Required|Position|PipelineInput        |Aliases                                |
|------------|--------|--------|---------------------|---------------------------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|Vserver<br/>VseverName<br/>VserverNames|

#### **ContinueOnFailure**
Specify to continue with the next matching vserver-motd even when the operation fails for the current vserver. This parameter is supported with Ontapi only.

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

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[VserverMotdInfo]`|true    |2       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverMotdInfo

---

### Notes
Category: Vserver
API: vserver-motd-modify, vserver-motd-modify-iter,
Family: cluster, vserver

---

### Syntax
```PowerShell
Set-NcVserverMotd [[-Message] <String>] [-IsClusterMessageEnabled <Boolean>] [-Banner <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVserverMotd [[-Message] <String>] [-IsClusterMessageEnabled <Boolean>] [-Vservers] <String[]> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Banner <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVserverMotd [[-Message] <String>] [-IsClusterMessageEnabled <Boolean>] [-Query] <VserverMotdInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVserverMotd [[-Message] <String>] [-IsClusterMessageEnabled <Boolean>] [-Controller <NcController[]>] -Template [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

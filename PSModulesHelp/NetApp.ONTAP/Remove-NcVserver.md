Remove-NcVserver
----------------

### Synopsis
Destroys a vserver and its objects.

---

### Description

Destroys a vserver and its objects.  All volumes and mirrors belonging to the vserver must be deleted using other cmdlets before destroying the vserver.  This cmdlet removes all other objects of this vserver including its network interfaces, routes, configurations, admin login accounts and roles.

---

### Related Links
* [Get-NcVserver](Get-NcVserver)

---

### Examples
> Example 1

```PowerShell
Stop-NcVserver vserver4
Set-NcVol -Offline vserver4vol0 -vs vserver4
Remove-NcVol vserver4vol0 -vs vserver4
Remove-NcVserver vserver4
Destroy vserver 'vserver4'.
```

---

### Parameters
#### **Name**
Name of the vserver to destroy.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|VserverName|

#### **Async**
Specify to perform vserver creation asynchronously.
This operation is supported only in ONTAP 8.4 and later. If this parameter is specified against an unsupported controller, the cmdlet will throw an 'Invalid Argument' error.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: vserver
API: vserver-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcVserver [-Name] <String> [-Async] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```

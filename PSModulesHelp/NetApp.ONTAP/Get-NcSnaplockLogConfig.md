Get-NcSnaplockLogConfig
-----------------------

### Synopsis
Display SnapLock audit Log configuration.

---

### Description

Display SnapLock audit Log configuration.

---

### Related Links
* [New-NcSnaplockLogConfig](New-NcSnaplockLogConfig)

* [Set-NcSnaplockLogConfig](Set-NcSnaplockLogConfig)

* [Remove-NcSnaplockLogConfig](Remove-NcSnaplockLogConfig)

---

### Examples
> Example 1

```PowerShell
Get-NcSnaplockLogConfig
Gets the SnapLock Audit Log Configuration for all vservers where configuration has been done

DefaultRetentionPeriod : 6 months

MaxLogSize             : 1048576

NcController           : 10.63.1.234

Volume                 : locked

Vserver                : primary1

```

---

### Parameters
#### **Vserver**
Name of the vserver(s) for which information is to be returned.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SnaplockVserverLogConfig]`|false   |named   |false        |

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
Can be used to obtain an empty attribute element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SnaplockVserverLogConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snaplock.SnaplockVserverLogConfig

---

### Notes
Category: snaplock
API: snaplock-get-vserver-log-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSnaplockLogConfig [[-Vserver] <String[]>] [-Attributes <SnaplockVserverLogConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnaplockLogConfig -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnaplockLogConfig -Query <SnaplockVserverLogConfig> [-Attributes <SnaplockVserverLogConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Get-NcOption
------------

### Synopsis
Get a list of options.

---

### Description

Get a list of options.

---

### Related Links
* [Set-NcOption](Set-NcOption)

* [Update-NcOption](Update-NcOption)

---

### Examples
> Example 1

Get-NcOption backup.log.enable
Get the value of 'backup.log.enable' for each vserver.

Vserver     Name               Value
-------     ----               -----
Cerebus-03  backup.log.enable  on
Cerebus-04  backup.log.enable  on
Cerebus-05  backup.log.enable  on
Cerebus-06  backup.log.enable  on

---

### Parameters
#### **Name**
The name of one or more options to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|OptionNames|

#### **Vserver**
Restrict results to the specified vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Hashtable**
Specify to get all values in a hashtable instead of separate objects.  Because options must be specified by name and vserver, this parameter is only supported when this cmdlet is directed to a vserver.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |HT     |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a OptionInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcOption -Template" to get the initially empty OptionInfo object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[OptionInfo]`|false   |named   |false        |

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

#### **Query**
For advanced queries, provide an OptionInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcOption -Template" to get the initially empty OptionInfo object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[OptionInfo]`|true    |named   |false        |

#### **Template**
Specify to get an empty OptionInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Options.OptionInfo

---

### Notes
Category: options
API: options-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcOption [[-Name] <String[]>] [-Vserver <String[]>] [-Hashtable] [-VserverContext <String>] [-Attributes <OptionInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcOption [-Hashtable] [-VserverContext <String>] -Query <OptionInfo> [-Attributes <OptionInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcOption [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

Get-NcEmsConfig
---------------

### Synopsis
Get the EMS Configuration.

---

### Description

Get the EMS Configuration.

---

### Related Links
* [Set-NcEmsConfig](Set-NcEmsConfig)

---

### Examples
> Example 1

```PowerShell
Get-NcEmsConfig
Get the EMS config for the current cluster.

Console                      : True
ConsoleLogLevel              : node_fault
MailFrom                     : admin@localhost
MailServer                   : localhost
MaxLogShowSize               : 2048
MaxTargetEventBytes          : 262144
MaxTargetLogSize             : 5242880
Suppression                  : True
TraceLogSize                 : 2048

```

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide an EmsConfigInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcEmsConfig -Template" to get the initially empty EmsConfigInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[EmsConfigInfo]`|false   |1       |true (ByPropertyName)|

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
Specify to get an empty EmsConfigInfo object for use with advanced queries involving the Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsConfigInfo

---

### Notes
Category: ems
API: ems-config-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsConfig [[-Attributes] <EmsConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsConfig [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```

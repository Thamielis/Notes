Set-NcClusterHaMode
-------------------

### Synopsis
Enable or disable the high-availability (HA) for this node.

---

### Description

Enable or disable the high-availability (HA) for this node. A reboot of the node is required for the HA mode to become effective.

Note that changing the mode to non_ha (by specifying the -Disable switch) requires disabling the takeover facility first, by calling Disable-NcClusterHA.

---

### Related Links
* [Enable-NcClusterHA](Enable-NcClusterHA)

* [Disable-NcClusterHA](Disable-NcClusterHA)

* [Restart-NcNode](Restart-NcNode)

* [Restart-NcNodePowerCycle](Restart-NcNodePowerCycle)

---

### Examples
> Example 1

Set-NcClusterHaMode aparajir-vsim1 -Enable
Sets the node aparajir-vsim1 to "ha" mode

Enabling HA
Are you sure you want to enable HA on node aparajir-vsim1?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y
WARNING: The mode change will take effect only after a re-boot. Please re-boot now using Restart-NcController

---

### Parameters
#### **Node**
Name of the node for which High Availability mode is being set

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Enable**
Specify to set the mode to "ha". After HA is enabled, giveback and and takeover are available.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |2       |true (ByPropertyName)|

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

#### **Disable**
Specify to set mode to "non_ha". Note that changing the mode to non_ha requires disabling the takeover facility by calling Disable-NcClusterHA.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |2       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: cf
API: cf-mode-set
Family: cluster

---

### Syntax
```PowerShell
Set-NcClusterHaMode [-Node] <String> [-Controller <NcController[]>] [-Enable] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcClusterHaMode [-Node] <String> [-Controller <NcController[]>] [-Disable] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

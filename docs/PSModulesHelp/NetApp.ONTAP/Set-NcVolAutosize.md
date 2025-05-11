Set-NcVolAutosize
-----------------

### Synopsis
Given the name of a flexible volume, set the autosize settings.

---

### Description

Given the name of a flexible volume, set the autosize settings.

---

### Related Links
* [Get-NcVolAutosize](Get-NcVolAutosize)

---

### Examples
> Example 1

Set-NcVolAutosize vol2 -Enabled -MaximumSize 200g -IncrementSize 1g | Get-NcVolAutosize
Configure the autosize settings for volume 'vol2' and display the result.

Name                      IsEnabled IncrementSize MaximumSize
----                      --------- ------------- -----------
vol2                        True           1.0 GB    200.0 GB

> Example 2

Get-NcVolAutosize vol1 | Set-NcVolAutosize vol2 | Get-NcVolAutosize
Get the autosize settings from volume 'vol1' and copy those to volume 'vol2' and display the result.

Name                      IsEnabled IncrementSize MaximumSize
----                      --------- ------------- -----------
vol2                        True         100.0 MB     20.0 GB

---

### Parameters
#### **Name**
The name of the flexible volume for which we want to set autosize.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **MinimumSize**
The flexible volume's minimum allowed size using the following format
<number>[k|m|g|t]
The amount is the absolute size to set. The optional trailing 'k', 'm', 'g', and 't' indicates the desired units, namely 'kilobytes', 'megabytes', 'gigabytes', and 'terabytes' (respectively).  If the trailing unit character doesn't appear, then <number> is interpreted as the number of bytes desired. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |named   |false        |Min<br/>MinSize|

#### **GrowThresholdPercent**
The percentage of the flexible volume's capacity at which autogrow is initiated. The default grow threshold varies from 85% to 98%, depending on the volume size. It is an error for the grow threshold to be less than or equal to the shrink threshold. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ShrinkThresholdPercent**
Specifies the percentage of the flexible volume's capacity at which autoshrink is initiated. The default shrink threshold is 50%. It is an error for the shrink threshold to be greater than or equal to the grow threshold. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **MaximumSize**
Specify the flexible volume's maximum allowed size using the following format
<number>[k|m|g|t]
The amount is the absolute size to set. The optional trailing 'k', 'm', 'g', and 't' indicates the desired units, namely 'kilobytes', 'megabytes', 'gigabytes', and 'terabytes' (respectively).  If the trailing unit character doesn't appear, then <number> is interpreted as the number of bytes desired. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |2       |false        |Max<br/>MaxSize|

#### **IncrementSize**
Specify the flexible volume's increment size using the following format
<number>[k|m|g|t]
The amount is the absolute size to set. The optional trailing 'k', 'm', 'g', and 't' indicates the desired units, namely 'kilobytes', 'megabytes', 'gigabytes', and 'terabytes' (respectively).  If the trailing unit character doesn't appear, then <number> is interpreted as the number of bytes desired.

|Type      |Required|Position|PipelineInput|Aliases                      |
|----------|--------|--------|-------------|-----------------------------|
|`[String]`|false   |3       |false        |Inc<br/>IncSize<br/>Increment|

#### **Enabled**
Specify to enable the volume autosize feature. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Disabled**
Specify to disable the volume autosize feature. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Mode**
Specify the flexible volume's autosize mode of operation.  Valid values are "grow", "grow_shrink", and "off".  The default mode is "off". This parameter is supported with Ontapi only.
Valid Values:

* grow
* grow_shrink
* off

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Reset**
Set the value of Enabled, MaximumSize, IncrementSize, MinimumSize, GrowThresholdPercent, ShrinkThresholdPercent, and Mode to their default values. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AutosizeInfo**
This parameter accepts the output of Get-NcVolAutosize, as needed for pipelined invocations. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[Autosize]`|true    |named   |true (ByValue)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: volume
API: volume-autosize-set
Family: vserver

---

### Syntax
```PowerShell
Set-NcVolAutosize [-Name] <String> [-MinimumSize <String>] [-GrowThresholdPercent <Int32>] [-ShrinkThresholdPercent <Int32>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[[-MaximumSize] <String>] [[-IncrementSize] <String>] [-Enabled] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Set-NcVolAutosize [-Name] <String> [-MinimumSize <String>] [-GrowThresholdPercent <Int32>] [-ShrinkThresholdPercent <Int32>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[[-MaximumSize] <String>] [[-IncrementSize] <String>] [-Disabled] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVolAutosize [-Name] <String> -Mode <String> [-MinimumSize <String>] [-GrowThresholdPercent <Int32>] [-ShrinkThresholdPercent <Int32>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [[-MaximumSize] <String>] [[-IncrementSize] <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVolAutosize [-Name] <String> -Reset [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVolAutosize [-Name] <String> [-VserverContext <String>] [-Controller <NcController[]>] -AutosizeInfo <Autosize> [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

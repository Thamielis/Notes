Add-VBRTapeGFSMediaPool
-----------------------

### Synopsis
Creates a new GFS media pool.

---

### Description

This cmdlet creates a new GFS media pool. The media sets are created with default settings. Run the New-VBRTapeGFSMediaSetPolicy cmdlet to set other options for media sets.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

* [Get-VBREncryptionKey](Get-VBREncryptionKey)

* [New-VBRTapeGFSMediaSetPolicy](New-VBRTapeGFSMediaSetPolicy)

---

### Examples
> Example 1 Creating GFS Media Pool with Default Settings and Custom Retention Periods

$library = Get-VBRTapeLibrary -Name "HP MSL G3 Series 9.50"
$encryption = Get-VBREncryptionKey -Description "Veeam Administrator"
Add-VBRTapeGFSMediaPool -Name "GFS Media Pool" -Library $library -MoveFromFreePool -EnableEncryption -EncryptionKey $encryption -DailyOverwritePeriod 30 -WeeklyOverwritePeriod 8 -MonthlyOverwritePeriod 12 -QuarterlyOverwritePeriod 8 -YearlyOverwritePeriod 5
This example shows how to create a GFS media pool with default settings and customized retention periods.
Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value. Save the result to the $library variable.
2. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save the result it to the $encryption variable.
3. Run the Add-VBRTapeGFSMediaPool cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $library variable as the Library parameter value.
- Provide the MoveFromFreePool parameter.
- Provide the EnableEncryption parameter.
- Set the $encryption variable as the EncryptionKey parameter value.
- To define retention settings, provide the DailyOverwritePeriod, WeeklyOverwritePeriod, MonthlyOverwritePeriod, QuarterlyOverwritePeriod, YearlyOverwritePeriod parameter values.

---

### Parameters
#### **DailyMediaSetPolicy**
Specifies settings for the daily media set. Accepts the VBRTapeGFSMediaSetPolicy object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRTapeGFSMediaSetPolicy]`|false   |named   |False        |

#### **DailyOverwritePeriod**
Indicates the data retention period for the daily media set (days).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies the description for the created media pool. If not set, Veeam will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableEncryption**
Enables data encryption for data archived to tape. Use the EncryptionKey or KMSServer parameter to specify the encryption key you want to use to encrypt the data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableMultiStreaming**
Indicates that the media pool can use several drives simultaneously. Use the NumberOfStreams parameter to set the maximum number of drives that can be used. Use the SplitJobFilesBetweenDrives parameter to indicate if the multistreaming will be used to split data between tape jobs or between source backup jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
Used to set the encryption key for the EnableEncryption parameter.  Specifies the encryption key you want to use to encrypt the data.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **KMSServer**
Used to set the encryption key for the EnableEncryption parameter if you use the KMS Server for encryption. Specifies the KMS Server you want to use to encrypt the data. Accepts the VBRKMSServer object. To get this object, run the Get-VBRKMSServer cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **Library**
Specifies the array of tape libraries. The media pool will use tapes from these libraries. For tape library failover, use NextLibOffline, NextLibDrivesBusy and/or NextLibNoMedia parameters to manage the failover events. Veeam will switch to the next library in order they are added to the VBRTapeLibrary object. Accepts the VBRTapeLibrary object, GUID or string.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Medium**
Specifies the array of tapes. The cmdlet will add these tapes to the media pool. Accepts the VBRTapeMedium  object, GUID or string.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRTapeMedium[]]`|false   |named   |False        |

#### **MonthlyMediaSetPolicy**
Indicates settings for the monthly media set. Accepts the VBRTapeGFSMediaSetPolicy object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRTapeGFSMediaSetPolicy]`|false   |named   |False        |

#### **MonthlyOverwritePeriod**
Indicates the data retention period for the monthly media set (months).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MoveFromFreePool**
Defines that the media pool will be replenished by tapes from the Free media pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the media pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **NextLibDrivesBusy**
Defines that the media pool will switch to the next library if the primary library has no available drives. Default: true. To disable this option, set the parameter value to $false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NextLibNoMedia**
Defines that the media pool will switch to the next library if the primary library has no available media. Default: true. To disable this option, set the parameter value to $false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NextLibOffline**
Defines that the media pool will switch to the next library if the primary library is offline. Default: true. To disable this option, set the parameter value to $false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NumberOfStreams**
Used to set value for the EnableMultiStreaming parameter. Indicates the maximum number of drives that the media pool can use. Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **QuarterlyMediaSetPolicy**
Specifies settings for the quarterly media set. Accepts the VBRTapeGFSMediaSetPolicy object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRTapeGFSMediaSetPolicy]`|false   |named   |False        |

#### **QuarterlyOverwritePeriod**
Indicates the data retention period for the quarterly media set (months).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SplitJobFilesBetweenDrives**
Defines that one tape job will use multiple drives to write data. Drives will process source backup jobs one by one. Default: one drive is used for one tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WeeklyMediaSetPolicy**
Specifies settings for the weekly media set. Accepts the VBRTapeGFSMediaSetPolicy object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRTapeGFSMediaSetPolicy]`|false   |named   |False        |

#### **WeeklyOverwritePeriod**
Indicates the data retention period for the weekly media set (weeks).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **WORM**
Defines that the cmdlet will add the WORM Media Pool. NOTE: you cannot set retention policy when the WORM parameter is set to true. Default: false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **YearlyMediaSetPolicy**
Specifies settings for the yearly media set. Accepts the VBRTapeGFSMediaSetPolicy object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRTapeGFSMediaSetPolicy]`|false   |named   |False        |

#### **YearlyOverwritePeriod**
Indicates the data retention period for the yearly media set (years).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeLibrary[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRTapeGFSMediaPool [-DailyMediaSetPolicy <VBRTapeGFSMediaSetPolicy>] [-DailyOverwritePeriod <Int32>] [-Description <String>] [-EnableEncryption] [-EnableMultiStreaming] [-EncryptionKey <VBREncryptionKey>] 
```
```PowerShell
[-KMSServer <VBRKMSServer>] -Library <VBRTapeLibrary[]> [-Medium <VBRTapeMedium[]>] [-MonthlyMediaSetPolicy <VBRTapeGFSMediaSetPolicy>] [-MonthlyOverwritePeriod <Int32>] [-MoveFromFreePool] -Name <String> 
```
```PowerShell
[-NextLibDrivesBusy] [-NextLibNoMedia] [-NextLibOffline] [-NumberOfStreams <Int32>] [-QuarterlyMediaSetPolicy <VBRTapeGFSMediaSetPolicy>] [-QuarterlyOverwritePeriod <Int32>] [-SplitJobFilesBetweenDrives] 
```
```PowerShell
[-WeeklyMediaSetPolicy <VBRTapeGFSMediaSetPolicy>] [-WeeklyOverwritePeriod <Int32>] [-WORM] [-YearlyMediaSetPolicy <VBRTapeGFSMediaSetPolicy>] [-YearlyOverwritePeriod <Int32>] [<CommonParameters>]
```

Add-VBRTapeMediaPool
--------------------

### Synopsis
Creates a new media pool.

---

### Description

This cmdlet creates a new custom media pool. Run the Add-VBRTapeGFSMediaPool cmdlet to create a GFS media pool.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

* [Get-VBRTapeMedium](Get-VBRTapeMedium)

* [Get-VBRTapeVault](Get-VBRTapeVault)

* [Get-VBREncryptionKey](Get-VBREncryptionKey)

* [New-VBRTapeMediaPoolRetentionPolicy](New-VBRTapeMediaPoolRetentionPolicy)

* [New-VBRTapeMediaSetCreationPolicy](New-VBRTapeMediaSetCreationPolicy)

---

### Examples
> Example 1 Creating Media Pool with Default Settings

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Add-VBRTapeMediaPool -Name "Monthly Full Backups" -MoveFromFreePool
This example shows how to create a media pool with default settings.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter values.
2. Pipe the cmdlet output to the Add-VBRTapeMediaPool cmdlet. Specify the Name parameter values. Provide the MoveFromFreePool parameter.
> Example 2 Creating Media Pool with Specific Settings

$mediasetpolicy = New-VBRTapeMediaSetCreationPolicy -Type Always
$retentionpolicy = New-VBRTapeMediaPoolRetentionPolicy -Type Cyclic
$library = Get-VBRTapeLibrary -Name "Sydney_Tape_Server"
$media = Get-VBRTapeMedium -Name "00110001"
$vault = Get-VBRTapeVault -Name "Sydney Remote Storage"
$securepassword = Get-VBREncryptionKey -Description "Veeam Administrator"
Add-VBRTapeMediaPool -Name "AD Backups Encrypted" -Description "Active Directory Encrypted Backups" -Library $library -Medium $media -MoveOfflineToVault -Vault $vault -EnableEncryption -EncryptionKey $securepassword -MediaSetCreationPolicy $mediasetpolicy -MediaSetName "AD Daily %date%" -RetentionPolicy $retentionpolicy
This example shows how to create a media pool with the following settings:
- Offline tape are moved to vault.
- Data on tape is encrypted.
Perform the following steps:
1. Run the New-VBRTapeMediaSetCreationPolicy cmdlet. Set the Always option for the Type parameter. Save the result to the $mediasetpolicy variable.
2. Run the New-VBRTapeMediaPoolRetentionPolicy cmdlet. Set the Cyclic option for the Type parameter. Save the result to the $retentionpolicy variable.
3. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value. Save the result to the $library variable.
4. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $media variable.
5. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value. Save the result to the $vault variable.
6. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save the result to the $securepassword variable.
7. Run the Add-VBRTapeMediaPool cmdlet. Specify the following settings:
- Specify the Name and the Description parameter values.
- Set the $library variable as the Library parameter value.
- Set the $media variable as the Medium parameter value.
- Provide the MoveOfflineToVault parameter.
- Set the $vault variable as the Vault parameter value.
- Provide the EnableEncryption parameter.
- Set the $securepassword variable as the EncryptionKey parameter value.
- Set the $mediasetpolicy variable as the MediaSetCreationPolicy parameter value.
- Specify the MediaSetName parameter value.
- Set the $retentionpolicy variable as the RetentionPolicy parameter value.

---

### Parameters
#### **Description**
Specifies the description for the created media pool. If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableEncryption**
Enables encryption for the data archived to tape. Use the EncryptionKey or KMSServer parameters to specify the encryption key you want to use to encrypt the data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableMultiStreaming**
Enables the media pool to use several drives simultaneously. Use the NumberOfStreams parameter to set the maximum number of drives that can be used. Use the SplitJobFilesBetweenDrives parameter to indicate if the multistreaming will be used to split data between tape jobs or between source backup jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
Used to set the encryption key for the EnableEncryption parameter.  Specifies the encryption key you want to use to encrypt the data.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **KMSServer**
Used to set the encryption key for the EnableEncryption parameter if you use the KMS Server for encryption. Specifies the KMS Server you want to use to encrypt the data. Accepts the VBRKMSServer object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **Library**
Specifies the array of tape libraries. The media pool will use tapes from these libraries. For tape library failover, use NextLibOffline, NextLibDrivesBusy and/or NextLibNoMedia parameters to manage the failover events. Veeam will switch to the next library in order they are added to the VBRTapeLibrary object. Accepts the VBRTapeLibrary object, GUID or string.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **MediaSetCreationPolicy**
Specifies the settings of media set you want to apply to this media pool. If omitted, the media creation policy will be set to 'Never' by default. Accepts VBRTapeMediaSetCreationPolicy object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRTapeMediaSetCreationPolicy]`|false   |named   |False        |

#### **MediaSetName**
Specifies the new name you want to assign to the media sets created in this media pool. If omitted, the media set name will be set to "Media set %date%" by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Medium**
Specifies the array of tapes. The cmdlet will add these tapes to the media pool. Accepts the VBRTapeMedium[] object, GUID or string type.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRTapeMedium[]]`|false   |named   |False        |

#### **MoveFromFreePool**
Defines that the media pool will be replenished by tapes from the Free media pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MoveOfflineToVault**
Defines that the tapes that go offline must be automatically moved to a vault.  Use the Vault parameter to specify the vault to which you want to move the tapes from this media pool.

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
Used to set value for the EnableMultiStreaming parameter. Specifies the maximum number of drives that the media pool can use. Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies the retention settings you want to apply to this media pool. If omitted, the media set name will be set to 'Never' by default. Accepts VBRTapeMediaPoolRetentionPolicy object. Note: This parameter will not work in case you use the WORM parameter.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRTapeMediaPoolRetentionPolicy]`|false   |named   |False        |

#### **SplitJobFilesBetweenDrives**
Defines that one tape job will use multiple drives to write data. Drives will process source backup jobs one by one. Default: one drive is used for one tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Vault**
Used to set vault for the MoveOfflineToVault parameter. Specifies the vault to which you want to automatically move the tapes. You can use one vault for several media pools. Accepts the VBRTapeVault object, GUID or string.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRTapeVault]`|false   |named   |False        |

#### **WORM**
Defines that the cmdlet will add the WORM Media Pool. NOTE: you cannot set retention policy when the WORM parameter is set to true. Default: false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Add-VBRTapeMediaPool [-Description <String>] [-EnableEncryption] [-EnableMultiStreaming] [-EncryptionKey <VBREncryptionKey>] [-KMSServer <VBRKMSServer>] -Library <VBRTapeLibrary[]> [-MediaSetCreationPolicy 
```
```PowerShell
<VBRTapeMediaSetCreationPolicy>] [-MediaSetName <String>] [-Medium <VBRTapeMedium[]>] [-MoveFromFreePool] [-MoveOfflineToVault] -Name <String> [-NextLibDrivesBusy] [-NextLibNoMedia] [-NextLibOffline] 
```
```PowerShell
[-NumberOfStreams <Int32>] [-RetentionPolicy <VBRTapeMediaPoolRetentionPolicy>] [-SplitJobFilesBetweenDrives] [-Vault <VBRTapeVault>] [-WORM] [<CommonParameters>]
```

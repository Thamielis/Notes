Set-VBRTapeMediaPool
--------------------

### Synopsis
Modifies media pool.

---

### Description

This cmdlet modifies media pool that was created before.

To modify settings, specify new values for the necessary parameters.  The cmdlet will overwrite the previous parameter values with new values.  The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

* [Get-VBRTapeMedium](Get-VBRTapeMedium)

* [Get-VBRTapeVault](Get-VBRTapeVault)

* [Get-VBREncryptionKey](Get-VBREncryptionKey)

* [New-VBRTapeMediaPoolRetentionPolicy](New-VBRTapeMediaPoolRetentionPolicy)

* [New-VBRTapeMediaSetCreationPolicy](New-VBRTapeMediaSetCreationPolicy)

---

### Examples
> Example 1 Modifying Media Pool to Move Offline Tapes to Vault

$mediapool = Get-VBRTapeMediaPool -Name "File Backup Media Pool"
$library = Get-VBRTapeLibrary -Name "Sydney_Tape_Server"
$vault = Get-VBRTapeVault -Name "Sydney Remote Storage"
Set-VBRTapeMediaPool -MediaPool $mediapool -Library $library -MoveOfflineToVault -Vault $vault
This example shows how to instruct a selected media pool to move the offline tapes to a tape vault.

Perform the following steps:
1. Run Get-VBRTapeMediaPool to get the media pool. Save it to the $mediapool variable.
2. Run Get-VBRTapeLibrary to get the library. Save it to the $library variable.
3. Run Get-VBRTapeVault to get the target vault. Save it to the $vault variable.
4. Run the Set-VBRTapeMediaPool cmdlet. Specify the following settings:
- Set the $mediapool variable as the MediaPool parameter value.
- Set the $library variable as the Library parameter value.
- Provide the MoveOfflineToVault parameter.
- Set the $vault variable as the Vault parameter value.
> Example 2 Adding Encryption Settings to Media Pool

$mediapool = Get-VBRTapeMediaPool -Name "File Backup Media Pool"
$library = Get-VBRTapeLibrary -Name "Sydney_Tape_Server"
$encryptionkey = Get-VBREncryptionKey -Description "Veeam Administrator"
Set-VBRTapeMediaPool -MediaPool $mediapool -Library $library -EnableEncryption -EncryptionKey $encryptionkey
This example shows how to add encryption settings to a selected media pool.

Perform the following steps:
1. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save it to the $mediapool variable.
2. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value. Save it to the $library variable.
3. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save it to the $encryptionkey variable.
4. Run the Set-VBRTapeMediaPool cmdlet. Specify the following settings:
- Set the $mediapool variable as the MediaPool parameter value.
- Set the $library variable as the Library parameter value.
- Provide the EnableEncryption parameter.
- Set the $encryptionkey variable as the EncryptionKey parameter value.

---

### Parameters
#### **Description**
Specifies the description for the media pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableEncryption**
Enables data encryption for data archived to tape. Use the EncryptionKey or KMSServer parameter to specify the encryption key you want to use to encrypt the data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableMultiStreaming**
Defines that the media pool can use several drives simultaneously. Use the NumberOfStreams parameter to set the maximum number of drives that can be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
Used to set the encryption key for the EnableEncryption parameter. Specifies the encryption key you want to use to encrypt the data. Accepts the VBREncryptionKey object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **KMSServer**
Used to set the encryption key for the EnableEncryption parameter if you use the KMS Server for encryption. Specifies the KMS Server you want to use to encrypt the data. Accepts the VBRKMSServer object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **Library**
Specifies the array of tape libraries whose tapes will be used in this media pool. Use the NextLibOffline, NextLibDrivesBusy and/or NextLibNoMedia parameters to manage the libraries. Veeam Backup & Replication will switch to the ne?t library in order they are added to the VBRTapeLibrary object. Accepts the VBRTapeLibrary object, GUID or string.

|Type                |Required|Position|PipelineInput        |
|--------------------|--------|--------|---------------------|
|`[VBRTapeLibrary[]]`|true    |named   |True (ByPropertyName)|

#### **MediaPool**
Specifies the media pool you want to modify. Accepts the VBRTapeMediaPool object. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRTapeMediaPool]`|true    |named   |True (ByPropertyName, ByValue)|

#### **MediaSetCreationPolicy**
Specifies the settings of media set you want to apply to this media pool. If omitted, the media creation policy will be set to 'Never' by default. Accepts the VBRTapeMediaSetCreationPolicy object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRTapeMediaSetCreationPolicy]`|false   |named   |False        |

#### **MediaSetName**
Specifies the new name you want to assign to the media sets created in this media pool. If omitted, the media set name will be set to "Media set %date%" by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Medium**
Specifies the array of tapes you want to add to the media pool. Accepts the VBRTapeMedium[] object. To get this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRTapeMedium[]]`|false   |named   |False        |

#### **Mode**
Specifies the tape media pool mode. You can set either of the following modes:
* Paralleling: if you set this mode, the tape job will use drives in all libraries parallelly.
* Failover: if you set this mode, the tape job will use the first library in the list to write data. Other libraries from this media pool will be passive and will be used for failover.
Valid Values:

* Paralleling
* Failover

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **MoveFromFreePool**
Defines if new tapes will be allocated from the Free media pool when needed. If you provide this parameter, the media pool will be replenished by tapes from the Free media pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MoveOfflineToVault**
Defines that the tapes that go offline must be automatically moved to a vault. Use the Vault parameter to specify the vault to which you want to move the tapes from this media pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the new name you want to assign to the media pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Used to set value for the EnableMultiStreaming parameter. Defines the maximum number of drives that the media pool can use. Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies the retention settings you want to apply to this media pool. If omitted, the media set name will be set to 'Never' by default. Accepts the VBRTapeMediaPoolRetentionPolicy object. To create this object, run the New-VBRTapeMediaPoolRetentionPolicy cmdlet.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRTapeMediaPoolRetentionPolicy]`|false   |named   |False        |

#### **SplitJobFilesBetweenDrives**
Defines that the backup files within one backup set will be written with several drives to several tapes. Otherwise, one tape job will use one drive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Vault**
Used to set vault for the MoveOfflineToVault parameter. Specifies the vault to which you want to automatically move the tapes. You can use one vault for several media pools. Accepts the VBRTapeVault object. To get this object, run the Get-VBRTapeVault cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRTapeVault]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeMediaPool

Veeam.Backup.PowerShell.Infos.VBRTapeLibrary[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRTapeMediaPool [-Description <String>] [-EnableEncryption] [-EnableMultiStreaming] [-EncryptionKey <VBREncryptionKey>] [-KMSServer <VBRKMSServer>] -Library <VBRTapeLibrary[]> -MediaPool <VBRTapeMediaPool> 
```
```PowerShell
[-MediaSetCreationPolicy <VBRTapeMediaSetCreationPolicy>] [-MediaSetName <String>] [-Medium <VBRTapeMedium[]>] [-Mode {Paralleling | Failover}] [-MoveFromFreePool] [-MoveOfflineToVault] [-Name <String>] 
```
```PowerShell
[-NextLibDrivesBusy] [-NextLibNoMedia] [-NextLibOffline] [-NumberOfStreams <Int32>] [-PassThru] [-RetentionPolicy <VBRTapeMediaPoolRetentionPolicy>] [-SplitJobFilesBetweenDrives] [-Vault <VBRTapeVault>] 
```
```PowerShell
[<CommonParameters>]
```

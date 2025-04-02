Start-VBRTapeRestoreAllContent
------------------------------

### Synopsis
Starts restoring all content of the specified tapes.

---

### Description

This cmdlet starts restoring all content of the specified tapes.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Restoring all Tape Content

$tape = Get-VBRTapeMedium -Name "0021000C"
Start-VBRTapeRestoreAllContent -TapeMedium $tape -Server "qa10.tech.local" -Path "C:\Restored Backup\Tapes" -AddDependentMediumAutomatically -Security
This example shows how to start a tape job for restoring all content of the tape with the following settings:
- The tape restore job will process data that is stored on the 0021000C tape and all dependent tapes. Dependent tapes will be found and added to the job automatically.
- The tape restore job will restore the entire tape content to qa10.tech.local server and will store it at C:\Restored Backup\Tapes path.
- The tape restore job will apply security settings of the original content to the restored content.
- The copy job will run with the enabled hardware compression option.
Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Start-VBRTapeRestoreAllContent cmdlet. Specify the following settings:
- Set the $tape variable as the TapeMedium parameter value.
- Specify the Server parameter value.
- Specify the Path parameter value.
- Provide the AddDependentMediumAutomatically parameter.
- Provide the Security parameter.

---

### Parameters
#### **AddDependentMediumAutomatically**
Defines that the cmdlet will automatically add tapes that are dependent on the media added to tape restore job. If you do not provide this parameter and you have dependent tapes, the cmdlet will not be able to copy files written to dependent tapes and will return a warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DependentTapeMedium**
Specifies an array of dependent tapes. The cmdlet will add this array of dependent tapes to the entire tape restore job. When a backup file does not fit on one tape, it is divided into parts and written to several tapes. These tapes are considered dependent. Note: If you do not specify the DependentTapeMedium and SkipDependencyCheck parameters, but dependent media exist, you will get a warning. If you want to restore all content of the the tapes included into the tape restore job including file parts stored on dependent tapes, confirm addition of the missing dependent tapes to the job. If dependent tapes are unavailable, for example, they are physically destroyed, you can try to restore data stored only on the specified tapes. In this case, do not confirm addition of dependent tapes to the job. Accepts the VBRTapeMedium object. To get this object, run the Get-VBRTapeCopyDependentMedium cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRTapeMedium[]]`|false   |named   |False        |

#### **Path**
Specifies the path to the folder. The cmdlet will restore the content of the tapes to this folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Security**
Defines that the files will be restored with the original security settings. Otherwise the file/folder security settings will be inherited from the parent item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the target server. The cmdlet will restore the content of the tapes to this server. Accepts the CHost object. To create this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **SkipDependencyCheck**
Defines that the existence of dependent tapes is not checked. Note: If you do not specify the DependentTapeMedium and SkipDependencyCheck parameters, but dependent media exist, you will get a warning. If you want to restore all content of the the tapes included into the tape restore job including file parts stored on dependent tapes, confirm addition of the missing dependent tapes to the job. If dependent tapes are unavailable, for example, they are physically destroyed, you can try to restore data stored only on the specified tapes. In this case, do not confirm addition of dependent tapes to the job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TapeMedium**
Specifies an array of tapes. The cmdlet will add this array of tapes to the tape restore job. Accepts the VBRTapeMedium[] object. To get this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRTapeMedium[]]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRTapeRestoreAllContent [-AddDependentMediumAutomatically] [-DependentTapeMedium <VBRTapeMedium[]>] -Path <String> [-RunAsync] [-Security] -Server <CHost> [-SkipDependencyCheck] -TapeMedium 
```
```PowerShell
<VBRTapeMedium[]> [<CommonParameters>]
```

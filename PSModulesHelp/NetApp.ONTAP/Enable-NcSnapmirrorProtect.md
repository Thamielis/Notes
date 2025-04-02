Enable-NcSnapmirrorProtect
--------------------------

### Synopsis
The snapmirror-protect API protects the specified Vserver or a  list of volumes. The snapmirror-protect API must be used from the destination cluster. It is supported for FlexVol, FlexGroup and  Vserver endpoints. It is not supported for FlexGroup constituents, Infinite Volumes, Infinite Volume constituents, AltaVault, or SolidFire endpoints. This API is available in ONTAP 9.3 and later.
in ONTAP 9.4 and later, this API supports protecting FlexGroup endpoints.in ONTAP 9.7 and later, this API  supports protecting Vserver endpoints. A job will be spawned to operate on the snapmirror and the job id will be returned. The progress of the job can be tracked using the job APIs.

---

### Description

The snapmirror-protect API protects the specified Vserver or a  list of volumes. The snapmirror-protect API must be used from the destination cluster. It is supported for FlexVol, FlexGroup and  Vserver endpoints. It is not supported for FlexGroup constituents, Infinite Volumes, Infinite Volume constituents, AltaVault, or SolidFire endpoints. This API is available in ONTAP 9.3 and later.
in ONTAP 9.4 and later, this API supports protecting FlexGroup endpoints.in ONTAP 9.7 and later, this API  supports protecting Vserver endpoints. A job will be spawned to operate on the snapmirror and the job id will be returned. The progress of the job can be tracked using the job APIs.

---

### Examples
> Example 1

```PowerShell
PS C:> Enable-NcSnapmirrorProtect -Policy DPDefault -PathList vs1:vol5
ResultErrorCode          :
ResultErrorMessage       :
ResultJobid              : 134
ResultStatus             : in_progress
NcController             : 172.26.80.23
APIStatus                : passed
Errno                    : 0
FailureReason            :
ResultErrorCodeSpecified : False
ResultJobidSpecified     : True

```

---

### Parameters
#### **Policy**
Specifies the name of the SnapMirror policy for the SnapMirror relationships.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **PathList**
Specifies the list of source volume paths to be protected.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **Schedule**
Specifies the name of the cron schedule for the SnapMirror relationships.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AutoInitialize**
Specifies whether or not an initialize should be started after each SnapMirror relationship is created.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **DestinationVolumePrefix**
Specifies the destination volume name prefix.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DestinationVolumeSuffix**
Specifies the destination volume name suffix.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DestinationVserver**
Specifies the destination Vserver to be used for protection.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DestinationPath**
Specifies the destination Path to be used for protection.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CreateDestination**
Use this object to provision the destination endpoint when establishing a SnapMirror relationship for a FlexVol volume, FlexGroup volume, SVM, Consistency Group or ONTAP S3 Bucket. This parameter is supported with Rest only.

|Type                                                     |Required|Position|PipelineInput        |
|---------------------------------------------------------|--------|--------|---------------------|
|`[NetApp.Ontapi.Filer.C.Snapmirror930.CreateDestination]`|false   |named   |true (ByPropertyName)|

#### **Destination**
Specifies the Destination endpoint of a SnapMirror relationship. This parameter is supported with Rest only.

|Type                                               |Required|Position|PipelineInput        |
|---------------------------------------------------|--------|--------|---------------------|
|`[NetApp.Ontapi.Filer.C.Snapmirror930.Destination]`|false   |named   |true (ByPropertyName)|

#### **Source**
Specifies the Source endpoint of a SnapMirror relationship. This parameter is supported with Rest only.

|Type                                          |Required|Position|PipelineInput        |
|----------------------------------------------|--------|--------|---------------------|
|`[NetApp.Ontapi.Filer.C.Snapmirror930.Source]`|false   |named   |true (ByPropertyName)|

#### **TransferSchedule**
Schedule used to update asynchronous relationships. This \"transfer_schedule\" overrides the \"transfer_schedule\" set on the SnapMirror relationship's policy. To remove the \"transfer_schedule\", set its value to null (no-quotes).. This parameter is supported with Rest only.

|Type                                                    |Required|Position|PipelineInput        |
|--------------------------------------------------------|--------|--------|---------------------|
|`[NetApp.Ontapi.Filer.C.Snapmirror930.TransferSchedule]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
* DataONTAP.C.Types.Snapmirror.String

---

### Notes
Category: snapmirror
API:  snapmirror-protect
Family: cluster, vserver

---

### Syntax
```PowerShell
Enable-NcSnapmirrorProtect [-Policy] <String> [-PathList] <String[]> [-Schedule <String>] [-AutoInitialize <Boolean>] [-DestinationVolumePrefix <String>] [-DestinationVolumeSuffix <String>] 
```
```PowerShell
[-DestinationVserver <String>] [-DestinationPath <String>] [-CreateDestination <NetApp.Ontapi.Filer.C.Snapmirror930.CreateDestination>] [-Destination 
```
```PowerShell
<NetApp.Ontapi.Filer.C.Snapmirror930.Destination>] [-Source <NetApp.Ontapi.Filer.C.Snapmirror930.Source>] [-TransferSchedule <NetApp.Ontapi.Filer.C.Snapmirror930.TransferSchedule>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

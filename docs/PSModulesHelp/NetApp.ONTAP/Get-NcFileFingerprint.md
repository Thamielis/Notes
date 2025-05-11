Get-NcFileFingerprint
---------------------

### Synopsis
Get the fingerprint information for a file.

---

### Description

Returns the fingerprint information for a file. The SessionID must be specified when using this cmdlet.

The SessionID of the fingerprint operation is returned when a fingerprint operation is started using the Start-NcFileFingerprint API. If the fingerprint operation is complete, this cmdlet will also show the complete fingerprint information for the file.

---

### Related Links
* [Start-NcFileFingerprint](Start-NcFileFingerprint)

* [Stop-NcFileFingerprint](Stop-NcFileFingerprint)

* [Get-NcFileFingerprintStatus](Get-NcFileFingerprintStatus)

---

### Examples
> Example 1

```PowerShell
Get-NcFileFingerprint 16908291
Get the fingerprint from session 16908291

AggregateUuid                          : df073407-9317-4c87-acee-9f051a7596a4
FileMetadata                           : DataONTAP.C.Types.File.FileFingerprintInfo
FilerId                                : 525562cb-e80f-11e4-b4e6-71bbfdb77764
FilerName                              : aparajir-vsim1
FingerprintAlgorithm                   : sha256
FingerprintEndTime                     : 1450351659
FingerprintInputPath                   : /vol/aparajir_vol1/f1
FingerprintScope                       : data_and_metadata
FingerprintStartTime                   : 1450351659
FingerprintVersion                     : 3
FormattedFingerprintEndTime            : Thu Dec 17 11:27:39 GMT 2015
FormattedFingerprintStartTime          : Thu Dec 17 11:27:39 GMT 2015
FormattedSnaplockSystemComplianceClock : Thu Dec 17 11:04:01 GMT 2015
FormattedSnaplockVolumeComplianceClock :
FormattedVolumeExpiryDate              :
IsVolumeExpiryDateWraparound           :
MetadataFiles                          :
NcController                           : 10.63.1.232
SessionId                              : 16908291
SnaplockLicense                        : compliance_and_enterprise
SnaplockSystemComplianceClock          : 1450350241
SnaplockVolumeComplianceClock          :
VolumeContainingAggregate              : aggr1
VolumeDsid                             : 1066
VolumeExpiryDate                       :
VolumeMsid                             : 2147484714
VolumeName                             : aparajir_vol1
VolumeSnaplockType                     :
VolumeType                             :
VolumeUuid                             :
VserverId                              : 24461b7f-e813-11e4-a9eb-0050569c1653
VserverName                            : primary1
FingerprintEndTimeSpecified            : True
FingerprintStartTimeSpecified          : True
IsVolumeExpiryDateWraparoundSpecified  : False
SessionIdSpecified                     : True
SnaplockSystemComplianceClockSpecified : True
SnaplockVolumeComplianceClockSpecified : False
VolumeDsidSpecified                    : True
VolumeExpiryDateSpecified              : False
VolumeMsidSpecified                    : True

```

---

### Parameters
#### **SessionId**
The unique identifier for the fingerprint operation.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |1       |true (ByPropertyName)|

#### **DesiredAttributes**
Specify top filter output fields.

|Type               |Required|Position|PipelineInput        |Aliases   |
|-------------------|--------|--------|---------------------|----------|
|`[FingerprintInfo]`|false   |2       |true (ByPropertyName)|Attributes|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.File.FingerprintInfo

---

### Notes
Category: file
API: file-fingerprint-dump
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcFileFingerprint [-SessionId] <Int64> [[-DesiredAttributes] <FingerprintInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

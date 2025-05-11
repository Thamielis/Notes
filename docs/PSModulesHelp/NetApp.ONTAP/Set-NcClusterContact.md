Set-NcClusterContact
--------------------

### Synopsis
Modifies the contact information

---

### Description

Modifies the contact information

---

### Related Links
* [Get-NcCluster](Get-NcCluster)

* [Get-NcCluster](Get-NcCluster)

* [Set-NcCluster](Set-NcCluster)

---

### Examples
> Example 1

```PowerShell
Set-NcClusterContact -PrimaryName "Aparajita Raychaudhury" -BusinessName "NetApp" -BusinessAddress "Bangalore"
Set some fields of contact information

Address           : Bangalore
BusinessName      : NetApp
City              : 
Country           : 
NcController      : 10.238.49.117
PrimaryAltPhone   : 
PrimaryEmail      : ""
PrimaryName       : Aparajita Raychaudhury
PrimaryPhone      : 
SecondaryAltPhone : 
SecondaryEmail    : 
SecondaryName     : 
SecondaryPhone    : 
State             : 
ZipCode           :

```

---

### Parameters
#### **PrimaryName**
The name of Primary Contact

|Type      |Required|Position|PipelineInput        |Aliases                           |
|----------|--------|--------|---------------------|----------------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|ContactName<br/>PrimaryContactName|

#### **PrimaryPhone**
The primary phone Number of Primary Contact

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|Phone<br/>PrimaryContactPhone|

#### **PrimaryAltPhone**
The alternate phone Number of Primary Contact

|Type      |Required|Position|PipelineInput        |Aliases                                                                                |
|----------|--------|--------|---------------------|---------------------------------------------------------------------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|AltPhone<br/>AlternatePhone<br/>PrimaryContactAlternatePhone<br/>PrimaryContactAltPhone|

#### **PrimaryEmail**
Email Address or User ID of Primary Contact

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|Email<br/>PrimaryContactEmail|

#### **SecondaryName**
The name of Secondary Contact

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|false   |named   |true (ByPropertyName)|SecondaryContactName|

#### **SecondaryPhone**
The primary phone number of secondary contact

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|SecondaryContactPhone|

#### **SecondaryAltPhone**
The alternate phone number of secondary contact

|Type      |Required|Position|PipelineInput        |Aliases                                                    |
|----------|--------|--------|---------------------|-----------------------------------------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|SecondaryContactAlternatePhone<br/>SecondaryContactAltPhone|

#### **SecondaryEmail**
Email Address or User ID of Secondary Contact

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|SecondaryContactEmail|

#### **BusinessName**
Business Name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Address**
Business Address

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|false   |named   |true (ByPropertyName)|BusinessAddress|

#### **City**
City where business is located.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|false   |named   |true (ByPropertyName)|BusinessCity|

#### **State**
State where business is located.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |named   |true (ByPropertyName)|BusinessState|

#### **Country**
Country where business is located.

|Type      |Required|Position|PipelineInput        |Aliases                                                |
|----------|--------|--------|---------------------|-------------------------------------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|CountryCode<br/>BusinessCountry<br/>BusinessCountryCode|

#### **ZipCode**
Postal Code Where Business Resides

|Type      |Required|Position|PipelineInput        |Aliases                                        |
|----------|--------|--------|---------------------|-----------------------------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|PinCode<br/>BusinessZipCode<br/>BusinessPinCode|

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
* DataONTAP.C.Types.Cluster.ClusterContact

---

### Notes
Category: cluster
API: cluster-contact-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcClusterContact [-PrimaryName <String>] [-PrimaryPhone <String>] [-PrimaryAltPhone <String>] [-PrimaryEmail <String>] [-SecondaryName <String>] [-SecondaryPhone <String>] 
```
```PowerShell
[-SecondaryAltPhone <String>] [-SecondaryEmail <String>] [-BusinessName <String>] [-Address <String>] [-City <String>] [-State <String>] [-Country <String>] [-ZipCode <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

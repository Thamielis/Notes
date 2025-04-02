Initialize-NcObjectProperty
---------------------------

### Synopsis
Set one or more properties on Toolkit objects.

---

### Description

Set one or more properties on Toolkit objects.

A best practice for using the Toolkit is not to directly instantiate any of the types returned by Toolkit cmdlets.  However, some of the advanced queries and object manipulation features of clustered Data ONTAP require sending these types back to the controller.

To support these features, the Toolkit provides means of creating the needed objects and selectively filling in some or all of their properties.  Value properties, such as strings and integers, may be set directly.  But embedded reference types should be created using this cmdlet.

---

### Related Links
* [Get-NcVol](Get-NcVol)

---

### Examples
> Example 1

$q = Get-NcVol -Template
Initialize-NcObjectProperty $q VolumeIdAttributes
$q.VolumeIdAttributes.Name = "vol1|vol2"
$q.VolumeIdAttributes.OwningVserverName = "vserver1"
$a = Get-NcVol -Template
Initialize-NcObjectProperty $a VolumeIdAttributes
$a.VolumeIdAttributes.Comment = "Database volumes"
Update-NcVol -Query $q -Attributes $a
Using this cmdlet and others, execute an advanced query to set the comment field on multiple volumes.

NcController : 10.61.172.155
SuccessCount : 2
FailureCount : 0
SuccessList  : {vol1, vol2}
FailureList  : {}

---

### Parameters
#### **Object**
The object to modify.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Name**
The name of one or more properties to set.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Count**
If the named field is an array, specify Count to fill the array with that number of objects.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **All**
Specify to initialize all reference-type properties in the object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Recurse**
Specify to fill in not only the named property, but all nested objects as well.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
If specified, the modified object is written back to the pipeline.

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

---

### Inputs

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Initialize-NcObjectProperty [-Object] <Object> [[-Name] <String[]>] [[-Count] <Int32>] [-All] [-Recurse] [-PassThru] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [<CommonParameters>]
```

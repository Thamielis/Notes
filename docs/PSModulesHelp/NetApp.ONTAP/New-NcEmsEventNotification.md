New-NcEmsEventNotification
--------------------------

### Synopsis
Create an event notification

---

### Description

Create an event notification. This cmdlet returns a non persistent ID assigned to the newly created notification. This can be used to update/delete the notification. 

Note: This ID is non-persistent and will be changed every time a previously created notification is deleted.

---

### Related Links
* [Remove-NcEmsEventNotification](Remove-NcEmsEventNotification)

* [Get-NcEmsEventNotification](Get-NcEmsEventNotification)

* [Update-NcEmsEventNotification](Update-NcEmsEventNotification)

---

### Examples
> Example 1

```PowerShell
New-NcEmsEventNotification -FilterName testFilter -Destinations testDest
Creates notification with ID 3, sent to testDest and generated using event filter testFilter

3

```

---

### Parameters
#### **FilterName**
Name of the event filter, using which notification is to be created.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Destinations**
The destinations for the event notification

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

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
* [Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32)

---

### Notes
Category: ems
API: ems-event-notification-create
Family: cluster

---

### Syntax
```PowerShell
New-NcEmsEventNotification [-FilterName] <String> [-Destinations] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```

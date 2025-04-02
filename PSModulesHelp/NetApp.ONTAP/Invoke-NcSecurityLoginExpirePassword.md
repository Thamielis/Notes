Invoke-NcSecurityLoginExpirePassword
------------------------------------

### Synopsis
If the user has a password enabled, this API will cause it to immediately expire. Current login sessions will still remain available

---

### Description

If the user has a password enabled, this API will cause it to immediately expire. Current login sessions will still remain available

---

### Examples
> Example 1

```PowerShell
Invoke-NcSecurityLoginExpirePassword -Vserver vs1 -UserName sapanj
Makes the password for user sapanj to expire

ErrorCode          :
ErrorMessage       :
NcController       : 10.238.73.251
SecurityKey        : DataONTAP.C.Types.Security.SecurityLoginPasswordUserInfo
ErrorCodeSpecified : False

```

---

### Parameters
#### **Vserver**
Name of the Vserver.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

#### **UserName**
Name of the user whose password need to be expired.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**
This input element is useful when multiple security objects match a given query. If set to true, the API will continue with the next matching security even when the operation fails for the security. If set to false, the API will return on the first failure.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
When allowing failures ('continue-on-failure' is set to true), then this input element may be provided to limit the number of failed operations before the server gives up and returns. If set, the API will continue with the next matching security even when the operation on a previous matching security fails, and do so until the total number of objects failed to be operated on reaches the maximum specified. If set to the maximum or not provided, then there will be no limit on the number of failed operations. Only applicable if 'continue-on-failure' is set to true.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **Query**
If operating on a specific security, this input element must specify all keys. If operating on security objects based on query, this input element must specify a query.

|Type                             |Required|Position|PipelineInput        |
|---------------------------------|--------|--------|---------------------|
|`[SecurityLoginPasswordUserInfo]`|true    |1       |true (ByPropertyName)|

#### **Template**
Specify to get an empty SecurityLoginPasswordUserInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityLoginAccountInfo

---

### Notes
Category: security
API: security-login-expire-password-iter
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcSecurityLoginExpirePassword [-Vserver] <String[]> [-UserName] <String[]> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSecurityLoginExpirePassword [-Query] <SecurityLoginPasswordUserInfo> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSecurityLoginExpirePassword [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```

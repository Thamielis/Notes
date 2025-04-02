Get-NaControllerError
---------------------

### Synopsis
Get a description of a Data ONTAP error code.

---

### Description

Get a description of a Data ONTAP error code.  A specific error may be retrieved by numerical code or by its shorthand name, both of which are normally returned by Data ONTAP if an API error occurs.  Specify neither to get a listing of all defined error codes.

---

### Examples
> Example 1

```PowerShell
Get-NaControllerError 1004
Look up a Data ONTAP error code by number.

Name        : ENOPARTNERIFC
Code        : 1004
Description : Partner interface configured does not exist on partner.

```
> Example 2

```PowerShell
Get-NaControllerError EQUOTADIRECTIVE
Look up a Data ONTAP error code by name.

Name        : EQUOTADIRECTIVE
Code        : 13054
Description : Cannot process quota directives in /etc/quotas.

```

---

### Parameters
#### **Code**
The numerical error code returned by Data ONTAP.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Int32]`|false   |1       |true (ByValue, ByPropertyName)|

#### **Name**
An error name returned by Data ONTAP, such as 'EDEST_IS_LS_VOLUME2'.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.Types.Toolkit.Utils.ControllerErrorInfo

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Get-NaControllerError [[-Code] <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NaControllerError [-Name] <String> [<CommonParameters>]
```

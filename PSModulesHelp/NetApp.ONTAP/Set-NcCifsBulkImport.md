Set-NcCifsBulkImport
--------------------

### Synopsis
Loads CIFS local users,groups and group memberships file from the specified URI

---

### Description

Upload the status of the bulk-import of the specified SVM to the specified URI.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcCifsBulkImport](Get-NcCifsBulkImport)

* [Add-NcCifsBulkImport](Add-NcCifsBulkImport)

---

### Examples
> Example 1

```PowerShell
Set-NcCifsBulkImport -Path http://nbsweb.eng.btc.netapp.in/u/st/web/LUG_Import/Vserver1/user5.7z  -VserverContext vs0
NcController     : 10.234.75.101
    Svm              : vs0
    State            : failed
    DetailedStatus   : Failed processing line 2 of the input file. Reason: The domain name that qualifies local users and local groups must match the CIFS server name.
    ImportUri        : http://nbsweb.eng.btc.netapp.in/u/st/web/LUG_Import/Vserver1/user5.7z
    ElementsImported : 0
    ElementsIgnored  : 0

```

---

### Parameters
#### **VserverContext**
Name of vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |VS     |

#### **Path**
URI to which the status needs to be uploaded"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **UserName**
UserName of the specified URI.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |1       |true (ByPropertyName)|

#### **Password**
Password of the specified URI.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |2       |true (ByPropertyName)|

#### **Credential**
Credential of the specified URI.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|false   |3       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsBulkImport

---

### Notes
Category: Cifs
Api: /protocols/cifs/users-and-groups/bulk-import/svm.uuid
Family: Vserver

---

### Syntax
```PowerShell
Set-NcCifsBulkImport -VserverContext <String> [-Path] <String> [<CommonParameters>]
```

Add-NcCifsBulkImport
--------------------

### Synopsis
Loads CIFS local users,groups and group memberships file from the specified URI

---

### Description

Loads CIFS local users,groups and group memberships file from the specified URI.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcCifsBulkImport](Get-NcCifsBulkImport)

* [Set-NcCifsBulkImport](Set-NcCifsBulkImport)

---

### Examples
> Example 1

```PowerShell
Add-NcCifsBulkImport -Path http://nbsweb.eng.btc.netapp.in/u/st/web/LUG_Import/Vserver1/user5.7z  -DecryptionPassword netapp -VserverContext vs0
```

---

### Parameters
#### **VserverContext**
Name of vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |VS     |

#### **Path**
URI from which to load the input file containing the CIFS local users and groups. The file must be encrypted using the 7zip utility. URI can be FTP or HTTP

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **DecryptionPassword**
Password to decrypt the compressed file

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **UserName**
UserName of the specified URI.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |2       |true (ByPropertyName)|

#### **Password**
Password of the specified URI.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |3       |true (ByPropertyName)|

#### **Credential**
credential required for Specified URL.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|false   |4       |true (ByPropertyName)|

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
Add-NcCifsBulkImport -VserverContext <String> [-Path] <String> [-DecryptionPassword] <String> [<CommonParameters>]
```

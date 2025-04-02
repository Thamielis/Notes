Get-NcCifsBulkImport
--------------------

### Synopsis
Retrieves information about the import operation status of the CIFS local users, groups, and group membership.

---

### Description

Retrieves information about the import operation status of the CIFS local users, groups, and group membership. This cmdlet is supported with Rest

---

### Related Links
* [Add-NcCifsBulkImport](Add-NcCifsBulkImport)

* [Set-NcCifsBulkImport](Set-NcCifsBulkImport)

---

### Examples
> Example 1

```PowerShell
Get-NcCifsBulkImport -VserverContext vs0
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
Name of the Vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |true         |VS     |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsBulkImport

---

### Notes
Category: Cifs
Api: /api/protocols/cifs/users-and-groups/bulk-import/svm.uuid
Family: Vserver

---

### Syntax
```PowerShell
Get-NcCifsBulkImport -VserverContext <String> [<CommonParameters>]
```

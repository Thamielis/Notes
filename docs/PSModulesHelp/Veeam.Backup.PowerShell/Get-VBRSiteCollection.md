Get-VBRSiteCollection
---------------------

### Synopsis
Returns an array of site collections for Microsoft SharePoint.

---

### Description

This cmdlet returns an array of site collections for Microsoft SharePoint.

---

### Related Links
* [Get-VBRApplicationRestorePoint](Get-VBRApplicationRestorePoint)

---

### Examples
> Example 1

```PowerShell
$spoint = Get-VBRApplicationRestorePoint -SharePoint -Name "Sharepoint server"
Get-VBRSiteCollection -RestorePoint $spoint
This example shows how to get an array of Microsoft SharePoint site collections.   1. Run Get-VBRApplicationRestorePoint to get the restore point. Save the result to the $spoint variable.   2. Run Get-VBRSiteCollection with the $session variable.
```

---

### Parameters
#### **RestorePoint**
Specifies a restore session. The cmdlet will return the information about the Microsoft SharePoint site collections, added to the specifies restore session. Accepts the VBRApplicationRestorePoint type.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRApplicationRestorePoint[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRApplicationRestorePoint[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRSiteCollection -RestorePoint <VBRApplicationRestorePoint[]> [<CommonParameters>]
```

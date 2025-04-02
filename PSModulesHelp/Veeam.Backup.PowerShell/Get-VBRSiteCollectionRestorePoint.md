Get-VBRSiteCollectionRestorePoint
---------------------------------

### Synopsis
Returns restore points of backed-up VMs with Microsoft SQL databases for the specified Microsoft SharePoint site collection.

---

### Description

This cmdlet returns restore points of backed-up VMs with Microsoft SQL databases for the specified Microsoft SharePoint site collection.

---

### Related Links
* [Get-VBRApplicationRestorePoint](Get-VBRApplicationRestorePoint)

* [Get-VBRSiteCollection](Get-VBRSiteCollection)

---

### Examples
> Getting all Restore Points of VMs with Microsoft SQL Ddatabases for Microsoft SharePoint Site Collections

$restorepoint = Get-VBRApplicationRestorePoint -SharePoint -Name "Sharepoint server"
$site = Get-VBRSiteCollection -RestorePoint $restorepoint
Get-VBRSiteCollectionRestorePoint -SiteCollection $site
This example shows how to get all restore points of backed-up VMs with Microsoft SQL databases for the Sharepoint server SharePoint site collection

Perform the following steps:

1. Run the Get-VBRApplicationRestorePoint cmdlet. Provide the SharePoint and specify the Name parameter values. Save the result to the $restorepoint variable.   2. Run the Get-VBRSiteCollection cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $site variable.   3. Run the Get-VBRSiteCollectionRestorePoint cmdlet. Set the $site variable as the SiteCollection parameter value.

---

### Parameters
#### **SiteCollection**
Specifies a site collection for Microsoft SharePoint. The cmdlet will return restore points of backed-up VMs with Microsoft SQL databases for these site collections.
Accepts the SiteCollection object. To get this object, run the Get-VBRSiteCollection cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRSiteCollection]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRSiteCollectionRestorePoint -SiteCollection <VBRSiteCollection> [<CommonParameters>]
```

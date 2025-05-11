Remove-VBRNutanixHost
---------------------

### Synopsis
Removes Nutanix Files storage systems from the backup infrastructure.

---

### Description

This cmdlet removes a Nutanix Files storage system from the backup infrastructure. Note that the storage itself is not removed.

---

### Related Links
* [Get-VBRNutanixHost](Get-VBRNutanixHost)

---

### Examples
> Example 1

$host = Get-VBRNutanixHost -Name "Nutanix Files_host"
Remove-VBRNutanixHost -Host $host
This example shows how to modify the port number of Nutanix Files Storage Systems.

Perform the following steps:
1.	Run the Get-VBRNutanixHost cmdlet to create a credential object. Specify the Name parameter value. Save the result to the $host variable.
2.	Run the Remove-VBRNutanixHost cmdlet. Set the $host variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies the storage system that you want to remove.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CNutanixHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Nutanix.CNutanixHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRNutanixHost -Host <CNutanixHost> [<CommonParameters>]
```

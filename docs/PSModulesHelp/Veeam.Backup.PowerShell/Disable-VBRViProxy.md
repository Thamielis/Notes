Disable-VBRViProxy
------------------

### Synopsis
Disables a VMware backup proxy.

---

### Description

This cmdlet allows you to temporarily disable a VMware backup proxy. The disabled proxy is not used by any job.
Run the Enable-VBRViProxy cmdlet to enable a VMware backup proxy.

---

### Related Links
* [Get-VBRViProxy](Get-VBRViProxy)

---

### Examples
> Example 1. Disabling VMware Backup Proxy [Using Pipeline]

Get-VBRViProxy -Name "VMware Backup Proxy 01" | Disable-VBRViProxy
This example shows how to disable the VMware backup proxy named VMware Backup Proxy 01.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Disable-VBRViProxy cmdlet.
> Example 2. Disabling VMware Backup Proxy [Using Variable]

$proxy = Get-VBRViProxy -Name "Local Backup Proxy"
Disable-VBRViProxy -Proxy $proxy
This example shows how to disable the VMware backup proxy named Local Backup Proxy.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Disable-VBRViProxy cmdlet. Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **Proxy**
Specifies an array of VMware proxies you want to disable.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CViProxy[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CViProxy[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRViProxy -Proxy <CViProxy[]> [<CommonParameters>]
```

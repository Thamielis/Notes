Enable-VBRViProxy
-----------------

### Synopsis
Enables a disabled VMware backup proxy.

---

### Description

This cmdlet allows you to enable a VMware backup proxy.
Run the Disable-VBRViProxy cmdlet to disable a VMware backup proxy.

---

### Related Links
* [Get-VBRViProxy](Get-VBRViProxy)

---

### Examples
> Example 1. Enabling VMware Backup Proxy [Using Pipeline]

Get-VBRViProxy -Name "VMware Backup Proxy 01" | Enable-VBRViProxy
This example shows how to enable the VMware backup proxy named VMware Backup Proxy 01.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Enable-VBRViProxy cmdlet.
> Example 2. Enabling VMware Backup Proxy [Using Variable]

$proxy = Get-VBRViProxy -Name "Local Backup Proxy"
Enable-VBRViProxy -Proxy $proxy
This example shows how to enable the VMware backup proxy named Local Backup Repository.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Enable-VBRViProxy cmdlet. Set the $proxy variable as the Proxy parameter value

---

### Parameters
#### **Proxy**
Specifies an array of VMware proxies you want to enable.

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
Enable-VBRViProxy -Proxy <CViProxy[]> [<CommonParameters>]
```

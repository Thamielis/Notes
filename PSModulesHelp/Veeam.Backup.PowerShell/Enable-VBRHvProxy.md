Enable-VBRHvProxy
-----------------

### Synopsis
Enables the disabled Hyper-V backup proxy.

---

### Description

This cmdlet enables the disabled Hyper-V backup proxy.
Run the Disable-VBRHvProxy cmdlet to disable the Hyper-V backup proxy.

---

### Related Links
* [Get-VBRHvProxy](Get-VBRHvProxy)

---

### Examples
> Example 1. Enabling Hyper-V Backup Proxy [Using Pipeline]

Get-VBRHvProxy -Name "VMware Backup Proxy 01" | Enable-VBRHvProxy
This example shows how to enable the Hyper-V backup proxy named VMware Backup Proxy 01.
Perform the following steps:
1. Run the Get-VBRHvProxy cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Enable-VBRHvProxy cmdlet.
> Example 2. Enabling Hyper-V Backup Proxy [Using Variable]

$proxy = Get-VBRHvProxy -Name "Local Backup Proxy"
Enable-VBRHvProxy -Proxy $proxy
This example shows how to enable the Hyper-V backup proxy named Local Backup Proxy.
Perform the following steps:
1. Run the Get-VBRHvProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Enable-VBRHvProxy cmdlet. Set the $proxy variable as the Proxy parameter value

---

### Parameters
#### **Proxy**
Specifies an array of Hyper-V proxies you want to enable.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CHvProxy[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CHvProxy[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRHvProxy -Proxy <CHvProxy[]> [<CommonParameters>]
```

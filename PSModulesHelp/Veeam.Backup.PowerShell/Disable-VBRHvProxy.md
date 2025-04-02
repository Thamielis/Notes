Disable-VBRHvProxy
------------------

### Synopsis
Disables a Hyper-V backup proxy.

---

### Description

This cmdlet allows you to disable the Hyper-V backup proxy. The disabled proxy is not used by any job.
Run the Enable-VBRHvProxy cmdlet to enable the Hyper-V backup proxy.

---

### Related Links
* [Get-VBRHvProxy](Get-VBRHvProxy)

---

### Examples
> Example 1. Disabling Hyper-V Backup Proxy [Using Pipeline]

Get-VBRHvProxy -Name "Hyper-V Backup Proxy 01" | Disable-VBRHvProxy
This example shows how to disable the Hyper-V backup proxy named Hyper-V Backup Proxy 01.
Perform the following steps:
1. Run the Get-VBRHvProxy cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Disable-VBRHvProxy cmdlet.
> Example 2. Disabling Hyper-V Backup Proxy [Using Variable]

$proxy = Get-VBRHvProxy -Name "Local Backup Proxy"
Disable-VBRHvProxy -Proxy $proxy
This example shows how to disable the Hyper-V backup proxy named Local Backup Proxy.
Perform the following steps:
1. Run the Get-VBRHvProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Disable-VBRHvProxy cmdlet. Set the $proxy variable as the Proxy parameter value

---

### Parameters
#### **Proxy**
Specifies an array of the Hyper-V proxies you want to disable.

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
Disable-VBRHvProxy -Proxy <CHvProxy[]> [<CommonParameters>]
```

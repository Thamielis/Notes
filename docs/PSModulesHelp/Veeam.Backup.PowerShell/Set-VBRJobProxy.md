Set-VBRJobProxy
---------------

### Synopsis
Modifies settings of a backup proxy.

---

### Description

This cmdlet modifies settings of a backup proxy.
You can run this cmdlet with backup jobs and replica jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.
IMPORTANT!
If you want to set a custom proxy, make sure that the proxy server is added to the backup infrastructure console, otherwise you will not be able to assign it to the job. The custom proxy server must be configured appropriately. For more information on proxy server settings, see Adding VMware Backup Proxies section in the Veeam Backup & Replication User Guide.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRViProxy](Get-VBRViProxy)

* [Get-VBRHvProxy](Get-VBRHvProxy)

---

### Examples
> Example 1. Setting Automatic Proxy Selection to Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Set-VBRJobProxy -AutoDetect
This example shows how to set the automatic proxy selection to the Backup Job 01 and Backup Job 02 backup jobs. The Target parameter is not set to enable the source proxy allocation.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter values.
2. Pipe the cmdlet output to the Set-VBRJobProxy cmdlet. Provide the AutoDetect parameter.
> Example 2. Assigning Hyper-V Proxy to Job [Using Variable]

$job = Get-VBRJob -Name "Backup Copy"
$proxy = Get-VBRHvProxy -Name "Local Backup Proxy"
Set-VBRJobProxy -Job $job -Proxy $proxy -Target
This example shows how to assign the custom Hyper-V target proxy to the Backup Copy job. The name of the proxy is Local Backup Proxy. The Target parameter is set to enable target proxy allocation.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRHvProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
3. Run the Set-VBRJobProxy cmdlet. Set the $job variable as the Job parameter value. Set the $proxy variable as the Proxy parameter value. Provide the Target parameter.
> Example 3. Assigning VMware Proxies to Job [Using Pipeline]

$proxy = Get-VBRViProxy -Name "Local Backup Proxy"
Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Set-VBRJobProxy -Proxy $proxy
This example shows how to assign the custom VMware source proxy to the Backup Job 01 and Backup Job 02 backup jobs. The name of the proxy is Local Backup Proxy. The Target parameter is not set to enable the source proxy allocation.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter values.
3. Pipe the cmdlet output to the Set-VBRJobProxy cmdlet. Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **AutoDetect**
Defines that the automatic selection mode is enabled.
If you provide this parameter, the proxy server selection mode will be set to automatic. Otherwise, you must specify the custom proxy server.
Use the Proxy parameter to specify the custom proxy server.  Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Job**
Specifies an array of jobs. The cmdlet will return proxies assigned to these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Proxy**
Specifies an array of proxies you want to assign to the job.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IProxy[]]`|true    |named   |False        |

#### **Target**
Defines that the autodetect option will be enabled for the target proxy server.
If you provide this parameter, the automatic selection mode will be enabled for the target proxy server.
Otherwise, the automatic selection mode will be enabled for the source proxy server.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRJobProxy -AutoDetect -Job <CBackupJob[]> [-Target] [<CommonParameters>]
```
```PowerShell
Set-VBRJobProxy -Job <CBackupJob[]> -Proxy <IProxy[]> [-Target] [<CommonParameters>]
```

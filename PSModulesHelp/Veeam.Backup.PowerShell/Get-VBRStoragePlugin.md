Get-VBRStoragePlugin
--------------------

### Synopsis
Returns plug-ins for adding Universal Storage API integrated systems.

---

### Description

This cmdlet returns the list of installed Plug-ins for adding Universal Storage API integrated systems to Veeam Backup & Replication.
For more information on Universal Storage API integrated systems, see the Universal Storage Integration API section of the User Guide for VMware vSphere.

---

### Related Links
* [Get-VBRViProxy](Get-VBRViProxy)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1

```PowerShell
Get-VBRStoragePlugin
This command returns the list of all installed storage plug-ins.
```
> Example 2

Get-VBRStoragePlugin
$credentials = Get-VBRCredentials -Name "IBM Administrator"
$proxy = Get-VBRViProxy -Name 172.17.41.34
Add-StoragePluginHost -PluginType Ibm -Name 172.17.41.3 -Credentials $credentials -Description "IBM iSCSI" -Proxy $proxy -iSCSI
This example shows how to add an IBM Spectrum Virtualize storage to Veeam Backup & Replication.

Perform the following steps:
1. Run the Get-VBRStoragePlugin cmdlet. To add the IBM Spectrum Virtualize storage system to Veeam Backup & Replication, you will need the IBM Plug-in.
2. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
3. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
4. Run the Add-StoragePluginHost cmdlet. Specify the following settings:
- Set the Ibm option for the PluginType parameter value.
- Specify the Name parameter value.
- Set the $credentials variable as the Credentials parameter value.
- Specify the Description parameter value.
- Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **Name**
Specifies the array of plug-in names.
The cmdlet will return plug-ins with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

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
Get-VBRStoragePlugin [-Name <String[]>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

Set-VBRJobObjectVssOptions
--------------------------

### Synopsis
Customizes job VSS settings.

---

### Description

This cmdlet applies a set of customized VSS settings to the specific objects in job or sets credentials to authenticate with the specific objects in job.
To apply the set of customized settings you need to first create a CVssOptions object. This object unifies all the VSS options you want to apply to the job object.
Run the New-VBRJobVssOptions cmdlet to create the CVssOptions object.
Run the Set-VBRJobVssOptions cmdlet to set the VSS options to the whole job.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJobObject](Get-VBRJobObject)

* [Get-VBRJob](Get-VBRJob)

* [New-VBRJobVssOptions](New-VBRJobVssOptions)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Applying Custom VSS Options to Specific VM [Using Pipeline]

$options = New-VBRJobVssOptions -ForObject
Get-VBRJob -Name "Active Directory Backup" | Get-VBRJobObject -Name "AD_01" | Set-VBRJobObjectVssOptions -Options $options
This example shows how to apply custom VSS options to the AD_01 VM included in the backup job named Active Directory Backup.
Perform the following steps:
1. Run the New-VBRJobVssOptions cmdlet. Provide the ForObject parameter. Save the result to the $options variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Get-VBRJobObject cmdlet. Specify the Name parameter value.
4. Pipe the cmdlet output to the Set-VBRJobObjectVssOptions cmdlet. Set the $options variable as the Options parameter value.
> Example 2. Applying Custom VSS Options to VM Running Active Directory [Using Variable]

$AD_VMs = Get-VBRJobObject
$options = New-VBRJobVssOptions -ForObject
Set-VBRJobObjectVssOptions -Object $AD_VMs -Options $options
This example shows how to apply custom VSS options to the VMs running Active Directory represented by the $AD_VMs variable.
Perform the following steps:
1. Run the Get-VBRJobObject cmdlet. Save the result to the $AD_VMs variable.
2. Run the New-VBRJobVssOptions cmdlet. Provide the ForObject parameter. Save the result to the $options variable.
3. Run the Set-VBRJobObjectVssOptions cmdlet. Set the $AD_VMs variable as the Object parameter value. Set the $options variable as the Options parameter value.
> Example 3. Setting Credentials to Authenticate with SQL Server Included in Specific Backup Job [Using Pipeline]

$SharePointBackup = Get-VBRJob
$Administrator = Get-VBRCredentials
Get-VBRJobObject -Job $SharePointBackup -Name "SharePoint_SQL" | Set-VBRJobObjectVssOptions -Credentials $Administrator
This example shows how to set credentials to authenticate with the SQL server included in the SharePoint backup job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $SharePointBackup variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
3. Run the Get-VBRJobObject cmdlet. Set the $SharePointBackup variable as the Job parameter value. Specify the Name parameter value.
4. Pipe the cmdlet output to the Set-VBRJobObjectVssOptions cmdlet. Set the $Administrator variable as the Credentials parameter value.
> Example 4. Setting Credentials to Authenticate with VM [Using Variable]

$SharePoint_SQL = Get-VBRJobObject
$Administrator = Get-VBRCredentials
Set-VBRJobObjectVssOptions -Object $SharePoint_SQL -Credentials $Administrator
This example shows how to set credentials to authenticate with the VM represented by the $SharePoint_SQL variable.
Perform the following steps:
1. Run the Get-VBRJobObject cmdlet. Save the result to the $SharePoint_SQL variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
3. Run the Set-VBRJobObjectVssOptions cmdlet. Set the $SharePoint_SQL variable as the Object parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the guest VM.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Object**
Specifies the VMs and VM containers for which you want to change VSS settings.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CObjectInJob]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Options**
Specifies the option that you want to change.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CGuestProcessingOptions]`|true    |1       |False        |

---

### Inputs
Veeam.Backup.Core.CObjectInJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRJobObjectVssOptions [-Object] <CObjectInJob> -Credentials <CCredentials> [<CommonParameters>]
```
```PowerShell
Set-VBRJobObjectVssOptions [-Object] <CObjectInJob> [-Options] <CGuestProcessingOptions> [<CommonParameters>]
```

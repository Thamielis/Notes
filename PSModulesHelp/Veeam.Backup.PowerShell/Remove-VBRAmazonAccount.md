Remove-VBRAmazonAccount
-----------------------

### Synopsis
Removes AWS credentials records from Veeam Backup & Replication.

---

### Description

This cmdlet removes AWS credentials records from Veeam Backup & Replication. You can remove credentials records for the following services:
- Amazon S3
- Amazon EC2
- S3 compatible (including IBM Cloud Object Storage)

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

---

### Examples
> Removing AWS Credentials Record

$creds = Get-VBRAmazonAccount -AccessKey "ABCDEFGHIGKLMNOP"
Remove-VBRAmazonAccount -Account $creds
This example shows how to remove an AWS credentials record.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $creds variable.
2. Run the Remove-VBRAmazonAccount cmdlet. Set the $creds variable as the Account parameter value.

---

### Parameters
#### **Account**
Specifies AWS credentials records that you want to remove.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRAmazonAccount]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRAmazonAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRAmazonAccount -Account <VBRAmazonAccount> [-Confirm] [-WhatIf] [<CommonParameters>]
```

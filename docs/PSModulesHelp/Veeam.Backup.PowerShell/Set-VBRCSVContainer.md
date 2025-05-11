Set-VBRCSVContainer
-------------------

### Synopsis
Modifies a scope of computers listed in a CSV file.

---

### Description

This cmdlet modifies the VBRCSVContainer object. This object contains the scope of computers you want to add to a protection group.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Set-VBRProtectionGroup](Set-VBRProtectionGroup)

---

### Examples
> Changing Master Account Credentials for Protection Group

$group = Get-VBRProtectionGroup -Name "Support PG"
$csv = $group.Container
$newcsv = Set-VBRCSVContainer -Container $csv -MasterCredentials "supporteast\dstones"
Set-VBRProtectionGroup -ProtectionGroup $group -Container $newcsv
This example shows how to change Master account credentials for a protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Get the protection scope. Use the Container property of the $group variable. Save the result to the $csv variable.
3. Run the Set-VBRCSVContainer cmdlet. Set the $csv variable as the Container parameter value. Specify the MasterCredentials parameter value. Save the result to the $newcsv variable.
4. Run the Set-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value. Set the $newcsv variable as the Container parameter value.

---

### Parameters
#### **Container**
Specifies the scope of computers that are listed in a CSV file.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRCSVContainer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **CustomCredentials**
Specifies custom credentials for authenticating with associated computers.

|Type                         |Required|Position|PipelineInput        |
|-----------------------------|--------|--------|---------------------|
|`[VBRCSVCustomCredentials[]]`|false   |named   |True (ByPropertyName)|

#### **MasterCredentials**
Specifies Master account credentials for authenticating with all computers listed in a CSV file.
For authenticating with computers that require different credentials, Veeam Backup & Replication uses custom credentials. If you want to use custom credentials for some computers, set the UseCustomCredentials parameter.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **NetworkCredentials**
Specifies the credentials you want to use for authenticating with the shared folder. The cmdlet will use these credentials if a CSV file is located on a file share.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **Path**
Specifies the path to the CSV file. The cmdlet will import computers' DNS names or IP addresses from this file.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

#### **UseCustomCredentials**
Defines that you want to use custom credentials for authenticating with some computers listed in a CSV file.
To specify custom credentials, use the CustomCredentials parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCSVContainer

System.String

Veeam.Backup.Common.CCredentials

System.Management.Automation.SwitchParameter

Veeam.Backup.PowerShell.Infos.VBRCSVCustomCredentials[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCSVContainer -Container <VBRCSVContainer> [-CustomCredentials <VBRCSVCustomCredentials[]>] [-MasterCredentials <CCredentials>] [-NetworkCredentials <CCredentials>] [-Path <String>] 
```
```PowerShell
[-UseCustomCredentials] [<CommonParameters>]
```

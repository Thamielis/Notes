New-VBRCSVContainer
-------------------

### Synopsis
Creates a scope of computers listed in a CSV file.

---

### Description

This cmdlet creates the VBRCSVContainer object. This object contains a scope of computers listed in a CSV file.
Use this object to create a protection group with the Add-VBRProtectionGroup cmdlet.

---

### Related Links
* [New-VBRCSVCustomCredentials](New-VBRCSVCustomCredentials)

* [Add-VBRProtectionGroup](Add-VBRProtectionGroup)

---

### Examples
> Example 1. Creating Scope of Computers from CSV File on Computer

$ccreds = Get-Credential
$custom = @("172.19.51.55", "sup-v8931") | ForEach { New-VBRCSVCustomCredentials -HostName $_ -Credentials $ccreds}
$netcreds = Get-Credential
New-VBRCSVContainer -Path "C:\Computers.csv" -MasterCredentials support\jsmith -UseCustomCredentials -CustomCredentials $custom
This example shows how to create a scope of computers from a CSV file located on your computer.
Perform the followings steps:
1. Specify custom credentials for computers from a CSV file:
- Run the Get-Credential cmdlet. Type the credentials and save the result to the $ccreds variable.
- Run the New-VBRCSVCustomCredentials cmdlet. Set the $ccreds variable as the Credentials parameter value. Use the ForEach statement to apply the same credentials to multiple computers. Save the result to the $custom variable.
2. Run the New-VBRCSVContainer cmdlet. Specify the following settings:
- Specify the Path parameter value.
- Specify the MasterCredentials parameter value.
- Provide the UseCustomCredentials parameter value.
- Set the $custom variable as the CustomCredentials parameter value.
> Example 2. Creating Scope of Computers from CSV File on File Share

$ccreds = Get-Credential
$custom = @("172.19.51.55", "sup-v8931") | ForEach { New-VBRCSVCustomCredentials -HostName $_ -Credentials $ccreds}
$netcreds = Get-Credential
New-VBRCSVContainer -Path "//support.local/east/Computers.csv" -MasterCredentials support\jsmith -NetworkCredentials $netcreds -UseCustomCredentials -CustomCredentials $custom
This example shows how to create a scope of computers from a CSV file located on a file share.
Perform the followings steps:
1. Specify custom credentials for computers from a CSV file:
- Run the Get-Credential cmdlet. Type the credentials and save the result to the $ccreds variable.
- Run the New-VBRCSVCustomCredentials cmdlet. Set the $ccreds variable as the Credentials parameter value. Use the ForEach statement to apply the same credentials to multiple computers. Save the result to the $custom variable.
2. Run the Get-Credential cmdlet to create a credential object you want to use for authenticating with the shared folder. Type the credentials and save the result to the $netcreds variable.
3. Run the New-VBRCSVContainer cmdlet. Specify the following settings:
- Specify the Path parameter value.
- Specify the MasterCredentials parameter value.
- Set the $netcreds variable as the NetworkCredentials parameter value.
- Provide the UseCustomCredentials parameter value.
- Set the $custom variable as the CustomCredentials parameter value.
> Example 3. Creating Protection Group with Scope of Computers from CSV File on File Share

$ccreds = Get-Credential
$custom = @("172.19.51.55", "sup-v8931") | ForEach { New-VBRCSVCustomCredentials -HostName $_ -Credentials $ccreds}
$netcreds = Get-Credential
$csvscope = New-VBRCSVContainer -Path "//support.local/east/Computers.csv" -MasterCredentials support\jsmith -NetworkCredentials $netcreds -UseCustomCredentials -CustomCredentials $custom
Add-VBRProtectionGroup -Name "CSV" -Container $csvscope
This example shows how to create a protection group with a scope of computers from a CSV file.
Perform the following steps:
1. Specify custom credentials for computers from a CSV file:
- Run the Get-Credential cmdlet. Type the credentials and save the result to the $ccreds variable.
- Run the New-VBRCSVCustomCredentials cmdlet. Set the $ccreds variable as the Credentials parameter value. Use the ForEach statement to apply the same credentials to multiple computers. Save the result to the $custom variable.
2. Run the Get-Credential cmdlet to create a credential object you want to use for authenticating with the shared folder. Type the credentials and save the result to the $netcreds variable.
3. Run the New-VBRCSVContainer cmdlet. Specify the Path and the MasterCredentials parameter values. Set the $netcreds variable as the NetworkCredentials parameter value. Provide the UseCustomCredentials parameter value. Set the $custom variable as the CustomCredentials parameter value. Save the result to the $csvscope variable.
4. Create a protection group. To do this, run the Add-VBRProtectionGroup cmdlet. Specify the Name parameter value. Set the $csvscope variable as the Container parameter value.

---

### Parameters
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
|`[CCredentials]`|true    |named   |True (ByPropertyName)|

#### **NetworkCredentials**
Specifies the credentials you want to use for authenticating with the shared folder. The cmdlet will use these credentials if a CSV file is located on a file share.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **Path**
Specifies the path to the CSV file. The cmdlet will import computer DNS names or IP addresses from this file.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

#### **UseCustomCredentials**
Defines that you want to use custom credentials for authenticating with some computers listed in a CSV file.
To specify custom credentials, use the CustomCredentials parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

---

### Inputs
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
New-VBRCSVContainer [-CustomCredentials <VBRCSVCustomCredentials[]>] -MasterCredentials <CCredentials> [-NetworkCredentials <CCredentials>] -Path <String> [-UseCustomCredentials] [<CommonParameters>]
```

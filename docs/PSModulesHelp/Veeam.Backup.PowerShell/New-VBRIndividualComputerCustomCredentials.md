New-VBRIndividualComputerCustomCredentials
------------------------------------------

### Synopsis
Specifies credentials for authenticating with individual computers.

---

### Description

This cmdlet specifies credentials for authenticating with individual computers that you want to add to a protection group.
Veeam Backup & Replication uses these credentials for Veeam Agent deployment and backup\restore activities.

---

### Related Links
* [New-VBRIndividualComputerContainer](New-VBRIndividualComputerContainer)

---

### Examples
> Specifying Credentials for Authenticating with Individual Computers

$ccreds = Get-Credential
New-VBRIndividualComputerCustomCredentials -HostName 172.19.51.50 -Credentials $creds
This example shows how to specify credentials for authenticating with individual computers.
Perform the following steps:
1. Run the Get-Credential cmdlet. Type the credentials and save the result to the $ccreds variable.
2. Run the New-VBRIndividualComputerCustomCredentials cmdlet. Specify the HostName parameter value. Set the $ccreds variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies credentials to authenticate against individual computers in a protection group.
Note: for string type, enter a user name in the Domain\Username format.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|true    |named   |True (ByPropertyName)|

#### **HostName**
Specifies the DNS name or an IP address of the computer for which you want to specify custom credentials.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SSHElevateToRoot**
Defines that the cmdlet will grant the non-root users with root account privileges.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **SSHFailoverToSu**
Defines that Veeam Backup & Replication will use the su command if the sudo command fails.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **SSHPassword**
Specifies the password you want to use to authenticate against individual computers in a protection group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **SSHPort**
Specifies the Web service port to connect to Linux-based machines.
Default: 443.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt16]`|false   |named   |True (ByPropertyName)|

#### **SSHRootPassword**
Specifies the root password used for authentication.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

#### **SSHTempCredentials**
Defines that the cmdlet will use single-use credentials to access Linux-based machines.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |True (ByPropertyName)|

#### **SSHUser**
Specifies the user name you want to use to authenticate against individual computers in a protection group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **UseTemporaryCertificate**
Defines that the cmdlet will use temporary certificate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |True (ByPropertyName)|

---

### Inputs
System.String

Veeam.Backup.Common.CCredentials

System.Management.Automation.SwitchParameter

System.UInt16

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRIndividualComputerCustomCredentials -Credentials <CCredentials> -HostName <String> [<CommonParameters>]
```
```PowerShell
New-VBRIndividualComputerCustomCredentials -HostName <String> [-SSHElevateToRoot] [-SSHFailoverToSu] -SSHPassword <String> [-SSHPort <UInt16>] [-SSHRootPassword <String>] -SSHTempCredentials -SSHUser <String> 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
New-VBRIndividualComputerCustomCredentials -HostName <String> -UseTemporaryCertificate [<CommonParameters>]
```

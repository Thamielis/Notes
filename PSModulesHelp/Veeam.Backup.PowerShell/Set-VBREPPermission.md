Set-VBREPPermission
-------------------

### Synopsis
Applies user access permissions to backup repositories for Endpoint jobs.

---

### Description

This cmdlet applies user access permissions to a selected repository that is used as a target by Veeam Agent operating in a standalone mode.
By default, the backup repositories are configured to have no permissions for writing backups created by a Veeam Agent. To start using a Veeam backup repository as target for backups created by a Veeam Agent, you need to change the access permissions to Everyone or OnlySelectedUsers.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBREncryptionKey](Get-VBREncryptionKey)

---

### Examples
> Example 1. Granting Repository Permissions to Administrator

$repository = Get-VBRBackupRepository -Name "WinLocal"
Set-VBREPPermission -Repository $repository -Type OnlySelectedUsers -User "VEEAM\Administrator"
This example shows how to grant permission to access the WinLocal repository to Administrator.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save it to the $repository variable.
2. Run the Set-VBREPPermission cmdlet. Set the $repository variable as the Repository parameter value. Set the OnlySelectedUsers option for the Type parameter. Specify the User parameter value.
> Example 2. Enabling Encryption for Repository

$encryptionkey = Get-VBREncryptionKey -Description "Veeam Administrator"
$repository = Get-VBRBackupRepository -Name "WinLocal"
Set-VBREPPermission -Repository $repository -EnableEncryption -EncryptionKey $encryptionkey
This command enables encryption for the WinLocal repository.
Perform the following steps:
1. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save it to the $encryptionkey variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save it to the $repository variable.
3. Run the Set-VBREPPermission cmdlet. Set the $repository variable as the Repository parameter value. Provide the EnableEncryption parameter. Set the $encryptionkey variable as the EncryptionKey parameter value.
> Example 3. Granting User Access Permissions to Everyone

$encryptionkey = Get-VBREncryptionKey -Description "Veeam Administrator"
$repository = Get-VBRBackupRepository -Name "WinLocal"
Set-VBREPPermission -Repository $repository -Type Everyone -EnableEncryption -EncryptionKey $encryptionkey
This example shows how to grant user access permissions to everyone and enable encryption for the WinLocal repository.
Perform the following steps:
1. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save it to the $encryptionkey variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save it to the $repository variable.
3. Run the Set-VBREPPermission cmdlet. Specify the following settings:
- Set the $repository variable as the Repository parameter value.
- Set the Everyone option for the Type parameter.
- Provide the EnableEncryption parameter.
- Set the $encryptionkey variable as the EncryptionKey parameter value.

---

### Parameters
#### **EnableEncryption**
Enables the option to encrypt the backups created by a Veeam Agent.
Use the EncryptionKey parameter to specify the encryption key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
Used to specify the encryption key for the EnableEncryption parameter.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will apply access permissions to a repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **KMSServer**
Specifies KMS servers added to the Veeam Backup & Replication console. The cmdlet will decrypt data encrypted by this server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Repository**
Specifies the repository for which you want to set permissions.
Note: You cannot use cloud repositories for backups created by a Veeam Agent.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Type**
Specifies the permission type:
* Everyone: everyone has permissions.
* NoOne: no one has permissions.
* OnlySelectedUsers: the selected users have permissions. Use the User parameter to specify the users.
Default: the permissions type that is currently set for the selected repository.
Valid Values:

* Everyone
* NoOne
* OnlySelectedUsers

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBREPPermissionType]`|false   |named   |False        |

#### **User**
Used to set users for OnlySelectedUsers option.
Specifies names of users allowed to use the repository for backups created by a Veeam Agent.
You can specify user names or names of Active Directory groups.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBREPPermission [-EnableEncryption] [-EncryptionKey <VBREncryptionKey>] [-Force] [-KMSServer <VBRKMSServer>] [-PassThru] -Repository <CBackupRepository> [-Type {Everyone | NoOne | OnlySelectedUsers}] [-User 
```
```PowerShell
<String[]>] [<CommonParameters>]
```

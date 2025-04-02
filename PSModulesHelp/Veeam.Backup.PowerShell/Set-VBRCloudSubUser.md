Set-VBRCloudSubUser
-------------------

### Synopsis
Modifies settings of cloud subuser accounts.

---

### Description

This cmdlet modifies settings for the subuser tenant account. You can modify the cloud subuser accounts of the following types:
- Simple cloud subtenant accounts
- vCD cloud subtenant accounts
To modify settings, specify new values for the necessary parameters. The parameters that you omit will remain unchanged.

NOTE: You cannot modify the following settings:
- The cloud subuser name. After the subuser account is created, the name becomes a part of system information and cannot be changed.
- For Agent Management subusers: user name and resources.

---

### Related Links
* [Get-VBRCloudSubUser](Get-VBRCloudSubUser)

* [Set-VBRCloudSubUserResource](Set-VBRCloudSubUserResource)

---

### Examples
> Example 1. Modifying Password for Selected Cloud Subuser

$subuser = Get-VBRCloudSubUser -Name "Subuser 1"
Set-VBRCloudSubUser -SubUser $subuser -Password "Pass12345"
This example shows how to modify the password for a selected cloud subuser.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Run the Set-VBRCloudSubUser cmdlet. Set the $subuser variable as the SubUser parameter value. Specify the Password parameter value.
> Example 2. Disabling Selected Cloud Subuser

$subuser = Get-VBRCloudSubUser -Name "Subuser 1"
Set-VBRCloudSubUser -SubUser $subuser -Disabled
This example shows how to disable a selected cloud subuser.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Run the Set-VBRCloudSubUser cmdlet. Set the $subuser variable as the SubUser parameter value. Provide the Disabled parameter.
> Example 3. Modifying Quota for Selected Cloud Subuser

$subuser = Get-VBRCloudSubUser -Name "Subuser 1"
$subuserresources = $subuser.Resources[0]
$newresources = Set-VBRCloudSubUserResource -CloudSubUserResource $subuserresources -Quota 20
Set-VBRCloudSubUser -SubUser $subuser -Resources $newresources
This example shows how to modify the quota of resources for a selected cloud subuser.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Get the existing quota of the subuser. Use the Resources property of the VBRCloudSubUserResource object saved to the $subuser variable. Save the result to the $subuserresources variable.
3. Run the Set-VBRCloudSubUserResource cmdlet. Set the $subuserresources variable as the CloudSubUserResource parameter value. Specify the Quota parameter value. Save the result to the $newresources variable.
4. Run the Set-VBRCloudSubUser cmdlet. Set the $subuser variable as the SubUser parameter value. Set the $newresources variable as the Resources parameter value.

---

### Parameters
#### **Description**
Specifies the description of the cloud subuser account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Disabled**
Defines that the cloud subuser is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password you want to set to the subuser account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Resources**
Specifies the quota of the subuser backup resources you want to give to the subuser. Accepts the VBRCloudSubUserResource[] object. To get this object, run the Set-VBRCloudSubUserResource cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRCloudSubUserResource[]]`|false   |named   |False        |

#### **SubUser**
Specifies the cloud subuser you want to modify. Accepts the VBRCloudSubUser object. To get this object, run the Get-VBRCloudSubUser cmdlet.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[IVBRCloudSubUser]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRCloudSubUser

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudSubUser [-Description <String>] [-Disabled] [-PassThru] [-Password <String>] [-Resources <VBRCloudSubUserResource[]>] -SubUser <IVBRCloudSubUser> [<CommonParameters>]
```

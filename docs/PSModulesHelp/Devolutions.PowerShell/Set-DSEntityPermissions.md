Set-DSEntityPermissions
-----------------------

### Synopsis
Sets the permissions on a given entity.

---

### Description

Sets the permissions on a given entity (Vault, folder or entry).

---

### Examples
> EXAMPLE

$Permissions = @(
            [RemoteDesktopManager.PowerShellModule.Private.models.ConnectionPermission]@{
                IsEmpty  = $false
                Override = [RemoteDesktopManager.PowerShellModule.Private.enums.SecurityRoleOverride]::Custom
                Right    = [RemoteDesktopManager.PowerShellModule.Private.enums.SecurityRoleRight]::View
                Roles    = @($UserId1, $UserId2, $RoleId1)
            },
            [RemoteDesktopManager.PowerShellModule.Private.models.ConnectionPermission]@{
                IsEmpty  = $false
                Override = [RemoteDesktopManager.PowerShellModule.Private.enums.SecurityRoleOverride]::Inherited
                Right    = [RemoteDesktopManager.PowerShellModule.Private.enums.SecurityRoleRight]::Edit
                Roles    = @($UserId1, $UserId2, $RoleId1)
            }
        )
        > Set-DSEntityPermissions -EntityId $ID -Permissions $Permissions
- To override already existing permissions, please use the 'OverrideExistingPermissions' switch parameter.
        - When using this CMDlet, your entity's override mode will default to 'Custom'. Use the 'PermissionOverride' parameter if you wish to set it to anything else.

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EntityId**
ID of the entity for which you want to change the permissions

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **OverrideExistingPermissions**
ID of the entity for which you want to change the permissions

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **PermissionOverride**
ID of the entity for which you want to change the permissions
Valid Values:

* Default
* Custom
* Inherited
* Everyone
* Never

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[SecurityRoleOverride]`|false   |2       |false        |

#### **Permissions**
ID of the entity for which you want to change the permissions

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ConnectionPermission[]]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Set-DSEntityPermissions -detailed". For technical information, type "Get-Help Set-DSEntityPermissions -full".

---

### Syntax
```PowerShell
Set-DSEntityPermissions -EntityId <Guid> [[-PermissionOverride] <Default | Custom | Inherited | Everyone | Never>] [[-Permissions] <ConnectionPermission[]>] [[-OverrideExistingPermissions]] [-AsLegacyResponse] [<CommonParameters>]
```

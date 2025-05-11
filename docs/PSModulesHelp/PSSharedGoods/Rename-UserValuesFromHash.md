Rename-UserValuesFromHash
-------------------------

### Synopsis
This function renames user values based on a hash table of match data.

---

### Description

The Rename-UserValuesFromHash function takes a list of users, a hash table of match data, and an array of field types. It then renames specific values in the user objects based on the match data provided.

---

### Examples
> EXAMPLE 1

```PowerShell
$users = @(
    [PSCustomObject]@{ UserPrincipalName = 'user1@test.com'; License = 'test:license'; ProxyAddress = 'proxy@test.com' }
    [PSCustomObject]@{ UserPrincipalName = 'user2@test.com'; License = 'test:license'; ProxyAddress = 'proxy@test.com' }
)
$matchData = @{
    'test.com' = 'newdomain.com'
    'test:' = 'newdomain:'
}
$fieldTypes = @('UserPrincipalName', 'License')
Rename-UserValuesFromHash -Users $users -MatchData $matchData -FieldTypes $fieldTypes
```

---

### Parameters
#### **Users**
The list of user objects to be processed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **MatchData**
A hash table containing the match data used for renaming values.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **FieldTypes**
An array of field types to be considered for renaming.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
Rename-UserValuesFromHash [[-Users] <Object>] [[-MatchData] <Object>] [[-FieldTypes] <Object>] [<CommonParameters>]
```

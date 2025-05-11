Get-WinADForestInformation
--------------------------

### Synopsis

Get-WinADForestInformation [[-TypesRequired] <ActiveDirectory[]>] [[-PathToPasswords] <string>] [[-PathToPasswordsHashes] <string>] [[-Splitter] <string>] [[-ResultPageSize] <int>] [-RequireTypes] [-PasswordQuality] [-DontRemoveSupportData] [-DontRemoveEmpty] [-Formatted] [-Parallel] [-Extended] [<CommonParameters>]

---

### Description

---

### Parameters
#### **DontRemoveEmpty**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DontRemoveSupportData**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Extended**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Formatted**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Parallel**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **PasswordQuality**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **PathToPasswords**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **PathToPasswordsHashes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **RequireTypes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ResultPageSize**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |4       |false        |

#### **Splitter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **TypesRequired**

Valid Values:

* ForestInformation
* ForestFSMO
* ForestRoles
* ForestGlobalCatalogs
* ForestOptionalFeatures
* ForestUPNSuffixes
* ForestSPNSuffixes
* ForestSites
* ForestSites1
* ForestSites2
* ForestSubnets
* ForestSubnets1
* ForestSubnets2
* ForestSiteLinks
* ForestDomainControllers
* ForestRootDSE
* ForestSchemaPropertiesUsers
* ForestSchemaPropertiesComputers
* ForestReplication
* DomainRootDSE
* DomainRIDs
* DomainAuthenticationPolicies
* DomainAuthenticationPolicySilos
* DomainCentralAccessPolicies
* DomainCentralAccessRules
* DomainClaimTransformPolicies
* DomainClaimTypes
* DomainFineGrainedPolicies
* DomainFineGrainedPoliciesUsers
* DomainFineGrainedPoliciesUsersExtended
* DomainGUIDS
* DomainDNSSRV
* DomainDNSA
* DomainInformation
* DomainControllers
* DomainFSMO
* DomainDefaultPasswordPolicy
* DomainGroupPolicies
* DomainGroupPoliciesDetails
* DomainGroupPoliciesACL
* DomainGroupPoliciesACLConsistency
* DomainGroupPoliciesSysVol
* DomainGroupPoliciesOwners
* DomainGroupPoliciesWMI
* DomainGroupPoliciesLinksSummary
* DomainOrganizationalUnits
* DomainOrganizationalUnitsBasicACL
* DomainOrganizationalUnitsExtendedACL
* DomainContainers
* DomainTrustsClean
* DomainTrusts
* DomainWellKnownFolders
* DomainBitlocker
* DomainLAPS
* DomainGroupsFullList
* DomainGroups
* DomainGroupsMembers
* DomainGroupsMembersRecursive
* DomainGroupsSpecial
* DomainGroupsSpecialMembers
* DomainGroupsSpecialMembersRecursive
* DomainGroupsPriviliged
* DomainGroupsPriviligedMembers
* DomainGroupsPriviligedMembersRecursive
* DomainUsersFullList
* DomainUsers
* DomainUsersCount
* DomainUsersAll
* DomainUsersSystemAccounts
* DomainUsersNeverExpiring
* DomainUsersNeverExpiringInclDisabled
* DomainUsersExpiredInclDisabled
* DomainUsersExpiredExclDisabled
* DomainAdministrators
* DomainAdministratorsRecursive
* DomainEnterpriseAdministrators
* DomainEnterpriseAdministratorsRecursive
* DomainComputersFullList
* DomainComputersAll
* DomainComputersAllBuildCount
* DomainComputersAllCount
* DomainComputers
* DomainComputersCount
* DomainServers
* DomainServersCount
* DomainComputersUnknown
* DomainComputersUnknownCount
* DomainPasswordDataUsers
* DomainPasswordDataPasswords
* DomainPasswordDataPasswordsHashes
* DomainPasswordClearTextPassword
* DomainPasswordClearTextPasswordEnabled
* DomainPasswordClearTextPasswordDisabled
* DomainPasswordLMHash
* DomainPasswordEmptyPassword
* DomainPasswordWeakPassword
* DomainPasswordWeakPasswordEnabled
* DomainPasswordWeakPasswordDisabled
* DomainPasswordWeakPasswordList
* DomainPasswordDefaultComputerPassword
* DomainPasswordPasswordNotRequired
* DomainPasswordPasswordNeverExpires
* DomainPasswordSmartCardUsersWithPassword
* DomainPasswordAESKeysMissing
* DomainPasswordPreAuthNotRequired
* DomainPasswordDESEncryptionOnly
* DomainPasswordDelegatableAdmins
* DomainPasswordDuplicatePasswordGroups
* DomainPasswordHashesWeakPassword
* DomainPasswordHashesWeakPasswordEnabled
* DomainPasswordHashesWeakPasswordDisabled
* DomainPasswordStats

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[ActiveDirectory[]]`|false   |0       |false        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Get-WinADForestInformation; CommonParameters=True; parameter=System.Object[]}}
```

Get-WinADDomainInformation
--------------------------

### Synopsis

Get-WinADDomainInformation [[-Domain] <string>] [[-TypesRequired] <ActiveDirectory[]>] [[-PathToPasswords] <string>] [[-PathToPasswordsHashes] <string>] [[-ForestSchemaComputers] <array>] [[-ForestSchemaUsers] <array>] [[-Splitter] <string>] [[-ResultPageSize] <int>] [-Extended] [-Formatted] [-PasswordQuality] [-Parallel] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Domain**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

#### **Extended**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ForestSchemaComputers**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[array]`|false   |4       |false        |

#### **ForestSchemaUsers**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[array]`|false   |5       |false        |

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
|`[string]`|false   |2       |false        |

#### **PathToPasswordsHashes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **ResultPageSize**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |7       |false        |

#### **Splitter**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|false   |6       |false        |Joiner |

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
|`[ActiveDirectory[]]`|false   |1       |false        |

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
{@{name=Get-WinADDomainInformation; CommonParameters=True; parameter=System.Object[]}}
```

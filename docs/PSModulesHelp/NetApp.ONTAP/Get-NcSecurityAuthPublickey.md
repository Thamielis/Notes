Get-NcSecurityAuthPublickey
---------------------------

### Synopsis
Retrieves the public keys configured for user accounts

---

### Description

Retrieves the public keys configured for user accounts. This cmdlet is supported with Rest

---

### Related Links
* [New-NcSecurityAuthPublicKey](New-NcSecurityAuthPublicKey)

* [Set-NcSecurityAuthPublicKey](Set-NcSecurityAuthPublicKey)

* [Remove-NcSecurityAuthPublicKey](Remove-NcSecurityAuthPublicKey)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityAuthPublickey
NcController          : 172.21.91.165
AccountName           : hiralm
Comment               : test
Index                 : 1
ObfuscatedFingerprint : xomos-solog-rodyn-vofoc-kybiz-lokeh-huzyr-savor-salas-hobig-texox
OwnerName             : vs1
OwnerUuid             : f08c4444-b739-11ec-9877-005056ac46f6
PublicKey             : ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWJTerk2xXi3Lkrqrm6Q67aNmNDNKgpezwzl9Ap+DxtMxmocHC52CuwEcJjIUe121uAi0myscaJmC5Y0BzSnYuwcJ3/82kconFUwtK0h6
                        QUTGqbc0vb4MZ39yIiiItCObWTot3msJYfZB+dgcCxMZ+0bl9YwZXrWMWP6XDJw/ai/EfWTZHC7e8Xe1mfp+C0cGMhlxRvgfeGjhZqU85DBfdGD5Tu/67vD13Q+817Jf8iBxgrEFiqirnkW
                        NX5dj+jkMlEVC3s6dYciJNBEiMxNkSFGTnkG74S61pvZNFD6mSznV/28hl3zSjwWiuacsP3Be1ydeG8nEcCRN5Ap7vMdVd
Scope                 : svm
ShaFingerprint        : SHA256:hDzOIWuWwESVULDKALY6Qni0d6CnLoORf3DL9fPmE6w

```

---

### Parameters
#### **OwnerName**
Te Name of the Owner

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **AccountName**
The Name of the User Account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Index**
Index Number for the public key

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcSecurityAuthPublickey -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcSecurityAuthPublickey -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcSecurityAuthPublickey -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcSecurityAuthPublickey -Query $a.

|Type                                                       |Required|Position|PipelineInput|
|-----------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.SecurityAuthPublickeysOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Security.SecurityAuthPublickeysOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcSecurityAuthPublickey -Attributes $a.

|Type                                                       |Required|Position|PipelineInput|
|-----------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.SecurityAuthPublickeysOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityAuthPublickeysOutput

---

### Notes
Category: Security
Api: api/security/authentication/publickeys
Family: Cluster

---

### Syntax
```PowerShell
Get-NcSecurityAuthPublickey [[-OwnerName] <String>] [-AccountName <String>] [-Index <long>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityAuthPublickey -Template <DataONTAP.C.Types.Security.SecurityAuthPublickeysOutput> [<CommonParameters>]
```
```PowerShell
Get-NcSecurityAuthPublickey -Query <DataONTAP.C.Types.Security.SecurityAuthPublickeysOutput> [-Attributes <DataONTAP.C.Types.Security.SecurityAuthPublickeysOutput>] [<CommonParameters>]
```

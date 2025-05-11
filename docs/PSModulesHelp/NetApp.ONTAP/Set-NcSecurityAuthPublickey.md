Set-NcSecurityAuthPublickey
---------------------------

### Synopsis
Modifies the public keys configured for user accounts

---

### Description

Modifies the public keys configured for user accounts. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcSecurityAuthPublicKey](Get-NcSecurityAuthPublicKey)

* [New-NcSecurityAuthPublicKey](New-NcSecurityAuthPublicKey)

* [Remove-NcSecurityAuthPublicKey](Remove-NcSecurityAuthPublicKey)

---

### Examples
> Example 1

```PowerShell
Set-NcSecurityAuthPublickey -OwnerName vs1 -AccountName hiralm -Index 1 -PublicKey "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWJTerk2xXi3Lkrqrm6Q67aNmNDNKgpezwzl9Ap+DxtMxmocHC52CuwEcJjIUe121uAi0myscaJmC5Y0BzSnYuwcJ3/82kconFUwtK0h6QUTGqbc0vb4MZ39yIiiItCObWTot3msJYfZB+dgcCxMZ+0bl9YwZXrWMWP6XDJw/ai/EfWTZHC7e8Xe1mfp+C0cGMhlxRvgfeGjhZqU85DBfdGD5Tu/67vD13Q+817Jf8iBxgrEFiqirnkWNX5dj+jkMlEVC3s6dYciJNBEiMxNkSFGTnkG74S61pvZNFD6mSznV/28hl3zSjwWiuacsP3Be1ydeG8nEcCRN5Ap7vMdVd" -Comment "PATCH operation"
OwnerName             : vs1
AccountName           : hiralm
Index                 : 1
PublicKey             : ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWJTerk2xXi3Lkrqrm6Q67aNmNDNKgpezwzl9Ap+DxtMxmocHC52CuwEcJjIUe121uAi0myscaJmC5Y0BzSnYuwcJ3/82kconFUwtK0h6
                        QUTGqbc0vb4MZ39yIiiItCObWTot3msJYfZB+dgcCxMZ+0bl9YwZXrWMWP6XDJw/ai/EfWTZHC7e8Xe1mfp+C0cGMhlxRvgfeGjhZqU85DBfdGD5Tu/67vD13Q+817Jf8iBxgrEFiqirnkW
                        NX5dj+jkMlEVC3s6dYciJNBEiMxNkSFGTnkG74S61pvZNFD6mSznV/28hl3zSjwWiuacsP3Be1ydeG8nEcCRN5Ap7vMdVd
Comment               : PATCH operation
NcController          : 172.21.91.165
ObfuscatedFingerprint : xomos-solog-rodyn-vofoc-kybiz-lokeh-huzyr-savor-salas-hobig-texox
OwnerUuid             : f08c4444-b739-11ec-9877-005056ac46f6
Scope                 : svm
ShaFingerprint        : SHA256:hDzOIWuWwESVULDKALY6Qni0d6CnLoORf3DL9fPmE6w

```

---

### Parameters
#### **OwnerName**
Te Name of the Owner

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **AccountName**
The Name of the User Account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **PublicKey**
The publickey details for the creation of the user account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Index**
Index Number for the public key

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|true    |2       |false        |

#### **Comment**
Optional Commment for the public key .

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityAuthPublickeysOutput

---

### Notes
Category: Security
Api: api/security/authentication/publickeys/{owner.uuid}/{account.name}/{index}
Family: Cluster

---

### Syntax
```PowerShell
Set-NcSecurityAuthPublickey [-OwnerName] <String> [-AccountName] <String> [-PublicKey <String>] [-Index] <long> [-Comment <String>] [<CommonParameters>]
```
```PowerShell
Set-NcSecurityAuthPublickey [-OwnerName] <String> [-AccountName] <String> [-Index] <long> [<CommonParameters>]
```

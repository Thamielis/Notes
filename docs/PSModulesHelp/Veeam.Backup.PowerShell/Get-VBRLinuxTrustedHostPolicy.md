Get-VBRLinuxTrustedHostPolicy
-----------------------------

### Synopsis
Returns the trust policy for Linux hosts.

---

### Description

This cmdlet returns the trust policy that is set for Linux hosts.
The trust policy determines which protected computers running Linux OS are allowed to connect to the backup server:
- All: with this policy, the connection is allowed for all newly discovered Linux hosts.
- KnownHosts: with this policy, the connection is allowed only for trusted Linux hosts.

---

### Examples
> Getting Trust Policy for Linux Hosts

Get-VBRLinuxTrustedHostPolicy

                                                                                                 Type
                                                                                                 ----
                                                                                           KnownHosts
This command returns the trust policy that is set for Linux hosts.

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRLinuxTrustedHostPolicy [<CommonParameters>]
```

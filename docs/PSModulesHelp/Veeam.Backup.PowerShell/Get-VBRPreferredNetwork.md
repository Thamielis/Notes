Get-VBRPreferredNetwork
-----------------------

### Synopsis
Returns preferred networks.

---

### Description

This cmdlet returns an array of preferred networks created for the backup infrastructure.

---

### Examples
> Getting Preferred Networks

Get-VBRPreferredNetwork
  IpAddress                               SubnetMask                              CIDRNotation
  192.168.0.1                             255.255.255.255                         192.168.0.1/32
  123.0.0.0                               255.0.0.0                               123.0.0.0/8
This command returns preferred networks created for the backup infrastructure.

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
Get-VBRPreferredNetwork [<CommonParameters>]
```

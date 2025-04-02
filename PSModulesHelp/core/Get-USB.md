Get-USB
-------

### Synopsis
Gets USB devices attached to the system

---

### Description

Uses WMI to get the USB Devices attached to the system

---

### Examples
> EXAMPLE 1

```PowerShell
Get-USB
```
> EXAMPLE 2

```PowerShell
Get-USB | Group-Object Manufacturer
```

---

### Notes
Thanks Lee Holmes

---

### Syntax
```PowerShell
Get-USB [<CommonParameters>]
```

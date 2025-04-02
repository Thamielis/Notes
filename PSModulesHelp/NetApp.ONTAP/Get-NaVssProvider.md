Get-NaVssProvider
-----------------

### Synopsis
Get a list of all VSS providers on the current system.

---

### Description

Get a list of all VSS providers on the current system.

---

### Related Links
* [Get-NaVssSnapshot](Get-NaVssSnapshot)

* [Get-NaVssWriter](Get-NaVssWriter)

---

### Examples
> Example 1

```PowerShell
Get-NaVssProvider
Get a list of all providers on the current system.

ProviderId        : b5946137-7b9f-4925-af80-51abd60b20d5
ProviderName      : Microsoft Software Shadow Copy provider 1.0
ProviderType      : SYSTEM
ProviderVersion   : 1.0.0.7
ProviderVersionId : 00000001-0000-0000-0007-000000000001
ClassId           : 65ee1dba-8ff4-4a58-ac1c-3470ee2f376a

```

---

### Inputs

---

### Outputs
* DataONTAP.HostUtilities.Vss.VssProviderProperties

---

### Notes
Category: vss

---

### Syntax
```PowerShell
Get-NaVssProvider [<CommonParameters>]
```

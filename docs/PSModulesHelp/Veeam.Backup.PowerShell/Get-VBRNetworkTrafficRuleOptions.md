Get-VBRNetworkTrafficRuleOptions
--------------------------------

### Synopsis
Returns settings of global network traffic rules.

---

### Description

This cmdlet returns the following settings of global network traffic rules:
- MultipleUploadStreamsEnabled - Defines that multithreaded data transfer is enabled or disabled.
- StreamsPerJobCount - Specifies a number of TCP/IP transfer connection for every job session.
- IPv6Enabled -  Defines that the IPv4/IPv6 dual stack mode is enabled or disabled.

---

### Examples
> Getting Settings of Global Network Traffic Rules

```PowerShell
Get-VBRNetworkTrafficRuleOptions
This command returns the following settings of global network traffic rules: MultipleUploadStreamsEnabled, StreamsPerJobCount and IPv6Enabled.
```

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNetworkTrafficRuleOptions

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNetworkTrafficRuleOptions [<CommonParameters>]
```

Get-VBRCloudGatewayCertificate
------------------------------

### Synopsis
Returns TLS certificates.

---

### Description

This cmdlet returns TLS certificates that are currently used, or the TLS certificate saved to your certificate store.

---

### Examples
> Example 1. Getting TLS Certificate from Certificate Store

```PowerShell
Get-VBRCloudGatewayCertificate -FromStore | Where FriendlyName -eq "Omega Company"
This command gets the Omega Company TLS certificate from the certificate store.
```
> Example 2. Getting TLS Certificate

```PowerShell
Get-VBRCloudGatewayCertificate
This command returns the TLS certificate that is currently assigned to the service provider.
```

---

### Parameters
#### **FromStore**
Defines that the cmdlet will return the TLS certificate present in the local certificate store on this server.  If you run the cmdlet without this parameter, it will return the certificate that is currently used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Get-VBRCloudGatewayCertificate [-FromStore] [<CommonParameters>]
```

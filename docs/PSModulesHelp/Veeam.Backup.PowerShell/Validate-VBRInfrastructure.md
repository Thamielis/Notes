Validate-VBRInfrastructure
--------------------------

### Synopsis
Validates the network infrastructure of a backup server.

---

### Description

This cmdlet validates the network infrastructure of a backup server and verifies whether IPv6 is allowed to use in the network infrastructure. After the verification completes, the cmdlet returns the error report with the Reports and Success properties. Depending on the result, the Success property contains the following values:
- True - If the Reports array is empty.
- False - If the Reports array contains details with errors.

---

### Examples
> Validating Network Infrastructure of Backup Server

```PowerShell
Validate-VBRInfrastructure -EnableIPv6
This command validates the network infrastructure of a backup server.
```

---

### Parameters
#### **EnableIPv6**
Defines that the IPv6 is allowed in the network infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRInfrastructureValidationResult

---

### Notes

---

### Syntax
```PowerShell
Validate-VBRInfrastructure -EnableIPv6 [<CommonParameters>]
```

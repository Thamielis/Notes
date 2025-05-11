Remove-NcEmsDestinationName
---------------------------

### Synopsis
Deletes an event destination.

---

### Description

Deletes an event destination. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcEmsDestinationName](Get-NcEmsDestinationName)

* [Set-NcEmsDestinationName](Set-NcEmsDestinationName)

---

### Examples
> Example 1

```PowerShell
Remove-NcEmsDestinationName -Name New1
```

---

### Parameters
#### **Name**
Name of the Destination.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |0       |true (ByPropertyName)|DestinationName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: Ems
Api: api/support/ems/destinations/{name}
Family: Controller

---

### Syntax
```PowerShell
Remove-NcEmsDestinationName [-Name] <String> [<CommonParameters>]
```

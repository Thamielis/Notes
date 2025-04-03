---
external help file: UniversalDashboard.MaterialUI-help.xml
Module Name: UniversalDashboard
online version: https://go.microsoft.com/fwlink/?LinkId=526726
schema: 2.0.0
---

# New-UDCheckbox

## SYNOPSIS
Creates a checkbox.

## SYNTAX

```
New-UDCheckbox
```

## DESCRIPTION
Creates a checkbox.
Checkboxes can be used in forms or by themselves.

## EXAMPLES

### BEISPIEL 1
```
Creates a checkbox with a custom icon and style.
```

$Icon = New-UDIcon -Icon angry -Size lg  -Id 'demo-checkbox-icon' -Regular
$CheckedIcon = New-UDIcon -Icon angry -Size lg  -Id 'demo-checkbox-icon-checked' 
New-UDCheckBox -Id 'btnCustomIcon' -Icon $Icon -CheckedIcon $CheckedIcon -OnChange {} -Style @{color = '#2196f3'}

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

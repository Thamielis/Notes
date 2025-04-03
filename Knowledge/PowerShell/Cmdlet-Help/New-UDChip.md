---
external help file: UniversalDashboard.MaterialUI-help.xml
Module Name: UniversalDashboard
online version: https://go.microsoft.com/fwlink/?LinkId=526726
schema: 2.0.0
---

# New-UDChip

## SYNOPSIS
Creates a new chip.

## SYNTAX

```
New-UDChip
```

## DESCRIPTION
Creates a new chip.
Chips can be used to display tags or little bits of data.

## EXAMPLES

### BEISPIEL 1
```
Creates a clickable chip with a custom style and icon.
```

$Icon = New-UDIcon -Icon 'user' -Size sm -Style @{color = '#fff'}
New-UDChip -Label "Demo User" -Id "chipIcon" -Icon $Icon -OnClick {Show-UDToast -Message 'test'} -Clickable -Style @{backgroundColor = '#00838f'}

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
